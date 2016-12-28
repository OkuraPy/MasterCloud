{if $layer && $customfile}
    {if $vpsdo=='metered_history'}
        {include file="`$xenserver_dir`metered_table.tpl"}
    {elseif $vpsdo=='clientsvms'}
        <table class="data-table backups-list"  width="100%" cellspacing=0>
            <thead>
                <tr>
                    <td>Label</td>
                    <td>OS</td>
                    <td>IP Address</td>
                    <td>Disk Space</td>
                    <td>Memory</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                {if $MyVMs}
                    {foreach from=$MyVMs item=vm name=foo}
                        <tr >
                            
                            <td ><strong>{$vm.name_label}</strong></td>
                            <td>{if $vm._os}{$vm._os}{else}{$vm.guest.os_version.name}{/if}</td>
                            <td>
                                {if $vm.guest.networks}
                                    {foreach from=$vm.guest.networks item=ipp name=ssff}{$ipp}{if !$smarty.foreach.ssff.last},{/if} {/foreach}
                                {elseif $service.vpsip}
                                    {$service.vpsip}
                                {else}-
                                {/if}
                            </td>

                            <td>{$vm.disk_size} GB</td>
                            <td>{$vm.memory} MB</td>
                            <td >
                                {if $vm.power_state=='Running'}

                                    <a  onclick="return power_xenserv($(this).attr('href'), 'off')"  
                                        href="?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&vpsdo=clientsvms&security_token={$security_token}&machine_id={$vm.id}&do=power" 
                                        class="power off-inactive" >OFF</a>
                                    <a class="power on-active">ON</a>
                                {else}
                                    <a class="power off-active">OFF</a>
                                    <a  class="power on-inactive" onclick="return power_xenserv($(this).attr('href'), 'on')"  
                                        href="?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&security_token={$security_token}&vpsdo=clientsvms&machine_id={$vm.id}&do=power"
                                        >ON</a>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                {else}
                    <tr>
                        <td style="text-align: center; font-size: 100%; width: 100%;" colspan="8">
                            This client dont have any machines created yet
                        </td>
                    </tr>
                {/if}
            </tbody>
        </table>
    {/if}
{/if}