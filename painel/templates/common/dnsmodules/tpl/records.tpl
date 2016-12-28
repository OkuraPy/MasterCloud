<script type="text/javascript" src="{$type_dir}js/punycode.min.js"></script>
<script type="text/javascript" src="{$type_dir}js/script.js"></script>
{literal}
    <script type="text/javascript">
        function ask() {
            if (!confirm('{/literal}{$lang.confirm_delrecord}{literal}'))
                return false;
        }
    </script>
{/literal}

<form action="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=dns_manage&domain_id={$domid}" method="POST">
    {foreach from=$record_types item=ids key=type}
        {if $type=='SOA'}
            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="display"  style="margin-bottom:15px">
                <col class="col-name" />
                <col class="col-ttl" />
                <col class="col-priority" />
                <col class="col-type" />
                <col class="col-content" />
                <col class="col-action" />
                <thead>
                    <tr>
                        <th colspan="6">{$lang.soarecord}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>{$lang.name}</th>
                        <th>{$lang.priority}</th>
                        <th>TTL</th>
                        <th>{$lang.type}</th>
                        <th>{$lang.data}</th>
                        <th></th>
                    </tr>
                </tbody>
                <tbody>
                    {foreach from=$records item=record}
                        {if in_array($record.id, $ids)}
                            <tr style="vertical-align:top">
                                <td><span class="overflow-e rr-name">{$record.name}</span></td>
                                <td>{$record.priority}</td>
                                <td>{$record.ttl}</td>
                                <td>{$record.type}</td>
                                <td align="left" style="padding-left:1em"><span class="rr-content">{$record.content[0]} {$record.content[1]}</span> (<br />
                                    <div style="min-width: 90px; padding-right: 0.5em;text-align: right;" class="clear left">{$record.content[2]};</div><div> {$lang.serial}</div>
                                    <div style="min-width: 90px; padding-right: 0.5em;text-align: right;" class="clear left">{$record.content[3]};</div><div> {$lang.refresh}</div>
                                    <div style="min-width: 90px; padding-right: 0.5em;text-align: right;" class="clear left">{$record.content[4]};</div><div> {$lang.retry}</div>
                                    <div style="min-width: 90px; padding-right: 0.5em;text-align: right;" class="clear left">{$record.content[5]};</div><div> {$lang.expire}</div>
                                    <div style="min-width: 90px; padding-right: 0.5em;text-align: right;" class="clear left">{$record.content[6]}</div><div>{$lang.minimumttl}</div>
                                    &nbsp;&nbsp;&nbsp;)
                                </td>
                                <td><a class="fs11" href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=edit_record&domain_id={$domid}&record={$record.id}" title="{$lang.edit}">{$lang.edit}</a> &nbsp;&nbsp;</td>
                            </tr>
                        {/if}
                    {/foreach}
                </tbody>
            </table>
        {/if}
    {/foreach}
    {foreach from=$record_types item=ids key=type}
        {if $type!='SOA'}
            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="display" style="margin-bottom:15px">
                <col class="col-name" />
                <col class="col-ttl" />
                <col class="col-priority" />
                <col class="col-type" />
                <col class="col-content" />
                <col class="col-action" />
                <thead><tr><th align="left" colspan="6">{$type} {$lang.records}</th></tr></thead>
                <tbody>
                    <tr>
                        <th >{$lang.name}</th>
                        <th >{$lang.priority}</th>
                        <th >TTL</th>
                        <th >{$lang.type}</th>
                        <th>{$lang.data}</th>
                        <th ></th>
                    </tr>
                    {foreach from=$records item=record name=rc}
                        {if in_array($record.id, $ids)}
                            <tr  {if  $smarty.foreach.rc.index%2 == 0}class="even"{else}class="odd"{/if}>
                                <td><span class="overflow-e rr-name">{$record.name}</span></td>
                                <td>{$record.priority}</td>
                                <td>{$record.ttl}</td>
                                <td>{$record.type}</td>
                                <td align="left">
                                    <span class="overflow-e rr-content">
                                        {if is_array($record.content)}
                                            {foreach from=$record.content item=content name=row}
                                                {$content}&nbsp;
                                            {/foreach}
                                        {else}
                                            {$record.content}
                                        {/if}
                                    </span>
                                </td>
                                <td style="text-align: right">
                                    <div class="dns-actions">
                                        {if in_array($record.type,$supported_types) && isset($record.id)}
                                            <a class="fs11 " href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=edit_record&domain_id={$domid}&record={$record.id}" title="{$lang.edit}">{$lang.edit}</a>
                                            <a class="fs11 lmore " href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=dns_manage&domain_id={$domid}&delete={$record.id}" onclick="return ask()" title="{$lang.delete}">{$lang.delete}</a>
                                        {else}
                                            &nbsp;
                                        {/if}
                                    </div>
                                </td>
                            </tr>
                        {/if}
                    {/foreach}
                    <tr>
                        <td colspan="6" style="text-align:right"><a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=add_record&dom={$domid}&type={$type}" class="fs11">{$lang.addnew} {$lang.record}</a></td>
                    </tr>
                </tbody>

            </table>
        {/if}
    {/foreach}

    <div style="margin-top:2em">
        <div class="pull-left form-horizontal">
            {$lang.newrecord}
            <select id="add_record">
                {foreach from=$supported_types item=stype}
                    <option  value="{$stype}" >{$stype}</option>
                {/foreach}
            </select>
            <a class="btn btn-primary" href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=add_record&dom={$domid}&type={$stype}"  >{$lang.Add}</a>
        </div>
        <div class="pull-right form-horizontal">
            <a class="btn btn-default" href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/"  > &laquo; {$lang.back}</a>
        </div>
        <div class="clear"></div>
    </div>

</form>