
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @project	    	accounts
    @file		        user.js
    @package            sho.accounts
    @author				dpaul
    @author				npohorelsky
    @modified			08.15.13
    @desc		        Model for representing a User in the accounts system. 
    @desc               Wraps the REST actions for accessing user details and invoking a logout
    @note               moved flash-message tracking to flash message
    -------------------------------------------------------------------------------------------- */  
	sho.provide('sho.accounts');
    
	/**
	 * class sho.accounts.User
	 * Model for representing a User in the accounts system. Wraps the REST actions for accessing user details and invoking a logout
	**/
    
	!(function($){
    sho.accounts.User = klass({
        
        _KLASS_ : 'sho.accounts.User',
        
        url_base : '/rest/accounts/security/',
        
        urls : {
            'read' :    'context',
            'write' :   'login',
            'destroy' : 'logout'
        },
        
    	/*
        =:startup 
        ---------------------------------------------------------------------------------------- */
        initialize:function()
        {		
			if (!sho.accounts.allowAuth()) { return; }
			
            this.data = {};
            this.sync('read');			
        },
        
        sync:function(operation, data)
        {	
            
            var th  = this, 
                url = this.url_base + this.urls[operation]
            ;
            if(operation !== 'write')
            {
                $.ajax({
                    'url':url,
    				'dataType': 'json',
    				'cache':false, // force uncached request in IE
    				'success': (function(data, status, xhr) {				
    					var callback = sho.string.camelize('on-'+operation);
                        th[callback](data);					
    				})
    			})
			}
			else
			{
			    $.post(url, data, function(xhr){
			        th.onAuthenticate(xhr);
			    })
			    .fail(function(){
			        th.trigger('authenticate:error', {
                        'message' : 'A server error has occurred'
                    })
			    })
			}
    		
        },
        
        extractUser:function(xhr)
        {
            this.data = xhr.data.user ? _.extend({'isAuthenticated':true}, xhr.data.user) : {};
            this.cookieUserState();
        },
        
        onRead : function(xhr)
        {							
            this.extractUser(xhr);		          
            this.trigger('loaded', this.data);
            this.isAuthenticated() && this.trigger('loaded:authenticated', this.data);	
        },
        
        onDestroy:function(xhr)
        {
            this.data = {};
            this.cookieUserState();
            this.trigger('logout:success');
        },
        
        authenticate:function(cfg)
        {
            if( _.isEmpty(cfg.email) || _.isEmpty(cfg.password)) 
            {
                this.trigger('validation:error', {
                    'message' : 'Email and password are required'
                })
            }
            else {
                this.sync('write', {
                    'email' :  cfg.email,
                    'password': cfg.password,
                    '_spring_security_remember_me' : !!cfg.rememberMe
                })
            }  
        },
        
        onAuthenticate:function(xhr)
        {
            this.extractUser(xhr);
            
            if(this.isAuthenticated())
            {
                this.trigger('authenticate:success', this.data);
            }
            else
            {
                this.trigger('authenticate:error', {
                    'message' : 'You have entered an invalid email or password'    
                })
            }
        },
        
        logout:function()
        {
            this.trigger('logout:loading');
		    this.sync('destroy');
		    sho.analytics.getTracker().trackClick({
            	click : 'navigation:log out'
            });
        },
        
        /* 
    	=:runtime, =:util
        ---------------------------------------------------------------------------------------- */
        trigger:function(eventName, e)
        {
			sho.dom.trigger('user:'+eventName, e);
        },
        
        reload:function()
        {
            this.sync('read');
        },
        
        muteGamificationNotifications:function()
        {
            // this cant be working, it seems this.gamificationNotificationCookieName is undefined
            sho.util.Cookies.write(this.gamificationNotificationCookieName, "false", 1825);
        },
        
        cookieUserState:function(property)
        {
            var th=this,method,value,
                propList = (!!property ? [property] : ['authenticated','gamified'])
            ;
            
            _.each(propList, function(prop){
                method =    sho.string.toMethodName('is-'+prop);
                value =     th[method].call(th);
                th.setCookie(prop, value)
            })        
        },
        
        setCookie:function(property, value)
        {
            var c = sho.util.Cookies,
                k = 'user_'+property
            ;
            if(eval(c.read(k)) == value) 
            {
                //log('|user| setCookie not needed for `'+property+'`, cookie already set to `'+value+'`')
            }
            else
            {
                //log('|user| setCookie `'+property+'`=`'+value+'`');
                c.write(k, value);
                
            }
        },
        
        /* 
    	=:email signup
        ---------------------------------------------------------------------------------------- */
        getSubscriptions:function()
    	{
    	    return this.data.subscriptionIdSet
    	},
    
        hasSubscription:function(id)
        {
            return _.indexOf(this.getSubscriptions(), id) > -1;
        },
    	            
        /* 
    	=:accessors
        ---------------------------------------------------------------------------------------- */
        getUserName:function(){
            return this.data.username
        },

        getGender:function()
        {
            var gender = this.data.gender, map = {
                'F':'female',
                'M':'male'
            };
            return map[gender];
        },

        isShowtimeSubscriber:function(){
            return this.data.subscribeToShowtime;
        },
        
        isAuthenticated:function(){
            return !!this.data.isAuthenticated
        },
        
        isGamified:function(){
            return this.data.isGamificationParticipant == 'YES';
        },

		getUserId:function() {
			return this.data.id
		},
	    
	    getEmail:function() {
			return this.data.email
		},
	    
        getToken:function(key){
	        return (this.data.tokenMap) ? this.data.tokenMap[key] : null;
	    },
	    
    	getLiveFyreToken:function() {
    		return this.getToken('socialize')
    	},
    	
    	getGamificationToken:function(){
    	    return this.getToken('gamification')
    	},
        
        shouldShowNotifications:function() {
            if(this.isAuthenticated()) {
                if (this.data.isGamificationParticipant == "YES") return true;
                if (this.data.isGamificationParticipant == "NO") return false;
            }
            return !this.gamificationNotificationsMuted();
        },
        
        gamificationNotificationsMuted:function() {
            return ( sho.util.Cookies.read('GAMIFICATION_NOTIFICATIONS') == "false" );
        }
    })
    
    })(sho.$);
    
