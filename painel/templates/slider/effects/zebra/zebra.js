$.extend($.hbslider.effects, {
    zebra: {
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
                opacity: 1,
                zIndex:0
            });

            var offset = slider.width / settings.bars;
            var length = 1;
            var css = slider.slides.eq(slider.next).attr('style');
            //build slices containers
            var slices = [];

            while (length <= settings.bars) {
                var k = (length * offset) - offset;
                slider.append('<div class="'+ slice_content + " "+ slice_content + "_" + length + '" style="position: absolute; overflow: hidden;' + css + '"></div>');
                slider.children('.' + slice_content + "_" + length).css({
                    left: k,
                    opacity: 0,
                    height: slider.height,
                    width: offset,
                    'z-index': 3,
                    'background-position': '-' + k + 'px top'
                });
                slices[length-1]=length;
                length++
            }

            if(settings.random) {
                $.shuffle(slices);
            }
            console.log(slices);
             length = 1;
             var html = slider.slides.eq(slider.next).children().length?slider.slides.eq(slider.next).html():slider.slides.eq(slider.next).outerHTML();
            while (length <= settings.bars) {
                var l = (length * offset) - offset;
                var delay = (length * settings.effecttime);
                slider.children('.' + slice_content + "_" + length).append('<div style="position: absolute; left: -' + l + 'px; width: ' + slider.width + 'px; height: ' + slider.height + 'px;">' + html + '</div>');
                slider.children('.' + slice_content + "_" + slices[length-1]).delay(delay).animate({
                    opacity: 1
                }, {
                    duration: 500,
                    easing: settings.defaulteasing
                });
                length++
            }
            var p = (settings.bars * settings.effecttime);
            slider.slides.eq(slider.next).delay(p).animate({
                opacity: 0
            }, settings.effecttime, function () {
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
            bars: 20,  //how many bars should our zebra have?
            effecttime: 50,  //how long should one slice dissapear for
            random: false // should zebra stripes be randomized?
        }
    }
});
