{include file="`$cloudstackdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">
        {if $vpsdo=='vmsnapshotschedule'}{$lang.snapshotschedule}
        {else}{$lang.snapshots}
        {/if}
    </h3>
    <ul class="sub-ul">
        <li><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vmsnapshot&vpsid={$vpsid}" class="{if $vpsdo=='vmsnapshot'}active{/if}" ><span>{$lang.snapshots}</span></a></li>
        <li><a href="{$service_url}&vpsdo=vmsnapshotschedule&vpsid={$vpsid}" class="{if $vpsdo=='vmsnapshotschedule'}active{/if}" ><span> {$lang.snapshotschedule}</span></a></li>
    </ul>
    <div class="clear"></div>
</div>
<div class="content-bar">
    {if $vpsdo=='vmsnapshotschedule'}
        {include file="`$cloudstackdir``$vpsdo`.tpl"}
    {else}
        {if $newsnapshot}
            <div class="notice">
                <h3>{$lang.createsnapshot}</h3>
                <p>
                    {$lang.creatingsnapshot_desc}
                </p>
            </div>
            <form action="" method="post">

                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker form-horizontal">
                    <tr>
                        <td style="width: 20%"><strong>{$lang.name}</strong></td>
                        <td><input type="text" name="name" /></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top"><strong>{$lang.Description}</strong></td>
                        <td><textarea type="text" name="description" ></textarea></td>
                    </tr>
                    <tr>
                        <td><strong>{$lang.snapshotmemory}</strong></td>
                        <td><input type="checkbox" name="snapshotmemory" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" name="create" value="{$lang.createsnapshot}" class="btn btn-primary" /></td>
                    </tr>
                </table>

            </form>
        {else}
            <table class="data-table backups-list"  width="100%" cellspacing=0>
                <thead>
                    <tr>
                        <td>{$lang.date}</td>
                        <td>{$lang.name}</td>
                        <td>{$lang.status}</td>
                        <td>{$lang.type}</td>
                        <td>{$lang.Active}</td> 
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </thead>
                {foreach item=backup from=$snapshots}
                    <tr>
                        <td>{$backup.created|regex_replace:"/[T]/":' '}</td>
                        <td>{$backup.displayname}</td>
                        <td>
                            {if $backup.state == "Ready" }
                                {$lang.Built}
                            {elseif $lang[$backup.state]}
                                {$lang[$backup.state]}
                            {else}
                                {$backup.state}
                            {/if}
                        </td>

                        <td>{$backup.type} </td>
                        <td>{if $backup.current} {$lang.yes}{else}{$lang.no}{/if}</td>
                        <td>
                            {if $backup.state != "Ready"}
                                &nbsp;
                            {else}
                                <a href="?cmd=clientarea&action=services&service={$service.id}&vpsid={$vpsid}&vpsdo=vmsnapshot&do=restore&backupid={$backup.id}&security_token={$security_token}" 
                                   onclick="return confirm('{$lang.suretorestorebkp}')" class="small_control small_backup_convert fs11">{$lang.revertthissnapshot}</a><br />
                            {/if}
                        </td>
                        <td width="60" class="text-right">
                            <a href="?cmd=clientarea&action=services&service={$service.id}&vpsid={$vpsid}&vpsdo=vmsnapshot&do=delete&backupid={$backup.id}&security_token={$security_token}" 
                               onclick="return confirm('{$lang.suretodeletebkp}')" class="small_control small_delete fs11">{$lang.delete}</a>
                        </td>
                    </tr>
                {foreachelse}
                    <tr>
                        <td colspan="7">{$lang.nothing}</td>
                    </tr>
                {/foreach}
            </table>
        {/if}
        <div class="clear"></div>
    {/if}
</div>
{include file="`$cloudstackdir`footer.cloud.tpl"}


