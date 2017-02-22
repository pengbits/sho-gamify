
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.challengedetails
    @file		        challenge.js
    @author				dpaul
    @modified			04.09.13
    @desc		        Model class for the Challenge Details component
    
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.challengegallery.models.challenge');

    /**
     * class sho.gamify.challengegallery.models.challenge.Ajax
     * Mix-in for the challenge model class. Handles functionality related to async Nitro API calls
    **/
    
    sho.gamify.challengegallery.models.challenge.Ajax = {

        fetch:function()
        {
            this.trigger('loading');
            
            var call = {
                'method':'user.getChallengeProgress',
                'showCanAchieveChallenge':true,
                'challengeName':escape(this.get('name')),
                'callback':this.fn.onReady
            };
            
            // hide achievements progress from users who haven't opted-in (only affects anonymous users)
            if(!sho.accounts.isGamified()) call.userId = sho.accounts.nitro.anonymous_user_id
            this.nitro.callAPI(call);
        },
        
        reload:function(cfg)
        {
            if(!cfg.name) 
            {
                this.trigger('error', {'error':'no name supplied'});
            }
            else
            {
                this.trigger('reload');
                this.clear({silent:true});
                this.set(cfg); 
                this.fetch();
            }
        },
        
        onReady:function(xhr)
        {
            var data = xhr.Nitro,
                challenge = data.challenges && data.challenges.Challenge ? data.challenges.Challenge : null
                success = !!challenge
            ;   
             
            if(success)
            {
                this.setNitroAttributes(challenge);
                if(this.isPaginated()) this.paginate({'silent':true}); 
                this.trigger('ready', this.attributes);
            }
            else
            {
                this.trigger('error', {'error':'no challenge data found' });
            }
            
        }
    };

