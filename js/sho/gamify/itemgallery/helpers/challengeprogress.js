
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.itemgallery.views
    @file		        radialprogress.js
    @author				dpaul
    @modified		    04.09.13
    @desc		        Helper for radial progress widgets 
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.itemgallery');
    
    /**
     * sho.gamify.itemgallery.getRadialProgressView(cfg) -> Template
     * Builds and returns a template that can be used to render the radial progress widgets that are used in the gallery and challenge details views.
     * Most of the styling options have to be set in the html layer, which makes skinning the widget a little tricky,
     * but this is somewhat alleviated by making the template dynamic/configurable.
     *
     * The discrepancies between the different contexts are captured in the templates object and knob_settings object below, for example:
     * 
     * - outer div classname
     * - label text
     * - use span or div for label
     * - knob options (width,thickness,fgColor,bgColor,readOnly,displayInput)
     * - 100% completed state (a checkmark, no need for radial progress at all)
     *
     * Additionally, in the case of a completed challenge, we don't need the knob plugin at all!. Instead, there is a kind of checkmark icon,
     * also implemented with canvas, that replaces the radial progress widget.
    **/
    !(function(gallery,$)
    {
        templates = {
        'expanded' : {
            'header' : ['',
                 '<div class="challenge-details-stat challenge-details-progress">',                
                        '<span class="challenge-details-progress-label">',                            
                            '<em>{{progress}}%</em> Completed',                                       
                        '</span>',
            ''],
                
            'footer' : ['',
                '</div>',
            '']
        },
        
        'collapsed' : {
            'header' : ['',
                 '<div class="challenge-progress">',
                        '<div class="challenge-progress-label">',
                            '{{progress}}%',
                        '</div>',
            ''],
                
            'footer' : ['',
                '</div>',
            '']
        },
        
        'activity_stream' : {
            'header' : ['<div class="activity-stream-icon">'],
            'footer' : ['</div>']
        }
        };
        
        knob_settings_base = {
            'fgColor': null, // must be set at runtime, after dom-ready, with getAccentColor  
            'bgColor':'#444444',      
            'readOnly':'true',
            'displayInput':'false'
        };
        
        knob_settings = {
            'expanded' : _.extend({}, knob_settings_base, {
                'width':'30',
                'height':'30',
                'thickness':'.5'
            }),
            'collapsed' : _.extend({}, knob_settings_base, {
                'width':'15',
                'height':'15',
                'thickness':'.4'
            }),
            'activity_stream' : _.extend({}, knob_settings_base, {
                'width':'17',
                'height':'17',
                'thickness':'.3'
            })
        };
        
        getRadialProgressView = function(state, cfg)
        {
            state = state || 'collapsed';
            
            // the template is built up as a series of nested arrays, _.flatten() normalizes this, so it can be
            // reduced to a string literal with join(). This allows us to use a more natural whitespace style.
            
            return _.flatten([
                
                // most of the forking happens in the header, the expanded state has different language
                // in the label, and different classnames in the parent container
                templates[state].header,
                
                // generate the input markup that knob plugin needs for the radial-progress element,
                // but only for challenges that are in-progress (completed:false)
                '{{^completed}}',
                getKnobTemplate(state),
                '{{/completed}}',
                
                // for completed challenges, we need a checkmark icon instead
                '{{#completed}}',
                getIconTemplate(),
                '{{/completed}}',
                
                // close the parent div
                templates[state].footer
            
            ]).join('');
        }
        
        // this is a little shoe-horned in, but trying to leverage the util code around canvas rendering for a new icon type...
        getLevelUpView = function()
        {
            return _.flatten([
                templates.activity_stream.header,
                getIconTemplate('levelup'),
                templates.activity_stream.footer
            ]).join('')
        }
        
        getKnobTemplate = function(state)
        {
            var cfg = knob_settings[state]; 
                cfg['fgColor'] = sho.gamify.getAccentColor('hex')
            ;
                                                           
            return ['',                                    
            '<input ',                                     // '<input ',
                (_.collect(cfg, function(v,k){             //     'data-width="30" ',
                    return 'data-'+k+'="'+v+'" '           //     'data-thickness=".4" ',
                })),                                       //     'data-fgColor="#ab1a26" ',
                                                           //     .
                'value="{{progress}}',                     //     'value="{{progress}}',
            '">',                                          // '">',
            '']                                                              
        }
        
        
        completed_state_icon_container_classname =  'challenge-progress-completed-state-container';
        completed_state_icon_canvas_classname =     'challenge-progress-completed-state';
        
        getIconTemplate = function(iconType)
        {
            // wrapping in outer div allows this canvas instance to share layout styles w/ radial-progress state,
            // but the canvas classname is what's used to pluck the element from the dom
            return ['',
                '<div class="', completed_state_icon_container_classname ,'">',        
                    '<canvas class="', completed_state_icon_canvas_classname, '" ',
                        'data-icon-type="', (iconType || 'checkmark') ,'" ',
                        'width="30" ',
                        'height="30" ',
                    '></canvas>',
                '</div>',
            '']
        }
        
        // Render the an icon onto the canvas element(s)        
        renderIcon = function(el)
        {
            _.each(getCanvases(el), function(canvas)
            {
                var iconType = sho.dom.data.read(canvas, 'iconType'),
                    fn = gallery[iconType] || sho.emptyFunction
                ;
                
                $(canvas).addClass('decorated-icon');
                fn(canvas.getContext("2d"));
            });
        }
        
        getCanvases = function(el)
        {
            canvases = $('.' + completed_state_icon_canvas_classname + ':not(.decorated-icon)', el || sho.dom.body());
            //log('|helper| getCanvases context=`'+ $((el||sho.dom.body())).attr('class')+'`, found: '+canvases.length);
            return canvases;
        }
        
        // This function was generated by the plugin we use to port it from Illustrator:
        // Created with Ai->Canvas Export Plug-In Version 1.0 (Mac) 
        // By Mike Swanson (http://blogs.msdn.com/mswanson/)        
        // and MIX Online  (http://visitmix.com/)
        checkmark = function(ctx)
        {
              ctx.save();
              ctx.beginPath();

              ctx.moveTo(29.1, 14.5);
              ctx.bezierCurveTo(29.1, 22.6, 22.6, 29.1, 14.5, 29.1);
              ctx.bezierCurveTo(6.5, 29.1, 0.0, 22.6, 0.0, 14.5);
              ctx.bezierCurveTo(0.0, 6.5, 6.5, 0.0, 14.5, 0.0);
              ctx.bezierCurveTo(22.6, 0.0, 29.1, 6.5, 29.1, 14.5);
              ctx.closePath();

              ctx.moveTo(12.2, 22.7);
              ctx.lineTo(24.3, 10.5);
              ctx.lineTo(21.0, 7.2);
              ctx.lineTo(12.1, 16.1);
              ctx.lineTo(8.2, 12.2);
              ctx.lineTo(4.9, 15.5);
              ctx.lineTo(12.2, 22.7);
              ctx.closePath();
              ctx.fillStyle = "rgb("+ sho.gamify.getAccentColor('rgb').join(', ') +")";
              ctx.fill();
              ctx.restore();
        }
        
        levelup = function(ctx) 
        {
            // levelup/Compound Path
            ctx.save();
            ctx.beginPath();
    
            // levelup/Compound Path/Path
            ctx.moveTo(30.0, 15.0);
            ctx.bezierCurveTo(30.0, 23.3, 23.3, 30.0, 15.0, 30.0);
            ctx.bezierCurveTo(6.7, 30.0, 0.0, 23.3, 0.0, 15.0);
            ctx.bezierCurveTo(0.0, 6.7, 6.7, 0.0, 15.0, 0.0);
            ctx.bezierCurveTo(23.3, 0.0, 30.0, 6.7, 30.0, 15.0);
            ctx.closePath();
    
            // levelup/Compound Path/Path
            ctx.moveTo(15.0, 5.8);
            ctx.lineTo(5.1, 16.0);
            ctx.lineTo(11.0, 16.0);
            ctx.lineTo(11.0, 24.0);
            ctx.lineTo(15.0, 24.0);
            ctx.lineTo(19.0, 24.0);
            ctx.lineTo(19.0, 16.0);
            ctx.lineTo(24.9, 16.0);
            ctx.lineTo(15.0, 5.8);
            ctx.closePath();
            ctx.fillStyle = "rgb("+ sho.gamify.getAccentColor('rgb').join(', ') +")";
            ctx.fill();
            ctx.restore();
        }
        
        // expose helper functions as public
        gallery.getRadialProgressView = getRadialProgressView
        gallery.getLevelUpView = getLevelUpView;
        gallery.renderIcon = renderIcon;
        gallery.checkmark = checkmark;
        gallery.levelup = levelup;
       
    
    })(sho.gamify.itemgallery, sho.$);
    