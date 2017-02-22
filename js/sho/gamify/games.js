
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        games.js
    @author				dpaul
    @modified			06.11.13
    @desc		        package loader - allows all subclasses to be loaded via 'sho.games.*'
    -------------------------------------------------------------------------------------------- */  
    
    /**
     * sho.gamify.games
     * namespace for games components that are powered by nitro
    **/
    
    sho.provide('sho.gamify.games');
    sho.require('sho.gamify.games.leaderboard');
    sho.require('sho.gamify.games.flashshim');
 