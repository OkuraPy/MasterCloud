<input value="{$details.os}" name="os" type="hidden" />
<input name="node" value="{$details.node}" type="hidden"  />
<input value="{$details.burstable_ram}" name="burstable_ram"  type="hidden"/>
<input value="{$details.guaranteed_ram}" name="guaranteed_ram"  type="hidden"/>
<input value="{$details.bw_limit}" name="bw_limit"  type="hidden"/>
<input value="{$details.disk_limit}" name="disk_limit" type="hidden" />

<div id="ipameditor">  
    {if $ipam}
        {literal}
            <script type="text/javascript">
                function loadIpamMGR() {
                    ajax_update('?cmd=module&module=ipam&action=accountseditor', {account_id: $('#account_id').val()}, '#ipameditor');
                }
                $(document).ready(loadIpamMGR);
            </script>
        {/literal}
    {/if}

    <table cellspacing="2" cellpadding="3" border="0" width="100%" >
        <tbody>
            <tr>
                <td width="150">{$lang.mainip}</td>
                <td><input value="{$details.ip}" name="ip" /></td>
            </tr>

            {if $details.additional_ip}
                {foreach from=$details.additional_ip item=ip}

                    <tr>
                        <td width="150">{$lang.addip}</td>
                        <td><input value="{$ip}" name="additional_ip[]" /></td>
                    </tr>
                {/foreach}
                <tr>
                    <td>{$lang.addip}</td>
                    <td><input value="" name="additional_ip[]" id="addip0" style="display:none" />
                        <a href="#" onclick="$(this).hide();
                                    $('#addip0').show();
                                    $('#addip00').show();
                                    return false;">{$lang.clicktoadd}</a>

                        <a href="#" onclick="$(this).hide();
                                    $('#addip1').show();
                                    return false;" id="addip00" style="display:none">{$lang.addmoreip}</a></td>
                </tr>
            {else}

                <tr>
                    <td>{$lang.addip}</td>
                    <td><input value="" name="additional_ip[]" id="addip0" style="display:none" />
                        <a href="#" onclick="$(this).hide();
                                    $('#addip0').show();
                                    $('#addip00').show();
                                    return false;">{$lang.clicktoadd}</a>

                        <a href="#" onclick="$(this).hide();
                                    $('#addip1').show();
                                    return false;" id="addip00" style="display:none">{$lang.addmoreip}</a></td>
                </tr>

            {/if}

            <tr style="display:none" id="addip1">
                <td>{$lang.addip}</td>
                <td><input value="" name="additional_ip[]" />  <a href="#" onclick="$(this).hide();
                            $('#addip2').show();
                            return false;">{$lang.addmoreip}</a></td>
            </tr>
            <tr style="display:none"  id="addip2">
                <td>{$lang.addip}</td>
                <td><input value="" name="additional_ip[]" />  <a href="#" onclick="$(this).hide();
                            $('#addip3').show();
                            return false;">{$lang.addmoreip}</a></td>
            </tr>
            <tr style="display:none"  id="addip3">
                <td>{$lang.addip}</td>
                <td><input value="" name="additional_ip[]" />  <a href="#" onclick="$(this).hide();
                            $('#addip4').show();
                            return false;">{$lang.addmoreip}</a></td>
            </tr>
            <tr style="display:none"  id="addip4">
                <td>{$lang.addip}</td>
                <td><input value="" name="additional_ip[]" />  <a href="#" onclick="$(this).hide();
                            $('#addip5').show();
                            return false;">{$lang.addmoreip}</a></td>
            </tr>
            <tr style="display:none"  id="addip5">
                <td>{$lang.addip}</td>
                <td><input value="" name="additional_ip[]" /> </td>
            </tr>
        </tbody>
    </table>
</div>
