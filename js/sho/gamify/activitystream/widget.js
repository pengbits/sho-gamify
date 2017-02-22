
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.fanclubs
    @file		        Gallery.js
    @author				dpaul
    @modified			03.13.13
    @desc		        fan club Gallery
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.activitystream');

    /**
     * class sho.gamify.activitystream.Widget
     * fan club Gallery - a set of challenge category tiles ( fan club tiles)
    **/

    !function($)
    {

    sho.gamify.activitystream.Widget = klass({
    
        '_KLASS_' : 'sho.gamify.activitystream.Widget',
   
        initialize:function(cfg)
        {
            this.source = sho.dom.data.read(cfg.container, 'source');
            log('hello from '+this._KLASS_+' [src='+this.source+']');
            
            if(this.source == 'challenge_progress') 
            {
               this.model = new sho.gamify.challengestream.Model({
                   'nitroFolder' : cfg.nitroFolder || sho.dom.data.read(cfg.container, 'nitroFolder'),
                   'filter' :      cfg.filter || sho.dom.data.read(cfg.container, 'filter'),
                   'sortBy' :      cfg.sortBy || sho.dom.data.read(cfg.container, 'sortBy'),
                   'sortDir' :     cfg.sortDirection || sho.dom.data.read(cfg.container, 'sort-direction')
               })
            }
            
            if(this.source == 'action_feed') 
            {
                this.model = new sho.gamify.activitystream.Model()
            }
            
            if(this.model)
            {
                this.view =  new sho.gamify.activitystream.View({
                    'container' : cfg.container,
                    'source' : this.source,
                    'model' : this.model
                    
                }) 
            }
                
        }
        

        
    });

    }(sho.$)

    sho.gamify.ActivityStream = sho.gamify.activitystream.Widget;