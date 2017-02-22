
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.leaderboard
    @file		        navigation.js
    @author				ncavanagh
    @modified		    04.01.13
    @desc		        View class for the navigation component.
    @note               The dropdown arrow had to be added as a separate element to the stock
    @note               sho.com dropdown js markup, because of its placement 
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.leaderboards');

    /**
     * class sho.gamify.leaderboards.navigation
     * View class for the leaderboard navigation component.
    **/

    !function($)
    {

    sho.gamify.leaderboards.navigation = Backbone.View.extend({

        '_KLASS_' : 'sho.gamify.leaderboards.navigation',
        'labels':['TODAY','THIS WEEK','THIS MONTH','THIS QUARTER','ALL TIME'],
   		'values':['DAY','WEEK','MONTH','QUARTER','ALLTIME'],
   		'isNavigating':false,
   		'dropdownArrow':'<span class="leaderboard-dropdown-arrow"></span>',
        
        /*
        =:startup
        ---------------------------------------------------------------------------------------- */
        initialize:function(cfg)
        {
            //log('hello from '+this._KLASS_);
            _.extend(this, {
                'leaderboardContainer' : cfg.leaderboardContainer,
                'navContainer' : cfg.navContainer,
                'leaderboardWidget' : cfg.leaderboardWidget
            });
            
            this.stage = $(this.leaderboardContainer).find('.leaderboard-stage');
            this.navElement = $(this.navContainer).find('.leaderboard-nav');
            if (!this.stage || !this.navContainer || !this.leaderboardWidget) return;
            
            var th = this;
            
        	var leaderboardNav = new sho.ui.menu.DropDown({
               		id:'leaderboard-nav',
               		container:this.navElement[0], 
               		title:'',
               		labels:this.labels,
               		values:this.values,
               		keepSelectionVisible:true,
               		selectedIndex : 4,
               		onSelect:(function(duration){ 
        				th.renderLeaderboard(duration);
        			})	
               });
            
            this.titleElement = $(this.navContainer).find('.dd-title a')[0];
            $(this.titleElement).append(this.dropdownArrow);  
            
            this.navControls = $(this.navContainer).find('.leaderboard-control');
            if(this.navControls) { this.setHandlers(); }
           
        },
        
        setHandlers:function()
        { 
            var th = this;
            $(this.navControls).click(function(e) {
              e.preventDefault();
              var element = this;
              if (!th.leaderboardWidget.view.isNavigating) { th.step(element); }
              return false;
            });
        },
        
        step:function(element)
        {   
            var direction = $(element).attr("rel");
            if (!direction) return;
            
            this.leaderboardWidget.view.isNavigating = true;
            
            var currentDuration = $(this.leaderboardWidget.container).data("leaderboard-duration");
            var index = $.inArray(currentDuration, this.values); 
            var newIndex = (direction == 'next') ? index+1 : index-1;
            
            if (newIndex >= this.values.length) { newIndex = 0; }
            if (newIndex < 0) { newIndex = (this.values.length-1); }
            
            this.renderLeaderboard(this.values[newIndex], newIndex);  
        },
        
        renderLeaderboard:function(duration, idx)
        {   
            $(this.leaderboardWidget.container).data("leaderboard-duration", duration);
            
            this.leaderboardWidget = new sho.gamify.leaderboards.Widget({
				'container' : this.leaderboardContainer,
				'duration' : duration
			});

			$(this.titleElement).html(this.labels[idx]);  
			$(this.titleElement).append(this.dropdownArrow);  
        }
  
    });

    }(sho.$)
