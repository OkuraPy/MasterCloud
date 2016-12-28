$.extend($.hbslider.effects, {
    verticalslide: {
        build: function(slider,settings) {
            //use slider defaults
            $.hbslider.effects.slide.build(slider,settings);
        },
        animate: function (direction,slider,settings) {
                slider.trigger('hb-effect-start');
                var nexttop=0, currenttop =0, position=0;

                switch(direction) {
                    case 'next'://left
                        currenttop =  slider.height;
                        position = -slider.height;
                        break;
                    case 'prev':
                        currenttop = -slider.height;
                        position = slider.height;
                        break;
                }
                slider.slides.eq(slider.next).css( {
                    zIndex: 5,
                    opacity: 1,
                    top: position
                });
                slider.slides.eq(slider.current).animate({
                    top: currenttop
                }, settings.effecttime, settings.defaulteasing);

                slider.slides.eq(slider.next).animate({
                    top: nexttop
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
});
