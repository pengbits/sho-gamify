
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.itemgallery.views
    @file		        detail.js
    @author				dpaul
    @modified		    04.03.13
    @desc		        Template for the Detail inside the Gallery component.
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.itemgallery.views');

    /**
     * class sho.gamify.itemgallery.views.Detail
     * Template for the Detail inside the Gallery component.
    **/

    sho.gamify.itemgallery.views.Details = ['',

    '<span class="challenge-closer">&nbsp;</span>',
    
    '<div class="',
        'challenge-details challenge-details-outer group',
        '{{#isMultiAction}} multi-action{{/isMultiAction}}',
        '{{#isPaginated}} paginated {{/isPaginated}}',
    '">',
        '<div class="challenge-details-inner group">',

            '<div class="left">',
                '{{#primaryArt}}<img src="{{primaryArt}}" />{{/primaryArt}}',
            '</div>',

            '<div class="right">',
                 '<div class="right-inner">',
                     
                     '<h3>{{name}}</h3>',
                     '<p>{{description}}</p>',
                 
                     '{{#isMultiAction}}',
                        '{{#isPaginated}}',
                         '<ul class="paginated-rule-list">',
                             // by all appearances, Mustache is converting achieved='1' to a truthy value,
                             // but '1' is not the same as true if there is a goal of 2+ rules.
                             // so we'll have to come back to this.
                            '{{#rulesPaginated}}',                
                            '<li class="rule-completed-{{completed}}">',
                                '<span>{{rulePosition}}.</span>',
                                '{{description}}',
                            '</li>',   
                            '{{/rulesPaginated}}',                                                      
                        '</ul>',
                        
                        '<div class="challenge-details-pagination">',
                            '<ul class="inline">',
                                '<li>',
                                    '<a class="{{^hasPrevPage}}disabled {{/hasPrevPage}}paginate-control paginate-prev" href="#">Previous</a>',
                                '</li>',
                                '<li>',
                                    '<a class="{{^hasNextPage}}disabled {{/hasNextPage}}paginate-control paginate-next" href="#">Next</a>',
                                '</li>',
                            '</ul>',
                        '</div>',                               
                        '{{/isPaginated}}',
                        
                        '{{^isPaginated}}',
                        '<ol>',                                                               
                            '{{#rules}}',
                            '<li class="rule-completed-{{completed}}">',
                                '{{description}}',
                            '</li>',
                            '{{/rules}}', 
                        '</ol>',
                        '{{/isPaginated}}',
                     '{{/isMultiAction}}',
                 
                     '<div class="challenge-details-stats group">',
                         
                         '<div class="challenge-details-stat challenge-details-points">',
                            '<em>{{price}}</em> Points',
                         '</div>', 
                    
                     '</div><!-- END challenge-details-stats -->',

                     '{{#isGamified}}',
                         '{{^isRedeemable}}',
                         '<p class="challenge-details-disclaimer">',
                            'Complete more challenges to earn enough points for this reward.',
                        '</p>',
                        '{{/isRedeemable}}',
                     '{{/isGamified}}',
                      
                     '<div class="challenge-details-actions">',
                        '{{#isGamified}}',
                            '<a class="btn redeem{{^isRedeemable}} is-inactive{{/isRedeemable}}" href="#" data-item-id="{{id}}">Redeem</a>',
                        '{{/isGamified}}',
                        '{{^isGamified}}',
                            '<a class="btn redeem get-started" href="#" data-item-id="{{id}}">Get Started</a>',
                        '{{/isGamified}}',
                     '</div>',
                    
                     // '<div class="challenge-details-actions">',
                     //    '{{#actionUrl}}',
                     //    '<a class="btn get-started start-challenge" href="#" data-action-url="{{actionUrl}}">{{actionLabel}}</a>',
                     //    '{{/actionUrl}}',
                     //    '{{#completed}}',
                     //        '{{> share}}',
                     //    '{{/completed}}',
                     // '</div>',
                     
                '</div><!-- END right-inner -->',
            '</div><!-- END right -->',

        '</div><!-- END challenge-details-inner -->',
    '</div><!-- END challenge-details -->',
    
    ''].join('');
    
