
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.challengegallery
    @file		        view.js
    @author				dpaul
    @modified		    04.11.13
    @desc		        View class for the Challenge Gallery component.
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.challengegallery.views');

    /**
     * class sho.gamify.challengegallery.views.Gallery
     * View class for the Challenge Gallery component.
     * 
     *  1. startup
     *      1. handlers
     *      2. render
     *      3. grid + radial progress styles
     *  2. runtime
     *      1. onLayout / auto-open / handle redirect
     *      2. expand
     *      3. collapse
     *      4. scrollto challenge
     *  3. runtime: details
     *      1. set detail
     *      2. show/hide/render detail
     *  4. util
    **/

    !function($)
    {

    sho.gamify.challengegallery.views.Gallery = Backbone.View.extend({

        '_KLASS_' : 'sho.gamify.challengegallery.views.Gallery',

        'bg_color' : {
            'expanded' :  '#1D1D1D',
            'collapsed' : '#303030',
            'collapsed_badge_gallery' : '#262626' // badge gallery has an opacity effect for uncompleted challenges that alters the colorway
        },
        
        /*
        =:startup
        ---------------------------------------------------------------------------------------- */
        initialize:function(cfg)
        {
            var $container = $(cfg.container);
            
            _.extend(this, {
                // options
                'displaySize' : cfg.displaySize || 'mixed',
                'columnWidth' : 220,    // size of smallest unit
                'is_badge_gallery' : $container.hasClass('badge-gallery'),
                
                // dom elements
                'container' : $container,
                'stage' : $container.find('.challenge-gallery-stage'),
                'scroll_offset' : {'top':(sho.dom.body().hasClass('has-nav-secondary') ? -100 : 0 )},
                
                // model,controller
                'model' :    cfg.model,
                'controller' : cfg.controller,
                
                // all-purpose object to hold bound callbacks
                'fn' : {},
            });
            
            this.setHandlers()
        },
        
        setHandlers:function()
        {
            // create bound callbacks
            var th=this; sho.string.toArray(['',
            
                'render renderError applyGridStyles onLayout renderDetail ',
                'expandChallenge collapseChallenge scrollToChallenge ',
                'onScrollTo paginate redirectToChallenge'
            
            ].join('')).each(function(method){
                th.fn[method] = _.bind(th[method], th);
            });
            
            // subscribe to dom events...
            this.container.on('click', '.challenge:not(.expanded)', this.fn.expandChallenge);
            this.container.on('click', '.challenge-closer', this.fn.collapseChallenge);
            this.container.on('click', '.paginate-control', this.fn.paginate);
            this.container.on('click', '.btn.get-started', this.fn.redirectToChallenge);
            
            // ...and model events
            this.model.bind('ready', this.fn.render)
            this.model.bind('error', this.fn.renderError)
            this.model.bind('details:ready', this.fn.renderDetail);
            this.model.bind('details:paginate', this.fn.renderDetail);
            this.model.bind('details:paginate', function(){
                th.alignVertically(th.expandedChallengeElement())
            })
            // this.model.bind('all', function(eventName,e){
            //     log('|gallery| `'+eventName+'`');
            // })
        },
        
        
        /*
        =:render, =:stage
        ---------------------------------------------------------------------------------------- */
        render:function()
        {
            var data =      this.model.get('challenges'),
                view =      sho.gamify.challengegallery.views.Challenge,
                th=         this
            ;
            
            this.container.removeClass('loading');
            this.stage.html( _.collect(data, function(attrs, idx){
                attrs.dataName = escape(attrs.name);
                attrs.number = (idx+1);
                attrs.displaySize = (th.displaySize == 'mixed' ? attrs.displaySize : th.displaySize);
                
                return Mustache.to_html(view, attrs, {
                    'challengeProgress' : sho.gamify.challengegallery.getRadialProgressView('collapsed')
                });
                
            }).join("\n"));
            
            _.delay(this.fn.applyGridStyles, sho.dom.REDRAW_DELAY_);
        },
        
        // this is pretty harsh... we'll need something subtler for production
        renderError:function(e)
        {
            this.container.addClass('error').html(e.error)
        },
        
        applyGridStyles:function()
        {
            this.container.isotope({
                'itemSelector' : '.challenge',
                'resizeable' : true,    
                'onLayout' : this.fn.onLayout,
                'masonry' : {
                    'columnWidth' : this.columnWidth
                }
            });
            
            this.renderRadialProgressWidgets();
            sho.dom.trigger('stickyfooter:update')
        },
        
        renderRadialProgressWidgets:function(el)
        {
            if(sho.env.browser().isIE8) return;
            el = el || this.container;
            el.find('input:not(.radial)').addClass('radial').knob();
            sho.gamify.challengegallery.renderIcon(el);
        },
        
        
        /*
        =:runtime
        ---------------------------------------------------------------------------------------- */
        // onLayout() is called each time isotope completes a render. 
        // here we use the callback to check for any queued challenges to auto-open:
        onLayout:function()
        {
            var el,fn,q = this.model.getRedirect() 
            
            if(q)
            {
                el = this.getChallengeContainerByName(q); 
                
                if(el)
                {
                    _.delay( _.bind(this.expandChallenge, this, {'currentTarget':el}), sho.dom.REDRAW_DELAY_);
                }
                else
                {
                    sho.gamify.showModal('challenge-unavailable')
                }
            }
        },
        
        expandChallenge:function(e)
        {
            var el = e.currentTarget; 
            
            // fetching the detail model may take a while, get that started
            this.setDetail(el);
            
            // collapse any expanded challenges..
            this.container.find('.challenge.expanded').removeClass('expanded')
            .find('.challenge-expanded-state').hide();    
            
            // .. and unset any animations
            this.blurDetail()
            
            // set expanded styles and store element
            this.expanded = $(el).addClass('expanded');
            
            // animate bg color
            this.focusDetail()
            
            // trigger a re-draw
            this.container.isotope('reLayout', this.fn.scrollToChallenge);
        },
        
        collapseChallenge:function(e)
        {
            sho.dom.trap(e);
            this.expandedChallengeElement().removeClass('expanded');
            this.blurDetail();
            this.hideDetail();
            this.expanded = null;
            this.container.isotope('reLayout');
        },
        
        scrollToChallenge:function()
        {
            sho.dom.body().scrollTo( this.expandedChallengeElement(), {
                'duration' : 1000,
                'axis' : 'y',
                'offset' : this.scroll_offset,
                'onAfter' : this.fn.onScrollTo // was this.fn.showDetail 
            });
        },
        
        onScrollTo:function()
        {
            this.showDetail();
            // this.focusDetail() - this is now called before scrollto is started, which feels more natural
        },
        
        
        /*
        =:detail
        ---------------------------------------------------------------------------------------- */
        setDetail:function(el)
        {
            this.controller.setDetail(unescape(sho.dom.data.read(el, 'challengeName')))
        },
        
        renderDetail:function(attrs)
        {
            el = this.expandedChallengeInnerElement(); 
            el.html(Mustache.to_html(sho.gamify.challengegallery.views.Details, attrs, {
                'challengeProgress' : sho.gamify.challengegallery.getRadialProgressView('expanded'),
                'share' : sho.social.components.view // was sho.gamify.challengegallery.views.Share
            }));
            
            this.renderRadialProgressWidgets(el);
            this.renderSocialComponents();              // this is also called after scrollTo finishes, but we need it here for pagination render
        },
        
        renderSocialComponents:function()
        {   
            sho.social.components.render(this.expandedChallengeInnerElement());
            // was sho.gamify.challengegallery.renderSocialComponents(this.expandedChallengeInnerElement());
        },
        
        // must call this after detail container element has display:block, (ie after showDetail() or heights will be zero
        alignVertically:function(el)
        {   
            if(sho.env.browser().shortName.match(/ie9|ie10|ie11|chrome/)) return; // css vertical align works in these browsers
            
            var col = el.find('.right'),
            inner =   el.find('.right-inner'),
            offset =  col.height() - inner.height(),
            top =     offset > 0 ? Math.floor(offset / 2) : 0
            ;
            if(top) inner.css({'margin-top':top+'px'});
            
        },
        
        showDetail:function()
        {
            this.alignVertically(this.expandedChallengeInnerElement().show());
            this.renderSocialComponents(); // called again after scrolling has finished, to ensure FB renders..
        },

        hideDetail:function()
        {
            this.expandedChallengeInnerElement().hide()
        },

        focusDetail:function()
        {
            this.expandedChallengeElement().addClass('challenge-focused')
            .css({
                'background-color' : (this.is_badge_gallery ? this.bg_color.collapsed_badge_gallery : this.bg_color.collapsed)
            })
            .animate({
                'background-color' : this.bg_color.expanded
            })
        },

        blurDetail:function()
        {
            var c=this.bg_color.collapsed;
            this.container.find('.challenge-focused').each(function(){
                $(this).css({
                    'background-color' : c
                }).removeClass('challenge-focused')
            });
        },
        
        /*
        =:util
        ---------------------------------------------------------------------------------------- */
        
        /**
         * sho.gamify.challengegallery.views.Gallery#expandedChallengeElement() -> jQuery
         * Return the jQuery-wrapped expanded challenge element, if there is one. 
         * Throws an error if this.expanded is null
        **/
        expandedChallengeElement:function()
        {
            if(!this.expanded) throw new Error('tried to fetch the expanded challenge\'s inner container when this.expanded is null');
            return $(this.expanded)
        },
        
        /**
         * sho.gamify.challengegallery.views.Gallery#expandedChallengeElement() -> jQuery
         * Return the jQuery-wrapped inner container of the expanded challenge, if there is one. 
         * Throws an error if this.expanded is null
        **/
        expandedChallengeInnerElement:function()
        {
            return this.expandedChallengeElement().find('.challenge-expanded-state')
        },
        
        getChallengeContainerByName:function(name)
        {
            return _.select(this.container.find('.challenge'), function(el){
                return sho.dom.data.read(el, 'challengeName') == escape(name)
            })[0]
        },
        
        paginate:function(e)
        {
            sho.dom.trap(e);      // <a class="paginate-control paginate-prev" href="#">Previous</a>
            var c = e.currentTarget ? e.currentTarget.className.split('paginate-')[2] : false; if(c)
            {
                this.controller.paginate(c);
            }
        },
        
        redirectToChallenge:function(e)
        {
            sho.dom.trap(e);
            this.controller.attemptChallenge(sho.dom.data.read(e.currentTarget, 'actionUrl'))
        }
        
      
    });

    // for debugging purposes
    window.getChallenge = function(name)
    {
        return _.select($('.challenge'), function(el){
            return sho.dom.data.read(el, 'challengeName') == escape(name)
        })
    }
    window.highlightChallenge = function(name)
    {
        $(getChallenge(name)).css({'outline':'yellow solid 1px'});
    }
    
    }(sho.$)