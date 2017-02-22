
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify.activitystream
    @file		        view.js
    @author				dpaul
    @modified			03.04.14
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.activitystream');
    
    /**
     * sho.gamify.activitystream.View
     * view class for activitystream
    **/
    
    !function($)
    {

    sho.gamify.activitystream.View = klass({
    
        '_KLASS_' : 'sho.gamify.activitystream.View',
       
        'no_activity_message' : ['',
        
            '<li>You haven\’t {{action}} any challenges yet. Would you like to ',
                '<a href="/sho/red-rewards/featured-challenges">start a challenge?</a>',
            '</li>',
        
        ''].join(''),
       
        'views' : {
            
            'action_feed' : ['',
            
                '<ul>',
                    '{{#items}}',
                    '<li class="is-{{kind}}">',
                        '{{#icon}}{{/icon}}',

                        '{{#shareUrl}}',
                            '<a href="{{shareUrl}}">',
                                '{{content}}',
                            '</a>',
                        '{{/shareUrl}}',

                        '{{^shareUrl}}',
                            '<p>{{content}}</p>',
                        '{{/shareUrl}}',

                        '<span>{{timestamp}}</span>',
                    '</li>',
                    '{{/items}}',
                    '{{^items}}',
                    '{{> no_activity_message}}',
                    '{{/items}}',
                '</ul>',
                
            ''].join(''),
            
            'challenge_progress' : ['',
            
                '<ul>',
                    '{{#items}}',
                    '<li>',
                        '{{#icon}}{{/icon}}',
                        '<a href="{{shareUrl}}">{{name}}</a>',
                        '<span class="group">',
                            '<span class="left activity-item-progress">{{progress}}% <em>Completed</em></span>',
                            '<span class="right activity-item-points">{{pointAward}} <em>Points</em></span>',
                        '</span>',
                    '</li>',
                    '{{/items}}',
                    '{{^items}}',
                    '{{> no_activity_message}}',
                    '{{/items}}',
                '</ul>',
                
            ''].join('')
            
        },
        
        
        initialize:function(cfg)
        {
            _.extend(this, {
                'container' : $(cfg.container),
                'model' : cfg.model,
                'source' : cfg.source,
                'fn' : {
                    'render' :      _.bind(this.render,      this),
                    'renderRadialProgressWidgets' :  _.bind(this.renderRadialProgressWidgets,  this),
                    'renderError' : _.bind(this.renderError, this)
                }
                
            })
            
            this.setHandlers();
        },
        
        setHandlers:function()
        {
            this.model.bind('ready', this.fn.render);
            this.model.bind('error', this.fn.renderError)
        },
        
        render:function()
        { 
            var k =     this.isActionFeed() ? 'items' : 'challenges',
            items =     this.model.get(k),
            view =      this.views[this.source],
            
            emptyText=  Mustache.to_html(this.no_activity_message, {
                'action' : (this.isActionFeed() ? 'completed' : 'started') 
            }),
            
            helper =    sho.gamify.challengegallery,
            
            data =  {
                'items' : items,
                'icon' : (function(){
                    return (function(text,render){
                        // get the mustache template code for a canvas element that will be
                        // painted by the call to sho.gamify.renderIcon below
                        if(this.kind && this.kind == 'level') {
                            return render(helper.getLevelUpView())
                        } else {
                            return render(helper.getRadialProgressView('activity_stream'))
                        }
                    })
                })
            };
            
            this.container.html(Mustache.to_html(view, data, {
                'no_activity_message' : emptyText,
            }))
            
            if(this.model.isEmpty()) this.renderEmptyStyles()
            this.renderRadialProgressWidgets();
            sho.dom.trigger('stickyfooter:update')
        },
        
        renderRadialProgressWidgets:function()
        {
            var el = this.container;
            
            el.find('input:not(.radial)').addClass('radial').knob();
            sho.gamify.challengegallery.renderIcon(el)
        },
        
        renderError:function(e)
        {
            this.container.addClass('has-errors').html('connection error')
        },
        
        renderEmptyStyles:function()
        {
            this.container.parent().addClass('is-empty')
        },
        
        isActionFeed:function(){
            return this.source == 'action_feed'
        }
        
    })
        
    }(sho.$)
