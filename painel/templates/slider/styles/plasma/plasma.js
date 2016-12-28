$.extend($.hbslider.styles, {
    plasma: {
        build: function(slider,settings) {
            $.hbslider.styles.basic.build(slider,settings);

            slider.container.removeClass('hbs-style-basic');
            slider.container.addClass('hbs-style-plasma');

            var shadowbox = $('<div>',{
                id: 'hbs-shadow-container'
            }).append($('<div class="hbs-shadow-left"></div>')).append($('<div class="hbs-shadow-middle"></div>')).append($('<div class="hbs-shadow-right"></div>'));
            
            slider.container.prepend(shadowbox);

            var w = slider.width;
            w= w- $('.hbs-shadow-left',slider.container).width();
            w= w- $('.hbs-shadow-right',slider.container).width();
            $('.hbs-shadow-middle',slider.container).css({width:w});

            $('.hbs-slider-prev').html('&laquo;');
            $('.hbs-slider-next').html('&raquo;');
            
            slider.css('width',slider.width-8);
            slider.css('height',slider.height-8);

            slider.container.hover(function() {
                        $('.hbs-slider-prev').not('.disabled').show();
                        $('.hbs-slider-next').not('.disabled').show();
                    }, function() {
                        $('.hbs-slider-prev').hide();
                        $('.hbs-slider-next').hide();
                    });
        },
        settings: {
        }
    }
});
