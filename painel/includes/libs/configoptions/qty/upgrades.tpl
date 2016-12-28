{foreach from=$cf.items item=cit}
<tr>
    <td><b>{$cf.name}</b></td>
    <td>
        <input name="fupgrade[{$cf.id}][new_config_id]"  value="{$cit.id}" type="hidden" />
        <b>{$cf.qty}</b> {if $cit.name || $cit.price>0}x{/if} {if $cit.name}{$cit.name}{/if} 
        {if $cit._price!=0} {$cit._price|price:$currency:1:1:$currency.code}{elseif $cit.price>0} {$cit.price|price:$currency:1:1} {/if}{if $cit.prices}<span id="custom_slider_price{$cit.id}"> </span>{/if}
    </td>
    <td align="center">
        <input name="fupgrade[{$cf.id}][new_qty]"  value="{$cf.qty}"  class="inp styled" size="3" id="custom_field_{$cf.id}" />
        {if $cit.name || $cit.price>0}x{/if} {if $cit.name}{$cit.name}{/if} {if $cit._price!=0} {$cit._price|price:$currency:1:1:$currency.code}{elseif $cit.price>0} {$cit.price|price:$currency:1:1} {/if}
        <script type="text/javascript">
        {if $cit.prices}
            $(function(){literal}{{/literal}
            var prices = [], scheme = '{$cit.scheme}';
        {foreach from=$cit.prices item=prices key=back}{if $prices.qty<=$cf.qty}prices.push('{$prices[$cit.cycle]|price:$currency:1:1}');{/if}{/foreach}
            $('#custom_slider_price{$cit.id}').text(scheme == 'tiered' ? 'x ' + prices[prices.length-1] : ' ( '+prices[prices.length-1]+' )');
        {literal}});{/literal}{/if}
 
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
                    {if $cd.condition=='less'}var b=(newval < {$cd.conditionval});
                    {elseif $cd.condition=='more'}var b=(newval > {$cd.conditionval});
                    {else}var b=(newval == {$cd.conditionval});
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
{/foreach}
