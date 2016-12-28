<div class="odesc_ odesc_single_vm pdx">Your client Virtual Machine will be provisioned with limits configured here</div>
<div class="odesc_ odesc_cloud_vm pdx">Your client will be able to use resource with limits configured here</div>
<table border="0" cellspacing="0" cellpadding="6" width="100%" >
    <tr><td colspan="2" class="onapp-preloader" style=""><img src="templates/default/img/ajax-loader3.gif"> Fetching data from CloudStack, please wait...</td></tr>

    <tr>
        <td width="160"><label >Zone</label></td>
        <td ><div id="option23container" class="tofetch"><select name="options[option23][]" id="option23" multiple="multiple" class="multi">
                    <option value="Auto-Assign" {if in_array('Auto-Assign',$default.option23)}selected="selected"{/if}>Auto-Assign</option>
                    {foreach from=$default.option23 item=vx}
                        {if $vx=='Auto-Assign'}{continue}
                        {/if}
                        <option value="{$vx}" selected="selected">{$vx}</option>
                    {/foreach} 
                </select></div><div class="clear"></div>
            <span class="fs11"> <input type="checkbox" class="formchecker"  rel="hypervisorzone" />Allow to select by client during checkout</span>
        </td>
    </tr>
    <tr class="odesc_">
        <td width="160"><label >Max Virtual Machines</label></td>
        <td><input type="text" size="3" name="options[option14]" value="{$default.option14}" id="option14"/></td>
    </tr>

</table>
<div class="nav-er"  id="step-2">
    <a href="#" class="prev-step">Previous step</a>
    <a href="#" class="next-step">Next step</a>
</div>