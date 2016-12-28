{if $vpsdo=='upgrade'}
    {include file="`$cloudstackdir`header.cloud.tpl"}
    {include file="`$cloudstackdir`upgrade.tpl"}
    {include file="`$cloudstackdir`footer.cloud.tpl"}

{else}

    {include file="`$cloudstackdir`header.cloud.tpl"}
    <div class="header-bar">
        <h3 class="resources hasicon">{$lang.reslabel}</h3>

        <div class="clear"></div>
    </div>
    <div class="content-bar ">
        <div class="notice">{$lang.resnotice} </div>
        <table cellspacing="0" cellpadding="0" width="100%" class="ttable">
            <thead>
                <tr>
                    <th  width="120"></th>
                    <th>{$lang.Usage}</th>
                    <th width="120">{$lang.Totallabel}</th>
                    <th width="120">{$lang.Leftlabel}</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td><b>{$lang.storage}</b> </td>
                    <td>
                        <div class="progress-bar">
                            <div class="bar {if $FastStat.disk_percent>90}red{else}green{/if}" style="width:{$FastStat.disk_percent}%"></div>
                        </div>
                    </td>
                    <td class="bigger">{$FastStat.disk_avail} GB</td>
                    <td class="bigger">{$FastStat.disk_free} GB</td>
                </tr>

                <tr>
                    <td><b>{$lang.ipcount}</b></td>
                    <td>
                        <div class="progress-bar">
                            <div class="bar {if $FastStat.ips_percent>90}red{else}green{/if}"  style="width:{$FastStat.ips_percent}%"></div>
                        </div>
                    </td>
                    <td class="bigger">{$FastStat.ips_avail}</td>
                    <td class="bigger">{$FastStat.ips_free}</td>
                </tr>
                {if $FastStat.vms_avail || $FastStat.vms_used}
                    <tr class="lst">
                        <td><b>{$lang.vpslimit}</b></td>
                        <td>
                            <div class="progress-bar">
                                <div class="bar {if $FastStat.vms_percent>90}red{else}green{/if}"  style="width:{$FastStat.vms_percent}%"></div>
                            </div>
                        </td>
                        <td class="bigger">{$FastStat.vms_avail}</td>
                        <td class="bigger">{$FastStat.vms_free}</td>
                    </tr>
                {/if}
            </tbody></table>
        <div style="padding:0px 10px 10px;text-align: right">
            <input type="submit" value="{$lang.UpgradeDowngrade}" class="blue" onclick="window.location = '?cmd=clientarea&action=services&service={$service.id}&vpsdo=upgrade'"/>
        </div>
    </div>
    {include file="`$cloudstackdir`footer.cloud.tpl"}

{/if}