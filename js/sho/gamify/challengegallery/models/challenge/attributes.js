
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
     * class sho.gamify.challengegallery.models.challenge.Attributes
     * Mix-in for the challenge model class. Handles functionality related to
     * validating and extending the nitro-backed challenge data with our custom sho.com business logic
    **/
    
    sho.gamify.challengegallery.models.challenge.Attributes = {
       
    
        'primary_art_store' : 'fullUrl',    // which field contains the path to the badge/primary art?
            
        'nitro_attributes' : {
              'name' : ''           // challenge title, also serves as primary id for challenges in Nitro getUserProgress call
            , 'description' : ''    // challenge description
            , 'fullUrl' : ''        // field potentially containing the path to badge/primary art
            , 'thumbUrl' : ''       // ''
            , 'iconUrl' : ''        // ''
            , 'actionUrl' : ''      // path to 'get started' / challenge location for single-action challenges 
                                    // (multi-action challenges store this in the Rules array
            , 'pointAward' : ''     // challenge points value
            , 'tags' : ''           // used for filtering challenges, ie filter="badge:yes"
            , 'folderName' : ''     // the container for the challenge. used in fanclubs
        },


        /**
         * sho.gamify.challengegallery.models.Challenge#setNitroAttributes(attrs) -> Null
         * Apply whatever cleanup is needed to the raw nitro data, while copying it over onto the model.
         * This is called internally after the ready event when the Detail view loads, but it is also called
         * externally by the gallery as a kind of re-useable validator for each challenge displayed
        **/
        setNitroAttributes:function(challenge)
        {
            // the nitro attributes we are most interested in are defined in a hash above
            var th = this; _.each(this.nitro_attributes, function(v,k){
                if(!! challenge[k]) th.attributes[k] = challenge[k];
            });
            
            // the user's progress is defined in Rule objects, stored in data.challenges.Challenge.rules.Rule.
            // in the case of a multi-action challenge, it will actually be an array of them. (see getChallengeType below)
            // in either case, drop the extra nesting and store a simple array of rule objects.. each tagged with the orignal position of each rule
            if(challenge.rules && challenge.rules.Rule) this.set({
                'rules' :  _.collect(_.flatten([challenge.rules.Rule]), function(r,i){
                    r.rulePosition = i+1; return r
                }) 
            })
            
            // this must be called before making use of isSingleAction/isMultiAction below
            this.setChallengeType()
            
            // many attributes require help to coerce them into a useable state:
            this.set({                       
                  
              	// deprecated this as it was found to be redundant (SITE-6626)                                                            
                //'seriesName' :          sho.gamify.series_name || 'Red Rewards',
                          
                'progress' :            this.getUserProgress(),
                'completed' :           this.isCompleted(),
                
                // multi/single actions have different styles, calls-to-action language and url handling      
                'isSingleAction' :      this.isSingleAction(),
                'isMultiAction' :       this.isMultiAction(),
                
                // longer multi-action challenges need a paginated view
                'isPaginated':          this.isPaginated(),
                'actionUrl' :           this.getActionUrl(challenge),
                'actionStatus' :        this.getActionStatus(),
                'actionStatusCSS' :     this.getActionStatus().split('_').join('-'),
                'actionLabel' :         this.getActionLabel(),
                'shareUrl' :            this.getShareUrl(),
                
                // create share text for seeding tweet button (although actionPhrase would be better, it's not provided)
                'shareText' :           this.getShareText(challenge),
                
                // handle points
                // warning! challenges created in new console are not populating this value correctly,
                // due to a change in structure that deprecated pointAward and introduced a new, 
                // more complex, nested object containing the points as an array (ChallengeRewards)
                // see https://issues.sho.com/browse/SITE-6949
                'pointAward' :          this.getPoints(challenge),
                
                // if display:large is not found in challenge tags we default to small
                'displaySize':          (/display:large/.test(challenge.tags) ? 'large' : 'small'),
                
                // grab the badge/primary art
                'primaryArt':           challenge[this.primary_art_store],
                
                // escape the challenge name to expose in a data-challenge-name attribute)
                'dataName' :            escape(challenge.name),
                
                // badge-less challenges are treated differently in the gallery view, they get a shader effect..
                'badge' :               (/badge:yes/.test(challenge.tags)),
                
                // custom sort for gallery order is stored in tags
                'sort' :                (function(){
                    var matches = challenge.tags.match(/sort:(\d+)/),
                        value =   _.any(matches) ? matches[1] : 300 // default sort value is 300
                    ;   
                    return Number(value)
                })()
                                      
            },{
                // no need to fire an event for these changes                                                                                                           
                'silent':true
            });
            
            // rules/progress tests
            // log('|model| progress => '+ this.attributes.progress);
            // log('|model| getRules() => '+ this.getRules().length);
            // log('|model| getRules(pending) => '+ this.getRules('pending').length);
            // log('|model| getRules(completed) => '+ this.getRules('completed').length);
            // log('|model| getRules(in-progress) => '+ this.getRules('in-progress').length);
            // log('|model| getActionStatus() =>  '+this.getActionStatus());
            // log('|model| isPaginated() => ' + this.isPaginated())
            // log(this.getRules());
            // log(this.attributes)
            // log(this.get('shareText'))
            
            // make the newly proccessed attributes available for external calling contexts (gallery)
            // using _.pick to keep the package as lean as possible, since most of these properties are only shown in the details view..
            return _.pick(this.attributes, 
                
                // used in gallery:detail context
                'seriesName',
                'dataName',
                'name',
                'displaySize',
                'actionStatus',
                'actionStatusCSS',
                'actionPhrase',
                'pointAward',    
                'progress',
                'completed',
                'primaryArt',
                'badge',
                'tags',
                'sort',
                
                // added for fan club context
                'folderName',
                
                // added for my activity context
                'shareUrl'
            )
        }
        
    };

