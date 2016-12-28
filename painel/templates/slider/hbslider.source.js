/**
 * jQuery HB Slider CORE
 * Built on latest jquery *1.8.1
 * requires jquery 1.4.2 +
 *
 * @author Kris Pajak @ hostbillapp.com
 * @copyright KP Software S.C. 2016
 * @see http://dev.hostbillapp.com/additional-resources/hostbill-slider-plugin-documentation/
 *
//  This software is furnished under a license and may be used and copied
//  only  in  accordance  with  the  terms  of such  license and with the
//  inclusion of the above copyright notice.  This software  or any other
//  copies thereof may not be provided or otherwise made available to any
//  other person.  No title to and  ownership of the  software is  hereby
//  transferred.
//
//  You may not reverse  engineer, decompile, defeat  license  encryption
//  mechanisms, or  disassemble this software product or software product
//  license.  HostBill  may terminate this license if you don't comply with any
//  of the terms and conditions set forth in our end user  license agreement
//  (EULA).  In such event,  licensee  agrees to return licensor  or destroy
//  all copies of software  upon termination of the  license.
*
*/

(function($) {

    //initi object
    $.hbslider = function(el, options) {
        var opt = options==undefined?{}:options;
        var settings = $.extend({}, $.hbslider.defaults);


        var effect = $.hbslider.effects[opt.effect==undefined?settings.effect:opt.effect],
        style = $.hbslider.styles[opt.style==undefined?settings.style:opt.style],
        slider = $(el);
        style = style ? style:$.hbslider.styles.basic;
        effect = effect ? effect:$.hbslider.effects.slide;

        if(effect.settings!==undefined) {
            $.extend(settings, effect.settings);
        }
        if(style.settings!==undefined) {
            $.extend(settings, style.settings);
        }
        $.extend(settings, opt);

        slider.ready = false;




        //internal "guts"
        hbs = {
            build: function() { //lets build everything before start
                if(!slider.ready) {

                    slider.wrap('<div class="hbs-container">');
                    slider.container = slider.parent(".hbs-container");
                    slider.addClass('hbs-slider');

                    if(settings.slidesselector!='') {
                        slider.slides = slider.children(settings.slidesselector);
                    } else {
                        slider.slides= slider.children();
                    }
                    slider.slides.css({
                        position:"absolute",
                        display:'block',
                        opacity: 0,
                        top: 0,
                        left: 0
                    });
                }
                if(!slider.ready && slider.slides.find('img').length) {
                    slider.slides.find('img').eq(0).one('load', function() {
                        slider.ready = true;
                        hbs.build();
                    }).each(function() {
                        if(this.complete) $(this).load();
                    });
                    return;
                } else {
                    slider.ready = true;
                }

                slider.current = 0;
                slider.next = 1;

                hbs.setcss();

                slider.playing=false;
                slider.paused=false;
                slider.animationinterval = false;
                slider.animating = false;


                if(settings.scaleimages) {
                    hbs.scaleimages();
                }

                slider.slides.css({
                    width: '100%',
                    height:  '100%'
                });
                //build style
                style.build(slider,settings);


                hbs.buildcaptions(); //build captions, show/hide them if neccessary

                //build effect
                effect.build(slider,settings);
                hbs.coreevents();  //core events should happen first!


                //build elements, those can be later destroyed/altered by style/effect
                if(settings.showpagination) {
                    hbs.pagination.build();
                }
                if(settings.showdirection) {
                    hbs.prevnext.build();
                }


                //call calbacks!
                settings.startSlide(slider);
                if(slider.slides.size()<2) {
                    settings.lastSlide(slider);
                    return;
                }


                hbs.keyboardevents();
                hbs.mouseevents();




                if(settings.autoplay) {
                    (settings.startdelay > 0) ? setTimeout(slider.play, settings.startdelay) : slider.play();
                }
            },
            setcss: function() {
                slider.width  = settings.width ? settings.width : slider.slides.outerWidth();
                slider.height  = settings.height ? settings.height :  slider.slides.outerHeight();
                if(slider.slides.find('img').length<1 && !settings.width) {
                    //autoscale
                    var p = slider.container.parent().width();
                    if(p>slider.width) {
                        slider.width=p;
                    }
                    var h = slider.width / 2.35;  //1.7 = 16x9
                    if(h> slider.height) {
                        slider.height = parseInt(h);
                    }
                }
                slider.container.css({
                    width: slider.width,
                    height: slider.height
                });

                var copystyles = 'top,right,bottom,left'.split(',');
                $.each(copystyles, function(i, attr){
                    var copy = $.trim(attr);
                    slider.container.css(copy, slider.css(copy));
                    slider.css(copy, ' ');
                });
                slider.css({
                    width: '100%',
                    height: '100%'
                });
                slider.container.css('position','relative');
                slider.slides.eq(0).css({
                    opacity: 1
                });
            },
            scaleimages: function() {
                slider.slides.find('img:eq(0)').each(function(){
                    $(this).css({
                        width: slider.width,
                        height: slider.height
                    });
                });
            },
            captioneffects: function(action,callback) {
                var currentcaption = $('.'+settings.captionselector,slider.slides.eq(slider.current));
                if(currentcaption.length<1) {
                    if(typeof(callback)=='function') {
                        callback();
                    }
                    return;
                }
                if(action=='show') {
                    switch(settings.captioneffect) {
                        case 'slide':
                            currentcaption.slideDown('slow');
                            break;
                        case 'fade':
                            currentcaption.fadeIn('slow');
                            break;
                    }
                } else {
                    switch(settings.captioneffect) {
                        case 'slide':
                            currentcaption.slideUp('fast',callback);
                            break;
                        case 'fade':
                            currentcaption.fadeOut('fast',callback);
                            break;
                    }
                }
            },
            buildcaptions: function() {
                if(settings.captioneffect!='none' && settings.showcaption) {
                    slider.bind('hb-effect-stop-internal',function(){
                        hbs.captioneffects('show');
                    });
                }
                if($('.'+settings.captionselector,slider).length) {
                    $('.'+settings.captionselector,slider).addClass(settings.captionstyle).show();
                    slider.slides.addClass('hbs-slide');
                    if(!settings.showcaption || settings.captioneffect!='none') {
                        $('.'+settings.captionselector,slider).hide().eq(0).show();
                    }
                    return;
                }
                var rebuild= false;
                slider.slides.each(function(){
                    var alt="";
                    var el = $(this);
                    var caption ="";
                    if(el.children().length && el.find('img').length) {
                        //we have a wrapper
                        alt = el.find('img').attr('alt');
                    } else {
                        if(el.attr('alt')) {
                            rebuild = true;
                            alt = $(this).attr('alt');
                            el.wrap('<div>');
                            el = el.parent();
                        }
                    }
                    if(alt) {
                        //build caption
                        caption = $('<div class="'+settings.captionselector+'"></div>').html(alt);
                        el.append(caption);
                    }
                });
                $('.'+settings.captionselector,slider).show();
                if(settings.captioneffect!='none') {
                    $('.'+settings.captionselector,slider).hide().eq(0).show();
                }
                if(rebuild) {
                    if(settings.slidesselector!='') {
                        slider.slides = slider.children(settings.slidesselector);
                    } else {
                        slider.slides= slider.children();
                    }
                }
                $('.'+settings.captionselector,slider).addClass(settings.captionstyle);
                slider.slides.addClass('hbs-slide');

            },
            coreevents: function() {
                //bind core events handler
                slider.bind('hb-effect-start',function(){
                    settings.beforeSlide(slider);
                });
                slider.bind('hb-effect-stop',function(event,direction){
                    slider.animating=false;
                    slider.current = slider.next;
                    slider.next = slider.current + 1;
                    if(slider.next >= slider.slides.length ) {
                        settings.lastSlide(slider);
                        slider.next = 0;
                    }
                    if(slider.current == 0 ) {
                        slider.next=1;
                    }
                    slider.trigger('hb-effect-stop-internal',[direction]);
                    slider.play();
                    settings.afterSlide(slider);
                });


            },
            pagination: {  //0,1,2,3... etc container, items etc
                build: function() {
                    if(!settings.showpagination) {
                        return false;

                    }
                    if(!$('.'+settings.paginationcontainer,slider.container).length) { //container missing, style did not added it?
                        var pagination = $('<ul>').addClass(settings.paginationcontainer);
                        slider.container.append(pagination);
                    }
                    if(slider.slides.size()<2) {
                        $('.'+settings.paginationcontainer,slider.container).hide();
                        return;
                    }
                    if (!$('.'+settings.paginationcontainer,slider.container).children().length) {
                        slider.slides.each(function(i){
                            var element = $(settings.paginationelement);
                            element.text(i+1);
                            $('.'+settings.paginationcontainer,slider.container).append(element);
                        });
                        $('.'+settings.paginationcontainer,slider.container).children().eq(slider.current).addClass('active');
                    }

                    hbs.pagination.bind();
                },
                bind: function() {
                    //bind to slider events, ie after slider change change active element
                    $('.'+settings.paginationcontainer,slider.container).children().each(function(n){
                        $(this).click(function(){
                            if(slider.current==n) {
                                return false;
                            }
                            $('.'+settings.paginationcontainer,slider.container).children().removeClass('active');
                            $(this).addClass('active');
                            slider.next=n;
                            var direction="next";
                            if(slider.current > slider.next) {
                                direction="prev";
                            }
                            slider.calleffects(direction,true);
                            return false;
                        });
                    });

                    slider.bind('hb-effect-stop-internal',function(){
                        $('.'+settings.paginationcontainer,slider.container).children().removeClass('active').eq(slider.current).addClass('active');
                    });
                }
            },
            prevnext: {
                build: function() {
                    if(!settings.showdirection) {
                        return;
                    }

                    if(!$('.'+settings.prevselector,slider.container).length) { //container missing, style did not added it?
                        var next = $('<div>').addClass(settings.nextselector).html("&rsaquo;");
                        var prev = $('<div>').addClass(settings.prevselector).html("&lsaquo;");
                        slider.container.append(next);
                        slider.container.append(prev);
                    }
                    if(slider.slides.size()<2) {
                        $('.'+settings.prevselector,slider.container).hide();
                        $('.'+settings.nextselector,slider.container).hide();
                        return;
                    }
                    if(!settings.loop) {
                        //hide first element
                        $('.'+settings.prevselector,slider.container).addClass('disabled');
                    }
                    hbs.prevnext.bind();
                },
                bind: function() {
                    var prev = $('.'+settings.prevselector,slider.container);
                    var next = $('.'+settings.nextselector,slider.container);

                    prev.click(function(e){
                        e.preventDefault();
                        if(!$(this).hasClass('disabled')) {
                            slider.next = slider.current -1;
                            if(slider.next < 0 ){
                                slider.next = slider.slides.length-1;
                            }
                            slider.calleffects("prev");

                        }
                    }).hover(function() {
                        slider.pause();
                    }, function() {
                        slider.play();
                    });
                    next.click(function(e){
                        e.preventDefault();
                        if(!$(this).hasClass('disabled'))
                            slider.calleffects("next");
                    }).hover(function() {
                        slider.pause();
                    }, function() {
                        slider.play();
                    });
                    if(!settings.loop) {
                        slider.bind('hb-effect-stop-internal',function(event,direction){
                            prev.removeClass('disabled');
                            next.removeClass('disabled');
                            if(slider.current==0) {
                                prev.addClass('disabled');
                            } else if(slider.current == slider.slides.length -1) {
                                next.addClass('disabled');
                            }
                        });
                    }

                }
            },
            keyboardevents: function() {  //bind keyboard prev & next
                if(settings.keyboard) {
                    $(document).bind('keyup', function(event) {
                        if(event.keyCode===39) {
                            event.preventDefault();
                            slider.calleffects("next");
                        } else if (event.keyCode===37) {
                            event.preventDefault();
                            slider.next = slider.current -1;
                            if(slider.next < 0 ){
                                slider.next = slider.slides.length-1;
                            }
                            slider.calleffects("prev");
                        }
                    });
                }
            },
            mouseevents: function() {
                if(settings.pauseonhover && settings.mousescroll) {
                    settings.pauseonhover=false;
                }
                if(settings.pauseonhover) {
                    slider.hover(function() {
                        slider.pause();
                    }, function() {
                        slider.play();
                    });
                }
                if(settings.mousescroll) {
                    slider.bind('mousewheel', function(event, delta) {
                        event.preventDefault();
                        slider.calleffects((delta < 0) ? "next" : "prev");
                    });
                }

            }
        }

        //public methods:
        slider.play = function() {
            slider.playing=true;
            slider.paused=false;
            clearInterval(slider.animationinterval);
            slider.animationinterval = setInterval(slider.animate, settings.slidedisplaytime);
        }


        slider.pause = function() {
            slider.paused=true;
            clearInterval(slider.animationinterval);
        }

        //called by interval, animation function
        slider.animate = function() {
            if(!slider.animating) {
                slider.calleffects('next');
            }
        };


        slider.calleffects = function (direction,force) {
            if(!slider.animating) {
                if(!settings.loop && force==undefined) {
                    if(direction=='next' && slider.slides.length == slider.current) {
                        return;
                    }
                }
                slider.animating = true;
                slider.pause();
                if(settings.captioneffect!='none' && settings.showcaption) {
                    hbs.captioneffects('hide', function(){
                        effect.animate(direction,slider,settings);
                    });
                } else {
                    effect.animate(direction,slider,settings);
                }
            }
        }




        //bind API methods:
        this.play = function() {
            slider.play()
        };
        this.pause = function() {
            slider.pause()
        };
        this.nextslide = function() {
            slider.calleffects('next')
        };
        this.prevslide = function() {
            slider.calleffects('prev')
        };

        this.set = function(n) {
            if(slider.current==n || slider.slides.length-1<n) {
                return false;
            }
            $('.'+settings.paginationcontainer,slider.container).children().removeClass('active');
            $(this).addClass('active');
            slider.next=n;
            var direction="next";
            if(slider.current > slider.next) {
                direction="prev";
            }
            slider.calleffects(direction,true);
            return false;
            slider.calleffects('prev')
        };

        //lets rock!
        hbs.build();
    };

    //Default, core options. Those options are overriten during initialization & with applied style.settings
    $.hbslider.defaults = {
        autoplay: true,  //should we start immediatelly ?
        loop: true,     //should animation loop till infinity ?
        debug: false,   //enable debug?

        width: false, //force slider width to this value
        height: false, //force slider height ot this value

        scaleimages: false, //whether to change image width/height to fit into slider

        responsive: true,  //should slider respond to widow resize as well as parent element width/height

        //show/hide options
        showdirection: true,   //direction prev/next buttons
        showpagination: true,  //pagination control
        showcaption: true,     //show caption text

        //TIMING options
        slidedisplaytime: 3000, //how long slide should be displayed
        startdelay: 100, //how many ms to wait before starting animation

        //CONTROL options
        pauseonhover: true,  //should animation be paused once mouse hovers it
        mousescroll: false,  //should mouse scroll allow switching slides
        keyboard: false,  //should keyboard arrows control slides


        //DOM elements
        slidesselector: '',
        captionselector: 'hbs-caption',
        captionstyle: 'bottom',
        paginationcontainer: 'hbs-slider-paginate', //css class
        paginationelement: '<li>',

        prevselector: 'hbs-slider-prev',  //css class
        nextselector: 'hbs-slider-next',  //css class


        //effect control
        effect: 'slide',     //effect between slides, can be a function to call for special effects!
        defaulteasing: 'linear',
        effecttime: 300, //how long effect transition should last (ie. effect speed)

        //caption effects:
        captioneffect: 'none', //should captions have their own show/hide effect

        //style control
        style: 'basic',

        // Callbacks
        startSlide: function(){},            //Callback: function(slider) - Slider has been built, and ready to start!
        beforeSlide: function(){},           //Callback: function(slider) - Fires asynchronously with each slider animation
        afterSlide: function(){},            //Callback: function(slider) - Fires after each slider animation completes
        lastSlide: function(){}            //Callback: function(slider) - Fires when the slider reaches the last slide (asynchronous)
    }


    //effects object, extend it with your custom effects
    $.hbslider.effects={
        slide: {
            build: function(slider,settings) {
                //prepare slider, create custom elements, set css etc. This is called once when slider is being built

                slider.css({
                    top: 'auto',
                    left: 'auto',
                    position: 'relative',
                    overflow: 'hidden'
                });

                slider.slides.css({
                    margin: 0,
                    width: '100%',
                    height:  '100%',
                    position: 'absolute',
                    zIndex: 0,
                    opacity: 0,
                    overflow: 'hidden'
                });
                slider.slides.eq(slider.current).css({
                    opacity: 1
                });
            },
            animate: function (direction,slider,settings) {
                slider.trigger('hb-effect-start');
                var nextleft=0, currentleft =0, position=0;

                switch(direction) {
                    case 'next'://left
                        currentleft = - slider.width;
                        position = slider.width;
                        break;
                    case 'prev':
                        currentleft = slider.width;
                        position = -slider.width;
                        break;
                }
                slider.slides.eq(slider.next).css( {
                    zIndex: 5,
                    opacity: 1,
                    left: position
                });
                slider.slides.eq(slider.current).animate({
                    left: currentleft
                }, settings.effecttime, settings.defaulteasing);

                slider.slides.eq(slider.next).animate({
                    left: nextleft
                }, settings.effecttime, settings.defaulteasing, function(){
                    // reset previous slide
                    slider.slides.eq(slider.current).css({
                        opacity: 0,
                        zIndex: 0
                    });

                    slider.trigger('hb-effect-stop',[direction]);
                });


            },
            settings: {}
        }
    }

    //styles object. Each style can come with its own configuration, ovverriding default (basic) one
    $.hbslider.styles={
        basic: {
            build: function(slider,settings) {
                if(settings.showpagination) {
                    var pagination = $('<ul>').addClass(settings.paginationcontainer);
                    slider.container.append(pagination);
                }
                if(settings.showdirection) {
                    var next = $('<div>').addClass(settings.nextselector).html("&rsaquo;");
                    var prev = $('<div>').addClass(settings.prevselector).html("&lsaquo;");
                    slider.container.append(next);
                    slider.container.append(prev);

                }
                slider.container.addClass('hbs-style-basic');

            },
            settings: {

        }
        }
    }
    $.fn.shuffle = function () {
        return this.each(function () {
            var a = $(this).children();
            return (a.length) ? $(this).html($.shuffle(a)) : this
        })
    };
    $.shuffle = function (a) {
        for (var j, x, i = a.length; i; j = parseInt(Math.random() * i, 10), x = a[--i], a[i] = a[j], a[j] = x) {}
        return a
    };
    $.fn.outerHTML = function(s) {
        return s
        ? this.before(s).remove()
        : jQuery("<p>").append(this.eq(0).clone()).html();
    };


    //jQuery plugin definition
    $.fn.hbslider = function(options) {
        //loop trough all matched elements (if more than one slider used)
        return this.each(function(){
            var el = $(this);
            //check if slider has already been applied?
            if (el.data('hbslider')) {
                return el.data('hbslider');
            }
            var slider =  new $.hbslider(el, options);
            //bind slider data to DOM object
            el.data('hbslider',slider);
        });
    };

})(jQuery);