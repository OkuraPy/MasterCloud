$(document).ready(function () {
    if (window.location.href.match('cart')) {
        $("#field_country, #state_input, #state_select").change(function () {
            var self = $(this),
                state = $("#state_select:visible"),
                form = self.parents("form").eq(0);
                
            form.addLoader();
            $.post("?cmd=cart&action=regionTax", {
                country: $("#field_country").val(),
                state: state.length > 0 ? state.val() : $("#state_input").val()
            }, function (resp) {
                if (resp == 1) {
                    var submit = form.find('[name=submit]');
                    form.append('<input type="hidden" name="autosubmited" value="true" />')
                    if(submit.length)
                        submit.click();
                    else
                        form.submit();
                }else
                    $('#preloader').remove()
            })
        });
    }
    if (typeof $.fn.chosen == 'function')
        $(".chzn-select").chosen();
});
function singup_image_reload() {
    var d = new Date();
    $('.capcha:first').attr('src', '?cmd=root&action=captcha#' + d.getTime());
    return false;
}