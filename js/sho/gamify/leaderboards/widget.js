
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.leaderboards
    @file		        widget.js
    @author				ncavanagh
    @modified			03.25.13
    @desc		        leaderboard wrapper class
    -------------------------------------------------------------------------------------------- */  
    
    sho.provide('sho.gamify.leaderboards');
    
    /**
     * class sho.gamify.leaderboards.Widget
     * component for rendering a leaderboard
    **/
    
    !function($)
    {
    
    sho.gamify.leaderboards.Widget = klass({
        
        '_KLASS_' : 'sho.gamify.leaderboards.Widget',
       
        initialize:function(cfg)
        {
            //log('hello from '+this._KLASS_);
                        
            this.container = cfg.container;
            
            $(this.container).addClass('loading');
            
            // defaults are handled in model for now
            this.config = {};
            this.config.leaderboardCount = sho.dom.data.read(cfg.container, 'leaderboardCount');
            this.config.leaderboardDuration = cfg.duration ? cfg.duration : sho.dom.data.read(cfg.container, 'leaderboardDuration');
            this.config.leaderboardScope = sho.dom.data.read(cfg.container, 'leaderboardScope');
            this.config.leaderboardTags = sho.dom.data.read(cfg.container, 'leaderboardTags');
            this.config.leaderboardTagsOperator = sho.dom.data.read(cfg.container, 'leaderboardTagsOperator');
            this.config.leaderboardNav = sho.dom.data.read(cfg.container, 'leaderboardNav');
            
            // set this via JS for future reference in navigation
            $(this.container).data("leaderboard-duration", this.config.leaderboardDuration);
               
            // originally multiple leaderboard methods were accepted: points, challenge, action
            // removed all but points, others not needed
            this.model = new sho.gamify.leaderboards.models['points'] ({
              'config' : this.config
            });

            this.view = new sho.gamify.leaderboards.views.Board({
              'model' : this.model,
              'container' : this.container
            });
          
            this.navContainer = $('.leaderboard-controls').get(0);
            
            if(this.navContainer && this.config.leaderboardNav != 'created') {
                this.navigation =	new sho.gamify.leaderboards.navigation ({
    				'navContainer' : this.navContainer,
    				'leaderboardContainer' : this.container,
    				'leaderboardWidget' : this
    			});
    			
    			// set an attribute on the container once the navigation is created
    			// to avoid trying to recreate the navigation again
    			// since navigating initializes a new widget
    			$(this.container).data("leaderboard-nav", 'created');
    		}
 
        }
    
    });
    
    }(sho.$)
    
    