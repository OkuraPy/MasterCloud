<div class="nicers" style="border:none;padding:10px;">
{if $logs}
<div id="listform">
    <div id="serializeit"><ul style="border:solid 1px #ddd;border-bottom:none;" id="grab-sorter" >
            {foreach from=$logs item=l}<li style="background:#ffffff"><div style="border-bottom:solid 1px #ddd;">
                    <table width="100%" cellspacing="0" cellpadding="5" border="0">
                        <tbody><tr>
                                <td width="50" valign="top"><div style="padding:10px 0px;"><input type="hidden" class="ser" value="197" name="sortc[]"><a name="f197"></a>
                                        <a onclick="return confirm('Are you sure you wish to delete this link?')" title="delete" class="menuitm" href="?cmd=module&module={$moduleid}&make=delete&id={$l.id}"><span class="delsth"></span></a>
                                    </div></td>
                                <td>
                                    <a class="external" href="{$l.link}" target="_blank">{$l.link}</a><br/>
                                    <input type="text" value="{$l.link}" style="margin-top:5px; width:90%"/>

                                </td>
                                <td width="350" valign="top" style="background:#F0F0F3;color:#767679;font-size:11px">Product: <strong>{$l.pname} </strong><br />
                                Generated by: <strong>{$l.firstname} {$l.lastname}</strong></td>
                            </tr>
                        </tbody></table></div></li>
            {/foreach}
        </ul>
    </div>
</div>
{else}
    <div id="bsmetered" class="blank_state_smaller blank_domains">
        <div class="blank_info">
            <h3>You dont have any custom direct links generated yet.</h3>
                Using this feature you can generate custom order links containing exact product configuration you need.
            <div class="clear"></div>
            <br>
            <a href="http://cdn.hostbillapp.com/modules/directcart/directlink.swf" class="new_control" target="_blank"><span class="addsth"><strong>Learn how</strong></span></a>
            <div class="clear"></div>
        </div>
    </div>

{/if}
</div>