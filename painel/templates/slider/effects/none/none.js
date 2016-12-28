$.extend($.hbslider.effects, {
    none: {
        build: function(slider,settings) {
            $.hbslider.effects.slide.build(slider,settings);

        },
        animate: function (direction,slider,settings) {
            slider.trigger('hb-effect-start');
            slider.slides.eq(slider.current).css({
                zIndex: 0,
                opacity: 0
            });
            slider.slides.eq(slider.next).css({
                opacity: 1,
                zIndex: 3
            });

            slider.trigger('hb-effect-stop',[direction]);
        },
        settings: {}
    }
});