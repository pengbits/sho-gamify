
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.challengedetails
    @file		        challenge/pagination.js
    @author				dpaul
    @modified			04.22.13
    @desc		        Model class for the Challenge Details component
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.challengegallery.models.challenge');

    /**
     * class sho.gamify.challengegallery.models.challenge.Pagination
     * mix-in for the challenge model class. Handles functionality related to pagination of rules, used in longer multi-action challenges.
    **/
    
    sho.gamify.challengegallery.models.challenge.Pagination = {
        
        'rules_per_page' : 3,
        
        isPaginated:function()
        {
            return this.getNumRules() > this.rules_per_page
        },
        
        paginate:function(opts)
        {
            // the first time this is called we need to set some attrs without triggering events:
            if(!this.has('page'))           this.attributes.page = 0;
            if(!this.has('pages'))          this.attributes.pages = Math.ceil(this.getNumRules() / this.rules_per_page);
            if(!this.has('hasPrevPage'))    this.attributes.hasPrevPage = false;
            if(!this.has('hasNextPage'))    this.attributes.hasNextPage = true;
            
            var from =      this.get('page') * this.rules_per_page, 
                to=         this.rules_per_page, 
                paginated=  _.clone(this.get('rules')).splice(from,to)
            ;
            this.attributes.rulesPaginated = paginated;
            
            //log('|model| paginate()');
            //log('|model| _.clone(this.get(\'rules\')).splice('+from+','+to+')');
            //log('|model| before: '+ this.trace(this.get('rules')));
            //log('|model| after:  '+ this.trace(this.get('rulesPaginated')));
                 
            (opts || {})['silent'] || this.trigger('paginate', this.attributes);
        },
        
        incrementOrDecrementCurrentPage:function(plusminus)
        {
            var page =          this.get('page') + (plusminus == '-' ? -1 : 1), 
                total =         this.get('pages'),
                hasPrevPage, hasNextPage
            ;
            // we have implemented support for 'endless' next/prev here, but given the way that
            // the controls are hidden when not needed, this will most likely never be seen
            if(page < 0)        page = total-1;
            if(page == total)   page = 0;
            
            // set flags for the availability of next/prev pages, so
            // we know how to hide the controls in the view
            hasNextPage =       page < total-1;
            hasPrevPage =       page > 0;
            
            // update the model
            this.set({
                'page' : page,
                'hasPrevPage' : hasPrevPage,
                'hasNextPage' : hasNextPage
            });
            
            // intentionally not passing {'silent':true} here..
            this.paginate();
        },
        
        getNextPage:function()
        {
            this.incrementOrDecrementCurrentPage('+');
        },
        
        getPrevPage:function()
        {    
            this.incrementOrDecrementCurrentPage('-');
        },
        
        getNumRules:function()
        {
            return this.getRules().length
        },
        
        trace:function(rules)
        {
            return (_.pluck(rules, 'url').join(', ').gsub(/http:\/\/www\.sho\.com/,''));    
        }
        
    };

