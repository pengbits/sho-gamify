
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.itemdetails
    @file		        item.js
    @author				dpaul
    @modified			04.09.13
    @desc		        Model class for the Item Details component
    
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.itemgallery.models.item');

    /**
     * class sho.gamify.itemgallery.models.item.Attributes
     * Mix-in for the item model class. Handles functionality related to
     * validating and extending the nitro-backed item data with our custom sho.com business logic
    **/
    
    sho.gamify.itemgallery.models.item.Attributes = {
       
    
        'primary_art_store' : 'fullUrl',        // which field contains the path to the badge/primary art?
        'minimum_count_remaining' : 3,          // how many items must be in the store to avoid the limited avail flag?    
        
        'nitro_attributes' : {
              'id' :  ''                        // unique identifier for product
            , 'name' : ''                       // item title, 
            , 'fullUrl' : ''                    // field potentially containing the path to badge/primary art,
            , 'price' : ''                      // how many rr points to redeem    
            , 'countRemaining' : ''             // trigger for limited availability flag - if there are less than n remaining in store
            , 'description' : ''
        },

        /**
         * sho.gamify.itemgallery.models.Item#setNitroAttributes(attrs) -> Null
         * Apply whatever cleanup is needed to the raw nitro data, while copying it over onto the model.
         * This is called internally after the ready event when the Detail view loads, but it is also called
         * externally by the gallery as a kind of re-useable validator for each item displayed
        **/
        setNitroAttributes:function(item)
        {
            // the nitro attributes we are most interested in are defined in a hash above
            var th = this; _.each(this.nitro_attributes, function(v,k){
                if(!! item[k]) th.attributes[k] = item[k];
            });
            
            // many attributes require help to coerce them into a useable state:
            this.set({                       
                
                
                // if display:large is not found in challenge tags we default to small
                'displaySize':          (/display:large/.test(item.tags) ? 'large' : 'small'),
                
                // src for primary art is psuedo configuarable, where should we look?
                'primaryArt':           item[this.primary_art_store],                  
                
                // escape the challenge name to expose in a data-challenge-name attribute)
                'dataName' :            escape(item.name),
                
                // cast countRemaining to number
                'countRemaining':       Number(item.countRemaining), 
                
                // if less than n items in store, flag as limited
                'isLimited':            Number(item.countRemaining) < this.minimum_count_remaining,
                
                // trigger different call-to-action in the detail view, can you afford this?
                'isRedeemable':         (sho.accounts.nitro.getCurrentPointsBalance() >= Number(item.price))
                
            },{
                'silent':true
            });
            
            
            // unlike the challenge model, just return all the attributes
            return this.attributes
        }
        
    };

