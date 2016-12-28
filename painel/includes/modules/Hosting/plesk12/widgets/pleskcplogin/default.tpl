
<div class="wbox">
    <div class="wbox_header">
        {$lang.logindetails}
    </div>
    <div class="wbox_content">
        {if $panellink || $service.username || $service.password }
            <form action="" method="post">
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker table table-striped">
                    {counter name=alt start=1 print=false assign=alter}

                    <tr {if $alter%2 == 0}class="even"{/if}{counter name=alt}>
                        <td width="160" align="right">{$lang.username}</td>
                        <td>{$service.username}</td>
                    </tr>
                    {if $service.password}  
                        <tr {if $alter%2 == 0}class="even"{/if}{counter name=alt}>
                            <td width="160" align="right">{$lang.password}</td>
                            <td><span style="display:none" id="showpassword">{$service.password}</span> <a href="#" onclick="$(this).hide();
                                    $('#showpassword').show();
                                    return false;" class="fs11">{$lang.revealpassword}</a></td>
                        </tr>
                    {/if}
                    {if $panellink}
                        <tr {if $alter%2 == 0}class="even"{/if}{counter name=alt}>
                            <td colspan="2">
                                <a href="{$plesk_url}{$panellink}" target="_blank" class="btn btn-primary btn-flat-primary">{$lang.clickhereaccesscontrolpanel}</a>
                            </td>
                        </tr>
                    {/if}
                </table>
            </form>
        {else}
            <p>{$lang.nothing}</p>
        {/if}    
    </div>
</div>
<script type="text/javascript" src="{$widgetdir_url}../widget.js"></script>
<link rel="stylesheet" type="text/css" href="{$widgetdir_url}../widget.css"  media="all">