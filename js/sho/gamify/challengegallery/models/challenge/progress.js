
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
     * class sho.gamify.challengegallery.models.challenge.Progress
     * mix-in for the challenge model class. Handles functionality related to user progresss
    **/
    
    sho.gamify.challengegallery.models.challenge.Progress = {
        
        'action_labels' : {
            'in_progress' : 'Continue',
            'not_started' : 'Get Started'
        },

        /**
         * sho.gamify.challengegallery.models.Challenge#getUserProgress() -> Number
         * return the user's progress as a number betweeen 0 and 100. 
        **/
        getUserProgress:function()
        {
            var th=this,
            
                rules = this.get('rules'),
            
                rulesTotal = rules.length,
            
            progress = _.inject(rules, function(p, rule){
                return p + th.getRuleProgress(rule)
            }, 0),            
                
                n = progress / rulesTotal,

                percent = eval((n * 100).toFixed(2).split('.')[0]) // "8.33" -> "8" -> 8
            ;
            
            // log([
            //     '|get_user| ', 
            //     'progress=', progress,
            //     ' rulesTotal=', rulesTotal,
            //     ' p/t=', (progress/rulesTotal),
            //     ' ', percent, '%'
            // ].join(''));
            
            return percent 
        },
        
        /**
         * sho.gamify.challengegallery.models.Challenge#getRuleProgress(Rule) -> Number
         * return the user's fractional progress in acheving a rule associated with the challenge.
         * this utility function is used to check against each rule in the challenge. internally, divides the 'achiveved' property
         * by the 'goal' propery. As goal can be more than 1, this can return 0,1, or a fraction
        **/
        getRuleProgress:function(rule)
        {
            var achieved =  Number(rule.achieved);
            goal =          Number(rule.goal);
            ruleProgress =  (achieved/goal);
            // log([
            //     '|get_rule| `', rule.actionTag,
            //     '` achieved=', achieved,
            //     ' goal=', goal,
            //     ' ruleProgress=', ruleProgress
            // ].join(''));
            return ruleProgress
        },
        
        /**
         * sho.gamify.challengegallery.models.Challenge#getRules(fitler) -> Array
         * return the rules associated with the challenge, with an optional filter applied
        **/
        getRules:function(filter)
        {
            var th=this,
            rules = this.get('rules'),
            fn
            ;
            
            // define a utility function to return the rules
            // that match the filter condition
            switch(filter)
            {
                case 'completed':
                    fn = function(rule){
                        return rule.completed=='true';
                    }
                    break;
                case 'pending':
                    fn = function(rule){
                        return rule.completed=='false';
                    }
                    break;
                case 'in-progress':    
                case 'in_progress':
                    fn = function(rule){
                        var progress = th.getRuleProgress(rule);
                        return progress < 1 && progress > 0
                    }
                    break;
                default:
                    fn = function(){
                        return true
                    }
            }   
            
            return _.filter(rules, fn);
        },
        
        /**
         * sho.gamify.challengegallery.models.Challenge#getActionLabel() -> String
         * Return the label for the actionUrl associated with the challenge. 
         * The language is conditional based on the user's progress, for example, in multi-challenge actions.
         *
        **/
        getActionLabel:function()
        {
            return this.action_labels[this.getActionStatus()];
        },
        
        /**
         * sho.gamify.challengegallery.models.Challenge#getActionStatus() -> String
         * Returns either ''not_started','in_progress', or 'complete' based on the user's progress.
        **/
        getActionStatus:function()
        {
            return (this.isCompleted() ? 'complete' 
                : 
                _.any( _.flatten([this.getRules('completed'),this.getRules('in-progress')])) ? 'in_progress' : 'not_started'
            )
        },
        
        /**
         * sho.gamify.challengegallery.models.Challenge#isCompleted() -> Boolean
         * Returns true if getUserProgress is greater than 99
        **/
        isCompleted:function()
        {
            return (this.getUserProgress() > 99)
        }
        

        
    };

