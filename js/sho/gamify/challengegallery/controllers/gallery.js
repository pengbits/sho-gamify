
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.challengegallery
    @file		        model.js
    @author				dpaul
    @modified			04.03.13
    @desc		        Controller class for the Challenge Gallery component
    
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.challengegallery.controllers');

    /**
     * class sho.gamify.challengegallery.controllers.Gallery
     * model class for the Challenge Gallery component
    **/

    sho.gamify.challengegallery.controllers.Gallery = klass({
        
        '_KLASS_' : 'sho.gamify.challengegallery.controllers.Gallery',
     
        initialize : function(cfg)
        {
            this.model = cfg.model;
            this.handleRedirect()
        },
        
        setDetail : function(challengeName)
        {
            this.model.setDetail({'name':challengeName});
            sho.analytics.getTracker({'reload':true}).trackPageView({
                'page':(  ['red rewards', (sho.gamify.series_name || 'showtime'), 'challenges', challengeName,'details'].join(':')).toLowerCase()
                // removing platform key since Red Rewards is only on desktop, Jira: SITE-9969
            })
        },
        
        handleRedirect : function()
        {
            // support either format:
            // Dexter%20Shutterbug%20Level%201
            // Dexter+Shutterbug+Level+1
            var h = window.location.hash,
            hash = !!h ? h.substr(1) : null,
            name = unescape((hash||'').split('+').join(' '));
            if(name !== '') this.model.queueRedirect(name);
            //window.location.hash = '';
        },
        
        convertSlugToChallengeName:function(slug) 
        {
            // dexter-booster-level-1 => 'Dexter Booster Level 1
            return _.collect((slug || '').split(/-/), function(phrase){
                return phrase.capitalize()
            }).join(' ')
        },
        
        paginate:function(key)
        {
            this.model.paginate(key);
        },
        
        attemptChallenge:function(url)
        {
            log('|controller| sho.accounts.nitro.attemptChallenge(`'+url+'`)');
            // proceed to the url associated w/ the challenge (or the next step of a multi-action challenge)
            // handles all use cases (logged in or anonymous, gamified or not):
            sho.accounts.nitro.attemptChallenge(url);
            
            // track the intent
            // adding name of expanded challenge
            sho.analytics.getTracker({'reload':true}).trackClick({
                'click' : this.model.getDetail().get('name').toLowerCase() +':details:'+'get started'
            })
        }
        
        
    })
    