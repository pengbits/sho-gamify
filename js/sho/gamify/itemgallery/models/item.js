
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify
    @file		        item.js
    @author				dpaul
    @modified			09.18.14
    @desc		        Model class for the Item Details component
    -------------------------------------------------------------------------------------------- */ 
    
    sho.provide('sho.gamify.itemgallery.models.item');
    
    /**
     * class sho.gamify.itemgallery.models.Item
     * This class defines the model in the model-view-controller setup. There is quite a lot of complex functionality so it
     * is broken up into individual modules to keep things manageable, but all methods and properties are ultimately copied onto the model class itself.
     * The model is only instantiatied once, to power the Details view, but the setAttributes method is called repeatedly from an external context
    **/
    
    sho.gamify.itemgallery.models.Item = Backbone.Model.extend(function(model_scope){
        
        return _.extend({},
            model_scope['Base'],
            model_scope['Ajax'],
            model_scope['Attributes'], 
            {}
        )
        // return _.extend({},
        //     model_scope['Base'],
        //     model_scope['Ajax'],
        //     model_scope['Attributes'],
        //     model_scope['Pagination'],
        //     model_scope['Types'],
        //     model_scope['Progress']
        // )
    }
    (sho.gamify.itemgallery.models.item))
    
    /* No surrender, No delete! */