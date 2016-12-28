{cartfieldlogic}
{foreach from=$cf.items item=cit}
    <div  class="custom_field_{$cf.id}">
        <div id="custom_slider_{$cit.id}" class="slides left" style="margin:6px 20px 0px 20px !important;float:left !important;width:370px;">
            <div class="sl"></div><div class="sr"></div>
        </div>
        <input name="{if $cf_opt_name && $cf_opt_name != ''}{$cf_opt_name}{else}custom{/if}[{$cf.id}][{$cit.id}]"  
               value="{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}" 
               onchange="if (typeof(simulateCart)=='function')simulateCart('{if $cf_opt_formId && $cf_opt_formId != ''}{$cf_opt_formId}{else}#cart3{/if}');" 
               type="text" id="custom_field_{$cf.id}"  
               variable="{$cf.variable}" />
        <script type="text/javascript">

            {if $cf.config.conditionals}
            $('#custom_field_{$cf.id}').fieldLogic({literal}{{/literal}type: '{$cf.type}'{literal}}{/literal}, [{foreach from=$cf.config.conditionals item=cd name=cond}{literal}{{/literal}
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
                        if (typeof ($('#slider').slider) != 'function'){literal} {
                            s.hide();
                            return false;
                        }{/literal}

                        var maxval = parseInt('{$cf.config.maxvalue}') || 100,
                            minval = parseInt('{$cf.config.minvalue}') || 0,
                            stepval = parseInt('{$cf.config.step}') || 1,
                            initialval = parseInt('{$cf.config.initialval}') || 0,
                            size = 12 * (maxval.toString().length + 1);
                    
                        s.width(s.parent().width() - size - (s.outerWidth(true) - s.width()) - (sval.outerWidth(true) - sval.width())).slider({literal}{
                            min: minval, max: maxval, value: sval.val() || initialval, step: stepval, range: "min",
                            animate: true, stop: function(e, ui) {
                                var x = Math.floor(s.slider("value"));
                                sval.val(x).trigger('change');
                            }
                        });
                        
                        sval.width(size).bind('change.slider', function(){
                            var self = $(this),
                                val = parseInt($(this).val()) ;
                            if(val%stepval != 0)
                                val = val - val%stepval
                            if(isNaN(val) || minval > val)
                                val = minval;
                            else if(val > maxval)
                                val = maxval;
                            
                            self.val(val);
                            s.slider('value', val);
                        });
                    }, 200);{/literal}
                    </script>
                </div>
                {/foreach}