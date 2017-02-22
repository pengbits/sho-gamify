
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <rebuild>
    @project	    	nitro
    @package            sho.accounts.nitro
    @file               notifications.js
    @author				ncavanagh
    @modified			05.13.13
    @note               reverted changes until homeland is ready to go out w/ 6.2.11		        
    
    ------------------------------------------------------------------------------------------*/
    sho.provide('sho.accounts.nitro');
  
      sho.accounts.nitro.Notifications = function($,nitro)
      { 
          var nitro_events_for_opt_in_notifications = [
                'photogallery_launch',
                'socialize_post',
                'content_share',
        		'twitter_follow',
        		'facebook_like',
        		// 'video_watch_promo',
        		// 'video_watch_episode',
        		'video_complete_promo',
        		'video_complete_episode'
          ];
      
          var tags_for_opt_in_notifications = [ 
                'seriesId:323',
                'seriesId:804',
                'seriesId:1003223'
          ];

          // this event is triggered from connection.js before the API call
          var nitro_action_event = 'nitro:action';

          var notification_interval = 5000;
      
          // this is the name of the notification in the bunchball console
          var opt_in_notification_name = "Sho www - Opt In";
      
          function init()
          {     
                // window listeners so notifications are not 'missed'...too much?
                var isActive = true;
                window.onfocus = function(){ isActive = true; }; 
                window.onblur = function(){ isActive = false; };
                
                // only show notifications if platform is desktop
                if(sho.env.platform().key != 'desktop') { return; }
                
                // nitro instance passed in closure is not working atm...
                var instance = sho.accounts.nitro.getInstance(); 
            
                // set up opt in notification handling and display
                // opt in notifications are only for non-gamified users
                sho.dom.bind(nitro_action_event, (function(event, call){
                    
                    // the check for gamification is here because the user could log in on the page after the init
                    // also check that the nitro action event has tags/metadata attached
                    // and that there isn't already a notification displayed
                    if(sho.accounts.isGamified() || !call.tags || $('.nitro-notify').length > 0) { return; }
                
                    var tagsArray = call.tags.split(',');
                    
                    _.each(tagsArray, function(eventName){
                        if ($.inArray(eventName, nitro_events_for_opt_in_notifications) >= 0) { 
                            _.each(tagsArray, function(eventName){
                                if ($.inArray(eventName, tags_for_opt_in_notifications) >= 0 && !!sho.accounts.shouldShowNotifications()) {
                                    instance.nitro.showNotificationsByName(opt_in_notification_name); 
                                }
                            });
                        }
                    });

                }));
            
                // if the user is gamified, set up recurring check for pending notifications
                // we needed a way to turn this behavior off for manual tests etc - dpaul
                if(!!sho.accounts.isGamified()) 
                {
                    if(sho.gamify && sho.gamify.disable_notification_loop) return;
                    
                    var notifier = setInterval(function() { 
                        if(isActive) { instance.showPendingNotifications(); }
                    }, notification_interval);
                }

          }
	
    	  return {
    	        'init' : init
    	  }

      }(sho.$, sho.accounts.nitro.getInstance)
  
      /* attach to dom ready */
      sho.dom.bind('nitro:init', sho.accounts.nitro.Notifications.init);

