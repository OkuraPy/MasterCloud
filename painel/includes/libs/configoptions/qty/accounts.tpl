{foreach from=$c.items item=cit}
    <input name="custom[{$kk}][{$cit.id}]"  size="8" value="{$c.qty}"/> 
{if $cit.name || $cit.price}x {/if}{if $cit.name}{$cit.name}{/if} {if $cit._price}({$cit._price|price:$currency:1:$forcerecalc:$currency.code})
    {elseif $cit.price}({$cit.price|price:$currency:true:$forcerecalc}){/if}
{/foreach}