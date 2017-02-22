
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        modals.js
    @author				dpaul
    @modified			05.15.13
    @desc		        handle the modals related to gamification
    -------------------------------------------------------------------------------------------- */  
    sho.provide('sho.gamify');
    !function (context){
        
        modal_cfg = {
         
            'points_info' : {
                'title' : 'How To Earn Points',
          	    'width' : 410,
          	    'height' : 288,
          	    'theme' : 'default', // don't use metro in case the challenge unavailable modal was opened first
          	    'content' : (function(){
          	        return ['',
          	        '<div class="gamify-modal-info">',
                        '<p>Earn points by doing all the usual things you do on the site. ',
                        '<ul>',
                            '<li>Watch a video <span>5 PTS</span></li>',
                            '<li>View a photo gallery <span>10 PTS</span></li>',
                            '<li>Share content <span>15 PTS</span></li>',
                            '<li>Post comments on the socialize page <span>25 PTS</span></li>',
                        '</ul>',
                        '<h3>Complete Challenges</h3>',
                        '<p>You\'ll also find customized challenges where you can really rack up points, as well as earn badges and rewards.<br/>Check back regularly for new challenges.</p>',
                    '</div>',
                    ''].join('')
          	    })
            },
            
            'available_points_info' : {
                'title' : 'Available Red Rewards Points',
          	    'width' : 450, // 427 in psd
          	    'height' : 137, // 105 in psd
          	    'theme' : 'default',
          	    'content' : (function(){
          	        return ['',
          	        '<div class="gamify-modal-info">',
                        '<p>"Available Points" are points that you have not yet used to redeem rewards.</p>',
                        '<p>&nbsp;</p>',
                        '<p>"Lifetime Points" are all the points you have earned to date, and are used to determine your levels, achievements and positions on leaderboards. They are not affected when you redeem Available Points.</p>',
                    '</div>',
                    ''].join('')
          	    })
            },
            
            'level_info' : {
                'title' : 'How To Level Up',
          	    'width' : 410,
          	    'height' : 365, //was 274, change to 365 for 1/5 build,
          	    'theme' : 'default',
          	    'content' : (function(){
          	        return ['',
                        '<div class="gamify-modal-info gamify-modal-level-info">',
                            '<p>',
                                'Once you reach the point threshold for a new level you will automatically be moved to that level, ',
                                'with a new set of challenges and achievements. See how high you can get!',
                            '</p> ',                            
                            /*'<ul>',
                              	'<li>Level 1: <span>all users start here (0 pts needed)</span></li>',
                                '<li>Level 2: <span>2,001</span></li>',
                                '<li>Level 3: <span>3,001</span></li>',
                                '<li>Level 4: <span>5,001</span></li>',
                                '<li>Level 5: <span>8,001</span></li>',
                                '<li>Level 6: <span>10,001</span></li>',
                                '<li>Level 7: <span>50,001</span></li>',
                            '</ul>',
                            */ 
                            '<ul>',                                
                                '<li>Level 1: <span>all users start here (0 pts needed)</span></li>',
            		            '<li>Level 2: <span>501</span></li>',
            		            '<li>Level 3: <span>2,001</span></li>',
            		            '<li>Level 4: <span>3,001</span></li>',
            		            '<li>Level 5: <span>4,001</span></li>',
            		            '<li>Level 6: <span>5,001</span></li>',
            		            '<li>Level 7: <span>6,001</span></li>',
            					'<li>Level 8: <span>7,001</span></li>',
            					'<li>Level 9: <span>8,001</span></li>',
            					'<li>Level 10: <span>9,001</span></li>',
            					'<li>Level 11: <span>10,001</span></li>',
            					'<li>Level 12: <span>50,001</span></li>',
                            '</ul>',                                          
                        '</div>',
          	        ''].join('')
          	    })
            },
            
            
            'challenge_unavailable' : {
                'title' : 'Challenge Unavailable',
                'width' : 380,
                'height' : 100,
                'theme' : 'metro',
                'content' : (function(){
                    return ['',
                        '<p>Sorry, this challenge is not available.</p>',
                        '<p>',
                            'Check out the available challenges and ',
                                (sho.accounts.isGamified() 
                                    ? 
                                    'earn more points and customized badges' : 
                                    'join Red Rewards now to start earning points and customized badges'),
                        '</p>',
                    ''].join('')
                })
            },
            
            'confirm_optin' : {
                'type' : 'confirm-optin'
            },
            
            'confirm_success' : {
                'title' : 'Sign Up for Red Rewards',
                'width' : 400,
                'height': 130,
                'theme' : 'metro',
                'content' : ['',
                    '<p>Your changes have been saved</p>',
                ''].join('')
            }
        }
        
        context.showModal = function(k)
        {
            var key = k.split('-').join('_'),
                cfg = modal_cfg[key]
            ;
            if(cfg)
            {
                sho.ui.Modal(cfg);
            }
        }
        
        
        
    }(sho.gamify)