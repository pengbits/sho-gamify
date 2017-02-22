
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.itemgallery
    @file		        widget.js
    @author				dpaul
    @modified			09.17.13
    @desc               the item gallery is a graphic representation of a catalog of redeemable items
    -------------------------------------------------------------------------------------------- */  
    
    sho.provide('sho.gamify.itemgallery');
    
    /**
     * class sho.gamify.itemgallery.Widget
     * the item gallery is a graphic representation of a catalog of redeemable items
    **/
    
    !function($)
    {
    
    sho.gamify.itemgallery.Widget = klass({
        
        '_KLASS_' : 'sho.gamify.itemgallery.Widget',
       
        initialize:function(cfg)
        {
            this.model = new sho.gamify.itemgallery.models.Gallery({
                
                // item catalog only - reject items w zero inventory
                'count_remaining' : 1,
                
                // shared with challenge gallery - configure the sorting and filter settings
                'filter' :      cfg.filter || sho.dom.data.read(cfg.container, 'filter'),
                'sortBy' :      cfg.sortBy || sho.dom.data.read(cfg.container, 'sortBy'),
                'sortDir' :     cfg.sortDirection || sho.dom.data.read(cfg.container, 'sort-direction')
            });

            this.controller = new sho.gamify.itemgallery.controllers.Gallery({
                'model' : this.model
            });
            
            this.view =  new sho.gamify.itemgallery.views.Gallery({
                'displaySize' : cfg.displaySize || sho.dom.data.read(cfg.container, 'displaySize'), // small,large or 'mixed' 
                'container' :   cfg.container,
                'model' :       this.model,
                'controller' :  this.controller
            });
            
        }
    
    });
    
    }(sho.$)
    
    