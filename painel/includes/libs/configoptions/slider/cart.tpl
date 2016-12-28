{cartfieldlogic}
{foreach from=$cf.items item=cit}
<input name="{if $cf_opt_name && $cf_opt_name != ''}{$cf_opt_name}{else}custom{/if}[{$cf.id}][{$cit.id}]"  
       value="{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}" 
       type="text" style="display:none" id="custom_field_{$cf.id}"  
       onchange="if (typeof(simulateCart)=='function')simulateCart('{if $cf_opt_formId && $cf_opt_formId != ''}{$cf_opt_formId}{else}#cart3{/if}');" 
       variable="{$cf.variable}" class="custom_field_{$cf.id}" />
<div id="custom_slider_{$cit.id}" class="slides left" style="margin:6px 20px 0px 20px !important;float:left !important;width:370px;">
    <div class="sl"></div><div class="sr"></div>
</div>
<div id="custom_slider_{$cit.id}_value_indicator" style="font-weight:bold;font-size:14px;padding-top:3px;">{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}</div>
<script type="text/javascript">

{if $cf.config.conditionals}
    $('.custom_field_{$cf.id}').fieldLogic({literal}{{/literal}type: '{$cf.type}'{literal}}{/literal},[{foreach from=$cf.config.conditionals item=cd name=cond}{literal}{{/literal}
         value: '{$cd.targetval}',
         condition_type: '{$cd.condition}',
         target: '.custom_field_{$cd.target}',
         condition: '{if $cd.conditionval}{$cd.conditionval}{else}{$cd.val}{/if}',
         action: '{$cd.action}'
         {literal}}{/literal}{if !$smarty.foreach.cond.last},{/if}{/foreach}]);
{/if}
    setTimeout(function() {literal}{{/literal}
        var s = $('#custom_slider_{$cit.id}');
        var sval = $('#custom_field_{$cf.id}');
        var svalind = $('#custom_slider_{$cit.id}_value_indicator');
        if (typeof($('#slider').slider) != 'function'){literal} {
            s.hide();
            sval.show();
            svalind.hide();
            return false;
        }{/literal}

        var maxval = parseInt('{$cf.config.maxvalue}') || 100;
        var minval = parseInt('{$cf.config.minvalue}') || 0;
        var stepval = parseInt('{$cf.config.step}') || 1;
        var initialval = parseInt('{$cf.config.initialval}') || 0;

        s.width(s.parent().width() - 90).slider({literal}{
            min: minval, max: maxval, value: sval.val() || initialval, step: stepval, range: "min",
            animate: true, stop: function(e, ui) {
                var x = Math.floor(s.slider("value"));
                sval.val(x).trigger('change');
                svalind.html(x);
            }
        });
    }, 200);{/literal}
</script>
{/foreach}