/************************************************************************
*************************************************************************
@Name :       	jRating - jQuery Plugin
@Revison :    	2.2
@Date : 		26/01/2011
@Author:     	 ALPIXEL - (www.myjqueryplugins.com - www.alpixel.fr) 
@License :		 Open Source - MIT License : http://www.opensource.org/licenses/mit-license.php
 
**************************************************************************
*************************************************************************/
(function(a){a.fn.jRating=function(b){var c={phpPath:"?cmd=tickets&action=rate",step:true,type:"custom",length:5,rateMax:10,showRateInfo:false,starHeight:20,starWidth:18,length:5,decimalLength:0,rateInfosX:-45,rateInfosY:5,onSuccess:function(a){parse_response(a)},onError:null,onClick:null};if(this.length>0)return this.each(function(){function p(a){var b=parseFloat(a*100/l*d.rateMax/100);switch(d.decimalLength){case 1:var c=Math.round(b*10)/10;break;case 2:var c=Math.round(b*100)/100;break;case 3:var c=Math.round(b*1e3)/1e3;break;default:var c=Math.round(b*1)/1}return c}function q(){switch(d.type){case"small":f=12;g=10;break;case"custom":f=d.starWidth;g=d.starHeight;break;default:f=23;g=20}}function r(a){if(!a)return 0;return a.offsetLeft+r(a.offsetParent)}var d=a.extend(c,b),e=0,f=0,g=0,h="";if(a(this).hasClass("jDisabled")||d.isDisabled)var i=true;else var i=false;q();a(this).height(g);var j=parseFloat(a(this).attr("id").split("_")[0]),k=a(this).attr("id").split("_").splice(1),l=f*d.length,m=j/d.rateMax*l,n=a("<div>",{"class":"jRatingColor",css:{width:m}}).appendTo(a(this)),j=a("<div>",{"class":"jRatingAverage",css:{width:0,top:-g}}).appendTo(a(this)),o=a("<div>",{"class":"jStar",css:{width:l,height:g,top:-(g*2)}}).appendTo(a(this));a(this).css({width:l,overflow:"hidden",zIndex:1,position:"relative"});if(!i)a(this).bind({mouseenter:function(b){var c=r(this);var e=b.pageX-c;if(d.showRateInfo)var f=a("<p>",{"class":"jRatingInfos",html:p(e)+' <span class="maxRate">/ '+d.rateMax+"</span>",css:{top:b.pageY+d.rateInfosY,left:b.pageX+d.rateInfosX}}).appendTo("body").show()},mouseover:function(b){a(this).css("cursor","pointer")},mouseout:function(){a(this).css("cursor","default");j.width(0)},mousemove:function(b){var c=r(this);var g=b.pageX-c;var h=f*(d.length/d.rateMax);if(d.step)e=Math.floor(g/h)*h+h+1;else e=g;j.width(e);if(d.showRateInfo)a("p.jRatingInfos").css({left:b.pageX+d.rateInfosX}).html(p(e)+' <span class="maxRate">/ '+d.rateMax+"</span>")},mouseleave:function(){a("p.jRatingInfos").remove()},click:function(b){a(this).css("cursor","default").addClass("jDisabled").unbind("click mouseleave mousemove mouseout mouseover mouseenter");if(d.showRateInfo)a("p.jRatingInfos").fadeOut("fast",function(){a(this).remove()});b.preventDefault();var c=p(e);j.width(0);n.width(e);if(d.onClick)d.onClick(this);var f={type:"POST",url:d.phpPath,data:{data:k,rate:c}};if(d.onSuccess)f.success=d.onSuccess;if(d.onError)f.error=d.onError;a.ajax(f)}});})}})(jQuery)