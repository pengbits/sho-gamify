
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <rebuild>
    @project	    	nitro
    @package            sho.accounts.nitro
    @file               actions.js
    @author				dpaul
    @modified			04.06.13
    @desc		        defines all actions to that we want to log in the nitro system, usually in response to a custom events
    @desc               for simple event->nitro.logAction aliasing, add the tags you want to log to the nitro_events hash below
    @note               https://issues.sho.com/browse/SITE-1196
        
    ------------------------------------------------------------------------------------------*/
    // inside the closure, sho.accounts.nitro.getInstance() is aliased as nitro(),
    // and sho.accounts.nitro is aliasd as workspace
    
    !(function(nitro,workspace)
    {
        // set verbose logging for nitro actions (really only visible on desktop, as we explicitly log to console)
        workspace.noisy_logging = true;
        var nitro_events = {
        
            // accounts                                        
            'user:register': 				        'profile_register',
            'user:newsletter:subscribe':            'profile_newsletters', 
           	'user:interest': 						'profile_interests',
			'user:profile:about':		 			'profile_about',
			'user:profile:avatar': 					'profile_avatar',		
			'user:profile:location': 				'profile_location',
			'user:profile:update':                  'profile_update', 			
        
            // schedules, episode guide, and new photogalleries
            'photogallery:opened':                  'photogallery_launch',
            'photogallery:image:viewed':            'photogallery_view',
            
            // social
            'socialize:post':                       'socialize_post',
            'content:shared':                       'content_share',
    		'twitter:follow':                       'twitter_follow',
    		// (more social handlers defined below)
		 
    		// order
    		'order:coupon_redeem':			        'order-coupon_redeem',
		
    		// games
    		'game:started':                         'game_start',
    		'game:ended':                           'game_score',
		
    		// search (global nav)
    		'searchbox:submitted':                  'site_search'
                                                
        };
        
        var genericCallback = (function(xhr){
           if(sho.accounts.nitro.noisy_logging) console.log(JSON.stringify(xhr))
        });
        
        // loop through hash of public events and map them to nitro.logAction
        _.each(nitro_events, function(str,eventName){
            sho.dom.bind(eventName, (function(){
                workspace['deferredLogAction']({
                    'tags':str
                })
            }));
        });
        
        // log the nitro action if the connection is ready, otherwise wait for 'user:loaded'
        workspace.deferredLogAction = (function(cfg)
        {
            cfg.callback = genericCallback;
            
            var fn = function(){
                nitro().logAction(cfg);
            }
            
            if(sho.accounts.nitro.hasInstance())
            {    
                // log('|actions| log nitro action normally');
                fn();
            }
            else
            {            
                // log('|actions| no nitro instance found, deferring until user json is ready');
                sho.dom.once('user:loaded', fn); // one-time only
            }
        });
        
        /*
        define more complicated callbacks with functions:
        ------------------------------------------------------------------------------------------*/        
        sho.dom.bind('user:loaded', function(e,evnt)
        {
            // get the user object to pass to nitro
            var user = evnt || {};
        
            // this is first time the nitro instance is accessed (initialized), so this is our chance to pass in the user object
            var n = nitro({'user':user});
        
            // we are no longer logging the page view action
            // n.logAction({
            //     'tags' :    'page_view',
            //     'callback' : genericCallback
            // });
        });
        
        /* 
        =:social, =:util
        ------------------------------------------------------------------------------------------*/
        var isFollow = (function(url){
            // determine if this is a page-level `like` or a series/network-level `follow`
            return /(http|https):\/\/www.facebook.com/.test(url);
        }),
        
        isVideo = (function(url){
            // determine if the url is a video, in which case, we'll refresh meta from the player model
            return /\/sho\/video\/titles/.test(url);
        });
        
        
        /* 
        =:facebook
        ------------------------------------------------------------------------------------------*/
        sho.dom.bind('facebook:like', function(e,url){
            
            log('|facebook:like| url='+url+' isFollow='+isFollow(url) +' isVideo='+isVideo(url));
            
            if(isVideo(url))    sho.dom.trigger('video_player:facebook:like');      
            else                nitro().logAction({ 'tags': (isFollow(url) ? 'facebook_like':'content_share') });
        })
    
        
        /* 
        =:twitter tweet
        this was a simple alias ('twitter:tweet': =>'content_share'), but that doesn't work for video player
        since this is global TEST IN SIMPLER CONTEXTS!
        ------------------------------------------------------------------------------------------*/
        sho.dom.bind('twitter:tweet', function(e,twittrEvent){
            
            log(twittrEvent);
            log(twittrEvent.target);
            log(twittrEvent.target && twittrEvent.target.src);
    
            var src = unescape(twittrEvent.target.src + ''),
                url = /&url=(.+)/.test(src) ? src.split('&url=')[1] : ''
            ;
            
            log('|twitter:tweet| url='+url+' isVideo='+isVideo(url));
            
            if(isVideo(url))    sho.dom.trigger('video_player:twitter:tweet');      
            else                nitro().logAction({ 'tags': 'content_share' });
        })
        
        /*
        =:google plus, =:g+ share
        ------------------------------------------------------------------------------------------*/
        sho.dom.bind('google:plus_one:on', function(e,data){
            
            var url = data.href;
            
            log('|google:plus_one:on| url='+ url+' isVideo='+isVideo(url));
            
            if(isVideo(url))    sho.dom.trigger('video_player:google:plus_on:on')
            else                nitro().logAction({ 'tags': 'content_share' })
        })
        
    
    
        /*
        =:video-player
        this is a little cryptic, but essentially we create a closure to avoid polluting 
        the global scope with helper functions needed to pluck accurate metadata from the player
        ------------------------------------------------------------------------------------------*/
        workspace['logVideoAction'] = function(tags)
        {
            if(!sho.video.playerExists()) return; // not likely, except in console-driven tests
            var model = (sho.video.getModel()),
            type =      (model.isFullEpisode() ? 'episode' : 'promo'),
            tags =      (/video_(watch|complete)/.test(tags) ? (tags + '_' + type) : tags),
            call =      {
                'tags' : tags,
                'metadata' : {}
            };
            
            // build up the neccesary metadata for the video by calling the individual model getters..
            // while we could inspect model.video.attributes directly, these helpers cast values to strings
            // and handle the aliasing of seasonNum as seasonNumber..		
            _.each(['seriesId','seasonNumber','episodeId','id'], function(k)
            {				
                var method = sho.string.toMethodName('get-video-'+k);
                var value = model[method].call(model);
                k = k == 'episodeId' ? 'titleId' : k; // rename to Nitro's liking...
                k = k == 'id' ? 'videoId' : k; // rename to Nitro's liking...
                if(!!value) call.metadata[k]=value;
            })
            
            // switched to deferredLogAction to handle auto-opened video watch action for SITE-7587
            workspace.deferredLogAction(call);
        }
        
        sho.dom.bind('video_player:video:loaded',                   _.bind(workspace.logVideoAction, workspace, 'video_watch'));
        sho.dom.bind('video_player:experience:media:finish_line',   _.bind(workspace.logVideoAction, workspace, 'video_complete'));
        sho.dom.bind('video_player:shareable:success',              _.bind(workspace.logVideoAction, workspace, 'content_share'));
        sho.dom.bind('video_player:clipboard:copied',               _.bind(workspace.logVideoAction, workspace, 'content_share'));
        sho.dom.bind('video_player:facebook:like',                  _.bind(workspace.logVideoAction, workspace, 'content_share'));
        sho.dom.bind('video_player:twitter:tweet',                  _.bind(workspace.logVideoAction, workspace, 'content_share'));
        sho.dom.bind('video_player:google:plus_on:on',              _.bind(workspace.logVideoAction, workspace, 'content_share'));
        
        /*
        =:mobile video actions
        (actions are attached to links on mobile site, since there are no player events to hook into)
        see behaviors/gamification.js
        ------------------------------------------------------------------------------------------*/
        
    })(sho.accounts.nitro.getInstance, sho.accounts.nitro)

    /* No surrender, No delete! */
