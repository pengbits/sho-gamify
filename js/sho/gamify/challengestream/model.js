
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify.challengestream
    @file		        model.js
    @author				dpaul
    @modified			03.04.14
    
    my copy of IE9 is choking on this more straight-forward inheritance directive:
    sho.gamify.challengestream.Model = sho.gamify.challengegallery.models.Gallery.extend({})
    
    but using the more heavy-handed extend() style doesn't work either...
    sho.gamify.challengestream.Model = Backbone.Model.extend(_.extend({}, sho.gamify.challengegallery.models.Gallery.prototype))
    
    however, dev+qa seem fine in IE9, so it may be hung up on some local security nonsense ..
    or dependency order is a problem???
    -------------------------------------------------------------------------------------------- */  

    /**
     * sho.gamify.challengestream.model
     * wrapper around api calls for in-progress activity stream
    **/
    
    sho.provide('sho.gamify.challengestream');      
    sho.gamify.challengestream.Model = sho.gamify.challengegallery.models.Gallery.extend({
        
        '_KLASS_' : 'sho.gamify.challengestream.Model',
        
        /*
        =:startup
        ---------------------------------------------------------------------------------------- */ 
        initialize:function(cfg)
        {
            if(!sho.accounts.isGamified())
            {
                // you can't have any challenges in-progress without joining red rewards, so just set items to emty array
                this.set({'challenges':[]});
                var fn = _.bind(this.trigger, this, 'ready'); _.delay(fn, sho.dom.REDRAW_DELAY_)
            }
            else
            {
                // limit challenges to those that have been started
                cfg.user_progress = 'in_progress';
                
                // sort by progress
                cfg.sortBy = 'progress';
                
                // challenges nearest completion first
                cfg.sortDir = 'descending';
                
                sho.gamify.challengegallery.models.Gallery.prototype.initialize.call(this, cfg)
            }
        },
        
        isEmpty:function()
        {
            return this.get('challenges').length == 0
        }
        
        
    })

    // No surrender, No delete!