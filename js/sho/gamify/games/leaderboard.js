
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <rebuild>
    @project	    	gamify / games
    @file		        leaderboard.js
    @package            games
    @author				dpaul
    @modified			06.13.13
    @desc		        
    
    zeldanitro:     3477471
    bowsernitro:    3477473
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.games');

    !(function($){
    
    /**
     * class sho.gamify.games.Leaderboard
     * nitro-powered leaderboard for use w/ games ie whats the diff
     *
     *  1. startup
     *  2. ajax (nitro calls)
     *  3. points/score
     *  4. render
     *  5. util
     *
    **/
    
    sho.gamify.games.Leaderboard = klass({

        '_KLASS_' : 'sho.gamify.games.Leaderboard',

    	default_avatar :        'http://www.sho.com/assets/images/accounts/avatars/generic/90x90/Generic_90x90.png',
        default_duration :      'ALLTIME',
        default_return_count :  100,
        auto_refresh :          true, // refresh leaderboard afrer write?
        first_run :             true, 
        highlight_my_user :     true,

        /*
        =:startup
        ---------------------------------------------------------------------------------------- */
        initialize:function(cfg)
        {
            _.extend(this, {
                'container' :   $(cfg.container),
                'nitro' :       sho.accounts.nitro.getInstance(),
                'auto_refresh': cfg.auto_refresh == undefined ? this.auto_refresh : cfg.auto_refresh, 
                'duration':     cfg.duration || this.default_duration,
                'returnCount':  cfg.returnCount || this.default_return_count,
                   
                'data' : {
                    'gameId' :  cfg.id,  //  www_games_whats_the_diff
                },
                
                'callbacks' : {
                    'onRead'  :     cfg.onRead  || sho.emptyFunction,
                    'onReady' :     cfg.onReady || sho.emptyFunction,
                    'onWrite' :     cfg.onWrite || sho.emptyFunction
                },
                
                'fn' : {
                    'read' :    _.bind(this.read, this),
                    'onRead' :  _.bind(this.onRead, this),
    	            'onWrite' : _.bind(this.onWrite, this),
    	            'onRender': _.bind(this.onRender, this)
                }
            })
            
            log('|gamify.leaderboard| hello from '+this._KLASS_ +' id=`'+this.data.gameId+'` auto_refresh=`'+this.auto_refresh+'` returnCount=`'+this.returnCount+'`');
            this.callbacks.onRead();
            this.read()
        },
        
        
        /*
        =:ajax 
        ---------------------------------------------------------------------------------------- */
        read:function()
        {
            this.nitro.callAPI({
               'method':'site.getPointsLeaders',
               'duration':this.duration,
               'returnCount': this.returnCount,
               'pointCategory': this.data.gameId, // game id is actually pointCategory!
               'preferences':'firstName|lastName',
               'callback': this.fn.onRead
            });
    
        },

        onRead:function(xhr)
        {   
            var th = this,
                data = xhr.Nitro,
                leaderboardData = data.leaders && data.leaders.Leader ? data.leaders.Leader : null,
                success = !!leaderboardData
            ;

            if(success)
            {
                // grab leaders, tweaking attributes where neccesary
                this.data.rankings = _.collect( _.flatten([leaderboardData]), function(attrs)
                {
                    var c = _.extend({}, attrs);

                    // cast points to number
                    c.points = Number(attrs.points);

                    // assign username based on nitro user stored preferences; if none, use userId
                    c.userName = (attrs.firstName) ? attrs.firstName : attrs.userId;

                    // assign avatar based on nitro user stored preferences; if none, use sho.com default
                    c.avatar = (attrs.lastName) ? attrs.lastName : th.default_avatar;

                    return c;
                })
                
                if(this.first_run)
                {
                    this.first_run = false;
                    this.callbacks.onReady(this.data.rankings);
                }
                else
                {
                    this.callbacks.onRead(this.data.rankings);
                }
                this.render()
            }
            else
            {
                log(xhr); 
                this.callbacks.onRead(false);
                throw new Error(data.Error && data.Error.Message ? data.Error.Message : 'Problem loading leaderboard')
            }
        },
        
        onWrite:function(xhr)
        {
            var data = xhr.Nitro,
            success = data && data.res && data.res == 'ok'
            ;
        
            if(success)
            {
                log('|gamify.leaderboard| score submitted successfully')
               
                this.callbacks.onWrite(true);
                
                if(this.auto_refresh) // can be problematic
                {
                    log('|gamify.leaderboard| reloading leaderboard...')
                    _.delay(this.fn.read, 1000)
                }
            }
            else
            {
                log(xhr)
                this.callbacks.onWrite(false);
                throw new Error('Problem submitting score for user#'+sho.accounts.getUserId()+'...')
            }
        },
        
        
        /*
        =:points, =:score 
        ---------------------------------------------------------------------------------------- */
        submitScore:function(score)
        {
            log('|gamify.leaderboard| submitScore:'+score);
            
            if(!sho.accounts.isGamified()) throw new Error('Trying to submit score with an anonymous or ungamified user');
            
            var normalized = this.normalizeScore(score); if(normalized > 0)
            {
	            this.nitro.callAPI({
	               'method': 'user.creditPoints',
				   'points': normalized,
	               'callback': this.fn.onWrite,
	               'pointCategory': this.data.gameId
	            });
            }
            else
            {
                log('|gamify.leaderboard| no change to high score');
                this.callbacks.onWrite(false);
            }
        },
        
        /**
         * sho.gamify.games.Leaderboard#normalizeScore(rawScore) -> Number
         * in nitro, scores are cumulative, but for the game context, we want
         * to replace the users' last score, not add to it. this function
         * checks if the user is already in the leaderboard, and if so, subtracts their last score
         * from the new value we're submitting. if the old score is higher than their new one,
         * nothing is logged to nitro
        **/
        normalizeScore:function(rawScore)
        {
            var lastScore, normalizedScore, userId = sho.accounts.getUserId();
            
            if(this.isLeader(userId))
            {
                lastScore = this.getPointsForLeader(userId);
                normalizedScore = (lastScore >= rawScore) ? 0 : (rawScore - lastScore)
            }
            else
            {
                normalizedScore = rawScore;
            }
            
            return normalizedScore;
        },
        
        /*
        =:util
        ---------------------------------------------------------------------------------------- */
        isLeader:function(userId)
        {
            return !!this.getLeader(userId)
        },
        
        getLeader:function(userId)
        {
            var candidates = _.select(this.data.rankings, function(r){ 
                return r.userId == userId 
            });
            return _.any(candidates) ? candidates[0] : false
        },
        
        getPointsForLeader:function(userId)
        {
            return (this.getLeader(userId) || {'points':0}).points
        },
        
        getData:function()
        {
            return this.data.rankings;
        },
		
        /*
        =:render
        ---------------------------------------------------------------------------------------- */
        render:function()
        {
            if(this.container) this.container.html(this.toHTML())
            if(this.highlight_my_user && sho.accounts.isAuthenticated()) _.delay(this.fn.onRender, sho.dom.REDRAW_DELAY_, sho.accounts.getUserId())
        },
        
        toHTML:function()
        {
            return _.flatten(['',
        
                '<table border="1">',
                    '<tr>',
                        '<th>',
                            'Rank',
                        '</th>',
                        '<th>',
                            'Name',
                        '</th>',
                        '<th>',
                            'Points',
                        '</th>',
                    '</tr>',
                    
                    _.collect( this.data.rankings, function(r,i){
                        return ['',
                        '<tr id="user-id-', r.userId, '">',
                            '<td>', (i+1), '</td>',
                            '<td>', r.userName, '</td>',
                            '<td>', r.points, '</td>',
                        '</tr>']
                    }),
        
                '</table>',
        
            '']).join('')
        },
        
        onRender : function(userId)
        {
            this.container.find('#user-id-'+userId).animate({
                'background-color':'yellow'
            })
        }
        

    });


    })(sho.$);

    /* No surrender, No delete! */ 
