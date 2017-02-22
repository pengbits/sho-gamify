
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @project	    	nitro
    @package            sho.accounts.nitro
    @file               satics.js
    @author				dpaul
    @modified			11.12.12
    @desc		        static method calls for nitro integration
    ------------------------------------------------------------------------------------------*/
    
    sho.provide('sho.accounts.nitro');
    
    (function(context,$)
    {
        var meta_props = 'series-id season-number episode-number title-id category'.split(' '),
        
        /**
         * sho.accounts.nitro.getInstance(cfg) -> Klass 
         * Singleton-style constructor for the nitro connection. Aliased as nitro() internally, as a convenience.
        **/
        nitro = context.getInstance = function(cfg)
        {	
			if(!sho.accounts.allowAuth()) { return; }
			
            var k = '_nitro_connection_';
            
            if(!sho.accounts.nitro[k]){ sho.accounts.nitro[k] = new sho.accounts.nitro.Connection(cfg || {}); }  
            return sho.accounts.nitro[k]
        }
        ;
        _.extend(context, {
            /**
             * sho.accounts.nitro.hasInstance
             * returns true if the nitro connection has been created
            **/
            'hasInstance' : (function(){
                return !!sho.accounts.nitro['_nitro_connection_'];
            }),
            
            /**
             * sho.accounts.nitro.anonymous_user_id = 'NITRO_showtime_anon_user'
             * the anonymous user id that is used to keep achievements from showing up in the gallery,
             * for users that haven't opted in to gamification
            **/
            'anonymous_user_id' : 'NITRO_showtime_anon_user',
            
            /**
             * sho.accounts.nitro.callAPI(params,callback,scope) -> Null
             * Convenience method for getting an instance of sho.accounts.nitro.Connection and invoking callAPI on it.
            **/
            'callAPI' : (function(params, callback, scope){
                nitro().callAPI(params, callback, scope);
            }),
            
            /**
             * sho.accounts.nitro.processResult(data,token) -> Null
             * Static callback for Nitro API call response. 
             * Proxies the response over to the instance of sho.accounts.nitro.Connection.
            **/
            'processResult' : (function(data, token){
                nitro().processResult(data, token);
            }),
            
            /**
             * sho.accounts.nitro.parseMeta() -> Object
             * Iterate over all meta-tags that are found in the format `<meta name="nitro-[key]" />`,
             * and build up an object of key value pairs
            **/
            'parseMeta' : (function()
            {
                return _.inject(context.metaTags(), function(tag,el)
                {
                    var name = $(el).attr('name').split('nitro-')[1], // IE didn't like split on regex (was string.split(/^nitro-/))
                        val =  $(el).attr('content'),
                        key = sho.string.camelize(name)
                    ;
                    tag[key] = val; return tag;
                    
                }, {})
                
            }),
            
            /**
             * sho.accounts.nitro.parseMetaStr() -> Object
             * Parse a colon-deliminated meta string in the format 'seriesId:323,seasonNumber:1'
             * and build up an object of key value pairs
            **/
            'parseMetaStr' : (function(str)
            {
                // log('|nitro.statics| parseMetaStr');
                return _.inject((str||'').split(','), function(tag,pair)
                {
                    var key,val,matches = pair.match(/\s*([^:]+):([^:]+)\s*/);
                    if(!matches) return tag;
                    
                    key = matches[1]; val = matches[2];
                    tag[key] = val; return tag;
                    
                }, {});
            }),
            
            /**
             * sho.accounts.nitro.metaTags() -> WrapperSet
             * Returns a wrapper set of metatag elements that have the 'nitro-' prefix.
            **/
            'metaTags' : (function(){
                return $( _.collect(meta_props, function(p){
                    return 'meta[name=nitro-'+p+']';
                }).join(','))
            }),
            
            /**
             * sho.accounts.nitro.isGamified() -> Boolean
             * Returns true if the user has opted in to the gamification program
            **/
            'isGamified' : (function(){
                return sho.accounts.isGamified()
            }),
            
            /**
             * sho.accounts.nitro.getPointsBalance() -> Object
             * Returns the points balance associated with user (literally, the contents of the gamification object nested inside the user JSON in memory)
            **/
            'getPointsBalance' : (function(){
                var user =  sho.accounts.getUser().data,
                    data =  user.gamification || {},
                    pts =   data.pointsBalance || {
                        'lifetimeBalance' : 0,
                        'points' : 0
                    }
                ;
                return pts
            }),
            
            /**
             * sho.accounts.nitro.getCurrentPointsBalance() -> Number
             * Returns the current points  associated with user
            **/
            'getCurrentPointsBalance' : (function(){
                return sho.accounts.nitro.getPointsBalance().points
            }),
            
            /**
             * sho.accounts.nitro.getLifetimePointsBalance() -> Number
             * Returns the lifetime points  associated with user
            **/
            'getLifetimePointsBalance' : (function(){
                return sho.accounts.nitro.getPointsBalance().lifetimeBalance
            })
        })
    
        
    })(sho.accounts.nitro, sho.$)
    
    /* No surrender, No delete! */
 