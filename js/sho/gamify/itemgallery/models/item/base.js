
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.challengedetails
    @file		        challenge.js
    @author				dpaul
    @modified			04.09.13
    @desc		        Model class for the Item Details component
    
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.itemgallery.models.item');

    /**
     * class sho.gamify.itemgallery.models.item.Base
     * mix-in for the item model class
    **/
    
    sho.gamify.itemgallery.models.item.Base = {

        '_KLASS_' : 'sho.gamify.itemgallery.models.Challenge',
       
        initialize:function(cfg)
        {
            _.extend(this, {
                'nitro' : sho.accounts.nitro.getInstance(),
                'attributes' : {},
                'fn' : { 
                    'onReady' : _.bind(this.onReady, this)
                }
            });
            
            if(this.has('id')) this.fetch()
        }

    };

