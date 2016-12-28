$(function () {
    function showPPtransactions() {
        var self = $(this);
        
        if (self.is('.showed_trans')) {
            self.html('Show Last Transactions').removeClass('showed_trans');
            $('#pptransactions').hide();
        } else {
            if (!self.is('.ppt_loaded')) {
                ajax_update('?cmd=module&module=ppalbalance&act=getTransactions', {}, '#pptransactions', true);
                self.addClass('ppt_loaded')
            }
            self.html('Hide Transactions').addClass('showed_trans');
            $('#pptransactions').show();
        }
    }
    ajax_update('?cmd=module&module=ppalbalance&act=getBalance', {}, '#pbalance', true);

    $('.gbox1').eq(0).after('<div id="paypal-balance">\
            <img src="../includes/modules/Other/ppalbalance/admin/logo.png" />\
            <span id="pbalance"><h3>Loading...</h3></span>\
            <div class="clear"></div>\
        </div>');
    $('#paypal-balance').on('click', '.pp-transactions', showPPtransactions)
})
