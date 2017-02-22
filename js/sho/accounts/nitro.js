
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <rebuild>
    @project	    	accounts
    @package            nitro
    @file		        nitro.js
    @author				dpaul
    @modified			10.05.12
    @desc		        package loader for sho.accounts.nitro
    -------------------------------------------------------------------------------------------- */  

    /**
     * sho.accounts.nitro
     * Namespace for integration points with BunchBall, a vendor that provides gamification services via the Nitro platform.
    **/ 

    sho.provide('sho.accounts.nitro');
    sho.require('sho.accounts.nitro.notifications');
    sho.require('sho.accounts.nitro.connection');
    sho.require('sho.accounts.nitro.statics');
    sho.require('sho.accounts.nitro.actions');
    sho.require('sho.accounts.nitro.attempt');