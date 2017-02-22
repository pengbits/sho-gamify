
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        models.js
    @author				ncavanagh
    @modified			03.28.13
    @desc		        package loader - allows all subclasses to be loaded via 'sho.gamify.leaderboard.*'
    @note               challenge and action models may not be necessary, removing for now
    -------------------------------------------------------------------------------------------- */  
    
    /**
     * sho.gamify.leaderboards.models
     * namespace for leaderboards details
    **/
    
    sho.provide('sho.gamify.leaderboards.models');
    sho.require('sho.gamify.leaderboards.models.points');
 