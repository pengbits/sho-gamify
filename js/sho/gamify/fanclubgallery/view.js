
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify.fanclubgallery
    @file		        view.js
    @author				dpaul
    @modified			03.04.14
    -------------------------------------------------------------------------------------------- */  

    /**
     * sho.gamify.fanclubgallery.View
     * view class for club gallery
    **/

    sho.provide('sho.gamify.fanclubgallery');
    
    !function($)
    {

    sho.gamify.fanclubgallery.View = klass({
    
        '_KLASS_' : 'sho.gamify.fanclubgallery.View',

        
        initialize:function(cfg)
        {
            _.extend(this, {
                'container' : $(cfg.container),
                'model' : cfg.model,
                'fn' : {
                    'parse' : _.bind(this.parse, this),
                    //'updatePointsBalance' : _.bind(this.updatePointsBalance, this),
                    'updateChallengesCompleted' : _.bind(this.updateChallengesCompleted, this)
                    // 'renderError' : _.bind(this.renderError, this)
                }
            })
            
            this.setHandlers();
            _.delay(this.fn.parse, sho.dom.REDRAW_DELAY_)
        },
        
        setHandlers:function()
        {
            // this.model.bind('all', function(eventName,e){
            //     log('|view| `'+eventName+'`');
            // })
            // this.model.bind('change:points_balance', this.fn.updatePointsBalance);
            this.model.bind('change:challenge_summary', this.fn.updateChallengesCompleted);
        },
        
        parse:function()
        {
            this.model.setFanclubs( _.collect(this.container.find('.fan-club-item'), function(el)
            {
                var club = $(el); return {
                    'title' : club.find('.fan-club-name').html(),
                    'id'    : club.attr('id'),
                    'tags'  : club.data('tags'),
                    'folderName' : club.data('folder')
                }
            }))
        },
        
        // updatePointsBalance:function(e)
        // {
        //     this.getFanClubElement('points-earned', e.id).html(e.balance)
        // },
        
        updateChallengesCompleted:function(e)
        {
            this.getFanClubElement('challenges-completed', e.id).html(e.completed)
        },
        
        
        getFanClubElement:function(name, id)
        {  
            return this.container.find('#'+id+' .fan-club-'+name+' em')
        }
    
    })
        
    }(sho.$)
