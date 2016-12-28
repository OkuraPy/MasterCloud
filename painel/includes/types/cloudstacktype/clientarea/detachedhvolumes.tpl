<table class="data-table backups-list"  width="100%" cellspacing=0>
    <thead>
        <tr>
            <td>{$lang.size}</td>
            <td>{$lang.label}</td>
            <td>{$lang.type}</td>
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
            <td>
                {assign value=$disk.state|lower var=diskstatelower}
                {if $lang[$disk.state]}{$lang[$disk.state]|capitalize}
                {elseif $lang[$diskstatelower]}{$lang[$diskstatelower]|capitalize}
                {else}{$disk.state}
                {/if}
            </td>
            <td>
                {if $disk.state == 'Ready' || $disk.state == 'Allocated'}
                    <a title="Attach" 
                       href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=detachedhvolumes&do=attach&diskid={$disk.id}&vpsid={$vpsid}&security_token={$security_token}" 
                       class="small_control small_backup_restore fs11" >
                        {$lang.attach}
                    </a> &nbsp;
                    <a title="{$lang.edit}" 
                       href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=disks&do=editor&diskid={$disk.id}&vpsid={$vpsid}" 
                       class="small_control small_pencil fs11" >
                        {$lang.edit}
                    </a> &nbsp;
                    <a title="{$lang.delete}" 
                       href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=detachedhvolumes&do=delete&diskid={$disk.id}&vpsid={$vpsid}&security_token={$security_token}" 
                       onclick="return confirm('{$lang.aresuredeletethisvolume}?');" class="small_control small_delete fs11" >
                        {$lang.delete}
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
    <a class="btn" href="{$service_url}&vpsdo=disks&vpsid={$vpsid}" >{$lang.back}</a>
</div>
<div class="clear"></div>