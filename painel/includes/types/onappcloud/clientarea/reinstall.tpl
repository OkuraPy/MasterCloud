<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.rebuild}</h3>

    <div class="clear"></div>
</div>
<div class="content-bar">
    <div class="notice">
        <h3>{$lang.ReinstallVPS}</h3>
        {$lang.choose_template1} <font color="#cc0000">{$lang.choose_template2}</font>
    </div>
    {if $ostemplates}
        <script type="text/javascript" >

            {literal}
                var ostemplates = [];
                var windows = [];
                var distributions = {
                    linux: [],
                    freebsd: [],
                    windows: []
                };{/literal}
                var selected = '{$selectedos}';

            {foreach from=$ostemplates item=templa}{if $templa.swap=='false'}windows[{$templa[0]}] = true;{/if}{/foreach}

            {foreach from=$distributions.linux item=i key=k}distributions.linux[{$k}] = "{$i}";{/foreach}
            {foreach from=$distributions.freebsd item=i key=k}distributions.freebsd[{$k}] = "{$i}";{/foreach}
            {foreach from=$distributions.windows item=i key=k}distributions.windows[{$k}] = "{$i}";{/foreach}

            {foreach from=$ostemplates item=i key=k}ostemplates[{$k}] ={literal} {{/literal}id: "{$i[0]}", name: "{$i[1]} {if $i[2] && $i[2]>0}( {$i[2]|price:$currency} ){/if}", distro: "{$i.distro}", family: "{$i.family}"{literal}}{/literal};{/foreach}
            {literal}$(function() {
                    var filtered = false;
                    for (var i in ostemplates) {
                        var os = ostemplates[i];
                        if (os.id == selected) {
                            $('#virtual_machine_operating_system').val(os.family);
                            filtertemplates('family', false);
                            $('#virtual_machine_operating_system_distro').val(os.distro);
                            filtertemplates('distro', false);
                            $('#virtual_machine_template_id').val(os.id);
                            swapcheck(os.id);
                            filtered = true;
                            break;
                        }
                    }
                    if (!filtered) {
                        filtertemplates('family');
                        filtertemplates('distro');
                    }
                })
            {/literal}
        </script>


        <form action="" method="post">
            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
                <tr>
                    <td colspan="2">
                        <div class="control-group">
                            <label class="control-label">{$lang.os}</label>
                            <div class="controls">
                                <select required="required" name="CreateVM[operating_system]" id="virtual_machine_operating_system" onchange="filtertemplates('family')" style="min-width:250px;" >
                                    {if $distributions.linux}<option value="linux" selected="selected">Linux</option>{/if}
                                    {if $distributions.windows}<option value="windows">Windows</option>{/if}
                                    {if $distributions.freebsd}<option value="freebsd" >FreeBSD</option>{/if}
                                </select>
                            </div>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td colspan="2">
                        <div class="control-group">
                            <label class="control-label">{$lang.distribution}</label>
                            <div class="controls"><select required="required" name="CreateVM[operating_system_distro]" id="virtual_machine_operating_system_distro" 
                                                          onchange="filtertemplates('distro')"style="min-width:250px;" >
                                    {foreach from=$distributions.linux item=d}
                                        <option value="{$d}">{$d|ucfirst}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td colspan="2">
                        <div class="control-group">
                            <label class="control-label">{$lang.ostemplate}</label>
                            <div class="controls"><select style="min-width:250px;" required="required" name="os" id="virtual_machine_template_id" onchange="swapcheck($(this).val())" >
                                    {foreach from=$ostemplates item=templa}{if $templa.family=='linux' && $templa.distro==$distributions.linux[0]}
                                            <option value="{$templa[0]}" >{$templa[1]} {if $templa[2] && $templa[2]>0}( {$templa[2]|price:$currency:true} ){/if}</option>
                                        {/if}
                                    {/foreach}
                                </select>
                                <span id="ospreloader" style="display:none;"><img src="includes/types/onappcloud/images/ajax-loader.gif" style="margin-bottom: 9px;" /></span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr id="license_type">
                    <td colspan="2">
                        <div class="control-group">
                            <label class="control-label">{$lang.licensingtype}</label>
                            <div class="controls"><select style="min-width:250px;" required="required" name="CreateVM[license_type]" id="virtual_machine_license_type" onchange="licesetypecheck($(this).val())" >
                                    <option value="mak" {if $submit.CreateVM.license_type=="mak"}selected="selected"{/if}> MAK</option>
                                    <option value="kms" {if $submit.CreateVM.license_type=="kms"}selected="selected"{/if}> KMS</option>
                                    <option value="own" {if $submit.CreateVM.license_type=="own"}selected="selected"{/if}> {$lang.yourlicense}</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr id="license_own">
                    <td colspan="2">
                        <div class="control-group">
                            <label class="control-label">{$lang.licensekey}</label>
                            <div class="controls">
                                <input type="text" size="30" name="CreateVM[license_key]" class="styled" value="{$submit.CreateVM.license_key}"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr><td colspan="2" align="center" style="border-bottom:none"> <input type="submit" value="{$lang.ReinstallVPS}" name="changeos" class="blue" /></td></tr>
            </table>
            {securitytoken}</form>
            {else}
            <div style="color: red; text-align: center; width:850px"><strong>{$lang.ostemplates_error}</strong></div>
                    {/if}
            </div>