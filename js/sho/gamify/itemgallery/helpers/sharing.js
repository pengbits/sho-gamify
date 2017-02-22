
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.itemgallery.views
    @file		        sharing.js
    @author				dpaul
    @modified		    04.09.13
    @desc		        Helper for social sharing components
    @notr               this is now a dupe of sho.social.helpers.components, please consolidate!
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.itemgallery');
    /**
     * sho.gamify.itemgallery.renderSocialComponents(el) -> el
     * Given a container element, render the social sharing components that are marked up inside.
     * this is lifted from the video overlay player, which has similar challenges.
     *
     * expects this markup:
     *
     * <div class="some-parent-container">
     *      <div class="share-components group social-sharing">
     *          <div class="share-component twitter first">
     *              <a href="https://twitter.com/share" class="twitter-share-button" data-count="none" data-url="{{shareUrl}}">Tweet</a>
     *           </div>
     *          <div class="share-component">
     *              <div class="google-plus">g</div> // placeholder only
     *          </div>
     *      	<div class="share-component fb">
     *      		<div id="video-fb-like" class="fb-like" data-href="{{shareUrl}}" data-send="false" data-layout="button_count" data-show-faces="false" data-font="arial"></div>
     *          </div>
     *      </div>
     * </div>
     *
     * css styles for this are in /lib/css/sho/social.css, which are most likely shared with the video player and order page.
    **/
        
    !(function(gallery)
    {
        renderSocialComponents = function(el, opts)
        {
            var container = $(el).find('.social-sharing'),
            opts = opts || { 'url':'http://www.sho.com' },
            fbElement,
            googElement
            ;
            
            // check for social-components container
            if(!_.any(container)) return false
            
            // decorate twitter html:
            twttr.widgets.load();
            
            // decorate fb html:
            fbElement = container.find('.share-component.fb').get(0); 
            fbElement && FB.XFBML.parse(fbElement);
            
            // render g+ button with explicit api call:
            googElement = container.find('.google-plus').get(0);
            if(!gapi || !googElement) return el;

            gapi.plusone.render(googElement, {
                'annotation' : 'none',
                'size'  :  'medium',
                'href'  :  (sho.dom.data.read(googElement, 'href') || 'http://www.sho.com'),
                'count' :  false,
                'callback' : (function(data){
                    if(data && data.state == 'on') sho.dom.trigger('google:plus_one:on', data)
                })
            });
        
            return el
		}
		
        // expose helper function as public
        gallery.renderSocialComponents = renderSocialComponents;
        
    
    })(sho.gamify.itemgallery);
    