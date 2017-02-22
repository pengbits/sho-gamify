
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.challengegallery.views
    @file		        challenge.js
    @author				dpaul
    @modified		    03.13.13
    @desc		        Template for the Challenge inside the Gallery component.
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.challengegallery.views');

    /**
     * class sho.gamify.challengegallery.views.Challenge
     * Template for the Challenge inside the Gallery component.
    **/

    sho.gamify.challengegallery.views.Challenge = ['',

    '<div class="challenge {{displaySize}} {{actionStatusCSS}}" data-challenge-name="{{dataName}}" ',
        'style="background-image:url({{primaryArt}})"',
    '>',
        '<div class="challenge-inner{{^badge}} no-badge{{/badge}}">',
            // deprecated this as it was found to be redundant (SITE-6626)
            // '<span class="challenge-label challenge-series-name">{{seriesName}}</span>',
            '<span class="challenge-label challenge-name">{{name}}</span>',
            '<span class="challenge-label challenge-points"><em>{{pointAward}}</em> Points</span>', 
            '{{> challengeProgress}}',
            
            '<div class="challenge-expanded-state">',
                '<span class="challenge-closer">&nbsp;</span>',
            '</div>',
        '</div>',
    '</div>',

    ''].join('');