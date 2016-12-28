<iframe src="https://hostbillapp.com/latest/" frameborder="0" border="0" style="width:650px;height:500px" />
<script type="text/javascript">
    {literal}

    $('#facebox .footer').append(
            '<div class="left"><input type="checkbox" id="dontshowmeagain" name="dontshowmeagain"> <label for="dontshowmeagain">Dont show this message again</label></div>'
    );
    $(document).bind('close.facebox',function(){
        if ($("#dontshowmeagain").is(":checked")) {
            ajax_update('?cmd=autoupgrade&action=dismiss');
        }
    });
    {/literal}
</script>