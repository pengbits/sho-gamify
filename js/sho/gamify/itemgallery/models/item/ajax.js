
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
     * class sho.gamify.itemgallery.models.item.Ajax
     * Mix-in for the item model class. Handles functionality related to async Nitro API calls
    **/
    
    sho.gamify.itemgallery.models.item.Ajax = {

        fetch:function()
        {
            this.trigger('loading');
            
            var call = {
                'method':'site.getCatalogItem',
                'itemId':this.get('id'),
                'callback':this.fn.onReady
            };
            
            this.nitro.callAPI(call);
        },
        
        reload:function(cfg)
        {
            if(!cfg.id) 
            {
                this.trigger('error', {'error':'no id supplied'});
            }
            else
            {
                this.trigger('reload');
                this.clear({silent:true});
                this.set(cfg); 
                this.fetch();
            }
        },
        
        onReady:function(xhr)
        {
            var data =      xhr.Nitro,
                item =      data.CatalogRecord && data.CatalogRecord.catalogItems && data.CatalogRecord.catalogItems.CatalogItem ? data.CatalogRecord.catalogItems.CatalogItem : null,
                success =   !!item
            ;   
            
            if(success)
            {
                this.setNitroAttributes(item);
                //no pagination in catalog item
                //if(this.isPaginated()) this.paginate({'silent':true}); 
                this.trigger('ready', this.attributes);
            }
            else
            {
                this.trigger('error', {'error':'no challenge data found' });
            }
            
        }
    };

