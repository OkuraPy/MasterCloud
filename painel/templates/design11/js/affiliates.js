setTimeout(function() {
    var s = $('#slider');
    var sval = $('#sfield');
    var svalind = $('#slider_value_indicator');
    var margin = $('#slider_margin_indicator');
    if (typeof($('#slider').slider) != 'function') {
        s.hide();
        sval.show();
        svalind.hide();
        return false;
    }

    var width = s.parent().width() - s.prevAll('span').width() - s.prevAll('div').width() - s.nextAll('span').width() - s.nextAll('div').width() - 90
    s.width(width).slider({
        min: minval, max: maxval, value: sval.val() || initialval, step: stepval, range: "min", animate: true, stop: function(e, ui) {
            var x = Math.floor(s.slider("value"));
            sval.val(x + 1).trigger('change');
            svalind.html(fx.p + (x + 1) + fx.s);
            margin.html(fx.p + ((maxval - x) + 1) + fx.s);
        }
    });
}, 200);


function check_i(element) {
    var td = $(element).parent();
    if ($(element).is(':checked'))
        $(td).find('input.config_val').removeAttr('disabled');
    else
        $(td).find('input.config_val').attr('disabled', 'disabled');
}
$('#dpick').datepicker();