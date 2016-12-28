<div class="notice">
    <h3>{$lang.setupvpn}</h3>
    <p>
        {$lang.vpn_csdesc}
    </p>

{if $ip_id}
    {if $vpn}
        <p>{$lang.vpnaccessip} <strong>{$ip.ipaddress}</strong>.
            <br>{$lang.vpnipseckey} <strong>{$vpn.presharedkey}</strong></p>
        <p>
            <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vpn&do=disable&security_token={$security_token}&ipid={$ip_id}" 
               onclick="return confirm('Are you sure?');"
               class="btn btn-danger">{$lang.vpndisableforip} {$ip.ipaddress}</a>
        </p>
    {else}
        <p>
            <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vpn&do=enable&security_token={$security_token}&ipid={$ip_id}" 
               class="btn btn-primary">{$lang.vpnenableforip} {$ip.ipaddress}</a>
        </p>
    {/if}
{elseif $ips}
    <p class="form-inline">
        {$lang.pleaseselectip}
        <select onchange="$(this).next().attr('href', '?cmd=clientarea&action=services&service={$service.id}&vpsdo=vpn&ipid=' + $(this).val())">
            {foreach from=$ips item=ip}
                <option {if $submit.ip == $ip.id}selected="selected"{/if} value="{$ip.id}">{$ip.ipaddress}</option>
            {/foreach}
        </select>
        <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vpn&ipid={$ip.id}" 
           class="btn btn-default" id="gotoip"> <i class="icon icon-lock"></i> {$lang.setup}</a>
    </p>
{else}
    <p>{$lang.vpnrequireip}</p>
{/if}
</div>
<br/>
<table class="data-table backups-list"  width="100%" cellspacing=0>
    <thead>
        <tr>
            <td>{$lang.vpnuser}</td>
            <td style="width: 50%">{$lang.manage}</td>
        </tr>
    </thead>
    {foreach item=user from=$users}
        <tr>
            <td >{$user.username}</td>
            <td class="text-right">
                <form class="form-inline" action="" method="post" style="display: none; margin: 0px;">
                    <input type="hidden" name="do" value="update"/>
                    <input type="hidden" value="{$user.username}" name="username">
                    <input type="password" value="" name="password" size="10" class="span2">
                    <button class="btn btn-primary"><i class="icon icon-check icon-white"></i> Update </button>
                    {securitytoken}
                </form>
                <a href="#" onclick="$(this).prev().css('display', 'inline').end().hide();
                        return false;"
                   class="btn"><i class="icon icon-edit"></i> Change Password</a>
                <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vpn&do=del&username={$user.username}&security_token={$security_token}{if $ip_id}&ipid={$ip_id}{/if}" 
                   onclick="return  confirm('Are you sure you want to remove this user?')"
                   class="btn"><i class="icon icon-trash"></i> Remove</a>
            </td>
        </tr>
    {foreachelse}
        <tr>
            <td colspan="4">{$lang.nothing}</td>
        </tr>
    {/foreach}
</table>

{include file="`$cloudstackdir`vpn_form.tpl"}