{if !$do}
    <table class="data-table backups-list"  width="100%" cellspacing=0>
        <thead>
            <tr>
                <td>{$lang.size}</td>
                <td>{$lang.label}</td>
                <td>{$lang.type}</td>
                {if $storage_tiers}
                    <td>Storage type</td>
                {/if}
                <td>{$lang.status}</td>
                <td width="220"></td>
            </tr>
        </thead>
        {foreach item=disk from=$disks}
            <tr>
                <td align="right">{$disk.dsize}</td>
                <td>
                    {$disk.name}
                </td>
                <td>
                    {$disk.type}
                </td>
                {if $storage_tiers}
                <td>
                    {if $disk.tier}{$disk.tier.name}{else} - {/if}
                </td>
                {/if}
                <td>
                    {assign value=$disk.state|lower var=diskstatelower}
                    {if $lang[$disk.state]}{$lang[$disk.state]|capitalize}
                    {elseif $lang[$diskstatelower]}{$lang[$diskstatelower]|capitalize}
                    {else}{$disk.state}
                    {/if}
                </td>
                <td>
                    {if $provisioning_type!='single' && $disk.type == 'DATADISK'}
                        <a title="{$lang.edit}" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=disks&do=editor&diskid={$disk.id}&vpsid={$vpsid}" class="small_control small_pencil fs11" >
                            {$lang.edit}
                        </a>
                        <a title="Detach" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=disks&do=detach&diskid={$disk.id}&vpsid={$vpsid}&security_token={$security_token}" 
                           {if $vm.state != 'Stopped'}onclick="return confirm('Detaching disks from running VMs may corrupt your data. Are you sure you want to continue?');"{/if} class="small_control small_delete fs11" >
                            {$lang.detach}
                        </a> </br>

                    {/if}
                    {if $feature.snapshot}
                        <a title="Create Snapshot" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=backups&do=create&diskid={$disk.id}&vpsid={$vpsid}&security_token={$security_token}" onclick="return confirm('{$lang.suretocreatesnapshot}{if $meteredsnap} {$lang.additionalmayaddedyourbill}{/if}');" class="small_control small_backup fs11" >
                            {$lang.createsnapshot}
                        </a>
                        <br/>
                        <a title="{$lang.backupschedule}" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=backupschedule&diskid={$disk.id}&vpsid={$vpsid}" class="small_control small_backup_schedule fs11" >
                            {$lang.snapshotschedule}
                        </a>
                    {/if}
                </td>
            </tr>
        {foreachelse}
            <tr>
                <td colspan="5">{$lang.nothing}</td>
            </tr>
        {/foreach}
    </table>
    <div class="btn-group-cloud">
        {if $availablespace > 0}
            <a class="btn btn-info" href="{$service_url}&vpsdo=disks&vpsid={$vpsid}&do=create" >{$lang.createvolume}</a>
        {/if}
        {if $availabledisks}
            <a class="btn btn-info" href="{$service_url}&vpsdo=detachedhvolumes&vpsid={$vpsid}">Detached volumes</a>
        {/if}
    </div>
    <div class="clear"></div>

{elseif $do=='editdisk' || $do=='createdisk'}
    <form method="post" action="">
        <input type="hidden" value="editdisk" name="make" />

        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
            
            <tr>
                <td>
                    <span class="slabel">{$lang.label}</span>
                </td>
                <td>
                    {if $do=='createdisk'}
                        <input type="text" required="required" name="name" class="styled" value=""/>
                        <input type="hidden" name="is_detached" class="styled" value="{if $editdisk.is_detached}1{/if}"/>
                    {else}
                        {$editdisk.current_volume.name}
                    {/if}
                </td>
            </tr>

            {if $editdisk.storage_tiers}
                <tr>
                    <td>
                        <span class="slabel">{$lang.storge_type}</span>
                    </td>
                    <td>
                        {if $do=='createdisk' && $editdisk.storage_tiers}
                            <select name="storage_tier" id="virtual_machine_storage_tier"  style="min-width:250px;" >
                                {foreach from=$editdisk.storage_tiers item=tier key=tk}
                                    {if $tier.enabled}
                                        <option value="{$tk}" {if $editdisk.tier.tier_id==$tk}selected="selected"{/if} 
                                                {if $editdisk[$tier.variable] < 1}disabled="disabled"{/if}
                                                data-total="{$editdisk[$tier.variable].max}"
                                                data-vmlimit="{$editdisk[$tier.variable].vmlimit}">
                                            {$tier.name} - {$editdisk[$tier.variable].max}GB available
                                        </option>
                                    {/if}
                                {/foreach}
                            </select>
                        {else}
                            {$editdisk.current_volume.tier.name}
                        {/if}
                    </td>
                </tr>
            {/if}
            <tr>
                <td>
                    <span class="slabel">{$lang.diskspace}</span>
                </td>
                <td>
                    <div class="input-with-slider">
                        
                        <input type="text" size="4" required="required" name="disk_size" class="styled" 
                               value="{if $editdisk.current}{$editdisk.current}{elseif $slider.initialval}{$slider.initialval}{else}1{/if}" 
                               id="disk_size"/> GB
                        <div class="slider" max="{$editdisk.vmlimit}" 
                             min="{if $slider.min}{$slider.min}{else}0{/if}" fmin="{if $slider.minvalue}{$slider.minvalue}{else}1{/if}" 
                             step="{if $slider.step}{$slider.step}{else}1{/if}" 
                             target="#disk_size"></div>
                    </div>

                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" class="blue" value="{$lang.savechanges}" {*if !$editdisk.is_detached}onclick="return confirm('{$lang.diskconfirm1}')"{/if*}/>
                    <input type="button" class="gray" value="{$lang.cancel}" 
                           onclick="window.location = '?cmd=clientarea&action=services&service={$service.id}&vpsdo=disks&vpsid={$vpsid}'"/>
                </td></tr>
        </table>{securitytoken}
    </form><script type="text/javascript">
        {literal}
            $(document).ready(function() {
                init_sliders();
                $('#virtual_machine_storage_tier').change(function(){
                    var self = $(this),
                        slder = $('#disk_size').next().data('slider');

                    slder.option('max', parseInt(self.find(':selected').data('vmlimit')))
                    slder.option('value', parseInt(slder.option('value')));
                }).change();
            });
        {/literal}
    </script>
{/if}