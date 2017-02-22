
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.itemgallery
    @file		        model.js
    @author				dpaul
    @modified			04.03.13
    @desc		        Controller class for the Item Gallery component
    
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.itemgallery.controllers');

    /**
     * class sho.gamify.itemgallery.controllers.Gallery
     * model class for the Item Gallery component
    **/

    sho.gamify.itemgallery.controllers.Gallery = klass({
        
        '_KLASS_' : 'sho.gamify.itemgallery.controllers.Gallery',
     
        initialize : function(cfg)
        {
            this.model = cfg.model;
        },
        
        setDetail : function(cfg)
        {
            this.model.setDetail(cfg);                 
            sho.analytics.getTracker({'reload':true}).trackPageView({
                'page':([
                    'red rewards',
                    (sho.gamify.series_name || 'showtime'),
                    'redemption',
                    cfg.name.replace(':', ' '),  // remove the colon : character from item name before adding to tracking string  
                    'details'].join(':')).toLowerCase()
            })
        },
        
        redeemItem:function(id)
        {
            var url = '/sho/red-rewards/redemption/redeem?id=' + id,
                isGamified = sho.accounts.isGamified()
            ;
            
            // track intent
            sho.analytics.getTracker({'reload':true}).trackClick({
                'click' : (isGamified ? 'redeem' : 'opt in')
            });
            
            // continue to redeem flow, or ...
            if(isGamified)
            {
                log('|controller| user is gamified, proceeed to `'+url+'`');
                window.location = url;
            }
            // ... user must opt in first
            else
            {
                log('|controller| user is not gamified, call nitro.optIn');
                sho.accounts.nitro.optIn()
            }
        }
        
        
    })
    