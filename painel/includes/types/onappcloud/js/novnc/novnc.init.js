$(function() {
    var rfb,
        $status = $('#no_vnc_status'),
        $cad = $('#send_ctrl_alt_del_button'),
        $reConnect = $('#reconnect'),
        host = Console.Host,
        port = Console.Port,
        password = Console.Pass,
        path = 'vncproxy?key=' + Console.VMID,
        remotekey = Console.Key,
        $mainDiv = $('#no_vnc_status_bar');

    function updateState(rfb, state, oldstate, msg) {
        var level;

        switch (state) {
            case 'failed':
            case 'fatal':
                level = "error";
                break;
            case 'normal':
            case 'disconnected':
            case 'loaded':
                level = "notice";
                break;
            default:
                level = "notice-w";
                break;
        }

        $cad.attr('disabled', !(state === 'normal'));

        if (typeof (msg) !== 'undefined') {
            $status.attr("class", "no_vnc_status flash " + level).html(msg);
        }

        if (level === 'error') {
            $cad.closest('.submit').hide();
        }
        if (state === "normal") {
            $cad.closest(".submit").show();
        }
        if (state === "disconnected") {
           rfbReconnect();
        }
    }

    function sendCtrlAltDel() {
        rfb.sendCtrlAltDel();
        return false;
    }

    function rfbReconnect() {
        if (this.currentTimeoutId) {
            clearTimeout(this.currentTimeoutId)
        }
        return this.currentTimeoutId = setTimeout(function() {
            return rfbConnect();
        }, 2000)
    }

    function rfbConnect() {
        rfb.connect(host, port, password, path);
        return false;
    }

    $cad.on('click', function() {
        var $this = $(this);
        if ($this.data('confirm') && !confirm($this.data('confirm'))) {
            return;
        }
        sendCtrlAltDel();
        return false;
    });
    $reConnect.on("click", function() {
        var $this = $(this);
        if ($this.data('confirm') && !confirm($this.data('confirm'))) {
            return;
        }
        rfbConnect();
        return false;
    });


    //WebUtil.init_logging('debug');
    rfb = new RFB({'target': $D('no_vnc_canvas'),
        'encrypt': true,
        'true_color': true,
        'local_cursor': true,
        'shared': true,
        'view_only': false,
        'onUpdateState': updateState,
        'check_rate': 16,
        'fbu_req_rate': 32,
    });
    rfbConnect();

    window.onbeforeunload = function() {
        $.post(host + '/close_console/' + remotekey);
    }
    // doesn't work in jQuery(document).ready context on production server(Apache + Passenger)
    // jQuery document ready event doesn't get triggered; reason: unknown
    var consolePing = setInterval(function() {
        $.post(host + '/console_ping/' + remotekey);
    }, 60000);
});