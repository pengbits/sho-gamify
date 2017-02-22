
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        gamify.js
    @author				dpaul
    @modified			03.13.13
    @desc		        package loader - allows all subclasses to be loaded via 'sho.gamify.challengegallery.*'
    -------------------------------------------------------------------------------------------- */  
    
    /**
     * sho.gamify.challengegallery
     * namespace for challenge details
    **/
    
    sho.provide('sho.gamify.challengegallery');
    sho.require('sho.gamify.challengegallery.models');
    sho.require('sho.gamify.challengegallery.views');
    sho.require('sho.gamify.challengegallery.controllers');
    sho.require('sho.gamify.challengegallery.helpers');
    sho.require('sho.gamify.challengegallery.widget');
 