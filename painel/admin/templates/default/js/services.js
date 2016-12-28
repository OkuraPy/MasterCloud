
var HBServices = {
    showArcived: function(){
         $('#serializeit').toggleClass('show-archived');
    },
    customize: function () {
        var op = $('input[name=otype]:checked').val();
        if (!op)
            return false;
        var cid = $('input[name=cat_id]').val();
        if (!cid) {
            alert('Please add your orderpage first');
            return false;
        }

        $.facebox({
            ajax: "?cmd=services&action=opconfig&tpl=" + op + "&id=" + cid,
            width: 600,
            nofooter: true,
            opacity: 0.8,
            addclass: 'modernfacebox'
        });
        return false;
    },
    editcat: function () {
        $('#cinfo1').toggle();
        $('#cinfo0').toggle();
        return false;
    },
    prswitch: function (id, el) {
        $('#subwiz_opt span').removeClass('active');
        $(el).parent().addClass('active');
        $('.pr_desc').hide();
        $('#pr_desc' + id).show();
    },
    editslug: function (el) {
        $(el).hide();
        $('#category_slug_edit').show();
        $('.changemeurl').hide();
        return false;
    },
    get_descr: function (el) {
        $('#wiz_options li').removeClass('activated');
        $(el).prop('checked', true).parent().addClass('activated');
        $('.gallery .gal_slide').hide();
        $('#o' + $(el).attr('id')).show();
    },
    sl: function (el) {
        var data = {
            ptype: $(el).val(),
            selected: $('#wiz_options input:checked').val(),
        };
        if (!$('#category_id').length)
            data.addcategory = true;
        ajax_update('?cmd=services&action=newpageextra', data,
            function (data) {
                $('#template_descriptions').html(data);
                if ($('#template_descriptions input:checked').length == 0) {
                    $('#template_descriptions input:first').click()
                }
                $('#submitbtn').removeAttr('disabled').prop('disabled', false);
            });
        return false;
    },
}
$(function () {
    
    function handleLink(){
        var self = $(this),
            entry = self.parents('.entry').eq(0),
            url = self.attr('href');
        
        entry.addClass('loading');
        $.get(url, function(resp){
            resp = parse_response(resp);
            var form = $('#serializeit'),
                newentry = $(resp).filter('#' + entry.attr('id'))
                
            entry.replaceWith(newentry[0]);
        })
        return false;
    }
    
    if ($('#addcategory').length) {
        $('.step1').css('opacity', 0.2);
        $('#categoryname').bind('keyup keydown change', function () {
            if ($(this).val() != '') {
                if ($('select[name=ptype]').val() != '0')
                    $('#submitbtn').removeAttr('disabled');
                $('.step1').css('opacity', 1);
                $('#hints').slideDown('fast');
                var w = $(this).val().replace(/[^a-zA-Z0-9-_\s]+/g, '-').replace(/[\s]+/g, '-').toLowerCase();
                if (!$('#category_slug_edit').is(':visible')) {
                    $('#category_slug_edit').val(w);
                }
                $('#hints .changemeurl').html(w);
            } else {
                $('.step1').css('opacity', 0.2);
                $('#hints').slideUp('fast');
                $('#submitbtn').attr('disabled', 'disabled');
            }
        });
        
        function saveOrder() {
            var sorts = $('#serializeit').serialize();
            ajax_update('?cmd=services&action=listcats&' + sorts, {});
        }
        $("#grab-sorter").dragsort({dragSelector: "a.sorter-handle", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class='placeHolder'><div></div></li>"});
        $('#serializeit').on('click', 'a.ajax', handleLink);
        
    } else if ($('#category_id').length) {
        $('#categoryname').bind('keyup keydown change', function () {
            if ($(this).val() != '') {
                $('#hints').slideDown('fast');
                var w = $(this).val().replace(/[^a-zA-Z0-9-_\s]+/g, '-').replace(/[\s]+/g, '-').toLowerCase();
                if (!$('#category_slug_edit').is(':visible')) {
                    $('#category_slug_edit').val(w);
                }
                $('#hints .changemeurl').html(w);
            } else {
                $('#hints').slideUp('fast');
            }
        });
        
        function saveOrder() {
            var sorts = $('#serializeit').serialize();
            ajax_update('?cmd=services&action=listprods&' + sorts, {});
        }
        $("#grab-sorter").dragsort({dragSelector: "a.sorter-handle", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class='placeHolder'><div></div></li>"});
        $('#serializeit').on('click', 'a.ajax', handleLink);
    }
});