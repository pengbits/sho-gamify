
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify.fanclubgallery
    @file		        model.js
    @author				dpaul
    @modified			03.04.14
    -------------------------------------------------------------------------------------------- */  

    /**
     * sho.gamify.fanclubgallery.model
     * wrapper around api calls for fan club gallery
    **/
    
    sho.provide('sho.gamify.fanclubgallery');
    sho.gamify.fanclubgallery.Model = Backbone.Model.extend({
        
        '_KLASS_' : 'sho.gamify.fanclubgallery.Model',
        
        /*
        =:startup
        ---------------------------------------------------------------------------------------- */ 
        initialize:function(cfg)
        {
            _.extend(this, {
                // get a copy of the Nitro connection
                'nitro' : sho.accounts.nitro.getInstance(),
                'nitroFolder' : 'www',
                'fn' : {
                    'getChallenges' :        _.bind(this.getChallenges, this),
                    'onChallengesReady' :    _.bind(this.onChallengesReady, this),
                    'buildFolderSummary':    _.bind(this.buildFolderSummary, this)
                }
            
            });
            
            // instantiate a detail model, but don't trigger any api calls yet
            // this is included here in a kind of compound-model relationship
            this.details = new sho.gamify.challengegallery.models.Challenge({});
        },
        
        // called by view after dom structure is parsed
        setFanclubs:function(data)
        {
            if(!data.length) return
            
            this.set({
                'fanclubs':data          
            })
            
            log('|fanclub.model| getting challenges...')
            
            _.delay(this.fn.getChallenges, sho.dom.REDRAW_DELAY_) // slight delay to ensure timestamp is distinct for callback
        },
        
        
        
        /*
        =:challenge summaries
        ---------------------------------------------------------------------------------------- */
        getChallenges:function()
        {
            // construct initial api call for challenges collection
            var call = {
                'method' : 'user.getChallengeProgress',
                'showOnlyTrophies' : false,
                'callback' : this.fn.onChallengesReady
            };
            
            // limit results to a specific folder if neccessary
            if(this.nitroFolder) call.folder = this.nitroFolder;
            
            // hide achievements progress from users who haven't opted-in (only affects anonymous users)
            if(!sho.accounts.isGamified()) call.userId = sho.accounts.nitro.anonymous_user_id
            
            // fire the call
            this.nitro.callAPI(call);
        },
        
        onChallengesReady:function(xhr)
        {
            var th = this,
            data = xhr.Nitro,
            challengeData = data.challenges && data.challenges.Challenge ? data.challenges.Challenge : null,
            success = !!challengeData,
            dirty,
            clean
            ;
            
            if(success)
            {
                // always start with a fresh model
                th.details.clear();
                
                // collect the challenges data that arrived as bulk JSON, but run all attributes 
                // through the validations provided by the detail model. (copy as clone, not by reference)
                dirty = _.collect(challengeData, function(attrs){
                    return _.clone(th.details.setNitroAttributes(attrs));
                })
                
                this.set({'challenges': this.byFolder(dirty)},{'silent':true})
                this.buildSummary()
                
                // log(this.get('fanclubs'))
                // this.set({'summary': this.buildSummary() });
                // 
                // // this.trigger('ready');
            }
            else
            {
                log('|fanclub.model| error '+JSON.stringify(data));
                this.trigger('error', {'error':'no challenge data found' });
            }
        },
        
        
        byFolder:function(data)
        {
            log('|fanclub.model| grouping by folder..')
            
            var isSeriesFolder = (function(str){
                return /www_series_(\d+)_*(\d+)*_*(\d+)*/.test(str)
            });
            
            return _.groupBy(data, function(c)
            {
                if(isSeriesFolder(c.folderName))
                {
                    // collapse www_series_323, www_series_323_1, www_series_323_2_1 etc into same folder    
                    return c.folderName.split('_').slice(0,3).join('_');
                }
                else
                {
                    return c.folderName
                }
            })
        },
        
        // loop over challenges in each category,
        // and build tally of points for each challenge achieved
        buildSummary:function()
        {
            _.each(this.get('fanclubs'), this.fn.buildFolderSummary)
        },
        
        // trigger event and pass summary entry directly to view
        buildFolderSummary:function(club)
        {
            var entry = this.getProgressForFolder(this.get('challenges')[club.folderName], club.id); 
            entry.id = club.id;
            this.trigger('change:challenge_summary', entry);
       
        },

        getProgressForFolder:function(folderChallenges, id)
        {
            // note: this is far simpler now that we aren't displaying the points earned, just the challenge counter
            log('|fanclub.model| getProgressForFolder called for `'+id+'`');
            return {
                'completed' : ( _.select(folderChallenges, function(c){return c.completed;})).length
            }
        }
        
    })

    // No surrender, No delete!