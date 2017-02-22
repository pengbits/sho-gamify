
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.itemgallery
    @file		        model.js
    @author				dpaul
    @modified			03.13.13
    @desc		        Model class for the Item Gallery component
    
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.itemgallery.models');

    /**
     * class sho.gamify.itemgallery.models.Gallery
     * model class for the Item Gallery component
    **/

    sho.gamify.itemgallery.models.Gallery = Backbone.Model.extend({

        '_KLASS_' : 'sho.gamify.itemgallery.models.Gallery',
       
        'attributes' : {
            'challenges' : null,    // array of challenge data from nitro that powers the gallery,
            'redirectQueue' : null  // support canonical url redirects to challenge gallery
        },
     
        /*
        =:startup
        ---------------------------------------------------------------------------------------- */
        initialize:function(cfg)
        {
            _.extend(this, {
                
                // get a copy of the Nitro connection
                'nitro' : sho.accounts.nitro.getInstance(),
                
                // nope - set optional nitro folder to limit results
                // 'nitroFolder' : cfg.nitroFolder,
                
                // nope - no filtering by tags yet
                'filter'  : false,
                
                // set optional constraint on user progress
                'user_progress' : cfg.user_progress, // 'complete','in_progress','not_started'
                
                // set optional constraint on countRemaining (item gallery on;y)
                'count_remaining' : cfg.count_remaining, // 1
                
                // sort proprerty can be any challenge attribute
                'sortBy'  : cfg.sortBy,                  
                
                // sort direction to handle reverses
                'sortDir' : cfg.sortDir || 'ascending',  
                
                // create all-purpose object to store bound callbacks
                'fn' : {
                    'onReady' : _.bind(this.onReady, this)
                },
                        
            });
            
            // nope - !!this.user_progress && log('|gallery| limit by user_progress:`'+this.user_progress+'`');
            !!this.count_remaining && log('|gallery| limit by count_remaining:`'+this.count_remaining+'`');
            
            // nope - manual sorts (a numeric property applied to the challenge) need their direction reversed
            // nope - if(this.sortBy == 'sort') { this.sortDir = this.sortDir == 'ascending' ? 'descending' : 'ascending' }
             
            // instantiate a detail model, but don't trigger any api calls yet
            // this is included here in a kind of compound-model relationship
            this.details = new sho.gamify.itemgallery.models.Item({});
            
            // // proxy detail events onto this model, prefixing with 'detail'
            var th=this; this.details.bind('all', function(eventName,e){
                //log('|gallery| trigger(details:'+eventName+')');
                th.trigger('details:'+eventName, e);
            })
            
            // construct initial api call for item collection
            var call = {
                'method' : 'site.getCatalog',
                'catalogName' : 'redRewards',
                'callback' : this.fn.onReady
            };
            
            // fire the call
            this.nitro.callAPI(call);
            
        },
        
        onReady:function(xhr)
        {
            var th = this,
            data = xhr.Nitro,
            //itemData = data.challenges && data.challenges.Challenge ? data.challenges.Challenge : null,
            itemData =   data.CatalogRecord && data.CatalogRecord.catalogItems && data.CatalogRecord.catalogItems.CatalogItem ? data.CatalogRecord.catalogItems.CatalogItem : null,            
            success = !!itemData,
            dirty,
            clean,
            sorted,
            
            useFilter = !!this.filter,
            containsTag = (function(c){
                return (c.tags||'').indexOf(th.filter) > -1
            }),
            
            limitByUserProgess = !!this.user_progress,
            acceptableProgress = _.bind(function(desired,c){
                //log('|acceptableProgress| desired=`'+desired+'`, item=`'+c.actionStatus+'`');
                return c.actionStatus == desired 
            }, window, this.user_progress)
            ,
            // clone limit by user progress behavior for ensuring inventory in item catalog..
            // all of this ad-hoc filtering is needed simply because filter implementation assumes
            // that the tags property is the only criteria for filtering!
            
            limitByCountRemaining= !!this.count_remaining,
            acceptableCountRemaining= _.bind(function(desired,i){
                //log('|acceptableCountRemaining| desired=`'+desired+'`, item=`'+i.countRemaining+'`');
                return i.countRemaining >= desired 
            }, window, this.count_remaining)
            ;
				            
            if(success)
            {
                // display gallery settings
                log('|gallery| sortBy=`'+ (this.sortBy || 'none') +'` dir=`'+this.sortDir+'` filter=`'+  (this.filter || 'none') +'`');

                // collect the data that arrived as bulk JSON, but run all attributes 
                // through the validations provided by the detail model. (copy as clone, not by reference)
                dirty = _.collect(itemData, function(attrs){
                    th.details.clear()     // important! make sure we're starting with a clean model
                    return _.clone(th.details.setNitroAttributes(attrs));
                })
                
                log('|gallery| total: '+(dirty.length))

                // put challenges in a meaningful order
                clean = _.sortBy(

                // post-processing is needed to reject challenges that don't fit our criteria..
                // either because the challenge doesn't contain the tag specified, or because the actionStatus or countRemaining isn't desireable.
                // ideally this would be set up front in the form of a param sent to nitro, to limit the query...
                _.filter(dirty, function(c) {
                    return ((useFilter ? containsTag(c) : true) 
                        && (limitByUserProgess ? acceptableProgress(c) : true) 
                        && (limitByCountRemaining ? acceptableCountRemaining(c) : true))
                    }),

                    // apply a sort if one has been defined
                    function(c)
                    { 
                    return (!!th.sortBy && th.sortBy !== 'random' ? c[th.sortBy] : true)
                
                });

                this.sortBy && log('|gallery| before: '+ (_.pluck(dirty, this.sortBy).join(', ')))
                this.sortBy && log('|gallery| after:  '+ (_.pluck(clean, this.sortBy).join(', ')))
                log('|gallery| filter: '+(clean.length))

                // handle descending order sorts
                sorted = this.sortDir == 'descending' ? clean.reverse() : clean;

                // store items, in random order if need be ...
                this.set({'items' : this.sortBy == 'random' ? _.shuffle(sorted) : sorted });
				
                // all done!
                this.trigger('ready');
            }
            else
            {
                log('|error| '+JSON.stringify(data));
                this.trigger('error', {'error':'no challenge data found' });
            }
               
            //log('onReady fired in gallery')
        },
        
        
        
        /*
        =:runtime
        ---------------------------------------------------------------------------------------- */
        setDetail:function(cfg)
        {
            this.details.reload({
                'name' : cfg.name,  // challenge uses name
                'id' : cfg.id       // item uses id
            });
        },
        
        // amazingly, first time we needed this was to finesse some tracking for SITE-8627!
        getDetail:function()
        {
            return this.details;
        },
        
        queueRedirect:function(challengeName)
        {
            this.set({'redirectQueue':challengeName},{'silent':true});
        },
        
        getRedirect:function()
        {
            // anything to redirect to?
            var q = this.get('redirectQueue');
            // empty the queue
            this.queueRedirect(false);
            // return it to view
            return q
        },
        
        paginate:function(key)
        {
            this.details[(sho.string.toMethodName('get-'+key+'-page'))]();
        }

    });
    