
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        gamify.js
    @author				dpaul
    @modified			04.18.13
    @desc		        Model class for the Challenge Details component
    -------------------------------------------------------------------------------------------- */ 
    
    sho.provide('sho.gamify.challengegallery.models.challenge');
    
    /**
     * class sho.gamify.challengegallery.models.Challenge
     * This class defines the model in the model-view-controller setup. There is quite a lot of complex functionality so it
     * is broken up into individual modules to keep things manageable, but all methods and properties are ultimately copied onto the model class itself.
     * The model is only instantiatied once, to power the Details view, but the setAttributes method is called repeatedly from an external context
    **/
    
    sho.gamify.challengegallery.models.Challenge = Backbone.Model.extend(function(model_scope){
        
        return _.extend({},
            model_scope['Base'],
            model_scope['Ajax'],
            model_scope['Attributes'],
            model_scope['Pagination'],
            model_scope['Types'],
            model_scope['Progress']
        )
    }
    (sho.gamify.challengegallery.models.challenge))
    
    /* No surrender, No delete! */