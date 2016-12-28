{include file="`$cloudstackdir`header.cloud.tpl"}
<script type="text/javascript" src="includes/types/cloudstacktype/js/progress.js"></script>
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.createnewserver}</h3>
    <div class="clear"></div>
</div>

<div id="progressbar" style="padding:10px;display:none;"></div>
<div class="content-bar nopadding" style="position:relative">
    <form method="post" action="" id="cloudstackbuild">
        <input type="hidden" value="createmachine" name="make" />
        {if !$CreateVM.hv_zones}<input type="hidden" name="CreateVM[hypervisor_group_id]" value="{$CreateVM.hv_zone_id}"/>
        {/if}
        {if !$CreateVM.network_zones}<input type="hidden" name="CreateVM[primary_network_group_id]" value="{$CreateVM.network_zone_id}"/>
        {/if}
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
            <tr>
                <td colspan="2" id="flavormgr">
            <center><img src="includes/types/cloudstacktype/images/ajax-loader-big.GIF" alt=""/></center>
            </td>
            </tr>
            {if $CreateVM.hv_zones}
                <tr>
                    <td colspan="2"><span class="slabel">{$lang.Zone}</span>
                        <select name="CreateVM[hypervisor_group_id]" id="virtual_machine_hypervisor_zone_id"  style="min-width:250px;" >
                            <option value="0" {if $submit.CreateVM.hypervisor_group_id=='0' || !$submit.CreateVM.hypervisor_group_id}selected="selected"{/if}>{$lang.firstavailable}</option>
                            {foreach from=$CreateVM.hv_zones item=zone}
                                <option value="{$zone[0]}" {if $submit.CreateVM.hypervisor_zone_id==$zone[0]}selected="selected"{/if}>{$zone[1]}</option>
                            {/foreach}
                        </select></td>
                </tr>
            {/if}
            {if $CreateVM.network_zones}
                <tr>
                    <td colspan="2"><span class="slabel">{$lang.networkzone}</span>
                        <select name="CreateVM[primary_network_group_id]" id="virtual_machine_primary_network_group_id"  style="min-width:250px;" >
                            <option value="0" {if $submit.CreateVM.primary_network_group_id=='0' || !$submit.CreateVM.primary_network_group_id}selected="selected"{/if}>{$lang.autoassign}</option>
                            {foreach from=$CreateVM.network_zones item=zone}
                                <option value="{$zone[0]}" {if $submit.CreateVM.network_zone_id==$zone[0]}selected="selected"{/if}>{$zone[1]}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
            {/if}
            <tr>
                <td colspan="2">
                    <span class="slabel">{$lang.hostname}</span>
                    <input type="text" size="30" required="required" name="CreateVM[hostname]"  class="styled" value="{$submit.CreateVM.hostname}" title="hostname can contain ASCII letters 'a' through 'z', the digits '0' through '9', and the hyphen ('-'), must be between 1 and 63 characters long, and can't start or end with \"-\" and can't start with digit"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span class="slabel">{$lang.ostemplate}</span>
                    <select style="min-width:250px;" required="required" name="CreateVM[template_id]" id="virtual_machine_template_id" onchange="oschange(this);" >
                        {foreach from=$CreateVM.ostemplates item=templa}
                            <option value="{$templa[0]}" {if $templa[3]>0 && $templa[2]=='template'}data-size="{$templa[3]}"{/if}{if $submit.CreateVM.template_id==$templa[0]}selected="selected"{/if}>
                                {$templa[1]} 
                                {if $templa[4] && $templa[4]>0} ({$templa[4]|price:$currency} )
                                {/if}
                            </option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            {if $CreateVM.vmlimits.disk}
                {if $CreateVM.storage_tags}
                    <tr>
                        <td colspan="2"><span class="slabel">{$lang.storge_type}</span>
                            <select name="storage_flavor" id="virtual_machine_storage_flavor"  style="min-width:250px;" >
                                {foreach from=$CreateVM.storage_tags item=tag}
                                    <option value="{$tag.tag}" {if $submit.CreateVM.data_storage_tag==$tag.tag}selected="selected"{/if}>
                                        {$tag.name}
                                        {if $tag.price}{$tag.price|price:$currency:true:true:true:4} GB/hour{/if}
                                    </option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                {/if}

                <tr>
                    <td colspan="2" id="disk-row">
                        <div class='input-with-slider'>
                            <span class="slabel">{$lang.datadisk_limit}</span>
                            <input type="text" size="4" required="required" name="CreateVM[primary_disk_size]" class="styled" 
                                   value="{if $submit.CreateVM.primary_disk_size}{$submit.CreateVM.primary_disk_size}{else}{$forms.disk.initialval}{/if}" 
                                   id="virtual_machine_cpu_primary_disk_size"/>
                            GB
                            <div class='slider' max='{$CreateVM.vmlimits.disk}' up-limit="{$CreateVM.vmlimits.disk}" 
                                 min='{$forms.disk.minvalue}' step='{$forms.disk.step}' target='#virtual_machine_cpu_primary_disk_size'></div>
                        </div>
                        <div class="clear"></div>
                    </td>
                </tr>
            {/if}
            <tr>
                <td colspan="2" id="disk-row">
                    <div class='input-with-slider'>
                        <span class="slabel">How many of these instances would you like?</span>
                        <input type="text" size="4" required="required" name="CreateVM[instances]" class="styled" value="{if $submit.CreateVM.instances}{$submit.CreateVM.instances}{else}1{/if}" id="virtual_machine_instances"/>
                        <div class="slider" {if $CreateVM.limits.disk}total='{$CreateVM.limits.disk}' divide="#virtual_machine_cpu_primary_disk_size"{/if}
                             max="{$CreateVM.limits.instances}" min="1" step="1"   target="#virtual_machine_instances"></div>
                    </div>
                    <div class="clear"></div>
                </td>
            </tr>
            <tr>
                <td align="center" style="border:none" colspan="2">
                    <input type="submit" value="{$lang.CreateVM}" style="font-weight:bold" class=" blue" />
                </td>
            </tr>
        </table>

        <script type="text/javascript">
            {literal}
                var intervalx = undefined;
                $('#progressbar').on("positionChanged", function(e) {
                    if (e.percent >= 100) {
                        clearInterval(intervalx);
                        intervalx = undefined;
                    }
                });
                function initprogress() {
                    $('.content-bar').hide();
                    $('#progressbar').addClass('content-bar').show().progressbar({
                        maximum: 100,
                        warningMarker: 110,
                        dangerMarker: 110,
                        step: 1
                    });
                    intervalx = setInterval(function() {
                        $('#progressbar').progressbar('stepIt');

                    }, 450);
                }
                function oschange(that) {
                    return false;
                }
                $.get('?cmd=flavormanager&selected={/literal}{$submit.flavor_id}{literal}', function(data) {
                    $('#flavormgr').html(data);
                });
                $(document).ready(function() {
                    $('#cloudstackbuild').submit(initprogress);

                    init_sliders();
                    $('input[name="CreateVM[hostname]"]').unbind('keyup input').bind('keyup input',function(){
                        var that = $(this),
                            val = that.val(),
                            btn = $('input[type="submit"]');
                        if(val.length < 1 || val.length > 63 || val.match(/[^\da-zA-Z\-]|^[^a-zA-Z]|[^a-zA-Z\d]$/) != null){
                            that.parent().addClass('error');
                            btn.prop('disabled', true).fadeTo(200,0.5);
                        }else{
                            btn.prop('disabled', false).fadeTo(200,1);
                            that.parent().removeClass('error');
                        }
                    }).keyup().parent().addClass('control-group');
              
                });
            {/literal}
        </script>
        <style> 
            {literal}
                span.slabel {
                    color: #505050;
                    display: block;
                    float: left;
                    font: bold 14px helvetica,arial,sans-serif;
                    overflow: hidden;
                    padding: 7px 5px 7px 10px;
                    width: 370px;
                }
            {/literal}
        </style>
        {securitytoken}
    </form>
</div>
{include file="`$cloudstackdir`footer.cloud.tpl"}
