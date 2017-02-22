
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        concerns.js
    @author				dpaul
    @modified			03.13.13
    @desc		        misc util functions that dont fit into MVC
    -------------------------------------------------------------------------------------------- */  

    /**
     * sho.gamify
     * namespace for gamification project
    **/

    sho.provide('sho.gamify');
    
    // relies on implementation in challengegallery.models.challenge.Base
    sho.gamify.getShareUrl = function(name)
    {
        return sho.gamify.challengegallery.models.Challenge.prototype.getShareUrl({
            'name' : name
        })
    }
    