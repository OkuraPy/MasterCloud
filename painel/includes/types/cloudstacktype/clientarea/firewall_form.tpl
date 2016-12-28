<form action="" method="post" id="formaddrule">
    <input type="hidden" name="do" value="addrule"/>
    <input type="hidden" name="securitygroupid" value="{$firewall.securitygroupid}"/>
    {if $ip_id}
        <input type="hidden" name="ipid" value="{$ip_id}"/>
    {/if}

    <br/><h3 class="summarize"> {$lang.addrule}: </h3>
    <table class="data-table backups-list form-horizontal table-layout-fixed"  width="100%" cellspacing="0">
        <tr>
            {if $advanced}

                <td>
                    {if $vpsdo=='egressfirewall'}
                        {if count($networkids) > 1}
                            <select name="networkid" class="width-auto">
                                {foreach from=$networkids item=network}
                                    <option {if $submit.networkid == $network[0]}selected="selected"{/if} value="{$network[0]}">{$network[1]}</option>
                                {foreachelse}
                                    <option value="">{$lang.none}</option>
                                {/foreach}
                            </select>
                        {else}
                            {foreach from=$networkids item=network}
                                <b>{$lang.network}</b><br>
                                <input type="hidden" name="networkid" value="{$network[0]}" />
                                {$network[1]}
                                {break}
                            {foreachelse}
                                <b>{$lang.network}</b><br>
                                {$lang.none}
                            {/foreach}
                        {/if}
                    {else}
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
                    {/if}
                </td>
            {else}
                <td>
                    <b>{$lang.type}:</b><br/>
                    <select name="type" class="width-auto">
                        <option {if $submit.type == "ingress"}selected="selected"{/if} value="ingress">{$lang.ingress}{$lang.rule}</option>
                        <option {if $submit.type == "engress"}selected="selected"{/if} value="engress">{$lang.engress}{$lang.rule}</option>
                    </select>
                </td>
            {/if}
            <td>
                <b>CIDR</b><br/>
                <input name="cidr" value="{$submit.cidr}" required class="width-auto"/>
            </td>
            <td>
                <b>{$lang.protocol}:</b><br/>
                <select name="protocol" onchange="$('.PROTO').hide().filter('input').prop('disabled', true).attr('disabled', 'disabled');
                        $('.' + $(this).val()).show().filter('input').prop('disabled', false).removeAttr('disabled');" class="width-auto">
                    <option {if $submit.protocol == "TCP"}selected="selected"{/if} >TCP</option>
                    <option {if $submit.protocol == "UDP"}selected="selected"{/if} >UDP</option>
                    <option {if $submit.protocol == "ICMP"}selected="selected"{/if} >ICMP</option>
                    {if $vpsdo=='egressfirewall'}<option {if $submit.protocol == "ALL"}selected="selected"{/if} >{$lang.all}</option>{/if}
                </select></td>
            <td style="width: 10%; white-space: nowrap; text-align: right">
                <b class="UDP TCP PROTO">{$lang.startport}:</b>
                <b class="ICMP PROTO" style="display:none">{$lang.icmptype}:</b>
                <strong class="UDP TCP PROTO" style="padding-left: 15px; font-size: 15px; font-family: Helvetica,sans-serif; visibility: hidden">&ndash;</strong>
                <br/>
                <input class="UDP TCP ICMP PROTO width-auto" name="startport" value="{$submit.startport}" size="5" required/> 
                <strong class="UDP TCP PROTO" style="padding-left: 15px; font-size: 15px; font-family: Helvetica,sans-serif;">&ndash;</strong>
            </td>
            <td style="width: 10%; white-space: nowrap;">
                <b class="UDP TCP PROTO">{$lang.endport}:</b>
                <b class="ICMP PROTO" style="display:none">{$lang.icmpcode}:</b><br/>
                <input class="UDP TCP ICMP PROTO width-auto" name="endport" value="{$submit.endport}" size="5" required />
            </td>

            <td style="width: 10%; text-align: center" valign="bottom">
                <input type="submit" value="{$lang.submit}" class="blue" />
            </td>
        </tr>
    </table>
    {securitytoken}
</form>