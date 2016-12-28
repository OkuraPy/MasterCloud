$.extend($.hbslider.effects, {
    pixelate: {
        build: function(slider,settings) {
            //use slider defaults
            slider.css({
                top: 'auto',
                left: 'auto',
                position: 'relative',
                overflow: 'hidden'
            });

            slider.slides.css({
                margin: 0,
                position: 'absolute',
                top: 0,
                left: 0,
                zIndex: 0,
                opacity: 0,
                overflow: 'hidden'
            });
            //first slide should be visible, and on top
            slider.slides.eq(slider.current).css({
                opacity: 1,
                zIndex:3
            });

        },
        animate: function (direction,slider,settings) {
            slider.trigger('hb-effect-start');

            var slice_content = 'slice_content';

            slider.slides.eq(slider.next).css({
                opacity: 1
            });
            
            var width = slider.width / settings.columns;
            var height = slider.height / settings.rows;
            var row = 1;
            var column = 1;
            var pixels = [];
            var l = 0;
            var html = slider.slides.eq(slider.next).children().length?slider.slides.eq(slider.next).html():slider.slides.eq(slider.next).outerHTML();
            var css = slider.slides.eq(slider.next).attr('style');
            while (row <= settings.rows) {
                while (column <= settings.columns) {
                    pixels[l] = (l + 1);
                    l++;
                    var o = 'slice_block_id_' + ((settings.columns * row) - (settings.columns - column));
                    var r = ((row * height) - height);
                    var s = ((column * width) - width);
                    var t = (width * column) - width;
                    var u = (height * row) - height;
                    slider.append('<div class="' + o + ' '+slice_content+'" style="position: absolute; overflow: hidden;' + css + '"></div>')
                    slider.children('.' + o).css({
                        width: width,
                        height: height,
                        'z-index': 4,
                        top: r + 'px',
                        left: s + 'px',
                        opacity: 0,
                        'background-position': '-' + t + 'px -' + u + 'px'
                    }).append('<div style="position: absolute; left: -' + t + 'px; top: -' + u + 'px; width: ' + slider.width + 'px; height: ' + slider.height + 'px;">' +html + '</div>');
                    column++;
                }
                row++;
                column = 1
            }
            if(settings.random) {
                var v = $.shuffle(pixels);
            } else {
                var v = pixels;
            }
            row = 1;
            column = 1;
            var w = 0;
            var delay=0;
            while (row <= settings.rows) {
                var x = row;
                while (column <= settings.columns) {
                    var y = '.slice_block_id_' + (v[w]);
                    delay = (settings.delay * x);
                    $(y).delay(delay).animate({
                        opacity: 1
                    }, {
                        duration: settings.effecttime,
                        easing: settings.defaulteasing
                    });
                    column++;
                    x++;
                    w++
                }
                row++;
                column = 1
            }
            slider.slides.eq(slider.next).delay(delay + settings.effecttime).animate({
                opacity: 0
            }, 1, function () {
                slider.slides.eq(slider.next).css({
                    opacity: 1,
                    zIndex:3
                });
                slider.slides.eq(slider.current).animate({
                    opacity: 0,
                    zIndex:0
                }, 200, function () {
                    slider.children('.'+slice_content).remove();
                });
                slider.trigger('hb-effect-stop',[direction]);
            })
        },
        settings: {
            columns: 10,
            rows: 5,
            delay: 50,
            effecttime: 500,
            random:false
        }
    }
});
