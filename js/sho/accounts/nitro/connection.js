
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <rebuild>
    @project	    	nitro
    @package            sho.accounts.nitro
    @file               connection.js
    @author				dpaul
    @modified		    03.28.13
    @desc		        wrapper around nitro connection (Bunchball integration point).
    @important          the clientside MD5 implementation below is completely insecure, we would never deploy this!
    @note               switched to log to spare us the extra logs when working on ipad 
    
    // the main way to use the connection is with callAPI. 
    // first, get a connection instance:
    var nitro = sho.accounts.nitro.getInstance();
    
    // the old implementation accepted a string and a callabck:
    nitro.callAPI('method=user.logAction&tags=page_view', function(data){
        console.log([data.Nitro.res,data])
    });
    
    // we have switched to a hash-style signature, since the string parsing is getting so messy
    nitro.callAPI({
        'method':'user.logAction',
        'tags': ['page_view'],
        'metadata':[]
        'callback': log
    })
    
    // also, we will be exposing logAction method to clients, since we will be using logClientAction in mixed-security model
    -------------------------------------------------------------------------------------------- */  
    sho.provide('sho.accounts');

    /**
     * class sho.accounts.nitro.Connection
     * Wrapper around nitro connection (Bunchball integration point).
    **/

    sho.accounts.nitro.Connection = klass({
    
        _KLASS_ : 'sho.accounts.nitro.Connection',
   
        unauthenticated_user : { 
            'id':'shotestuser' 
        },
        
        callbacks : [],
        
        // defining this at the class prototype-level may have to do with why
        // the NITRO user id kept popping up in logs even after authenticating - 
        // it's not treated as an instance property
        
        cfg : {
            'apiKey':'b5b18ae6c9894ccc9ab4bd45736a6e96',
            'debug':false   /* if set to true, we get a "Invalid Error: ts" alert when security is set to medium */
        },
        
        cfg_host : {
            'DEVELOPMENT' : {
                'server':"http://sandbox.bunchball.net/nitro/json/"
            },
            'PRODUCTION' : {
                'server':"http://showtime.nitro.bunchball.net/nitro/json/"
            },
        },
        
        notifer : null,
        notification_interval : 5000,
    
        /*
        =:startup
        -------------------------------------------------------------------------------------------- */
        
        /**
         * new sho.accounts.nitro.Connection(cfg)
         * creates a new connection instance. In practice, this method is not called directly,
         * instead, we use the singleton-style accessor defined in statics.
        **/
        initialize:function(cfg)
        {
            if(typeof Nitro === 'undefined') { 
                return; 
            }
            
            // set initial meta
            this.setInitalMetaData(cfg.metadata);
        
            // set the user associated with this nitro connection 
            this.setUser(cfg.user); 

            // stick with anonymous users
            // this.setUser(false);
            
            // extend defaults with runtime configs
            _.extend(this.cfg,
                this.cfg_host[( /LIVE|POSTING/.test(sho.env.serverName()) ? 'PRODUCTION' : 'DEVELOPMENT')],
                {
                    'metadata' : _.extend(this.metadata, cfg.metadata || {})
                }
            );        
            
            // init the nitro connection
            this.nitro = new Nitro(this.cfg);
            if(this.noisy_logging || sho.accounts.nitro.noisy_logging) console.log('|nitro| created connection. user=`'+this.cfg.userId+'` '); 
            
            // broadcast the init event
            _.delay(function(){
                sho.dom.trigger('nitro:init') }, sho.dom.REDRAW_DELAY_);
            
        },
        
        /**
         * sho.accounts.nitro.Connection#setUser(user) -> Null
         * Sets the user object that is associated with the Nitro Connection. _
         * If you supply null or false, no action is taken and anonymous user will be set on the Nitro side.
         * Was: If you supply null or false, sho.accounts.nitro.Connection.unauthenticated_user is used instead.
        **/
        setUser:function(user)
        {
            // old
            // this.user =       user ? user : null;
            // this.cfg.userId = user ? user.id : null;
            // // the presence of a gamification property in the user's tokenMap object indicates an enrolled user,
            // // as well as providing the sessionKey to include in API calls to nitro.
            // if (user && user.tokenMap && user.tokenMap.gamification) this.cfg.sessionKey =  user.tokenMap.gamification;
                
            if(user && user.isGamificationParticipant == 'YES')
            {
                this.user = user;
                this.cfg.userId = user.id
            }
            else
            {
                this.user = null;
                this.cfg.userId = null;
            }
            // this is still getting set in the call, as nitro populates the cfg object
            // must remove the check to include sessionKey in callAPI completely if you don't want this
            this.cfg.sessionKey = false
        },
    
        /**
         * sho.accounts.nitro.Connection#callAPI(config, callback, scope) -> Null
         * make a Nitro API call and supply a callback
        **/
        callAPI:function(cfg, callback, scope)
        {
            if(!_.isObject(cfg)) throw new Error('Passing string params to nitro.callAPI is deprecated. Use a cfg object');
            
            // register the timestamp-signed callback function to handle to the api call response
            var callback = callback || cfg.callback,
                scope = scope || cfg.scope || window
            ; 
            this.callbacks.push({
                'target' : scope,
                'method' : (typeof callback == 'string' ? scope[callback] : callback) || sho.emptyFunction,
                'token' : this.timeStamp()
            });
            
            // helpers
            var method =    cfg.method,     // 'user.logAction'
                tags =      cfg.tags,       // 'page_view'
                meta =      cfg.metadata,   // 'seriesId:323,category:series' or {'seriesId:323','category':'series'}
                metadata,
                metadataStr,
                call,
                callStr
            ;
            // if metadata is a string, convert to object to facilitate merging
            metadata = _.isString(meta) ? sho.accounts.nitro.parseMetaStr(meta) : meta;
            
            // override base metadata plucked from the DOM with metadata passed to api call unless explicitly told not to
            metadata = cfg.inherit_metadata +'' !== 'false' ? _.extend({}, this.metadata, metadata) : metadata;
            
            // start building the call by selectively cloning the cfg, rejecting anything problematic
            call = _.omit(cfg, 'callback','scope','inherit_metadata','include_metadata','include_tags','tags','metadata');
            
            // convert metadata to string and add to call if explicitly told to do so
            if(cfg.include_metadata) call.metadata = this.metadataStr(metadata)
            
            // if api call included tags, append 'metadata' to them. In current Nitro implementation, it must be included twice.
            // this is what's known as 'contextual tagging'. Actually, we may only want to do this for logAction calls, since
            // supplying tags to other api calls can be disasterous!
            if(cfg.include_tags && cfg.include_metadata)  call.tags = tags + ',' + call.metadata;
            if(cfg.include_tags && !cfg.include_metadata) call.tags = tags;
            
            // trigger global event and attach final config object as second argument
            // currently used for opt in notifications
            sho.dom.trigger('nitro:action', call);

            // note: in security-low there is no reason to include sessionKey, disabling for now for cleaner logs
            // add session key to call unless explicitly told not to
            // if(this.cfg.sessionKey && (cfg.include_sessionkey+'' !== 'false')) call.sessionKey = this.cfg.sessionKey;
            
            // convert call object to queryString, but don't uriEncode key-value pairs
            callStr = sho.object.toQueryString(call, false);
            
            this.nitro.callAPI(callStr, "sho.accounts.nitro.processResult", _(this.callbacks).last().token)
            
            // print debug-oriented representation of the call
            if(this.noisy_logging || sho.accounts.nitro.noisy_logging) console.log("\n"+
                '|nitro| callAPI[method=`'+ cfg.method +'` include_tags=`'+!!cfg.include_tags+'`, include_metadata=`'+ !!cfg.include_metadata + '`] ' + "\n" + callStr)
            
            // correct call structure from kyle:
            // nitro.callAPI(method=user.logAction&tags=page_view,/*(, NOT &!!!)*/ platform:desktop,product:shocom,seriesId:323,category:series'
            // &metadata=platform:desktop,product:shocom,seriesId:323,category:series)

        },
        
        
        /**
         * sho.accounts.nitro.Connection#logAction(tags) -> Null
         * Alias for callAPI({'method':'user.logAction'}), with the config option to include tags+metadata set to true
         * We will swap this out for user.clientLogAction which is the method that must be used in the mixed-security model,
         * however, before doing so, note that all the actions must have low-security checked in the console.
        **/
        logAction:function(cfg, callback, scope)
        {
            cfg.method = 'user.logAction';
            cfg.include_tags = true;
            cfg.include_metadata = true;
            this.callAPI(cfg, callback, scope);
        },
        
        // for debug purposes
        clientLogAction:function(cfg, callback, scope)
        {
            cfg.method = 'user.clientLogAction';
            cfg.include_tags = true;
            cfg.include_metadata = true;
            this.callAPI(cfg, callback, scope);
        },
        
    
        /**
         * sho.accounts.nitro.Connection#processResult(data, token) -> Null
         * Global callback handler for the response coming back from Nitro. Delegates to the registered callback for the api request.
        **/
        processResult:function(data, token)
        {
            var c,i=this.callbacks.length; 
            while(i--)
            {
                c = this.callbacks[i]; if(token == c.token) // token match!
                {
                    c.method.call(c.target, data);   // invoke the callback.. should we dig down into data.Nitro for the client?
                    this.callbacks.splice(i,1);      // remove callack from list
                    break;
                }
            
            }
        },
        

    
        /*
        =:util
        -------------------------------------------------------------------------------------------- */
        showPendingNotifications:function()
        {
            this.nitro.showPendingNotifications()
        },
        
        showNotificationsByName:function(name)
        {
            this.nitro.showNotificationsByName(name)
        },
        
        /**
         * sho.accounts.nitro.Connection#getUserId(callback, scope) -> Null
         * request the userId associated with the Nitro connection.
        **/
        getUserId:function(callback)
        {
            this.nitro.getUserId(callback);
        },
        
        /**
         * sho.accounts.nitro.Connection#timeStamp() -> String
         * returns a timestamp in the form of number of seconds since unix epoch.
        **/
        timeStamp:function()
        {
            return new Date().getTime() + ""
        },
        
        /**
         * sho.accounts.nitro.Connection#setInitalMetaData() -> Null
         * Populate the default/baseline metadata that will be passed along with all Nitro API requests
        **/
        setInitalMetaData:function(cfg)
        {
            this.metadata = _.extend({}, {
                'platform' : sho.env.platform().key,
                'product' : 'shocom'
            },
            sho.accounts.nitro.parseMeta(),
            (cfg || {})
            )
        },
        
        /**
         * sho.accounts.nitro.Connection#setMetaData(object) -> Null
         * Set the metadata that will be passed along with all Nitro API requests
        **/
        setMetaData:function(m)
        {
            _.extend(this.metadata, m || {});
        },
    
        /**
         * sho.accounts.nitro.Connection#setMetaData(object) -> Null
         * Get a copy of the metadata that will be passed along with all Nitro API requests
        **/
        getMetaData:function()
        {
            return this.metadata;
        },
    
        /**
         * sho.accounts.nitro.Connection#metadataStr(meta) -> Null
         * Utility method for converting the metadata hash to the format Nitro expects
        **/
        metadataStr:function(meta)
        {
            return _.collect((meta || this.metadata), function(val,key){
                return key+':'+val;
            }).join(',')
        }

    });

    /* No surrender, No delete! */
