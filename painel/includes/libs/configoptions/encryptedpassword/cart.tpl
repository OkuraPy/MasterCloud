{foreach from=$cf.items item=cit}
    <input name="{if $cf_opt_name && $cf_opt_name != ''}{$cf_opt_name}{else}custom{/if}[{$cf.id}][{$cit.id}]" 
       id="custom_field_{$cf.id}" value="{$contents[1][$cf.id][$cit.id].val}" 
       class="styled custom_field custom_field_{$cf.id}" type="password" autocomplete="off"
       onchange="if (typeof(simulateCart)=='function')simulateCart('{if $cf_opt_formId && $cf_opt_formId != ''}{$cf_opt_formId}{else}#cart3{/if}');"/>  
    <br/>
{/foreach}