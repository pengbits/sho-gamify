    
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.itemgallery.views
    @file		        detail.js
    @author				dpaul
    @modified		    08.07.14
    @desc		        Template for social sharing widgets inside the Challenge Details.
    @note               deprectated! use helpers in sho.social.components
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.itemgallery.views');

    /**
     * class sho.gamify.itemgallery.views.Detail
     * Template for social sharing widgets inside the challenge Details. 
    **/

    sho.gamify.itemgallery.views.Share = ['',
    
        '<div class="share-components group social-sharing">',
            '<div class="share-component twitter first">',
                '<a href="https://twitter.com/share" class="twitter-share-button" data-count="none" data-text="{{shareText}}" data-url="{{shareUrl}}">Tweet</a>',
             '</div>',
            '<div class="share-component">',
                '<div class="google-plus" data-href="{{shareUrl}}">g</div>', // placeholder only
            '</div>',
			'<div class="share-component fb">',
				'<div id="video-fb-like" class="fb-share-button" data-href="','{{shareUrl}}','" data-send="false" data-type="button_count" data-show-faces="false" data-font="arial"></div>',
            '</div>',
        '</div>',
            
    ''].join('');
    
    /* No surrender, No delete! */
