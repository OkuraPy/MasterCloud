{if !$vm}
    <a class="iphone_switch {if $service.status=='Active'}vm-status-pending{/if}" data-sid="{$service.id}" >
        {if $service.status}{if $lang[$service.status]}{$lang[$service.status]}{else}{$service.status}{/if}
        {else}{$lang.loading}
        {/if}
    </a>
{elseif $vm.locked!='true'}
    {if $vm.power=='true'}
        <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=poweroff&vpsid={$vm.id}&security_token={$security_token}"  
           class="iphone_switch iphone_switch_on" onclick="return powerchange(this, '{$lang.sure_to_poweroff}?');">
            {$lang.On}
        </a>
    {else}
        <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=poweron&vpsid={$vm.id}&security_token={$security_token}"  
           class="iphone_switch iphone_switch_off" onclick="return powerchange(this, '{$lang.sure_to_power_on}?');">
            {$lang.Off} 
        </a>
    {/if}
{elseif $vm.built=='true'}
    <a class="iphone_switch vm-status-pending" data-vid="{$vm.id}" title="Your server is changing power state, it might take few minutes." data-toggle="tooltip">
        {$lang.Pending}
    </a>
{else}
    <a class="iphone_switch vm-status-pending" data-vid="{$vm.id}" title="Your server is now being provisioned, it might take up to 15 minutes." data-toggle="tooltip">
        Creating
    </a>
{/if}