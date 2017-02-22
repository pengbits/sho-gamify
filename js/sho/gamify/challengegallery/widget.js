
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.challengegallery
    @file		        widget.js
    @author				dpaul
    @modified			03.13.13
    @desc		        challenge gallery wrapper class
    -------------------------------------------------------------------------------------------- */  
    
    sho.provide('sho.gamify.challengegallery');
    
    /**
     * class sho.gamify.challengegallery.Widget
     * component for rendering a the challenge gallery, ie, in a challenge gallery
    **/
    
    !function($)
    {
    
    sho.gamify.challengegallery.Widget = klass({
        
        '_KLASS_' : 'sho.gamify.challengegallery.Widget',
       
        initialize:function(cfg)
        {
            this.model = new sho.gamify.challengegallery.models.Gallery({
                'nitroFolder' : cfg.nitroFolder || sho.dom.data.read(cfg.container, 'nitroFolder'),
                'filter' :      cfg.filter || sho.dom.data.read(cfg.container, 'filter'),
                'sortBy' :      cfg.sortBy || sho.dom.data.read(cfg.container, 'sortBy'),
                'sortDir' :     cfg.sortDirection || sho.dom.data.read(cfg.container, 'sort-direction')
            });
            
            this.controller = new sho.gamify.challengegallery.controllers.Gallery({
                'model' : this.model
            });
            
            this.view =  new sho.gamify.challengegallery.views.Gallery({
                'displaySize' : cfg.displaySize || sho.dom.data.read(cfg.container, 'displaySize'), // small,large or 'mixed' 
                'container' :   cfg.container,
                'model' :       this.model,
                'controller' :  this.controller
            });
            
        }
    
    });
    
    }(sho.$)
    
    