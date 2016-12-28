function powerchange(el, warn, text) {
    if (warn && warn.length && !confirm(warn))
        return false;

    var self = $(el),
            toggle = self.hasClass('iphone_switch_on') ? 'off' : 'on',
            text = text || self.text();

    self.removeClass('iphone_switch_on iphone_switch_off')
            .addClass('iphone_switch_' + toggle)
            .text(text);
    return true;
}
function protochange(){
    var all = $('.PROTO');
    all.hide().children('input').prop('disabled',true);
    all.filter('.'+$(this).val()).show().children('input').prop('disabled',false);
}

$(function() {
    $('#protochange').change(protochange).change();
    function loadStatus(){
        var self = $(this).html("<div class=\"load-status-placeholder\"></div>");

        $.post(window.location.href.replace(/(vpsid|vpsdo)=[^&]*&?/g,'').replace(/&$|&#/,''), {
            vpsdo: 'loadvmstatus',
            sid: self.data('sid'),
            vid: self.data('vid')
        }, function(data) {
            var r = $(parse_response(data));
            self.replaceWith(r);
            if(r.is('.vm-status-pending'))
                loadStatusWithDely(60000);
        })
    }
    
    function loadStatusWithDely(dely){
        var vms = $('.vm-status-pending');
        setTimeout(function(){
            vms.each(loadStatus)
        }, dely)
    }
    var v = $('.vm-status-pending[data-sid]');
    loadStatusWithDely(v.length ? 0 : 60000);
    
    
    if (typeof $.fn.tooltip == 'function')
        $('#content-cloud').on('mouseenter', '[data-toggle="tooltip"]', function() {
            $(this).tooltip().data('tooltip').show();
        });
})

