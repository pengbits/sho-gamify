
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.leaderboards
    @file		        points.js
    @author				ncavanagh
    @modified			03.25.13
    @desc		        Model class for the leaderboard points component
    -------------------------------------------------------------------------------------------- */  
    
    sho.provide('sho.gamify.leaderboards.models');
    
    
	/**
     * class sho.gamify.leaderboards.model
     * model class for the leaderboard 
    **/
	
	/**
     * class sho.gamify.leaderboards.model.points < sho.gamify.leaderboards.model
     * points model class for the leaderboard component
    **/

    !function($)
    {

    sho.gamify.leaderboards.models.points = Backbone.Model.extend({

        '_KLASS_' : 'sho.gamify.leaderboards.models.points',
        defaultCount : 20,
        defaultDuration : 'ALLTIME',
        defaultAvatar : 'http://www.sho.com//assets/images/accounts/avatars/generic/90x90/Generic_90x90.png',
        
        initialize:function(cfg)
        {   
            // import config settings
            _.extend(this, {
                'returnCount' : cfg.config.leaderboardCount,
                'duration' : cfg.config.leaderboardDuration,
                'tags' : cfg.config.leaderboardTags,
                'tagsOperator' : cfg.config.leaderboardTagsOperator,
                'method' : cfg.config.leaderboardMethod,
                'scope' : cfg.config.leaderboardScope,
                'nitro' : sho.accounts.nitro.getInstance(),
                'fn' : {
                    'onReady' : _.bind(this.onReady, this)
                }
            });     
            
            this.callAPI();

        },

        callAPI:function()
        {   
            this.nitro.callAPI({
                   'method':'site.getPointsLeaders',
                   'duration':(this.duration ? this.duration : this.defaultDuration),
                   'returnCount':(this.returnCount ? this.returnCount : this.defaultCount),
                   'tags': this.tags,
                   'tagsOperator': this.tagsOperator,
                   'include_tags':true,
                   'pointCategory':'Points',
                   'preferences':'firstName|lastName',
                   'callback': this.fn.onReady
            });
        },
        
        onReady:function(xhr)
        {   
            var th = this,
            data = xhr.Nitro,
            leaderboardData = data.leaders && data.leaders.Leader ? data.leaders.Leader : null,
            
            success = !!leaderboardData,
            leaders
            ;
            
            // if the object returned is a single user (not an array), create array
            if (!$.isArray(leaderboardData)) {
                var leaderboardData = [data.leaders.Leader]; }
                
            if(success)
            {
                // collect leaders, tweaking attributes where neccesary
                leaders = _.collect(leaderboardData, function(attrs)
                {
                    var c = _.extend({}, attrs);
                    
                    // cast points to numbers if needed, rename as value
                    c.value = Number(attrs.points);
                    
                    // assign username based on nitro user stored preferences; if none, use userId
                    c.userName = (attrs.firstName) ? attrs.firstName : attrs.userId;
                    
                    // assign avatar based on nitro user stored preferences; if none, use sho.com default
                    c.avatar = (attrs.lastName) ? attrs.lastName : th.defaultAvatar;
                    
                    return c;
                })

                this.set({'leaders' : leaders });
                
                // all done!
                this.trigger('ready');
            }
            else
            {
                this.trigger('error', {'error':'No leaderboard data found.' });
            }
        }

    });

    }(sho.$)

