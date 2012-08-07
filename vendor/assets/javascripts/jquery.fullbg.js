/**
 * jQuery.fullBg
 * Version 1.0
 * Copyright (c) 2010 c.bavota - http://bavotasan.com
 * Dual licensed under MIT and GPL.
 * Date: 02/23/2010
**/
(function($) {
  $.fn.fullBg = function(container){
    var bgImg = $(this);		
		container = container || $(document)
 
    function resizeImg() {
      var imgwidth = bgImg.width();
      var imgheight = bgImg.height();
 
      var winwidth = container.width();
      var winheight = container.height();

      var widthratio = winwidth / imgwidth;
      var heightratio = winheight / imgheight;
 
      var widthdiff = heightratio * imgwidth;
      var heightdiff = widthratio * imgheight;
 
      if(heightdiff>winheight) {
        bgImg.css({
					// top: winheight/2-imgheight/2,
          width: winwidth+'px',
          height: heightdiff+'px'
        });
      } else {
        bgImg.css({
					// left: imgwidth/2 + windthdiff/2,
					width: widthdiff+'px',
          height: winheight+'px'
        });		
      }
    } 
    resizeImg();
		$(window).load(function(){
			resizeImg();
		})
    $(window).resize(function() {
      resizeImg();
    }); 
  };
})(jQuery)