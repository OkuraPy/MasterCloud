$.extend($.hbslider.effects, {
    cover: {
        build: function(slider,settings) {
            //use slider defaults
            $.hbslider.effects.slide.build(slider,settings);
              
        },
        animate: function (direction,slider,settings) {
            slider.trigger('hb-effect-start');
            var nextleft=0, position=0;


                slider.slides.eq(slider.current).css({
                    zIndex: 0
                });

            switch(direction) {
                case 'next'://left
                    position = slider.width;
                    break;
                case 'prev':
                    position = -slider.width;
                    break;
            }
            slider.slides.eq(slider.next).css( {
                zIndex: 5,
                opacity: 1,
                left: position
            }).animate({
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
});
