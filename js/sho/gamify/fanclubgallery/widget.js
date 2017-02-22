
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

    sho.provide('sho.gamify.fanclubgallery');

    /**
     * class sho.gamify.fanclubgallery.Widget
     * fan club Gallery - a set of challenge category tiles ( fan club tiles)
    **/

    !function($)
    {

    sho.gamify.fanclubgallery.Widget = klass({
    
        '_KLASS_' : 'sho.gamify.fanclubgallery.Widget',
   
        initialize:function(cfg)
        {
            
            this.model= new sho.gamify.fanclubgallery.Model()
            this.view=  new sho.gamify.fanclubgallery.View({
                'container' : cfg.container,
                'model' : this.model
            }) 
                
            // log('hello from '+this._KLASS_);
        }
        

        
    });

    }(sho.$)

    // export friendly constructor
    sho.provide('sho.gamify.fanclubs');
    sho.gamify.fanclubs.Gallery = sho.gamify.fanclubgallery.Widget;