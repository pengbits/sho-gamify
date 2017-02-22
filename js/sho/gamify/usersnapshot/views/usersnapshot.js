
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.usersnapshot
    @file		        view.js
    @author				ncavanagh
    @modified		    03.25.13
    @desc		        View class for the user snapshot component
    @desc               set handlers for the login button
    -------------------------------------------------------------------------------------------- */  

    /**
     * class sho.gamify.usersnapshot.views.UserSnapshot
     * View class for the leaderboard component.
    **/

    !function($)
    {

    sho.gamify.usersnapshot.views.UserSnapshot = Backbone.View.extend({

        '_KLASS_' : 'sho.gamify.usersnapshot.views.UserSnapshot',
    
        'seriesName' : null,

        /*
        =:startup
        ---------------------------------------------------------------------------------------- */
        initialize:function(cfg)
        {
            //log('hello from '+this._KLASS_); 
            this.container = $(cfg.container)
            
            // grab the series name to inject into the Points Info modal markup
            this.seriesName = sho.gamify.series_name ? sho.gamify.series_name : ''; 
            
            this.setHandlers();
            this.setEventListeners();
        },
        
        setHandlers:function()
        {            
            // search for all gamification call-to-actions, even if they are outside the user snapshot container, and attach the opt-in behavior
            $('.gamification-signup').click(function(e) {
                e.preventDefault();
                // not using sho.dom.trap as that supressed the click-tracking we marked up on the button 
                sho.accounts.nitro.optIn();
                return false;
            });
            
            // tooltips
            //  search for all tooltips, and attach modal behavior
            $('.gamify-icon-info').click(function(e){
                sho.dom.trap(e);
                
                var key = $(e.currentTarget).attr('id'); 
                sho.gamify.showModal(key); // see /sho/gamify/modals.js
            })
        },
        
        setEventListeners:function()
        {
            var fn = this.onUserChangeEvent;
            sho.accounts.nitro.user_change_events.each(function(e){
                sho.dom.bind(e, fn)
            })
        },
        
        onUserChangeEvent:function(e)
        {
            // don't blindly refresh for all events, as there could be either
            // a) destination pending as part of an opt-in from a challenge get started button
            // b) an opt-in flow in progress (confirm ui is open)
            
            log('|snapshot| responding to `'+e.type+'` reload?');
            if(sho.accounts.nitro.optInPending() && e.type == 'user:loaded:authenticated')
            {
                log('|snapshot| we have probably just returned from a little gigya round-trip action... we need to show the confirm ui');
                sho.gamify.showConfirmUI()
            }
            
            if((!sho.accounts.nitro.destinationPending() && !sho.accounts.nitro.optInPending() && e.type !== 'user:loaded:authenticated') || e.type == 'user:gamify:optin:cleared')
            {
                log('|snapshot| reload=true');
                window.location.reload();
            }
        }
    	
    });

    }(sho.$)
