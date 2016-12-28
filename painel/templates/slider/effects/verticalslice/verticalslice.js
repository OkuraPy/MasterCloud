$.extend($.hbslider.effects, {
    verticalslice: {
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
            var offset = slider.width / settings.bars;
            var targettop = slider.height;
            var length = 1;
            var css = slider.slides.eq(slider.next).attr('style');
            //build slices containers
            while (length <= settings.bars) {
                var k = (length * offset) - offset;
                slider.append('<div class="'+ slice_content + " "+ slice_content + "_" + length + '" style="position: absolute; overflow: hidden;' + css + '"></div>');
                slider.children('.' + slice_content + "_" + length).css({
                    left: k,
                    height: slider.height,
                    width: offset,
                    top: targettop,
                    'z-index': 3,
                    'background-position': '-' + k + 'px top'
                });
                length++
            }
            length = 1;
            var m = settings.bars;
            offset = slider.width / settings.bars;
            var html = slider.slides.eq(slider.next).children().length?slider.slides.eq(slider.next).html():slider.slides.eq(slider.next).outerHTML();
            //fill slices with original html
            while (length <= settings.bars) {
                var n = (length * offset) - offset;
                var o = (length * settings.effecttime);
                slider.children('.' + slice_content + "_" + length).append('<div style="position: absolute; left: -' + n + 'px; width: ' + slider.width + 'px; height: ' + slider.height + 'px;">' + html + '</div>');
                slider.children('.' + slice_content + "_" + m).delay(o).animate({
                    top: 0
                }, {
                    duration: 500,
                    easing: settings.defaulteasing
                });
                length++;
                m--
            }
            var p = (settings.bars * settings.effecttime);
            slider.slides.eq(slider.next).delay(p).animate({
                opacity: 0
            }, slider.duration, function () {
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
            bars: 10,
            effecttime: 100
        }
    }
});
