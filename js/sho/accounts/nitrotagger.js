/*
	JS
	--------------------------------------------------------------------------------------------  
	@site   			sho.com <rebuild>
	@project	    	accounts
	@file		        /lib/js/sho/accounts/js/accounts/nitroTagger.js
	@author				dmccleod
	@modified			10.15.12
	@desc		        functions for tagging pages and actions in accounts with bunch ball tags
	@note				

	/* =: accounts
	-------------------------------------------------------------------------------------------- */
	
	/**
     * sho
     * top-level namespace
    **/

	/**
	 * sho.accounts.nitroTagger(jQuery) -> functions
	 * Collection of functions to tag pages and events in accounts using the Nitro API
	**/	
	sho.provide('sho.accounts');
	sho.accounts.nitroTagger = function($)
	{		
	
		/**
		 * sho.accounts.nitroTagger#init() -> null
		 * Initialize function that calls the addEventHandlers() method
		**/
		function initialize(){
			addEventHandlers();
		}
				
		/**
		 * sho.accounts.nitroTagger.addEventHandlers() -> null	
		 * Adds form submit event handlers on the edit profile and newsletters preferences pages
		**/
		function addEventHandlers(){		    
			if($('#newsLetters')) $('#userManagementForm').on('submit',function(){tagNewsLetter()});
			if($('#editMyProfile')) $('#userManagementForm').on('submit',function(){tagProfileUpdate()});
		}
		
		/**
		 * sho.accounts.nitroTagger.tagNewsLetter() -> null	
		 * If the user has checked any of the newsletters, Nitro tags will be added for each newsletter
		**/
		function tagNewsLetter(){
			var seriesId;
			var checkboxes = $$('input[name^="userSelectedNewsletters"]').filter(function(i){
				return i.checked;
			}).each(function(index){
				seriesId = $(index).attr('data-series-id') || 0;
				sho.accounts.nitro.getInstance().logAction({'tags':'profile_newsletters','metadata':'seriesId:'+seriesId})
			});
			// call nitro api for all newsletters at once if they are checked
			//if($.grep(checkboxes, function(cb){ return cb.checked}).length >= 1) sho.dom.trigger('user:newsletter:subscribe');			
		}
	
		/**
		 * sho.accounts.nitroTagger.tagProfileUpdate() -> null	
		 * If the user has filled in any of the profile fields or chosen an avatar, Nitro tags will be added for updating the profile
		**/	
		function tagProfileUpdate(event){
			if($('#about').length > 0) if($('#about').val().length >=1) sho.dom.trigger('user:profile:about');
			if($('#location').length > 0) if($('#location').val().length > 2) sho.dom.trigger('user:profile:location');
			if($('#avatarId').length > 0) if($('#avatarId').val() != "" || $F($$('input[name^="customAvatar"]')[0]).length > 0) sho.dom.trigger('user:profile:avatar');		
		}
		
		/**
		 * sho.accounts.nitroTagger.tagRegistration() -> null	
		 * When the user has completed the registration process, Nitro tags will be added for registration
		 * If the user has subscribed to any newsletters, Nitro tags will be added for newsletter subscription		
		 * Note: registration is also considered a profile update, so Nitro tags will also be added for profile update upon registration
		**/
		function tagRegistration(c){
			if(c.has_newsletters && c.send_emails) sho.dom.trigger('user:newsletter:subscribe');
			if(c.has_location) sho.dom.trigger('user:profile:location');
			if(c.has_avatar) sho.dom.trigger('user:profile:avatar');
			if(c.has_about) sho.dom.trigger('user:profile:about');
			sho.dom.trigger('user:register');
			sho.dom.trigger('user:login:success');
		}
		
		function tagLogin(){
			sho.dom.trigger('user:login:success');
		}
				
		return {
			init: initialize,
			tagRegistration: tagRegistration,
			tagLogin: tagLogin
		}
		
	}(sho.$)
	
	sho.dom.ready(sho.accounts.nitroTagger.init)
	
	/* No surrender, No delete! */
		
	
	/**
	 * sho.accounts.nitroTagger#tagRegistration({object containing bollean values for the various account properties }) -> null	
	 * This function is called from /accounts/views/confirmation/confirmed.jsp
	 * If the user has completed registration, Nitro tags will be added for it's correlating action
	 * This function also adds Nitro tags if the user has chosen to subscribe to any newsletters
	 * A list of account properties is passed in as hash:
	 * - has_newsletters,			
	 * - has_about,
	 * - has_location,
	 * - has_avatar,
	 * - has_custom_avatar,
	 * - has_gender,
	 * - send_emails
	**/
	
	
	
	