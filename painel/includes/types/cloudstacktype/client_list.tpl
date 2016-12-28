<link media="all" type="text/css" rel="stylesheet" href="includes/types/cloudstacktype/clientarea/styles3.css" />
<script type="text/javascript" src="includes/types/cloudstacktype/clientarea/scripts.js"></script>
<a href="?cmd=clientarea&amp;action=services" id="currentlist" style="display:none" updater="#updater"></a>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tonapp">

    <thead>
        <tr>
            <th width="66"></th>
            <th>{$lang.service}</th>
            <th width="100"></th>
            <th width="70">{$lang.diskspace}</th>
            <th width="70">{$lang.memory}</th>
            <th width="80">{$lang.price}</th>
            <th width="80">{$lang.status}</th>
        </tr>
    </thead>
    <tbody id="updater">
        {*debug output=ajax like=services*}
        {foreach from=$services item=service name=foo}
            <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if} >
                <td {if $service.options.option10 == 'Single Machine, autocreation' && $service.status=='Active'}class="load_vm_status" data-sid="{$service.id}"{/if}>
                    {include file="../../includes/types/cloudstacktype/clientarea/ajax.vmstatus.tpl"}
                </td>
                <td >
                    <a href="?cmd=clientarea&amp;action={$action}&amp;service={$service.id}" style="text-decoration:none">
                        <strong>{$service.name}</strong>
                        {if $service.domain}<br /><small>{$service.domain}</small>{/if}
                    </a>
                </td>
                <td  align="center">{if $service.status=='Active' && $service.vpsip}{$service.vpsip}{else}-{/if}</td>

                <td>{$service.disk_limit} GB</td>
                <td>{$service.mem_limit} MB</td>

                <td>{$service.total|price:$currency} <span class="fs11">{$lang[$service.billingcycle]}</span></td>
                <td ><span class="{$service.status}">{$lang[$service.status]}</span></td>
            </tr>
        {/foreach}
    </tbody>

</table>
