$.extend($.hbslider.effects,{
    kenburns: {
            build: function(slider,settings) {
                //use slider defaults
                $.hbslider.effects.slide.build(slider,settings);
                 slider.slides.css({
                    opacity: 1,
                    zIndex: 0,
                    display: 'none'
                }).eq(slider.current).show();

               
            },
            animate: function (direction,slider,settings) {
                slider.trigger('hb-effect-start');
                slider.slides.eq(slider.current).css({
                        zIndex: 4
                    });
                slider.slides.eq(slider.next).css({zIndex:5}).fadeIn( settings.effecttime, settings.defaulteasing, function(){
                    // reset previous slide
                     slider.slides.eq(slider.current).css({
                        zIndex: 4,
                        display:'none'
                    });
                    slider.trigger('hb-effect-stop',[direction]);
                });
            },
            settings: {}
        }
});