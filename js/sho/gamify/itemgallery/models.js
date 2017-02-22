
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
     * sho.gamify.itemgallery.models
     * namespace for models in the item gallery
    **/
    
    /**
     * sho.gamify.itemgallery.models.item
     * namespace for mix-ins that make up the item model
    **/

    sho.provide('sho.gamify.itemgallery.models');
    sho.require('sho.gamify.itemgallery.models.item.base');
    sho.require('sho.gamify.itemgallery.models.item.ajax');
    sho.require('sho.gamify.itemgallery.models.item.attributes');
    sho.require('sho.gamify.itemgallery.models.item.types');
    sho.require('sho.gamify.itemgallery.models.item.pagination');
    sho.require('sho.gamify.itemgallery.models.item.progress');
    sho.require('sho.gamify.itemgallery.models.item');
    sho.require('sho.gamify.itemgallery.models.gallery');
 