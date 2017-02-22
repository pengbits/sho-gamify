
    /*
    JS
    --------------------------------------------------------------------------------------------  
    @site   			sho.com <common>
    @package            gamify.challengegallery.views
    @file		        colors.js
    @author				dpaul
    @modified		    04.09.13
    @desc		        Helper for managing accent colors
    -------------------------------------------------------------------------------------------- */  

    sho.provide('sho.gamify.challengegallery');

    !(function(gamify,$)
    {
        /**
         * sho.gamify.getAccentColor(format) -> mixed
         * returns the accent color defined in the css layer (ie as #gamify-accent-color{color:#FF0000})
         * in a format useable by the javascipt layer. accepts either 'rgb' (returns an array of rgb values)
         * or 'hex' (returns a string w/ the hex value). rgb format is returned by default
        **/
        function getAccentColor(format)
        {
            format = format || 'rgb';
            return format == 'rgb' ? getAccentColorRGB() : getAccentColorHex()
        }
        
        /**
         * sho.gamify.getAccentColorRGB() -> Array
         * Returns the accent color definined in the css layer as an array of RGB values. Internally, this method
         * appends an element to the dom with the id 'gamify-accent-color', and inspects the css property of the element.
        **/
        function getAccentColorRGB()
        {
            var k = 'accent_color_rgb', id = 'gamify-accent-color';
            
            if(gamify[k] == undefined)
            {   
                var str = sho.dom.body().append('<span id="'+id+'">&nbsp;</span>').find('#'+id).css('color'); // => "rgb(0, 0, 255)" 
                
                                                                // i miss my prototypejs regex!
                gamify[k] = _.collect(str.split('rgb(').join('').split(')').join('').split(' ').join('').split(','), function(segment){
                    return Number(segment)
                })
            }
            return gamify[k];
        }
        
        /**
         * sho.gamify.getAccentColorHex() -> String
         * Returns the accent color definined in the css layer as hex string  (#FF0000). Internally, this method
         * appends an element to the dom with the id 'gamify-accent-color', and inspects the css property of the element.
        **/
        function getAccentColorHex()
        {
            var k = 'accent_color_hex';
            if(gamify[k] == undefined) gamify[k] = sho.string.hexFromRGB(getAccentColorRGB());
        
            return gamify[k];
        }
        
        // expose helper functions as public
        gamify.getAccentColor = getAccentColor
   

    })(sho.gamify, sho.$);
