{if $panellink || $service.username || $service.password || $rootpass}
    <div class="wbox">
        <div class="wbox_header">
            {$lang.logindetails}
        </div>
        <div class="wbox_content">
            <form action="" method="post">
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker table table-striped">
                    {counter name=alt start=1 print=false assign=alter}
                    {if $panellink}
                    <tr {if $alter%2 == 0}class="even"{/if}{counter name=alt}>
                        <td width="160" align="right">URL</td>
                        <td><a href="{$panellink}" target="_blank">{$panellink}</a></td>
                    </tr>
                    {/if}
                    <tr {if $alter%2 == 0}class="even"{/if}{counter name=alt}>
                        <td width="160" align="right">{$lang.username}</td>
                        <td>{$service.username}</td>
                    </tr>
                    {if $service.password}  
                        <tr {if $alter%2 == 0}class="even"{/if}{counter name=alt}>
                            <td width="160" align="right">{$lang.password}</td>
                            <td><span style="display:none" id="showpassword">{$service.password}</span> <a href="#" onclick="$(this).hide();$('#showpassword').show();return false;" class="fs11">{$lang.revealpassword}</a></td>
                        </tr>
                    {/if}
                    {if $service.rootpassword}  
                        <tr {if $alter%2 == 0}class="even"{/if}{counter name=alt}>
                            <td width="160" align="right">{$lang.rootpassword}</td>
                            <td><span style="display:none" id="showpassword2">{$rootpass}</span> <a href="#" onclick="$(this).hide();$('#showpassword2').show();return false;" class="fs11">{$lang.revealpassword}</a></td>
                        </tr>
                    {/if}
                </table>
            </form>
        </div>
    </div>
{/if}
