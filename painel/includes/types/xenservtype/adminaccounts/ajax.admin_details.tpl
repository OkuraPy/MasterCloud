<select name="extra_details[option6]">
    <option value="" >None</option>
    {foreach from=$vms item=label key=uuid}
        <option value="{$uuid}" {if $uuid==$current}selected="selected"{/if}>{$label|escape}</option>
    {/foreach}
</select>