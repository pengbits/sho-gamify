
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.leaderboards
    @file		        board.js
    @author				ncavanagh
    @modified		    03.25.13
    @desc		        View class for the leaderboards component.
    -------------------------------------------------------------------------------------------- */  

    /**
     * class sho.gamify.leaderboards.Board
     * View class for the leaderboards component.
    **/

    !function($)
    {

    sho.gamify.leaderboards.views.Board = Backbone.View.extend({

        '_KLASS_' : 'sho.gamify.leaderboards.views.Board',
        'isNavigating' : false,

        /*
        =:startup
        ---------------------------------------------------------------------------------------- */
        initialize:function(cfg)
        {
            //log('hello from '+this._KLASS_); return;
            _.extend(this, {
                'container' : $(cfg.container),
                'model' :    cfg.model,
                'fn' : {}
            });
            
            var th=this; 
            sho.string.toArray('render renderError').each(function(method){
                th.fn[method] = _.bind(th[method], th);                 // this.fn.render = _.bind(this.render, this);
            });
            
            this.stage = this.container.find('.leaderboard-stage');
            this.setHandlers();
        },
        
        setHandlers:function()
        {
            this.model.bind('ready', this.fn.render);
            this.model.bind('error', this.fn.renderError);
        },
        
        render:function()
        {   
            var data = this.model.attributes,
            duration = data.config.leaderboardDuration,
            view = sho.gamify.leaderboards.views.template
            ;

            _.each(data.leaders, function(leader, idx){ 
                // add rank number
                leader.rank = idx+1; });

            this.container.removeClass('loading');
            this.container.find('.leaderboard-stage').removeClass('error'); 
            $(this.container).data("leaderboard-duration", duration);
            
            this.stage.html(Mustache.to_html(view, this.model.attributes));
            this.isNavigating = false;
            
            sho.dom.trigger('stickyfooter:update')
        },
        
        renderError:function(e)
        {
            this.container.find('.leaderboard-stage').addClass('error').html(e.error);
            this.container.removeClass('loading');
        },        
      
    });

    }(sho.$)
