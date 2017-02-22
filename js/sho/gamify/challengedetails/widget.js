
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.challengedetails
    @file		        widget.js
    @author				dpaul
    @modified			03.13.13
    @desc		        challenge details wrapper class
    -------------------------------------------------------------------------------------------- */  
    
    sho.provide('sho.gamify.challengedetails');
    
    /**
     * class sho.gamify.challengedetails.Widget
     * component for rendering challenge details in isolation, ie, while working on styling the component
    **/
    
    !function($){
    
    sho.gamify.challengedetails.Widget = klass({
        
        '_KLASS_' : 'sho.gamify.challengedetails.Widget',
       
        initialize:function(cfg)
        {
            _.extend(this, {
                'container' : $(cfg.container),
                'fn' : {
                    'render' : _.bind(this.render, this),
                    'onPaginateClick' : _.bind(this.onPaginateClick, this)
                },
                    
                // the details widget is just a convenience for testing the details in isolation,
                // that's why the classes are stored in challengegallery namespace
                'model' : new sho.gamify.challengegallery.models.Challenge({
                    'name' : cfg.name,
                    'dummy_progress' : false
                })
            });
            
            this.setHandlers();
            // expose as global for debugging
            window.challenge = this.model;
        },
        
        setHandlers:function()
        {
            // model events
            this.model.bind('ready', this.fn.render);
            this.model.bind('paginate', this.fn.render);
            // this.model.bind('all', function(eventName, e){ log('|widget| `'+eventName+'`'); })
            
            // dom events
            this.container.on('click', '.paginate-control', this.fn.onPaginateClick);
        },
        
        render:function(attrs)
        {
            //log(attrs);
            log(attrs.sort)
            
            // generate markup
            var html = Mustache.to_html(sho.gamify.challengegallery.views.Details, attrs, {
                'challengeProgress' : sho.gamify.challengegallery.getRadialProgressView('expanded'),
                'share' : sho.gamify.challengegallery.views.Share
            });
            
            // write to dom
            this.container.html(html)
            
            // render social components
            sho.gamify.challengegallery.renderSocialComponents(this.container);
            
            // simulate applyRadialProgressStyles() being called
            sho.env.browser().isIE8 || this.container.find('.challenge-details-progress input').addClass('radial').knob()
            
            // simulate renderIcon() being called
            sho.gamify.challengegallery.renderIcon(this.container);
            
            // simulate align alignVertically being called after slideTo callback
            var fn = sho.gamify.challengegallery.views.Gallery.prototype.alignVertically; 
            fn.call(this, $('.challenge-expanded-state-dummy'));
            
        },
        
        onPaginateClick:function(e)
        {
            sho.dom.trap(e);      // <a class="paginate-control paginate-prev" href="#">Previous</a>
            var m,
                method,
                key = e.currentTarget ? e.currentTarget.className.split('paginate-')[2] : false
            ; 
            
            if(key)
            {
                m = sho.string.toMethodName('get-'+key+'-page');
                method = this.model[m];
                method.call(this.model);
            }
        }
    
    });
        
    }(sho.$)
    
    /* No surrender, No delete! */
    
    