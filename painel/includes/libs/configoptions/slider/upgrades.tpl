{foreach from=$cf.items item=cit}
<tr>
    <td><b>{$cf.name}</b></td>
    <td>
        <input name="fupgrade[{$cf.id}][new_qty]"  value="{$cf.qty}" type="text" style="display:none" id="custom_field_{$cf.id}"   />
        <input name="fupgrade[{$cf.id}][new_config_id]"  value="{$cit.id}" type="hidden" />
        <b>{$cf.qty}</b> {if $cit.name || $cit.price>0}x{/if} {if $cit.name}{$cit.name}{/if} 
        {if $cit._price!=0} {$cit._price|price:$currency:1:1:$currency.code}{elseif $cit.price>0} {$cit.price|price:$currency:1:1} {/if}{if $cit.prices}<span id="custom_slider_price{$cit.id}"> </span>{/if}
    </td>
    <td>
        <div id="custom_slider_{$cit.id}" class="slides left" style="margin:6px 20px 0px 20px !important;float:left !important;width:370px;">
            <div class="sl"></div><div class="sr"></div>
        </div>
    <div id="custom_slider_{$cit.id}_value_indicator" style="font-weight:bold;font-size:14px;padding-top:3px;">{$cf.qty}</div>
<script type="text/javascript">
{literal}
setTimeout(function(){
    var s= $('#custom_slider_{/literal}{$cit.id}{literal}');
    var sval= $('#custom_field_{/literal}{$cf.id}{literal}');
    var svalind= $('#custom_slider_{/literal}{$cit.id}{literal}_value_indicator');
    if(typeof($('#slider').slider)!='function'){
        s.hide();
        sval.show();
        svalind.hide();
        return false;
    }

    var maxval = parseInt('{/literal}{$cf.config.maxvalue}{literal}') || 100 ;
    var minval = parseInt('{/literal}{if $cf.options & 32}{$cf.config.minvalue}{else}{$cf.qty}{/if}{literal}') || 0;
    var stepval = parseInt('{/literal}{$cf.config.step}{literal}') || 1 ;
    var initialval=parseInt('{/literal}{$cf.qty}{literal}') || 0;
    
    s.width(s.parent().width()-90).slider({
        min: minval ,max: maxval , value: sval.val() || initialval,step:stepval,range:"min", animate: true, stop:function(e,ui){
            var x = Math.floor(s.slider( "value" ));
            svalind.html(x);
            sval.val(x).trigger('change');
        }
    });
},200);

{/literal}{if $cit.prices}
    $(function(){literal}{{/literal}
    var prices = [], scheme = '{$cit.scheme}';
    
{foreach from=$cit.prices item=prices key=back}{if $prices.qty<=$cf.qty}prices.push('{$prices[$cit.cycle]|price:$currency:1:1:$currency.code:-1}');{/if}{/foreach}
    $('#custom_slider_price{$cit.id}').text(scheme == 'tiered' ? ' x ' + prices[prices.length-1] : ' ( '+prices[prices.length-1]+' )');
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
</td></tr>
{/foreach}


