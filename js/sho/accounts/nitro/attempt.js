
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @project	    	nitro
    @package            sho.accounts.nitro
    @file               attempt.js
    @author				npohorelsky
    @modified			5.2.13
    @desc		        Opt-in flow handling for gamification
    ------------------------------------------------------------------------------------------*/
    
    sho.provide('sho.accounts.nitro');
    
    (function(context,$)
    {
        
        _.extend(context, {	
            
            // name of the cookie that the API will set upon opt-in request
            'ATTEMPT_XHR_KEY' : 'SHO_RR_OPT_IN',
            
            // list of user events that accompany a change in gamification status
            'user_change_events' : [''+
                'user:login:success',
                'user:logout:success',
                'user:authenticate:success',
                'user:loaded:authenticated',
                'user:gamify:optin',
                'user:gamify:optin:cleared'
            ],

			// Private object for holding state
            '_attempt_data_' : {},
            
            /**
             * sho.accounts.nitro.optIn() -> null
             * Abstracts away the opt in use cases from calling code
             * Opts in logged in users and sets the opt in intent for logged out users and pops the login modal
            **/
            'optIn' : (function(){ 
                this._attemptOptInAndProceedToURL(null);
            }),
            
            /**
             * sho.accounts.nitro.optOut(url) -> null
             * Opts a user out of gamification if they are logged in and drops a cookie to suppress notifications if they are logged out
            **/
            'optOut' : (function(){
                if( this._attempt_data_.lock ) return; // Defend against rapid fire clickers                
                this._attempt_data_.lock = true;

                if(sho.accounts.isAuthenticated()) {
                    $.ajax({
                        url: this._url(false),
                        type: 'PUT',
                        dataType: 'json',
                        context: this,
                        success: function(data, textStatus, xhr) {
                            sho.accounts.refresh();
                            this._resetData();
                        },
                        error: function(xhr, textStatus, errorThrown) {
                            // mute them cause the opt out failed
                            sho.accounts.getUser().muteGamificationNotifications();
                            this._resetData();
                        }
                    });
                } else {
                    sho.accounts.getUser().muteGamificationNotifications();
                    this._resetData();
                }
            }),
            
            /**
             * sho.accounts.nitro.attemptChallenge(url) -> null
             * Abstracts away the opt in use cases from calling code.
             * If a user is logged in but not gamified, it will opt them in and proceed to the url
             * If a user is not logged in, it will attempt to log them in and then proceeed to the url
             * If a user decides to register .. we set intent but we stop there - they'll have to find that challenge themselves
            **/
            'attemptChallenge' : (function(url){
                this._attemptOptInAndProceedToURL( url );
            }),
            
            
            // safely call confirm ui regardless of user state
            'showConfirmUI' : (function(){
                
                // 1) ungamified users need the confirm ui...      
                if(sho.accounts.nitro.optInPending() && !sho.accounts.isGamified()) {
                    sho.gamify.showModal('confirm-optin'); 
                    sho.accounts.nitro.clearOptIn({silent:true});
                }
                
                // 2) but gamified users who find themselves here just need to go about their business.
                else  { 
                    sho.ui.modals.close();
                    sho.accounts.nitro.clearOptIn();
                }
                
            }),
            
            'optInPending' : (function(){
                return !!sho.util.Cookies.read(this.ATTEMPT_XHR_KEY);
            }),
            
            'clearOptIn' : (function(opts){
                sho.util.Cookies.clear(sho.accounts.nitro.ATTEMPT_XHR_KEY);
                if(opts && opts.silent) return
                
                _.delay(sho.dom.trigger, sho.dom.REDRAW_DELAY_, 'user:gamify:optin:cleared');
                
            }),
            
            /**
             * sho.accounts.nitro._attemptOptInAndProceedToURL(url) -> null
             * Abstracts away the opt in use cases from calling code.
             * If a user is logged in but not gamified, it will opt them in and proceed to the url
             * If a user is not logged in, it will attempt to log them in and then proceeed to the url
             * If a user decides to register .. we set intent but we stop there - they'll have to find that challenge themselves
            **/
            '_attemptOptInAndProceedToURL' : (function(url){
                
                log('|attempt| attemptOptInAndProceedToURL!');
                
                if( sho.accounts.isGamified()) {
                    log('|attempt| user is gamified, redirecting to `'+url+'`');
                    if ( url ) window.location = url;
                    return; 
                };
                if( this._attempt_data_.lock ) return; // Defend against rapid fire clickers
                
                this._attempt_data_.lock = true;
                
                var th=this;
                // auto-unlocking the attempt lock because not every unlock case accounted for
                setTimeout(function(){ th._attempt_data_.lock = false; }, 1000);
                
                this._attempt_data_.destinationUrl = url;
                
                if(sho.accounts.isAuthenticated()) 
                { 
                    sho.dom.trigger('login_modal:opened'); 
                    sho.gamify.showModal('confirm-optin');
                    this._setOnLoginListeners();
      
                } else { 
                    // notify backend and open login modal
                    // this PUT request results in a cookie being set that we can then check for on login success.
                    $.ajax({
                        url: this._url(true),
                        type: 'PUT',
                        dataType: 'json',
                        context: this,
                        success: function(data, textStatus, xhr) {
                            this._setOnLoginListeners();
                            sho.accounts.login();
                        },
                        error: function(xhr, textStatus, errorThrown) {
                            log( errorThrown );
                            sho.accounts.login(); // we open the modal anyway cause we want them to login
                        }
                    });
                }
            }),
            
            '_url' : (function(optIn){
                return '/api/accounts/opt-in?opt=' + optIn;
            }),

            '_resetData' : (function(){
                this._attempt_data_.lock = false;
                this._attempt_data_.destinationUrl = null;            
            }),
            
            /**
             * sho.accounts._setOnLoginListeners() -> null
             * Attach a callback to successful login, to carry the user all the way to their intended destination (a challenge)
             * I would have thought we'd need to unset this after it fires, but it doesn't seem to matter
            **/
            '_setOnLoginListeners' : (function(){
                if(!this.destinationPending()) return;
                
                var fn= _.bind(context._continueToDestination, context); // _.bind(this.method, this) doesnt work here..
                sho.dom.bind('user:gamify:optin', fn);
                sho.dom.bind('user:authenticate:success', function(e){
                    // have to ensure user is gamified in case this was fired from the login screen before the confirm ui!
                    sho.accounts.isGamified() && fn(e);                    
                });
            }),
            
            '_continueToDestination' : (function(e)
            {
                var url = this._getDestination();
                log('|attempt|  responding to `'+ e.type+ '` continue to destination: `'+url+'`');
                sho.accounts.nitro._resetData();
                
                // need a delay to give the callback below a chance to clear cookie,
                // also it's worth confirming the url exists in case we are in a strange state after
                // clicking on get started challenge button and then closing modal (SITE-8311)
                !!url && _.delay(function(){ window.location = url; }, sho.dom.REDRAW_DELAY_);
            }),
            
            '_getDestination' : (function(){
                return this._attempt_data_.destinationUrl
            }),
            
            /**
             * sho.accounts.nitro.destinationPending(null) -> Boolean
             * returns true if there is a destination pending
            **/
            'destinationPending' : (function(){
                return !!this._getDestination()
            })
        })
                
    })(sho.accounts.nitro, sho.$)
    
    // let's set intial state from here 
    sho.accounts.nitro._resetData();
    
    // alias sho.accounts.nitro.confirm as sho.gamify.confirm()
    sho.provide('sho.gamify');
    sho.gamify.showConfirmUI = sho.accounts.nitro.showConfirmUI;
    