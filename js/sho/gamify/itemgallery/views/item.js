
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.itemgallery.views
    @file		        challenge.js
    @author				dpaul
    @modified		    03.13.13
    @desc		        Template for the Item inside the Item Gallery component.
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.itemgallery.views');

    /**
     * class sho.gamify.itemgallery.views.Item
     * Template for the Item inside the Item Gallery component.
    **/

    sho.gamify.itemgallery.views.Item = ['',

    '<div class="challenge {{displaySize}} {{actionStatusCSS}} " data-challenge-name="{{dataName}}" data-challenge-id="{{id}}" ',
        'style="background-image:url({{primaryArt}})"',
    '>',
        '<div class="challenge-inner{{^badge}} no-badge{{/badge}}">',
            '<span class="challenge-label challenge-name">{{name}}</span>',
            '<span class="challenge-label challenge-limited-availability">{{#isLimited}}Only {{countRemaining}} left!{{/isLimited}}</span>',
            '<span class="challenge-label challenge-points"><em>{{price}}</em> Points</span>', 
            
            '<div class="challenge-expanded-state">',
                '<span class="challenge-closer">&nbsp;</span>',
            '</div>',
        '</div>',
    '</div>',

    ''].join('');