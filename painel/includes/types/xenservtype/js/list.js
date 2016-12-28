function powerchange(el) {
    if ($(el).hasClass('iphone_switch_container_on')) {
        if (confirm('Are you sure you want to Power OFF this VM?')) {
            loadStatus($(el).parent(), 'poweroff');
        }
    } else if ($(el).hasClass('iphone_switch_container_off')) {
        if (confirm('Are you sure you want to Power ON this VM?')) {
            loadStatus($(el).parent(), 'poweron');
        }

    }
    return false;
}

function loadStatus() {
    var self = $(this).html("<img src='includes/types/cloudstacktype/images/1032.gif' />");

    $.post(window.location.href, {
        vpsdo: 'loadvmstatus',
        sid: self.data('sid'),
        vid: self.data('vid')
    }, function(data) {
        var r = $(parse_response(data));
        self.replaceWith(r);
        if (r.is('.vm-status-pending'))
            loadStatusWithDely(60000);
    })
}

function loadStatusWithDely(dely) {
    var vms = $('.vm-status-pending');
    setTimeout(function() {
        vms.each(loadStatus)
    }, dely)
}
$(function() {


    var v = $('.vm-status-pending[data-sid]');
    //loadStatusWithDely(v.length ? 0 : 60000);

})