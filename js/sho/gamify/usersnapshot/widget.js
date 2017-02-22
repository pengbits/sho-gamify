
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.usersnapshot
    @file		        widget.js
    @author				ncavanagh
    @modified			04.12.13
    @desc		        usersnapshot wrapper class
    -------------------------------------------------------------------------------------------- */  
    
    sho.provide('sho.gamify.usersnapshot');

    /**
     * class sho.gamify.usersnapshot.Widget
     * component for rendering a user snapshot
    **/
    
    !function($)
    {
    
    sho.gamify.usersnapshot.Widget = klass({
        
        '_KLASS_' : 'sho.gamify.usersnapshot.Widget',
       
        initialize:function(cfg)
        {
            //log('hello from '+this._KLASS_); 
                        
            this.container = cfg.container;
            
            $(this.container).addClass('loading');
            
            this.config = {};
            this.config.userId = sho.dom.data.read(cfg.container, 'userId');

            this.view =  new sho.gamify.usersnapshot.views.UserSnapshot({
              'container' : this.container
            })
        }
    
    });
    
    }(sho.$)
    
    