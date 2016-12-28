{include file="`$cloudstackdir`header.cloud.tpl"}
<script type="text/javascript" src="includes/types/cloudstacktype/js/progress.js"></script>
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.createnewserver}</h3>
    <div class="clear"></div>
</div>
<div id="progressbar" style="padding:10px;display:none;"></div>
<div class="content-bar nopadding" style="position:relative">
    <div class="resources_box">
        <strong><em>{$lang.availableresources}</em></strong>
        <table cellspacing="0" cellpadding="0" width="100%" class="ttable">
            <tbody>
                <tr>
                    <td width="70" align="right">{$lang.memory}</td>
                    <td ><b {if $CreateVM.limits.mem<1}style="color:red"{/if}>{$CreateVM.limits.mem} MB</b></td>
                </tr>
                <tr>
                    <td width="70" align="right">{$lang.cpucores}</td>
                    <td ><b {if $CreateVM.limits.cpu<1}style="color:red"{/if}>{$CreateVM.limits.cpu}</b></td>
                </tr>
                {if !$opt_vcpu}
                <tr>
                    <td width="70" align="right">{$lang.cpuspeed}</td>
                    <td ><b {if $CreateVM.limits.cpus<1}style="color:red"{/if}>{$CreateVM.limits.cpus} MHz</b></td>
                </tr>
                {/if}
                {if $CreateVM.totals.disk}
                <tr>
                    <td width="70" align="right">{$lang.storage}</td>
                    <td ><b id="storage_limit_indicator" {if $CreateVM.limits.disk<1}style="color:red"{/if}>{$CreateVM.limits.disk} GB</b></td>
                </tr>
                {/if}
                {if !$advanced_network}
                    <tr>
                        <td width="70" align="right">{$lang.ips}</td>
                        <td ><b {if $CreateVM.limits.ips<1}style="color:red"{/if}>{$CreateVM.limits.ips}</b></td>
                    </tr>
                {/if}
            </tbody></table>
        <div style="text-align: right"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=resources" class="fs11">{$lang.increaselimits}</a></div>
    </div>
    <form method="post" action="" id="cloudstackbuild" class="create-vm-form">
        <input type="hidden" value="createmachine" name="make" />
        {if !$CreateVM.hv_zones}<input type="hidden" name="CreateVM[hypervisor_group_id]" value="{$CreateVM.hv_zone_id}"/>
        {/if}
        {if !$CreateVM.network_zones}<input type="hidden" name="CreateVM[primary_network_group_id]" value="{$CreateVM.network_zone_id}"/>
        {/if}
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
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
            <tr>
                <td colspan="2">
                    <span class="slabel">{$lang.hostname}</span>
                    <input type="text" size="30" required="required" name="CreateVM[hostname]"  
                           class="styled" value="{$submit.CreateVM.hostname}" 
                           autocomplete="off"
                           title="hostname can contain ASCII letters 'a' through 'z', the digits '0' through '9', and the hyphen ('-'), must be between 1 and 63 characters long, and can't start or end with \"-\" and can't start with digit"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span class="slabel">{$lang.ostemplate}</span>
                    <select style="min-width:250px;" required="required" name="CreateVM[template_id]" id="virtual_machine_template_id" onchange="oschange(this);" >
                        {foreach from=$CreateVM.ostemplates item=templa}
                            <option value="{$templa[0]}" {if $templa[3]>0 && $templa[2]=='template'}data-size="{$templa[3]}"{if $CreateVM.vmlimits.disk < $templa[3]} disabled="disabled"{/if}{/if}
                                    {if $submit.CreateVM.template_id==$templa[0] && ($templa[3]<$CreateVM.vmlimits.disk || $templa[2]!='template')}selected="selected"{/if}>
                                {$templa[1]} 
                                {if ($templa[4] && $templa[4]>0) || ($templa[3]>0 && $templa[2]=='template')} (
                                    {if $templa[4] && $templa[4]>0} {$templa[4]|price:$currency} 
                                    {/if}
                                    {if $templa[3]>0 && $templa[2]=='template'} {$templa[3]}GB
                                    {/if}
                                ){/if}
                            </option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            {if $keys}
            <tr>
                <td colspan="2">
                    <span class="slabel">SSH Key</span>
                     <select name="CreateVM[keypair]" id="virtual_machine_keypair"  style="min-width:250px;" >
                        <option value="" {if $submit.CreateVM.keypair==''}selected="selected"{/if}> - </option>
                        {foreach from=$keys item=key}
                            <option {if $submit.CreateVM.keypair==$key.name}selected="selected"{/if}>{$key.name|escape}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            {/if}
            <tr>
                <td colspan="2">
                    <div class="input-with-slider">
                        <span class="slabel">{$lang.RAM}</span>
                        <input type="text" size="4" required="required" name="CreateVM[memory]" class="styled" value="{if $submit.CreateVM.memory}{$submit.CreateVM.memory}{else}{$CreateVM.vmlimits.mem}{/if}" id="virtual_machine_memory"/>
                        MB
                        <div class="slider" max="{$CreateVM.vmlimits.mem}" min="4" step="4" target="#virtual_machine_memory"></div>
                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <div class="input-with-slider">
                        <span class="slabel">{$lang.cpucores}</span>
                        <input type="text" size="4" required="required" name="CreateVM[cpus]" class="styled" value="{if $submit.CreateVM.cpus}{$submit.CreateVM.cpus}{else}{$CreateVM.vmlimits.cpu}{/if}" id="virtual_machine_cpus"/>

                        <div class="slider" max="{$CreateVM.vmlimits.cpu}" min="1" step="1" total="{$CreateVM.limits.cpus}" divide="#virtual_machine_cpu_shares" target="#virtual_machine_cpus"></div>
                    </div>

                </td>

            </tr>
            {if $CreateVM.vmlimits.cpus_pc}
            <tr>
                <td colspan="2">
                    <div class="input-with-slider">
                        <span class="slabel">{$lang.cpuspeed}</span>
                        <input type="text" size="4" required="required" name="CreateVM[cpu_shares]" class="styled" value="{if $submit.CreateVM.cpu_shares}{$submit.CreateVM.cpu_shares}{else}{$CreateVM.vmlimits.cpus_default}{/if}" id="virtual_machine_cpu_shares"/>
                        MHz
                        <div class="slider" max="{$CreateVM.vmlimits.cpus_default}" up-limit="{$CreateVM.vmlimits.cpus_pc}" min="100" step="1" target="#virtual_machine_cpu_shares"></div>
                    </div>
                </td>
            </tr>
            {/if}
            {if $CreateVM.storage_tiers}
                <tr>
                    <td colspan="2"><span class="slabel">{$lang.storge_type}</span>
                        <select name="CreateVM[storage_tier]" id="virtual_machine_storage_tier"  style="min-width:250px;" >
                            {foreach from=$CreateVM.storage_tiers item=tier key=tk}
                                {if $tier.enabled}
                                <option value="{$tk}" {if $submit.CreateVM.storage_tier==$tk}selected="selected"{/if} 
                                        {if $CreateVM.vmlimits[$tier.variable] < 1}disabled="disabled"{/if} 
                                        data-vmtotal="{$CreateVM.vmlimits[$tier.variable]}"
                                        data-total="{$CreateVM.limits[$tier.variable]}">
                                    {$tier.name} - {$CreateVM.limits[$tier.variable]}GB available
                                </option>
                                {/if}
                            {/foreach}
                        </select>
                    </td>
                </tr>
            {/if}
            <tr>
                <td colspan="2" id="disk-row">
                    <div class="input-with-slider">
                        <span class="slabel">{$lang.datadisk_limit}</span>
                        <input type="text" size="4" required="required" name="CreateVM[primary_disk_size]" class="styled" 
                               value="{if $submit.CreateVM.primary_disk_size}{$submit.CreateVM.primary_disk_size}{elseif $forms.disk.initialval}{$forms.disk.initialval}{else}{$CreateVM.vmlimits.disk}{/if}" 
                               id="virtual_machine_cpu_primary_disk_size"/>
                        GB
                        <div class="slider" max='{$CreateVM.vmlimits.disk}' total="{$CreateVM.limits.disk}" 
                             min='{$forms.disk.minvalue}' step='{$forms.disk.step}' target="#virtual_machine_cpu_primary_disk_size"></div>
                    </div>
                    <div class="clear"></div>
                </td>
            </tr>

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

            {if $service.options.offerha && $service.options.primarystorage != 'local' }
                <tr>
                    <td colspan="2"><span class="slabel">{$lang.haenabled}</span>
                        <input name="CreateVM[enable_ha]" id="virtual_machine_enable_ha" value="1" type="checkbox"  {if $submit.CreateVM.enable_ha}checked="checked"{/if} />
                    </td>
                </tr>
            {/if}

            {if $metered_variables}
                <tr>
                    <td colspan="2"><span class="slabel">{$lang.priceperhour}</span>
                        <span class="slabel">{$lang.On} {$currency.sign}<span id="hourly_price_on">0.00</span>{$currency.code}</span>
                        <span class="slabel">{$lang.Off} {$currency.sign}<span id="hourly_price_off">0.00</span>{$currency.code}</span>
                        {literal}
                            <script type="text/javascript">
                            var mvars = {};
                            {/literal}{*}
                            {*}{foreach from=$metered_variables item=v}{*}
                                {*}{foreach from=$v.prices item=p}{*}
                                    {*}{if $p.qty <= 1 && $p.qty_max >= 1}{*}
                                        {*}mvars['{$v.variable_name}'] = '{$p.price}';{*}
                                    {*}{/if}{*}
                                {*}{/foreach}{*}
                            {*}{/foreach}

                            {literal}
                                function update_metered_totals() {
                                    var off = $('#hourly_price_off'),
                                        on = $('#hourly_price_on'),
                                        total = 0.0,
                                        maxi = 2,
                                        mvar = {};
                                    for(var x in mvars){
                                        var d = mvars[x].split('.');
                                        if(d[1].length){
                                            var i = d[1].length;
                                            while(d[1].charAt(--i)){
                                                if(d[1].charAt(i) != '0')
                                                    break;
                                            }
                                            i++;
                                            if(maxi < i)
                                                maxi = i;
                                        }
                                        mvar[x] = parseFloat(mvars[x]);
                                    }
                                    if (mvar.memory) {
                                        total += parseInt($('#virtual_machine_memory').val()) * mvar.memory;
                                    }
                                    if (mvar.cpus) {
                                        total += parseInt($('#virtual_machine_cpus').val()) * mvar.cpus;
                                    }
                                    if (mvar.cpu_shares) {
                                        total += parseInt($('#virtual_machine_cpu_shares').val()) * mvar.cpu_shares;
                                    }
                                    if (mvar.ip_address) {
                                        total += 1 * mvar.ip_address;
                                    }
                                    if (mvar.allocated_vm) {
                                         total += 1 * mvar.allocated_vm;
                                    }
                                    if (mvar.volume) {
                                        total += parseInt($('#virtual_machine_cpu_primary_disk_size').val()) * mvar.volume
                                    }
                                    var precision = Math.pow(10, maxi);
                                    off.text(Math.round(total * precision) / precision);
                                    
                                    if (mvar.running_vm) {
                                        total += 1 * mvar.running_vm;
                                    }
                                    on.text(Math.round(total * precision) / precision);
                                }

                                if (typeof('appendLoader') == 'function') {
                                    appendLoader('update_metered_totals');
                                } else {
                                    $(document).ready(function() {
                                        update_metered_totals();
                                    });
                                }
                            </script>
                        {/literal}
                    </td>
                </tr>
            {/if}

            <tr>
                <td align="center" style="border:none" colspan="2">
                    <input type="submit" value="{$lang.CreateVM}" style="font-weight:bold" class=" blue" />
                </td>
            </tr>
        </table>

        <script type="text/javascript">
            {literal}
                var intervalx = undefined;
                $('#progressbar').on("positionChanged", function (e) {
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
                   intervalx= setInterval(function () {
				$('#progressbar').progressbar('stepIt');
				
			}, 450);
                }
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

                    $('#virtual_machine_storage_tier').change(function(){
                        var self = $(this),
                            slder = $('#virtual_machine_cpu_primary_disk_size').next(),
                            max = parseInt(self.find(':selected').data('vmtotal'));
                        
                        slder.attr('max', max).data('slider').option('max', max)
                        slder.data('slider').option('value', parseInt(slder.data('slider').option('value')));
                    }).change();
                });
            {/literal}
        </script>

        {securitytoken}
    </form>
</div>
{include file="`$cloudstackdir`footer.cloud.tpl"}