
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <desktop>
    @package            gamify.activitystream
    @file		        model.js
    @author				dpaul
    @modified			03.04.14
    -------------------------------------------------------------------------------------------- */  

    /**
     * sho.gamify.activitystream.model
     * wrapper around api calls for fan club gallery
    **/
    
    sho.provide('sho.gamify.activitystream');
    sho.gamify.activitystream.Model = Backbone.Model.extend({
        
        '_KLASS_' : 'sho.gamify.activitystream.Model',
        
        'reject_regex' : /(^\d+_)|(^opt-in)/,
        
        'max_items' : 50, // default is 20, max is 50
        
        /*
        =:startup
        ---------------------------------------------------------------------------------------- */ 
        initialize:function(cfg)
        {
            _.extend(this, {
                'nitro' : sho.accounts.nitro.getInstance(),
                'fn' : {
                    'onActionFeedReady' : _.bind(this.onActionFeedReady, this)
                }
            });
            
            this.fetch()        
        },
        
        fetch:function()
        {
            var call = {
                'method':'site.getActionFeed',
                'include_tags':false, 
                'apiKey' :  sho.accounts.nitro.Connection.prototype.cfg.apiKey, // not sure why, but it seems the apiKey must be passed in again here
                'callback':this.fn.onActionFeedReady,
                'returnCount' : this.max_items,
                'showLevelChanges' : true,
                'userIds' : (sho.accounts.isGamified() ? sho.accounts.getUserId() : sho.accounts.nitro.anonymous_user_id)
            }
            
            this.nitro.callAPI(call)
        },
        
        onActionFeedReady:function(xhr)
        {
            if(xhr.Nitro && xhr.Nitro.items && xhr.Nitro.items)
            {   
                // make sure that response for collection contains actual data and not 'true'...
                var data = xhr.Nitro.items.item,
                    items = !!data && _.isArray(data) ? this.process(data) : []
                ;
                this.set({ 'items':items }, {'silent':true})
                this.trigger('ready')
            }
            else
            {
                log(xhr)
                this.trigger('error')
            }
        },
        
        process:function(items)
        {
            // log(items)
            log('|activitystream| #dirty: '+items.length)
            var th=this, 
            use_relative_dates = window.relativeDate !== undefined,
            dirty = _.collect(items, function(item)
            {
                // timestamp needs to be manipulated before it can be displayed:
                var d = new Date(item.ts * 1000);
                item.timestamp = use_relative_dates ? relativeDate(d) : d;
                
                // coerce type into a css classname
                // 'challenge','level','message'types listed at https://bunchballnet-main.pbworks.com/w/page/53132353/site_getActionFeed
                item.kind = item.type.toLowerCase();
                
                // if it's a challenge, and it appeared in the action feed, it must be a completed challenge
                if(item.kind == 'challenge') item.completed = true;
                
                // add a share url so it can be clickable
                if(item.kind == 'challenge') item.shareUrl = sho.gamify.getShareUrl(item.itemName)
                return item
            }),
            clean = _.filter(dirty, function(item){
                return !(th.reject_regex.test(item.itemName)); // 323_photo, opt-in
            })
            ;
            log('|activitystream| #clean: '+clean.length)
            return clean
        },
        
        isEmpty:function()
        {
            return this.get('items').length == 0
        }
        
        
    })

    // No surrender, No delete!