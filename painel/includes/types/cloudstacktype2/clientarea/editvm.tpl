<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">
        Upgrade
    </h3>
    <div class="clear"></div>
</div>
<div class="content-bar nopadding" style="position:relative">
    <form method="post" action="">
        <input type="hidden" value="editmachine" name="make" />
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
            <tr>
                <td colspan="2" id="flavormgr">
            <center>
                <img src="includes/types/cloudstacktype/images/ajax-loader-big.GIF" alt=""/>
            </center>
            </td>
            </tr>  
            <tr>
                <td align="center" style="border:none" colspan="2">
                    <input type="submit" value="Upgrade" style="font-weight:bold" class=" blue" />
                    <br />
                </td>
            </tr>
        </table>
        {securitytoken} 
    </form>
</div>
{literal}
    <script type="text/javascript">
        $.get('?cmd=flavormanager&selected={/literal}{$VMDetails.flavor_id}{literal}', function(data) {
            $('#flavormgr').html(data);
        });
    </script>
{/literal}