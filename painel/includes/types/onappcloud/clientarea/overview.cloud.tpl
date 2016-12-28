{include file="`$onappdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="header-icon serverlist">{$lang.cloudlabel1}</h3>
    <div class="clear"></div>
</div>
<div class="content-bar">

    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="tonapp server-list" style="margin:10px 0px;">
        <thead>
            <tr>
                <th width="66"></th>
                <th>{$lang.hostname}</th>
                <th width="233">{$lang.ipadd}</th>
                <th width="70">{$lang.diskspace}</th>
                <th width="70">{$lang.memory}</th>
                <th width="60"></th>
            </tr>
        </thead>
        <tbody id="updater">
            {if $MyVMs}
                {foreach from=$MyVMs item=vm name=foo}
                    <tr >
                        <td >
                            {if $vm.built=='true'}
                                {if $vm.power=='true'}
                                    <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=poweroff&vpsid={$vm.id}&security_token={$security_token}" 
                                       class="iphone_switch_container iphone_switch_container_on" onclick="return powerchange(this, 'Are you sure you want to Power OFF this VM?');">
                                        <img src="includes/types/onappcloud/images/iphone_switch_container_off.png" alt="" />
                                    </a>

                                {else}
                                    <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=poweron&vpsid={$vm.id}&security_token={$security_token}" 
                                       class="iphone_switch_container iphone_switch_container_off" onclick="return powerchange(this, 'Are you sure you want to Power ON this VM?');">
                                        <img src="includes/types/onappcloud/images/iphone_switch_container_off.png" alt="" />
                                    </a>

                                {/if}
                            {else}
                                <a  class="iphone_switch_container iphone_switch_container_pending">
                                    <img src="includes/types/onappcloud/images/iphone_switch_container_off.png" alt="" />
                                </a>
                            {/if}
                        </td>
                        <td>
                            <a href="?cmd=clientarea&action=services&service={$service.id}&vpsid={$vm.id}&vpsdo=vmdetails" >
                                <b class="left">{$vm.hostname}</b> {if $vm.tags}{foreach from=$vm.tags item=tag}<span class="label label-success right fs11 " style="margin-right:2px">{$tag}</span> {/foreach}{/if}
                                <span class="clear"></span>
                            </a>
                        </td>
                        <td>{foreach from=$vm.ip item=ipp name=ssff}{$ipp}{if !$smarty.foreach.ssff.last},{/if} {/foreach}</td>
                        <td>{$vm.disk} GB</td>
                        <td>{$vm.memory} MB</td>
                        <td class="fs11">
                            <a href="?cmd=clientarea&action=services&service={$service.id}&vpsid={$vm.id}&vpsdo=vmdetails"  class="ico ico_wrench" title="{$lang.edit}">{$lang.edit}</a>
                            <a  href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=destroy&vpsid={$vm.id}&security_token={$security_token}" 
                                onclick="return  confirm('{$lang.sure_to_destroy}?')" class="ico ico_cross" title="{$lang.delete}">{$lang.delete}</a>
                        </td>
                    </tr>
                {/foreach}
            {else}
                <tr >
                    <td colspan="6" align="center">{$lang.nomachinesnote}, <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=createvm">{$lang.addservernote}</a>.</td>
                </tr>
            {/if}
        </tbody>
    </table>
    {if $cloud_widgets}
        <div class="btn-group pull-right cloud-widgets">
            <a href="#" class="btn dropdown-toggle " data-toggle="dropdown">{$lang.actions} <span class="caret"></span></a>
            <ul class="dropdown-menu">
                {foreach from=$cloud_widgets item=widg}
                    <li>
                        <a  href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}">
                            <img src="{$system_url}{$widg.config.smallimg}" alt="">  {if $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}
                        </a>
                    </li>
                {/foreach}
            </ul>
        </div>
        <div class="clear"></div>
    {/if}
</div>
{include file="`$onappdir`footer.cloud.tpl"}