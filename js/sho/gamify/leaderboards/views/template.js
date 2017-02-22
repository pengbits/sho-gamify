
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.leaderboards
    @file		        template.js
    @author				ncavanagh
    @modified			03.26.13
    @desc		        Leaderboard View Partial - Draws the markup needed for the leaderboards
    @note               conditionally adds highlight classname if the row is assumed to be the current user
    -------------------------------------------------------------------------------------------- */  
    
    sho.provide('sho.gamify.leaderboards.views');
	
    /**
     * class sho.gamify.leaderboards.views
     * Leaderboard View class
    **/

    /**
     * class sho.gamify.leaderboards.views.template < sho.gamify.leaderboards.views
     * Leaderboard View Partial - Draws the markup needed for the leaderboards
    **/

    sho.gamify.leaderboards.views.template = ['',
    
    '{{#leaders}}',
    '<div class="leaderboard-points leaderboard-tr {{#isUser}}leaderboard-tr-highlight{{/isUser}}">',
        '<div class="leaderboard-rank leaderboard-td">',
            '{{rank}}',
        '</div>',
        '<div class="leaderboard-avatar leaderboard-td">',
            '<img src="{{avatar}}" />',
        '</div>',
        '<div class="leaderboard-username leaderboard-td">',
            '{{userName}}',
        '</div>',
        '<div class="leaderboard-values leaderboard-td">',
            '{{value}}',
        '</div>',
    '</div>',
    '{{/leaders}}',
    
    ''].join('');

    
    