
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
     * class sho.gamify.challengegallery.models.challenge.Types
     * mix-in for the challenge model class. Handles functionality related to 
     * definining and distinguishing between the different sub-types of challenges.
    **/
    
    sho.gamify.challengegallery.models.challenge.Types = {
        
        /**
         * sho.gamify.challengegallery.models.Challenge#setChallengeType() -> Null
         * Determine, and set, the challenge type. We use the length of the internal 'rules' property to 
         * determine if the challenge is multi-action or single-action,  but there's no point in peforming this look-up every time, 
         * so this method cache thes value as 'challengeType'.
        **/
        setChallengeType:function()
        {
            var type = (this.get('rules').length > 1) ? 'multi_action' : 'single_action'
            this.attributes.challengeType = type;
        },

        /**
         * sho.gamify.challengegallery.models.Challenge#isSingleAction() -> Boolean
         * returns true if the challengeType is 'single_action'
        **/
        isSingleAction:function()
        {
            return this.get('challengeType') == 'single_action'
        },

        /**
         * sho.gamify.challengegallery.models.Challenge#isSingleAction() -> Boolean
         * returns true if the challengeType is 'multi_action'
        **/
        isMultiAction:function()
        {
            return this.get('challengeType') != 'single_action'
        },

        
        /**
         * sho.gamify.challengegallery.models.Challenge#getActionUrl(challenge) -> string
         * Returns an action url ('get started/continue' link) for the challenge. 
         * Relativizes the link by chopping at 'http://www.sho.com' if use_production_action_urls = true.
         *
         * Note that while we were previously using the 'url' field of the parent object to supply this to single-action challenges,
         * we now use the same logic for both single and multi-action challenges, which is, pull the url from the next pending rule.
         * This does however mean that single-action challenges will return false for this method if the user has completed the challenge.
        **/
        getActionUrl:function(challenge)
        {
            var url = this.getMultiActionUrl(challenge); 
            return this.use_production_action_urls 
                ? 
                url : (url || '').split('http://www.sho.com').join('')
        },

        /**
         * sho.gamify.challengegallery.models.Challenge#getMultiActionUrl(challenge) -> string
         * return the next pending action's url for a multi-action challenge
        **/
        getMultiActionUrl:function(challenge)
        {
            var next = _(this.getRules('pending')).first(); 
            return (next ? next.url : false)
        }
        
    };

