$.extend($.hbslider.styles, {
    bordered: {  
        build: function(slider,settings) {
            $.hbslider.styles.basic.build(slider,settings);

            slider.container.removeClass('hbs-style-basic');
            slider.container.addClass('hbs-style-bordered');
            slider.container.append($('<div>').addClass('bordered-frame'));
        },
        settings: {
        }
    }
});
