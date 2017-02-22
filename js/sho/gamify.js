
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        gamify.js
    @author				dpaul
    @modified			03.13.13
    @desc		        package loader - allows all subclasses to be loaded via 'sho.gamify.*'
    -------------------------------------------------------------------------------------------- */  
    
    /**
     * sho.gamify
     * namespace for gamification project
    **/
    
    sho.provide('sho.gamify');
    sho.require('sho.gamify.challengedetails');
    sho.require('sho.gamify.challengegallery');
    sho.require('sho.gamify.itemgallery');
    
    sho.require('sho.gamify.fanclubgallery');
    sho.require('sho.gamify.challengestream');
    sho.require('sho.gamify.activitystream');
    sho.require('sho.gamify.leaderboards');
    sho.require('sho.gamify.usersnapshot');
    sho.require('sho.gamify.games');
    sho.require('sho.gamify.modals');
    sho.require('sho.gamify.concerns');
    
    
    