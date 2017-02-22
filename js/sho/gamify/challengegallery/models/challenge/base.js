
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
     * class sho.gamify.challengegallery.models.challenge.Base
     * mix-in for the challenge model class
    **/
    
    sho.gamify.challengegallery.models.challenge.Base = {

        '_KLASS_' : 'sho.gamify.challengegallery.models.Challenge',
       
        'dummy_progress' : false,
        'use_production_share_urls' :  false, // if you set this to true to test social sharing, please change it back!
        'use_production_action_urls' : false,
        
        initialize:function(cfg)
        {
            _.extend(this, {
                'nitro' : sho.accounts.nitro.getInstance(),
                'attributes' : { 
                    'name' :  cfg.name,
                    'rules' : [],
                    'page' :  null,
                    'pages' : null
                },
                'dummy_progress' : (typeof cfg.dummy_progress == 'undefined' ? this.dummy_progress : cfg.dummy_progress),
                'fn' : { 
                    'onReady' : _.bind(this.onReady, this)
                }
            });
            
            if(this.has('name')) this.fetch()
        },
        
        getShareUrl:function(cfg)
        {
            // we considered using a more sluggy form of the challenge, but enforcing the conversion rules
            // in both server and javascript layer would be iffy, plus the issue of special characters..
            // at the moment, it's a simple parameter only, that gets sent as the hash fragment after the redirecy
            var env_root = this.use_production_share_urls ? 'http://www.sho.com' : ('http://'+window.location.host),
                base_url = '/sho/red-rewards/challenges',
                // added option to supply cfg in case called outside of model (ie from activity stream)
                name = cfg ? cfg.name : (this.get('name') || 'unknown challenge'),
                url = env_root + base_url + '?name=' + escape(name)
            ;
            // log('|model| getShareUrl `'+url+'`');
            
            return url; 
        },
        
        // create share text for seeding tweet button (although actionPhrase would be better, it's not provided)
        getShareText:function(attrs)
        {
            return attrs.name+' - '+attrs.description
        },
        
        // handle points
        // warning! challenges created in new console are not populating the pointAwards value correctly,
        // due to a change in structure that deprecated pointAward and introduced a new, 
        // more complex, nested object containing the points as an array or object (ChallengeRewards.ChallengeReward)
        // see https://issues.sho.com/browse/SITE-6949
        //
        //  "ChallengeReward": [{
        //  	"itemName": "Points",
        //  	"details": "283138|10",
        //  	"type": "point"
        //  }, {
        //  	"itemName": "Challenge Completed",
        //  	"details": "508914",
        //  	"type": "notification"
        //  }]
        
        getPoints:function(attrs)
        {
            if(attrs['ChallengeRewards'] && attrs['ChallengeRewards']['ChallengeReward']){
                
                // this could be array or object, so normalize by wrapping and flattening...
                var rewards = _.flatten([attrs.ChallengeRewards.ChallengeReward]),

                // grab the first item that has the right points category (possible that none will)
                wrapper = _.find(rewards, function(r){ return r.itemName == 'Points' }),
                
                // extract the points value from challenges that have the correct points category
                pointsStr = wrapper && !!wrapper.details && /\d+\|\d+/.test(wrapper.details) ? wrapper.details.split('|')[1] : null
                ;
                return !!pointsStr ? Number(pointsStr) : null
            }
            else
            {
                // fallback is deprecated pointAward property
                return Number(attrs.pointAward)
            }   
        }
        
        

    };

