
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        gamify.js
    @author				dpaul
    @modified			03.13.13
    @desc		        package loader - allows all subclasses to be loaded via 'sho.gamify.itemgallery.*'
    -------------------------------------------------------------------------------------------- */  
    
    /**
     * sho.gamify.itemgallery
     * namespace for item gallery
     * the item gallery is a graphic representation of a catalog of redeemable items
    **/
    
    sho.provide('sho.gamify.itemgallery');
    sho.require('sho.gamify.itemgallery.models');
    sho.require('sho.gamify.itemgallery.views');
    sho.require('sho.gamify.itemgallery.controllers');
    sho.require('sho.gamify.itemgallery.helpers');
    sho.require('sho.gamify.itemgallery.widget');
 