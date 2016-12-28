$(function() {
    $('.management_links').each(function(i) {
        $(this).children().eq(0).click(function() {
            $(this).parents('tr').next().toggle();
            return false;
        });
    });
    $('.db_management_links').each(function(i) {
        $(this).children().eq(0).click(function() {
            $(this).parents('tr').next().toggle().next().hide();
            return false;
        });
        $(this).children().eq(1).click(function() {
            $(this).parents('tr').next().next().toggle().prev().hide();
            return false;
        });
        $(this).parent().next().find('img[title]').click(updateprivs);
    });
    var change = 0;
    $('.eml_management_links').each(function(i) {
        $(this).children().eq(0).click(function() {
            if ($(this).parents('tr').next().data('status') == 1) {
                $(this).parents('tr').next().hide().data('status', 0);
            } else {
                $(this).parents('tr').next().show().data('status', 1);
                $(this).parents('tr').next().find('.change_div').hide().eq(1).show();
            }
            return false;
        });
        $(this).children().eq(1).click(function() {
            if ($(this).parents('tr').next().data('status') == 2) {
                $(this).parents('tr').next().hide().data('status', 0);
                change = 0;
            } else {
                $(this).parents('tr').next().show().data('status', 2);
                $(this).parents('tr').next().find('.change_div').hide().eq(0).show();
            }
            return false;
        });
    });
    $('.email_quota').change(function() {
        if ($(this).children("option:selected").val() == 'custom') {
            var name = $(this).attr('name');
            $(this).replaceWith('<input name="' + name + '" size="8" class="span1">MB');
        }
    });
    $('.disab').find('input, select').prop('disabled', true).attr('disabled', 'disabled');
    $('input[type=submit]').bind('click', function(e) {
        //e.preventDefault();
        var self = $(this),
            form = self.parents('form').eq(0),
            sub = self.parents('#updater tr, tfoot').eq(0).find('input, select, textarea');

        //$.post(form.attr('action'), sub.serializeArray(), function(){

        //})
        form.find('input, select, textarea').not(sub).not('[name=security_token]').prop('disabled', true);
    })
})