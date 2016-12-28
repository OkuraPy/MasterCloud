
<form action="" method="post" id='formaddrule'>
    <input type="hidden" name="do" value="addrule"/>
    {if $ip_id}
        <input type="hidden" name="ipid" value="{$ip_id}"/>
    {/if}
    <br/><h3 class="summarize"> {$lang.addrule}: </h3>
    <table class="data-table backups-list form-horizontal"  width="100%" cellspacing="0" >
        <tr>
            <td>
                <b>IP</b><br/>
                {if !$ip_id}
                    <select name="ip" class="width-auto">
                        {foreach from=$ips item=ip}
                            <option {if $submit.ip == $ip.id}selected="selected"{/if} value="{$ip.id}">{$ip.address}</option>
                        {foreachelse}
                            <option value="">{$lang.none}</option>
                        {/foreach}
                    </select>
                {else}
                    {foreach from=$ips item=ip}
                        {if $ip_id == $ip.id}
                            <input type="hidden" name="ip" value="{$ip.id}" />
                            {$ip.address}
                        {/if}
                    {/foreach}
                {/if}
            </td>
            {if !$vpsid}
                <td>
                    <b>VM:</b><br/>
                    <select name="vpsid" class="width-auto">
                        {foreach from=$vms item=n key=k}
                            <option value="{$n.id}" >{$n.displayname}</option>
                        {/foreach}
                    </select>
                </td>
            {/if}
            <td>
                <b>{$lang.protocol}:</b><br/>
                <select name="protocol" id="protochange" class="width-auto">
                    <option {if $submit.protocol == "TCP"}selected="selected"{/if} >TCP</option>
                    <option {if $submit.protocol == "UDP"}selected="selected"{/if} >UDP</option>
                </select>
            </td>
            <td style="width: 10%; white-space: nowrap;">
                <div class="UDP TCP PROTO">
                    <b>{$lang.publicport}</b>
                    <br/>
                    <input name="startport" value="{$submit.startport}" required placeholder="eg. 20-26"/> 
                </div>
                <div class="ICMP PROTO">
                    <b style="display:none">{$lang.icmptype}:</b>
                    <br/>
                    <input name="startport" value="{$submit.startport}" required /> 
                </div>
            </td>
            <td style="width: 10%; white-space: nowrap;">
                <div class="UDP TCP PROTO">
                    <b>{$lang.privateport}</b>
                    <br/>
                    <input name="endport" value="{$submit.endport}" required placeholder="eg. 20-26"/> 
                </div>
                <div class="ICMP PROTO">
                    <b style="display:none">{$lang.icmpcode}</b>
                    <br/>
                    <input name="endport" value="{$submit.endport}" required /> 
                </div>
            </td>

            <td style="width: 10%; text-align: center" valign="bottom">
                <input type="submit" value="{$lang.submit}" class="blue" />
            </td>
        </tr>
    </table>
    {securitytoken}
</form>
