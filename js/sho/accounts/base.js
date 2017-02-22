
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <rebuild>
    @project	    	accounts
    @file		        base.js
    @packagr            sho.accounts
    @author				dpaul
    @modified			10.21.13
    @desc		        singleton-style wrapper around user object, proxies method calls and ensures instantiation
    @desc               sho.accounts.getUserName => (create user...return user.name)..
    -------------------------------------------------------------------------------------------- */  
    
    /**
     * sho.accounts 
     * namespace for accounts code
    **/
    sho.provide('sho.accounts');
    
    !(function(context,$)
	{
        // deprecated
	    //context.modal_dimensions = sho.string.toDimensions('667x212');

		/**
		 * sho.accounts.getUser(function) -> object
	 	 * Provide singleton-style access to User object
	    **/
		context.getUser = (function(){
			if(!sho.accounts.userExists()){ sho.accounts._user_ = new sho.accounts.User(); }			
            return sho.accounts._user_;
        });
        
        /**
         * sho.accounts#userExists() -> Boolean
         * utility method used in the singleton setup - returns true of a user instances already exists
        **/
        context.userExists = (function(){
            return !!(sho.accounts._user_);
        })
        
		/**
		 * each(Array, function) -> function
	 	 * Create static aliases for commonly used user object methods
		**/ 
        _.each(['isAuthenticated',
        'authenticate',
        'isShowtimeSubscriber',
        'isGamified',
        'getUserName',
        'getGender',
        'getUserId',
        'getLiveFyreToken',
        'getGamificationToken',
        'getCurrentAvailablePoints',
        'shouldShowNotifications',
        'getSubscriptions',
        'hasSubscription'], 
        function(method)
        {
                context[method] = (function(params){ 
                    return sho.accounts.getUser()[method](params); 
                })
        });

		/**
		 * sho.accounts.login(function) -> Null
	 	 * Convenience alias to open login modal (it's not really possible to log the user in via a method call)
	    **/
        context.login = (function()
        {
            if(sho.env.isDesktop())
            {
                sho.dom.trigger('login_modal:opened')
                sho.ui.Login();
    		}
    		else
    		{
    		    window.location = "/sho/accounts/login";
    		}
        });        
		
		/**
		 * sho.accounts.logout(function) -> Null
	 	 * Logout is async, must subcribe to logout event to make use of this
	    **/
        context.logout = (function(opts){
            if(!sho.accounts.isAuthenticated()) return true;
            else sho.accounts.getUser().logout();
        });
        
		/**
		 * sho.accounts.refresh(function) -> Null
	 	 * Invoke a reload of the user object (ie after logging in via portal)
		**/
        context.refresh = context.reload = (function(){
            if(sho.accounts.userExists()) sho.accounts.getUser().reload()
            else sho.accounts.getUser();
        });
		
		/**
		 * sho.accounts.allowAuth() -> Boolean
		 * returns true if authentication is supported in the environment.
	 	 * (we only allow authentication functionality and login link display on *.sho.com, localhost and 129.*.*.* and 10.0.2.2)
		**/
        context.allowAuth = (function(){ 
			var h = window.location.host,
			whitelist = /sho.com|localhost|^129\.\d+\.\d+\.\d|^10.0.2.2/,
			canAuth = whitelist.test(h);
			;
			// log('accounts.allowAuth called. h=`'+h+'` canAuth=`'+canAuth+'`' )
			return canAuth;
        });
        
		/**
		 * sho.dom.ready(function) -> Null
	 	 * On protected pages, listen for user logout event, and redirect user to home page when it occurs
		 * On protected pages, listen for user logout event, and redirect user to home page when it occurs
		 * Protected pages have the following meta element: <meta name="spring-protected-page" content="true" />
		**/
       	sho.dom.ready(function() 
       	{
       		if( _.any($('meta[name=spring-protected-page][content=true]')))
       	    {
       	        sho.dom.bind("user:logout:success", function(){
       				 window.location = "/sho/home"
       			});
       	    }

			/**
 			 * check for auto-pop of accounts modal
			**/
       	    var l = window.location.toString(), h = window.location.hash.toString(); 
       	    if(h.length && h.indexOf('/login') > -1) {
       	         sho.accounts.login();
       	         // window.location.hash = '';
       	    }	
        });
        
        /**
         * sho.accounts.guid() -> String
         * Returns a unique string that bears some resemblence to a guid, for example: "8f15c6d7-e372-ea69-4c83-1e765a0f0582"
         * http://note19.com/2007/05/27/javascript-guid-generator/
        **/
        var S4 = function(){ 
            return (((1+Math.random())*0x10000)|0).toString(16).substring(1)
        }
        context.guid = (function(){            
            return 'ANONYMOUS_'+ (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
        })
                
	})(sho.accounts, sho.$);
    /* No surrender, No delete! */
 