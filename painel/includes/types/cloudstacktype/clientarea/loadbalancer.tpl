<table class="data-table backups-list"  width="100%" cellspacing=0>
    <thead>
        <tr>
            <th>IP</th>
            <th>{$lang.name}</th>
            <th>{$lang.publicport}</th>
            <th>{$lang.privateport}</th>
            <th>{$lang.algorithm}</th>
            <th style="width: 100px">{$lang.stickiness}</th>
            <th style="width: 100px">{$lang.helthcheck}</th>
            <th>{$lang.manage}</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$balancerrules item=rule}
            <tr id="lb-{$rule.id}">
                <td>
                    {if !$ip_id}<a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=loadbalancer&ipid={$rule.publicipid}" />{$rule.publicip}</a>
                    {else}{$rule.publicip}
                    {/if}
                </td>
                <td class="lb-name">{$rule.name}</td>
                <td class="lb-publicport">{$rule.publicport}</td>
                <td class="lb-privateport">{$rule.privateport}</td>
                <td class="lb-algorithm">{if $lang[$rule.algorithm]}{$lang[$rule.algorithm]}{else}{$rule.algorithm}{/if}</td>
                <td><button class="btn btn-mini btn-default" data-id="{$rule.id}" data-type="stickiness" data-load><img src="includes/types/cloudstacktype/images/ajax-loader.gif"> {$lang.loading}</button></td>
                <td><button class="btn btn-mini btn-default" data-id="{$rule.id}" data-type="healthcheck" data-load><img src="includes/types/cloudstacktype/images/ajax-loader.gif"> {$lang.loading}</button></td>
                <td>
                    <div class="btn-group">
                        <a title="Manage" data-toggle="dropdown" class="btn btn-mini dropdown-toggle" href="#"><i class="icon icon-cog"></i><span class="caret"></span></a>
                                {*}<button class="btn btn-mini btn-default" data-id="{$rule.id}" data-type="instances" data-load>{$lang.edit}</button>{*}
                        <ul class="dropdown-menu">
                            <li><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=loadbalancer" 
                                   data-id="{$rule.id}" data-name="{$rule.name}" data-algorithm="{$rule.algorithm}" data-networkid="{$rule.networkid}" data-type="loadbalancer" data-load><i class="icon icon-edit"></i> {$lang.edit}</a></li>
                            <li><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=loadbalancer&do=ruledrop&rule={$rule.id}&security_token={$security_token}{if $ip_id}&ipid={$ip_id}{/if}" 
                                   onclick="return  confirm('Are you sure you want to remove this rule')" ><i class="icon icon-trash"></i> {$lang.delete}</a> </li>
                        </ul>
                    </div>


                </td>
            </tr>
            {foreachelse}
                <tr>
            <td colspan="8">{$lang.nothing}</td>
        </tr>
        {/foreach}
    </tbody>
</table>

<div class="clear"></div>

{if $ips}
    {include file="`$cloudstackdir`loadbalancer_form.tpl"}
{/if}
{literal}
    <style> 
        #facebox .table td{padding: 8px}
        #addrule td{
            white-space: nowrap;
            text-overflow: ellipsis;
            vertical-align: top;
        }
    </style>
{/literal}
<script type="text/javascript">
    var __$vms = [];
    {foreach from=$vms item=vm}
        {foreach from=$vm.nic item=net}
            {literal}__$vms.push({{/literal}
                    id: '{$vm.id}',
                    ipaddress: '{$net.ipaddress}',
                    name: '{$vm.displayname}',
                    networkid: '{$net.networkid}'
            {literal}});{/literal}
        {/foreach}
    {/foreach}
</script> 
<script src="includes/types/cloudstacktype/js/balancer.js" type="text/javascript"></script>
<script type="text/javascript" src="{$system_url}templates/common/facebox/facebox.js"></script>
<link media="all" type="text/css" rel="stylesheet" href="{$system_url}templates/common/facebox/facebox.css" />