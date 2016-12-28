{cartfieldlogic}
{once}
<script type="text/javascript" src="{$system_url}includes/libs/configoptions/searchselect/chosen/chosen.min.js"></script>
<link rel="stylesheet" href="{$system_url}includes/libs/configoptions/searchselect/chosen/chosen.css" />
{/once}
<select name="{if $cf_opt_name && $cf_opt_name != ''}{$cf_opt_name}{else}custom{/if}[{$cf.id}]" style="width:99%"  
        class="pconfig_ styled custom_field_{$cf.id}"  id="custom_field_{$cf.id}" 
        onchange="if (typeof (simulateCart) == 'function')
                    simulateCart('{if $cf_opt_formId && $cf_opt_formId != ''}{$cf_opt_formId}{else}#cart3{/if}')">
    {foreach from=$cf.items item=cit}
        <option value="{$cit.id}" {if $contents[1][$cf.id][$cit.id]}selected="selected"{/if}>{$cit.name} {if $cit.price!=0}(
            {if $cit.fee!=0} {$cit.fee|price:$currency} {$lang[$cit.recurring]}{/if}
            {if $cit.setup!=0} {$cit.setup|price:$currency} {$lang.setupfee}{/if}
            ){/if}</option>
        {/foreach}
</select>
<script type="text/javascript">
    $('.custom_field_{$cf.id}').chosen();
    {if $cf.config.conditionals}
    $('.custom_field_{$cf.id}').fieldLogic({literal}{{/literal}type: '{$cf.type}'{literal}}{/literal}, [{foreach from=$cf.config.conditionals item=cd name=cond}{literal}{{/literal}
            value: '{$cd.targetval}',
            condition_type: '{$cd.condition}',
            target: '.custom_field_{$cd.target}',
            condition: '{if $cd.conditionval}{$cd.conditionval}{else}{$cd.val}{/if}',
            action: '{$cd.action}'
        {literal}}{/literal}{if !$smarty.foreach.cond.last},{/if}{/foreach}]);

    {/if}
</script>

