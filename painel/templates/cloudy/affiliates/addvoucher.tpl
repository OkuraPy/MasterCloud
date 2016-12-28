<div class="spacing">
    <h3><i class="icon-dboard"></i> {$lang.affiliate}</h3>
    <p>{$lang.affiliate_description}</p>



    <div class="flat-ui-tab">
        {include file='menus/affiliates.sub.tpl'}
        <div class="tab-content p-10">
            <div class="tab-pane active">

                <h4 class="mt-10">{$lang.promocodes}</h4>
                {if !$plan}
                    <p>{$lang.selectcommplan}</p>


                    <form action="" method="POST" onsubmit="window.location.href = '{$ca_url}{$cmd}/{$action}/&plan=' + $(this).find('input[name=\'plan\']:checked').val();
                            return false;">
                        {foreach from=$commisionplans item=plan name=ul} 
                            <div class="commission-plan-box">
                                <div class="commission-plan-radio">
                                    <input type="radio" name="plan" value="{$plan.id}" {if $smarty.foreach.ul.first}{/if} />
                                </div>
                                <div class="commission-plan-text">
                                    <p>
                                        {$plan.name}
                                        {if $plan.type=='Percent'}{$plan.rate}%
                                        {else}{$plan.rate|price:$affiliate.currency_id}
                                        {/if}
                                        {$lang.commission}
                                    </p>
                                </div>
                                <div class="commission-plan-applies">
                                    {if $plan.applicable_list.1}
                                        <div class="commission-plan-more pull-right">
                                            <span>{$lang.dotmore}</span>
                                        </div>
                                        <div class="appliesto_full" style="display:none">
                                            {foreach from=$plan.applicable_list item=item name=commisionit}
                                                <span class="label flat-ui-label  label-info">{$item.cat}: {$item.name}</span>
                                            {/foreach}
                                        </div>
                                    {/if}

                                    <p>{$lang.appliesto}: 
                                        <span class="label flat-ui-label label-info"> 
                                            {if $plan.applicable_list.0}
                                                {$plan.applicable_list.0.cat}: {$plan.applicable_list.0.name}
                                            {/if}
                                        </span>
                                    </p>

                                </div>
                            </div>
                        {/foreach}
                        <div class="form-actions">
                            <center><input type="submit" value="{$lang.continue}" class="btn btn-primary" ></center>
                        </div>
                    </form>
                    {literal}
                    <style>
                        .commission-plan-applies .popover{
                            max-width: 60%
                        }
                    </style>
                    <script type="text/javascript">
                    $('.commission-plan-more').each(function() {
                        $(this).popover({html: true, content: $(this).next('.appliesto_full').html(), placement: 'left'}).click(function(){
                            $('.popover').not($(this).next()).prev().popover('hide');
                        });
                    });
                    </script>
                {/literal}
                {else}
                    <p>{$lang.newpromocode}</p>
                    <form action="" method="POST">
                        <table width="100%" border=0 class="table table-striped p-td" cellspacing="0">
                            <tr>
                                <td width="160" align="right">{$lang.vouchercode}</td>
                                <td><input type="text" readonly="readonly" value="{$plan.code}"/></td>
                            </tr>
                            <tr class="even">
                                <td width="160" align="right">{$lang.disctype}</td>
                                <td>
                                    <select name="cycle">
                                        <option value="once"  >{$lang.applyonce}</option>
                                        <option {if !$plan.recurring}disabled="disabled"{else}value="recurring"{/if} >{$lang.Recurring}</option>
                                    </select>
                                </td>
                            </tr>
                            {if 'config:AffVAudience:1'|checkcondition}
                                <tr class="even">
                                    <td width="160" align="right">{$lang.appliesto}</td>
                                    <td>
                                        <select name="audience">
                                            <option value="new" >{$lang.newcustommers}</option>
                                            <option value="all" >{$lang.allcustommers}</option>
                                            <option value="existing" >{$lang.existingcustommers}</option>
                                        </select>
                                    </td>
                                </tr>
                            {/if}
                            <tr>
                                <td width="160" align="right">{$lang.maxusage}</td>
                                <td>
                                    <input type="checkbox" name="max_usage_limit" onclick="check_i(this)" style="vertical-align: middle; margin:9px 8px 0 0; float:left" />
                                    <input type="text" size="4" name="max_usage" class="styled config_val" disabled="disabled"/>
                                </td>
                            </tr>
                            <tr class="even">
                                <td width="160" align="right">{$lang.expdate}</td>
                                <td>
                                    <input type="checkbox" onclick="check_i(this)" style="vertical-align: middle; margin:9px 8px 0 0; float:left" />
                                    <input id="dpick" data-date="" data-date-format="{$js_date}" name="expires" class="styled config_val" type="text" value="" disabled="disabled">
                                </td>
                            </tr>
                            <tr>
                                <td align="right">{$lang.Commission}<a class="vtip_description" title="{$lang.commissionpart}"></a></td>
                                <td>
                                    <input name="discount"  value="0" type="text" style="display:none" id="sfield"  variable="a" />
                                    <div id="slider_margin_indicator" class="left" style="font-weight:bold; padding-left: 5px; min-width: 30px">
                                        {if $plan.type!='Percent'}{$affiliate.currency.sign}
                                        {/if}
                                        {$plan.max_margin}
                                        {if $plan.type=='Percent'}%
                                        {/if}
                                    </div>
                                    <div id="slider" class="slides left" style="margin:0 20px 0 10px!important;float:left !important; clear:none; width:370px;">
                                        <div class="sl"></div>
                                        <div class="sr"></div>
                                    </div>
                                    <div id="slider_value_indicator" class="left" style="font-weight:bold; padding-right: 5px; min-width: 30px">
                                        {if $plan.type!='Percent'}{$affiliate.currency.sign}
                                        {/if}
                                        1
                                        {if $plan.type=='Percent'}%
                                        {/if}
                                    </div>
                                    <span class="left">{$lang.discount} <a class="vtip_description" title="{$lang.discountpart}"></a></span>

                                </td>
                            </tr>
                        </table>
                        <div class="form-actions">
                            <center><input type="submit" value="{$lang.addvoucher}" name="save" class="btn btn-primary"></center>
                        </div>
                        {securitytoken}
                    </form>
                    <script type="text/javascript">
                        var fx = {literal}{{/literal}{if $plan.type == 'Percent'}s:'%', p:''{else}s:'', p:'{$affiliate.currency.sign}'{/if}{literal}}{/literal}
                        var maxval = parseInt('{$plan.rate}') - 2;
                        var minval = 0;
                        var stepval = 1;
                        var initialval = 0;
                        var _date_format = '{$js_date}';
                    </script>
                    <link rel="stylesheet" href="{$template_dir}css/datepicker.css">
                    <script type="text/javascript" src="{$template_dir}js/bootstrap-datepicker.js"></script>
                    <script type="text/javascript" src="{$template_dir}js/affiliates.js"></script>
                {/if}
            </div>
        </div>
    </div>
</div>