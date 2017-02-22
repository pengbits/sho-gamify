
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
     * sho.gamify.challengegallery.models
     * namespace for models in the challenge gallery
    **/
    
    /**
     * sho.gamify.challengegallery.models.challenge
     * namespace for mix-ins that make up the challenge model
    **/

    sho.provide('sho.gamify.challengegallery.models');
    sho.require('sho.gamify.challengegallery.models.challenge.base');
    sho.require('sho.gamify.challengegallery.models.challenge.ajax');
    sho.require('sho.gamify.challengegallery.models.challenge.attributes');
    sho.require('sho.gamify.challengegallery.models.challenge.types');
    sho.require('sho.gamify.challengegallery.models.challenge.pagination');
    sho.require('sho.gamify.challengegallery.models.challenge.progress');
    sho.require('sho.gamify.challengegallery.models.challenge');
    sho.require('sho.gamify.challengegallery.models.gallery');
 