
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        gamify.js
    @author				dpaul
    @modified			03.04.14
    @desc		        package loader - allows all subclasses to be loaded via 'sho.gamify.activitystream.*'
    -------------------------------------------------------------------------------------------- */  

    /**
     * sho.gamify.activitystream
     * namespace for challenge category tiles aka fan clubs
    **/

    sho.provide('sho.gamify.activitystream');
    sho.require('sho.gamify.activitystream.model');
    sho.require('sho.gamify.activitystream.view');
    sho.require('sho.gamify.activitystream.widget');
