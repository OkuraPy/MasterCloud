<tr>
    <td><b>{$cf.name}</b>
    </td>
    <td>
        <input name="fupgrade[{$cf.id}][new_qty]"  value="{$cf.qty}" type="hidden"   />
        {foreach from=$cf.items item=cit}
            {if isset($cf.data[$cit.id])}{$cit.name} {if $cit.price!=0}(
                {if $cit.fee!=0} {$cit.fee|price:$currency:1:1} {$lang[$service.billingcycle]}{/if}
            {if $cit.setup!=0} {$cit.setup|price:$currency:1:1} {$lang.setupfee}{/if}
            ){/if}{break}{/if}
        {/foreach}
    </td>
    <td align="center">
        <select name="fupgrade[{$cf.id}][new_config_id]" id="custom_field_{$cf.id}" >
            {foreach from=$cf.items item=cit}
                <option value="{$cit.id}" {if isset($cf.data[$cit.id])}selected="selected"{/if}>{$cit.name} {if $cit.price!=0}(
                {if $cit.fee!=0} {$cit.fee|price:$currency:1:1} {$lang[$service.billingcycle]}{/if}
                {if $cit.setup!=0} {$cit.setup|price:$currency:1:1} {$lang.setupfee}{/if}
                ){/if}</option>
            {/foreach}
        </select>
        <script type="text/javascript">
        {if $cf.config.conditionals}
            function clear_cf_form(){literal}{
                 var cf = $(this);
                 if(cf.is('input[type=radio], input[type=checkbox]')){
                     cf.prop('checked',false).removeAttr('checked').siblings('input').prop('checked',false).removeAttr('checked');
                 }else cf.val('');
             }{/literal}
             $('#custom_field_{$cf.id}').change(function() {literal}{{/literal}
                var newval = $("#custom_field_{$cf.id}").val();
                var setvals={literal}{}{/literal};
                                        
                {foreach from=$cf.config.conditionals item=cd name=cond}
                    
                    {if $cd.condition=='less'}var b=(newval < {if $cd.conditionval}'{$cd.conditionval}'{else}'{$cd.val}'{/if}));
                    {elseif $cd.condition=='more'}var b=(newval > {if $cd.conditionval}'{$cd.conditionval}'{else}'{$cd.val}'{/if}));
                    {else}var b=(newval == {if $cd.conditionval}'{$cd.conditionval}'{else}'{$cd.val}'{/if});
                    {/if}

                    if(b) {literal}{{/literal}
                    {if $cd.action!='setval'}t.parent().{$cd.action}();{*}
                        {*}{if $cd.action=='hide'}t.each(clear_cf_form);
                        {/if}
                    {else}setvals['{$cd.target}']="{$cd.targetval}";
                    {/if}
                    {literal}}{/literal}
                {/foreach}
                    else {literal}{{/literal}
                {foreach from=$cf.config.conditionals item=cd name=cond}{*}
                    {*}{if $cd.action=='hide'}$('#custom_field_{$cd.target}').parent().show();
                    {/if}
                {/foreach}
                {literal}
                };
                for (var k in setvals) {
                    var t= $('#custom_field_'+k);
                    var s = t.parent().next().children('.slides');
                    t.val(setvals[k]);
                    if(typeof (s.slider)=='function') {
                        s.slider('value',setvals[k]);
                        s.next().html(setvals[k]);
                    }
                }
            });
            {/literal}
        {/if}
        </script>
    </td>
</tr>