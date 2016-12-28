
<table class="data-table backups-list"  width="100%" cellspacing=0>

    <thead>
        <tr>
            <td>IP</td>
            <td>{$lang.protocol}</td>
            <td>{$lang.publicport}</td>
            <td>{$lang.privateport}</td>
            {if $ip_id || !$vpsid}<td>{$lang.hostname}</td>{/if}
            <td>&nbsp;</td>
        </tr>
    </thead>
    {counter name=rules print=false start=0 assign=rules_couter}
    {foreach item=rule from=$fowardrules name=ruleloop}
        {if $ip_id || $vpsid == $rule.virtualmachineid || $network_overview}
            {counter name=rules}
            <tr>
                <td>{if !$ip_id}<a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=fowarding{if $vpsid}&vpsid={$vpsid}{/if}&ipid={$rule.ipaddressid}" />{/if}{$rule.ipaddress}{if !$ip_id}</a>{/if}</td>
                <td>{$rule.protocol|upper}</td>
                <td>{$rule.publicport}{if $rule.publicendport!=$rule.publicport} - {$rule.publicendport}{/if}</td>
                <td>{$rule.privateport}{if $rule.privateendport!=$rule.privateport} - {$rule.privateendport}{/if}</td>
                {if $ip_id || !$vpsid}<td><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=fowarding&vpsid={$rule.virtualmachineid}" />{$rule.virtualmachinedisplayname}</a></td>{/if}
                <td  class="width-auto">
                    <a class="small_control small_delete fs11" onclick="return  confirm('Are you sure you want to remove this rule')" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=fowarding{if $vpsid}&vpsid={$vpsid}{/if}&rule={$rule.id}&do=ruledrop&security_token={$security_token}{if $ip_id}&ipid={$ip_id}{/if}">{$lang.remove}</a>
                </td>
            </tr>
        {/if}
    {/foreach}

    {if !$rules_couter}
        <tr><td colspan="6">{$lang.nothing}</td></tr>
        {/if}
</table>


<div class="clear"></div>
{if $ips}
    {include file="`$cloudstackdir`fowarding_form.tpl"}
{/if}