<select name="custom[{$kk}]">
    <option value="0" {if $c.value=='0'}selected="selected"{/if}>-</option>
    {foreach from=$c.items item=itm}
        <option value="{$itm.id}" {if $c.values[$itm.id]}selected="selected"{/if}>{$itm.name} {if $itm.price}({$itm.price|price:$currency:true:$forcerecalc}){/if}</option>
    {/foreach}
</select>