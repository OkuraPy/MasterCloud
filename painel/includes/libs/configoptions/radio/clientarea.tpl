 {foreach from=$cst.items item=cit}{if $cit.name}{$cit.name}{/if}
{if $service.showbilling}{if $cit.price>0}( {$cit.price|price:$currency:1:1} ){/if}{/if}<br/>{/foreach}