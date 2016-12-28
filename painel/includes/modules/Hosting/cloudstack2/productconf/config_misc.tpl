<table border="0" cellspacing="0" width="100%" cellpadding="6">
    <tr><td colspan="2" class="onapp-preloader" style=""><img src="templates/default/img/ajax-loader3.gif"> Fetching data from CloudStack, please wait...</td></tr>
    <tr>
        <td width="160">
            <label>Auto reset root pasword</label>
        </td>
        <td>
            <input type="radio" value="1" name="options[autopass]" {if $default.autopass=='1'}checked="checked"{/if}> {$lang.yes}, try to obtain root password for VM as soon as it is created. <br />
            <input type="radio" value="0" name="options[autopass]" {if !$default.autopass || $default.autopass=='0'}checked="checked"{/if}> {$lang.no}, clients should request root password manualy. <br />
        </td>
    </tr>
    <tr>
        <td width="160">
            <label>Dynamic Scaling</label>
        </td>
        <td>
            <div id="dynamicscaling" class="formcheckerbox">
                <input type="radio" value="1" name="options[dynamicscaling]" {if $default.dynamicscaling=='1'}checked="checked"{/if} > 
                {$lang.yes}, allows updating CPU/RAM for a running VM avoiding any downtime. <br />
                <input type="radio" value="0" name="options[dynamicscaling]" {if !$default.dynamicscaling || $default.dynamicscaling=='0'}checked="checked"{/if} > 
                {$lang.no}, updating CPU/RAM will restart the VM with increased resources. <br />
            </div>
            <span class="fs11"> <input type="checkbox" class="formchecker" rel="dynamicscaling" />Allow to select by client during checkout</span>
        </td>
    </tr>
    <tr>
        <td><label>Custom Cloud Name: </label></td>
        <td> 
            <span><input type="checkbox" class="formchecker" rel="cloudname"/> Enable</span>
            <a class="vtip_description" title="Allow selecting custom name for this cloud. This will affect domain and network name"></a> 
        </td>
    </tr>
    <tr><td colspan="2">&nbsp;</td></tr>

    <tr class="odesc_ odesc_cloud_vm">
        <td colspan="2" >
            <b>Limit single server data disk size: 
                <a class="vtip_description" title="You can limit maximum data disk space client can create for single machine in his cloud. It allows controll over storage slider in client area"></a>
            </b>
        </td>
    </tr>
    <tr class="odesc_ odesc_cloud_vm">
        <td width="160" align="right">Enable:</td>
        <td>
            <span><input type="checkbox" class="formchecker" rel="limitvmdatadisk"/></span>
        </td>
    </tr>
</table>
<div class="nav-er"  id="step-5">
    <a href="#" class="prev-step">Previous step</a>
    <a href="#" class="next-step">Next step</a>
</div>