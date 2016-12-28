{if $make=='getonappval' && $valx}
    {if $valx=='option23'}   {* hypervisor zone  *}

            <select id="option23" multiple class="multi" name="options[option23][]">
                <option value="Auto-Assign" {if in_array('Auto-Assign',$defval)}selected="selected"{/if}>Auto-Assign</option>
                {foreach from=$modvalues item=value}
                    <option value="{$value[0]}" {if in_array($value[0],$defval)}selected="selected"{/if}>{$value[1]}</option>
                {/foreach}
            </select>

    {elseif $valx=='primarystorage'}    {*  primary storage  *}
        <tr>
            <td width="160" style="vertical-align: top;">
                <label >
                    Storage tags <span class="tier2storage">- Tier 1</span>
                    <a class="vtip_description" title="Select storage tags that will be used when deploying VMs"></a>
                </label>
            </td>
            <td>
                <div id="primarystoragecontainer" class="clearfix left">
                    <span>Primary storage (ROOT)</span><br/>
                    <select id="primarystorage" multiple class="multi" name="options[primarystorage][]" style="min-width: 150px">
                        <option value="Auto-Assign" {if in_array('Auto-Assign',$defopt.primarystorage)}selected="selected"{/if}>Auto-Assign</option>
                        {foreach from=$modvalues item=value}
                            <option value="{$value.name}" {if in_array($value.name,$defopt.primarystorage)}selected="selected"{/if}>{$value.name}</option>
                        {/foreach}
                    </select> 
                </div>
                <div id="datastoragecontainer" class="tofetch2 clearfix left" style="margin: 0 0 0 25px">
                    <span>Data storage (DATA)</span><br/>
                    <select id="datastorage" multiple class="multi" name="options[datastorage][]" style="min-width: 150px">
                        <option value="Auto-Assign" {if in_array('Auto-Assign',$defopt.datastorage)}selected="selected"{/if}>Auto-Assign</option>
                        {foreach from=$modvalues item=value}
                            <option value="{$value.name}" {if in_array($value.name,$defopt.datastorage)}selected="selected"{/if}>{$value.name}</option>
                        {/foreach}
                    </select> 
                </div>
                <div class="clear"></div>
            </td>
        </tr>
        <tr class="tier2storage">
            <td width="160" style="vertical-align: top;">
                <label >
                    Storage tags - Tier 2
                    <a class="vtip_description" title="Select storage tags that will be used when deploying VMs"></a>
                </label>
            </td>
            <td>
                <div id="primarystoragecontainer" class="clearfix left">
                    <span>Primary storage (ROOT)</span><br/>
                    <select id="primarystorage" multiple class="multi" name="options[primarystorage2][]" style="min-width: 150px">
                        <option value="Auto-Assign" {if in_array('Auto-Assign',$defopt.primarystorage2)}selected="selected"{/if}>Auto-Assign</option>
                        {foreach from=$modvalues item=value}
                            <option value="{$value.name}" {if in_array($value.name,$defopt.primarystorage2)}selected="selected"{/if}>{$value.name}</option>
                        {/foreach}
                    </select> 
                </div>
                <div id="datastoragecontainer" class="tofetch2 clearfix left" style="margin: 0 0 0 25px">
                    <span>Data storage (DATA)</span><br/>
                    <select id="datastorage" multiple class="multi" name="options[datastorage2][]" style="min-width: 150px">
                        <option value="Auto-Assign" {if in_array('Auto-Assign',$defopt.datastorage2)}selected="selected"{/if}>Auto-Assign</option>
                        {foreach from=$modvalues item=value}
                            <option value="{$value.name}" {if in_array($value.name,$defopt.datastorage2)}selected="selected"{/if}>{$value.name}</option>
                        {/foreach}
                    </select> 
                </div>
                <div class="clear"></div>
                <script type="text/javascript">
                    $('#storage_tier').trigger('tierup');
                    $("a.vtip_description").vTip();
                </script>
            </td>
        </tr>
{elseif $valx=='option12'}    {*  ostemplate  *}

    <select id="option12" name="options[option12]">
        {foreach from=$modvalues item=value}
            <option value="{$value[0]}" {if $value[0]==$defval}selected="selected"{/if}>{$value[1]}</option>
        {/foreach}
    </select>


{elseif $valx=='option22'}  {*   network zone  *}

    <select id="option22" multiple class="multi" name="options[option22][]">
        <option value="Auto-Assign" {if in_array('Auto-Assign',$defval)}selected="selected"{/if}>Auto-Assign</option>
        <option value="0" {if in_array('0',$defval)}selected="selected"{/if}>None (advanced only) - Auto create network </option>
        {foreach from=$modvalues item=value}
            <option value="{$value[0]}" {if in_array($value[0],$defval)}selected="selected"{/if}>{$value[1]}</option>
        {/foreach}
    </select>

{/if}
{elseif $make=='importformel' && $fid}
    <a href="#" onclick="return editCustomFieldForm('{$fid}', '{$pid}')" class="editbtn orspace">Edit related form element</a>
{if $vartype=='os'}<a href="#" onclick="return updateOSList('{$fid}')" class="editbtn orspace">Update template list from CloudStack</a>{/if}
<script type="text/javascript">editCustomFieldForm('{$fid}', '{$pid}');</script>
{/if}