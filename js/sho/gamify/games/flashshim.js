
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @project	    	gamify / games
    @file		        flashshim.js
    @package            games
    @author				nwebb
    @modified			09.27.13
    @desc		        acts as go-between for bringing nitro leaderboard functionality to flash games    
    -------------------------------------------------------------------------------------------- */  
    sho.provide('sho.gamify.games');
        
    sho.gamify.games.FlashShim = {
        nitroReady : false,
        leaderboardInit : false,
        leaderboardId : null,
        flashMovieId : null,
        leaderboard : null,
        leaderboardReady : false,
        
        initNitro : function ()
        {
            log('hello from \'sho.gamify.games.FlashShim\'');
            sho.dom.bind('nitro:init', function(e) {
                sho.gamify.games.FlashShim.nitroReady = true;
                
                // if initLeaderboard has been called already, call initLeaderboard again to initialize leaderboard
                if(sho.gamify.games.FlashShim.leaderboardInit){
                    sho.gamify.games.FlashShim.initLeaderboard(sho.gamify.games.FlashShim.flashMovieId, sho.gamify.games.FlashShim.leaderboardId);
                }
            });	
        },
		
        initLeaderboard : function(_flashMovieId, _leaderboardId) {
            log('|flashshim| initNitroLeaderboard | ' + _flashMovieId + ' | ' + _leaderboardId);
            //
            sho.gamify.games.FlashShim.flashMovieId = _flashMovieId;
            sho.gamify.games.FlashShim.leaderboardId = _leaderboardId;
            // Nitro must be ready before creating the leaderboard
            if(sho.gamify.games.FlashShim.nitroReady){   
                // create the leaderboard 
                sho.gamify.games.FlashShim.leaderboard = new sho.gamify.games.Leaderboard({
            
                    // id is required, it associates the leaderboard w/ a specific game
                    // internally, the game id is actually the points category in nitro
	                'id' : sho.gamify.games.FlashShim.leaderboardId,
            
                    // onRead/onWrite are used to set callbacks that will fire when
                    // these operations occur..
                    // use these to roll your own render routine if you do not set the container element
	                'onRead' :  sho.gamify.games.FlashShim.onLeaderboardRead,
	                'onWrite' : sho.gamify.games.FlashShim.onLeaderboardWrite,
	                'onReady' : sho.gamify.games.FlashShim.onLeaderboardReady
                })
				sho.gamify.games.FlashShim.setEventListeners();
            } else {
                // initLeaderboard has been called but leaderboard has not been initialized
                log("Nitro not ready");
                sho.gamify.games.FlashShim.leaderboardInit = true;
            }
        },
        
        onLeaderboardRead : function(data) {
            log('|flashshim| onLeaderboardRead');
            if(sho.gamify.games.FlashShim.leaderboardReady){
                sho.gamify.games.FlashShim.sendDataToFlash();
            }
        },

        onLeaderboardWrite : function(success) {
            log('|flashshim| onLeaderboardWrite: ' + success);
            if(sho.gamify.games.FlashShim.leaderboardReady){
                sho.gamify.games.FlashShim.sendDataToFlash();
            }
        },
        
        onLeaderboardReady : function(data) {
            log('|flashshim| onLeaderboardReady');
            sho.gamify.games.FlashShim.leaderboardReady = true;
			sho.gamify.games.FlashShim.sendDataToFlash();
        },
		
        setEventListeners : function() {
            log('|flashshim setEventListeners');
            var fn = this.onUserChangeEvent;
            sho.accounts.nitro.user_change_events.each(function(e){
                sho.dom.bind(e, fn)
            })
        },    
        
        onUserChangeEvent:function(e)
        {
            // don't blindly refresh for all events, as there could be either
            // a) destination pending as part of an opt-in from a challenge get started button
            // b) an opt-in flow in progress (confirm ui is open)

            log('|flashshim| responding to `'+e.type+'` reload?');
            if(sho.accounts.nitro.optInPending() && e.type == 'user:loaded:authenticated')
            {
                log('|flashshim| we have probably just returned from a little gigya round-trip action... we need to show the confirm ui');
                sho.gamify.showConfirmUI()
            }

            if((!sho.accounts.nitro.destinationPending() && !sho.accounts.nitro.optInPending() && e.type !== 'user:loaded:authenticated') || e.type == 'user:gamify:optin:cleared')
            {
                log('|flashshim| reload=true');
                window.location.reload();
            }
        },
        
        getLeaderboard : function() {
            sho.gamify.games.FlashShim.sendDataToFlash();
        },
        
        submitScore : function (score) {
            log('|flashshim| submitScore | ' + score);
            // If leaderboard is ready, submit score
            if(sho.gamify.games.FlashShim.leaderboardReady){
                sho.gamify.games.FlashShim.leaderboard.submitScore(score);
            }
        },
        
        sendDataToFlash : function () {
            log('|flashshim| sendDataToFlash');            
            var flashGame = sho.gamify.games.FlashShim.getFlashMovieObject(sho.gamify.games.FlashShim.flashMovieId);
			
            if(flashGame && flashGame.onLoadLeaderBoard != undefined){
                // Grab rankings from leaderboard data
                if(sho.gamify.games.FlashShim.leaderboard.data && sho.gamify.games.FlashShim.leaderboard.data.rankings){
                    var rankings = sho.gamify.games.FlashShim.leaderboard.data.rankings;
					
					log('|flashshim| Sending data to Flash...');
					
                    // Send leaderboard data to Flash
                    flashGame.onLoadLeaderBoard(rankings);
                }
            }
        },
        
        getFlashMovieObject : function (movieName) {
            if (navigator.appName.indexOf("Microsoft") != -1) {
                return window[movieName];
            } else {
                return document[movieName];
            }
        }
    }
    
    // sho.dom.ready(function()
    // {
    //    sho.gamify.games.FlashShim.initNitro();
    // })