
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <rebuild>
    @project	    	_
    @file		        confirm.js
    @package            gamify.modals
    @author				dpaul
    @modified			07.18.14
    ------------------------------------------------------------------------------------------ */  
    sho.provide('sho.ui.modals');

    !function($)
    {     

        /**
         * class sho.gamify.modals.ConfirmOptin < sho.ui.modals.Base
         * Recode of iframe-based login modal, uses xhr to provide a more responsive login flow w/ less resize glitches
        **/
    
        sho.gamify.modals.ConfirmOptin = Class.create( sho.ui.modals.Base, {

            _KLASS_ : 'sho.gamify.modals.ConfirmOptin',

            'defaults': {
                'title' : 'Sign Up for Red Rewards',
                'width' : 667,
        		'height' : 212,
                'theme' : 'metro'
            },
            
            'content' : ['',

                '<div class="gamify-confirm-enroll">',
                    '<p>Now you can earn points, badges and real rewards just for checking out the SHO.com website.</p>',
                    '<form name="gamify_confirm_enroll" action="#" method="POST">',
                    	'<fieldset class="confirm-checkbox-wrap">',
                    		'<input type="checkbox" name="confirm_checkbox" />',
                    		'<label for="confirm_checkbox">By selecting yes, I agree to the Red Rewards <a href="/sho/about/terms-red-rewards" target="_blank">terms</a>.</label>',
                    	'</fieldset>',
                    	'<fieldset>',
                    		'<input name="confirm_submit" value="Save" type="submit" class="submit" />',
                    	'</fieldset>',
                    '</form>',
                '</div>',
            
            ''].join(''),

            'url' : '/api/accounts/opt-in?opt=true',

            /*
            =:runtime
            ---------------------------------------------------------------------------------- */
            setHandlers : function($super)
            {
                // call super for standard modal behavior..
                $super()
            
                // create some bound callbacks
                _.extend(this.fn, {
                    'onSubmit' : _.bind(this.onSubmit, this),
                    'onSuccess': _.bind(this.onSuccess, this)
                })
            
                // set some pointers
                this.ui.form =  $(this.ui.content).find('form').submit(this.fn.onSubmit);
                this.ui.check = this.ui.form.find('input[name=confirm_checkbox]').uniform(); 
                this.ui.wrapper = this.ui.form.find('.confirm-checkbox-wrap');
            
            },

            onSubmit: function(e)
            {
                sho.dom.trap(e);

                if(!this.ui.check.is(':checked'))
				{
					this.ui.wrapper.addClass('error');
				}
				else
				{
					//this.ui.wrapper.removeClass('error');
					this.setContent('<p>Saving changes...</p>');
					// this could be moved back into attempt.js,
					// as long as there is a way to indicate that no checks are needed...
				    $.ajax({
                        'url' : '/api/accounts/opt-in?opt=true', 
                        'success' : sho.emptyFunction,//(function(xhr){window.xhr=xhr; log('ready')}), 
                        'type' : 'PUT', 
                        'dataType' : 'json' 
				    })
    				.done(this.onSuccess)
    				.fail(this.onError)			
				}
				
            },
            
            onSuccess:function(xhr){
                sho.dom.trigger('user:gamify:optin');
                
                // refresh the user object. currently, this spawns another xhr get, which is a shame,
                // since the data could be right there in the callback response. 
                // (it's not, the user object is slightly different, and doesn't include 'isGamificationParticipant')
                sho.accounts.refresh();
                
                sho.ui.Modal({
                    'width':400,
                    'height':130,
                    'theme' : 'metro',
                    'content' : ['',
                        '<p>Your changes have been saved.</p>',
                    ''].join('')
                })
                .selfDestruct();
            },
            
            onError:function(){
		        sho.ui.Error({
		            'message':'A server error has occurred'
		        })
            },
            
            unsetHandlers:function($super)
            {
                $super();
                this.unsetFormHandlers()
            },
            
            unsetFormHandlers:function()
            {
                this.ui.form.find('form').off('submit');
            },
            
            // calling modal.close() does not typically unset any listeners, merely wiping the inner content and hiding the container.
            // since that would leave orphaned listeners here, we're unsubscribing before that happens.
            close:function($super)
            {
                this.unsetFormHandlers();
                $super();
            },
                
            
        });

    }(sho.$)

