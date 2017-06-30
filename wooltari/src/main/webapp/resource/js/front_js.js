/*
 * jQuery Superfish Menu Plugin - v1.7.5
 * Copyright (c) 2014 Joel Birch
 *
 * Dual licensed under the MIT and GPL licenses:
 *	http://www.opensource.org/licenses/mit-license.php
 *	http://www.gnu.org/licenses/gpl.html
 */



/**
 * hoverIntent is similar to jQuery's built-in "hover" method except that
 * instead of firing the handlerIn function immediately, hoverIntent checks
 * to see if the user's mouse has slowed down (beneath the sensitivity
 * threshold) before firing the event. The handlerOut function is only
 * called after a matching handlerIn.
 *
 * hoverIntent r7 // 2013.03.11 // jQuery 1.9.1+
 * http://cherne.net/brian/resources/jquery.hoverIntent.html
 *
 * You may use hoverIntent under the terms of the MIT license. Basically that
 * means you are free to use hoverIntent as long as this header is left intact.
 * Copyright 2007, 2013 Brian Cherne
 *
 * // basic usage ... just like .hover()
 * .hoverIntent( handlerIn, handlerOut )
 * .hoverIntent( handlerInOut )
 *
 * // basic usage ... with event delegation!
 * .hoverIntent( handlerIn, handlerOut, selector )
 * .hoverIntent( handlerInOut, selector )
 *
 * // using a basic configuration object
 * .hoverIntent( config )
 *
 * @param  handlerIn   function OR configuration object
 * @param  handlerOut  function OR selector for delegation OR undefined
 * @param  selector    selector OR undefined
 * @author Brian Cherne <brian(at)cherne(dot)net>
 **/
	

var jsCreate = {	
	tabToggle : function(tabContainer){
		var tabclick = $(tabContainer).find(".tabclick");
		tabclick.click(function(){
			var curObj = this;
			var $this = $(this);
			tabclick.each(function(){
				if(this==curObj){
					if(this.href.split("#").length>1) 
					$("#"+this.href.split("#")[1]).show();
					tabclick.removeClass("current");
					$this.addClass("current");					
				}else{
					if(this.href.split("#").length>1) 
					$("#"+this.href.split("#")[1]).css({'display':'none'}) ;
				}
			});return false;
		})
	},

	layerPop : function(click, layer){
		var click = click;
		var layer = layer;
		 $(click).click(function(){
			$(layer).css({'display' : 'block'});
		});
		$('.btn_layerPopClose').click(function(){
			$(layer).css({'display' : 'none'});
		})
	}
}
