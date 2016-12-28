{include file="`$cloudstackdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">
        {$networkname}
        {if $vpsdo=='ips'}
            {$lang.ips} 
            {if $subdo=='assignip'}&raquo; {$lang.assign_new_ip}
            {/if}
        {elseif $vpsdo=='interfaces'}{$lang.networkinterfaces} 
            {if $subdo=='addinterface'}&raquo; {$lang.addnewnetwork}
            {elseif $subdo=='edit'}&raquo; {$interface.label}
            {/if}
        {elseif $vpsdo=='fowarding'}
            {$lang.portfowarding}
        {elseif $vpsdo=='egressfirewall'}
            {$lang.outboundfirewall}
        {elseif $vpsdo=='loadbalancer'}
            {$lang.loadbalancing}
        {elseif $vpsdo=='vpn'}
            {$lang.setupvpn}
        {else}
            {$lang.inboundfirewall}
        {/if}
    </h3>
    <ul class="sub-ul">
        {*  <li ><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=interfaces{if $vpsid}&vpsid={$vpsid}{/if}" class="{if $vpsdo=='interfaces'}active{/if}" ><span>{$lang.interfaces}</span></a></li> *}
        {if $feature.ips}
        <li >
            <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=ips{if $vpsid}&vpsid={$vpsid}{/if}" 
               class="{if $vpsdo=='ips'}active{/if}" ><span>{$lang.ips}</span></a>
        </li>
        {/if}
        {if $feature.firewall}
            <li >
                <a  href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=firewall{if $vpsid}&vpsid={$vpsid}{/if}" 
                    class="{if $vpsdo=='firewall'}active{/if}"><span>{$lang.inboundfirewall}</span></a>
            </li>
            {if $advanced_network && $egress_enabled}
                <li >
                    <a  href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=egressfirewall{if $vpsid}&vpsid={$vpsid}{/if}" 
                        class="{if $vpsdo=='egressfirewall'}active{/if}"><span>{$lang.outboundfirewall}</span></a>
                </li>
            {/if}
        {/if}
        {if $advanced_network}
            {if $feature.portforward}
            <li >
                <a  href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=fowarding{if $vpsid}&vpsid={$vpsid}{/if}" 
                    class="{if $vpsdo=='fowarding'}active{/if}"><span>{$lang.portforwarding}</span></a>
            </li>
            {/if}
            {if $feature.loadbalancer}
            <li >
                <a  href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=loadbalancer{if $vpsid}&vpsid={$vpsid}{/if}" 
                    class="{if $vpsdo=='loadbalancer'}active{/if}"><span>{$lang.loadbalancing}</span></a>
            </li>
            {/if}
            {if $feature.vpn}
            <li >
                <a  href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vpn{if $vpsid}&vpsid={$vpsid}{/if}" 
                    class="{if $vpsdo=='vpn'}active{/if}"><span>VPN</span></a>
            </li>
            {/if}
        {/if}
    </ul>
    <div class="clear"></div>
</div>
<div class="content-bar {if $subdo=='addinterface' || $subdo=='edit' }nopadding{/if}">
    {include file="`$cloudstackdir``$vpsdo`.tpl"}
</div>
{include file="`$cloudstackdir`footer.cloud.tpl"}