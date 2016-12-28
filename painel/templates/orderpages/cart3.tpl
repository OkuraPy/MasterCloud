{literal}
    <script type="text/javascript">
        function changeCycle(forms) {
            $(forms).append('<input type="hidden" name="ccycle" value="true"/>').submit();
            return true;
        }
    </script>
{/literal}

<form action="" method="post" id="cart3">
    {if $product.description!='' || $product.paytype=='Once' || $product.paytype=='Free'}
        <div class="wbox">
            <div class="wbox_header">
                <strong>{$product.name}</strong>
            </div>
            <div class="wbox_content" id="product_description">

                {$product.description}
                
                {if $product.paytype=='Free'}<br />
                    <input type="hidden" name="cycle" value="Free" />
                    {$lang.price} <strong>{$lang.free}</strong>

                {elseif $product.paytype=='Once'}<br />
                    <input type="hidden" name="cycle" value="Once" />
                    {price product=$product}
                    {$lang.price}  <strong>@@price</strong> {$lang.once} @@setupline<<' + '@
                    {/price}
                {/if}
                
            </div></div>
        {/if}



    {if   $product.type=='Dedicated' || $product.type=='Server' || $product.hostname || $custom || ($product.paytype!='Once' && $product.paytype!='Free')}

        <div class="wbox">
            <div class="wbox_header">
                <strong>{$lang.config_options}</strong>
            </div>
            <div class="wbox_content">


                <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
                    <colgroup class="firstcol"></colgroup>
                    <colgroup class="alternatecol"></colgroup>


                    {if $product.paytype!='Once' && $product.paytype!='Free'}
                        <tr>
                            <td class="pb10"  width="175">
                                <strong>{$lang.pickcycle}</strong>
                            </td>
                            <td class="pb10">
                                <select name="cycle"   onchange="{if $custom}changeCycle('#cart3');{else}simulateCart('#cart3');{/if}" style="width:99%">
                                    {price product=$product}
                                    <option value="@@cycle" @@selected>@@line</option>
                                    {/price}
                                </select>
                            </td>
                        </tr>
                    {/if}

                    {if $product.hostname}
                        <tr>
                            <td class="pb10" width="175"><strong>{$lang.hostname}</strong> *</td>
                            <td class="pb10"><input name="domain" type="text" value="{$item.domain}" class="styled" size="50" style="width:96%"/></td>	
                        </tr>


                    {/if}

                    {if $custom} <input type="hidden" name="custom[-1]" value="dummy" />
                        {foreach from=$custom item=cf} 
                            {if $cf.items}
                                <tr>
                                    <td colspan="2" class="{$cf.key} cf_option">

                                        <label for="custom[{$cf.id}]" class="styled">{$cf.name} {if $cf.options & 1}*{/if}</label>
                                        {if $cf.description!=''}<div class="fs11 descr" style="">{$cf.description}</div>{/if}

                                        {include file=$cf.configtemplates.cart}

                                    </td>
                                </tr>
                            {/if}
                        {/foreach}

                    {/if}


                </table>

                <small>{$lang.field_marked_required}</small>

            </div></div>
        {/if}


    {if $subproducts}
        <div class="wbox">
            <div class="wbox_header">
                <strong>{$lang.additional_services}</strong>
            </div>
            <div class="wbox_content">
                <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
                    <colgroup class="firstcol"></colgroup>
                    <colgroup class="alternatecol"></colgroup>
                    <colgroup class="firstcol"></colgroup>

                    {foreach from=$subproducts item=a key=k}
                        <tr><td width="20"><input name="subproducts[{$k}]" type="checkbox" value="1" {if $selected_subproducts.$k}checked="checked"{/if}  onchange="simulateCart('#cart3');"/></td>
                            <td>
                                <strong>{$a.category_name} - {$a.name}</strong>
                            </td>
                            <td>
                                {if $a.paytype=='Free'}
                                    {$lang.free}
                                    <input type="hidden" name="subproducts_cycles[{$k}]" value="free"/>
                                {elseif $a.paytype=='Once'}
                                    <input type="hidden" name="subproducts_cycles[{$k}]" value="once"/>
                                    {$a.m|price:$currency} {$lang.once} {if $a.m_setup!=0}/ {$a.m_setup|price:$currency} {$lang.setupfee}{/if}
                                {else}
                                    <select name="subproducts_cycles[{$k}]"   onchange="if ($('input[name=\'subproducts[{$k}]\']').is(':checked'))
                                simulateCart('#cart3');">
                                        {if $a.h!=0}<option value="h" {if $cycle=='h'} selected="selected"{/if}>{$a.h|price:$currency} {$lang.h}{if $a.h_setup!=0} + {$a.h_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.d!=0}<option value="d" {if $cycle=='d'} selected="selected"{/if}>{$a.d|price:$currency} {$lang.d}{if $a.d_setup!=0} + {$a.d_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.w!=0}<option value="w" {if $cycle=='w'} selected="selected"{/if}>{$a.w|price:$currency} {$lang.w}{if $a.w_setup!=0} + {$a.w_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.m!=0}<option value="m" {if $cycle=='m'} selected="selected"{/if}>{$a.m|price:$currency} {$lang.m}{if $a.m_setup!=0} + {$a.m_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.q!=0}<option value="q" {if $cycle=='q'} selected="selected"{/if}>{$a.q|price:$currency} {$lang.q}{if $a.q_setup!=0} + {$a.q_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.s!=0}<option value="s" {if $cycle=='s'} selected="selected"{/if}>{$a.s|price:$currency} {$lang.s}{if $a.s_setup!=0} + {$a.s_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.a!=0}<option value="a" {if $cycle=='a'} selected="selected"{/if}>{$a.a|price:$currency} {$lang.a}{if $a.a_setup!=0} + {$a.a_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.b!=0}<option value="b" {if $cycle=='b'} selected="selected"{/if}>{$a.b|price:$currency} {$lang.b}{if $a.b_setup!=0} + {$a.b_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.t!=0}<option value="t" {if $cycle=='t'} selected="selected"{/if}>{$a.t|price:$currency} {$lang.t}{if $a.t_setup!=0} + {$a.t_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.p4!=0}<option value="p4" {if $cycle=='p4'} selected="selected"{/if}>{$a.p4|price:$currency} {$lang.p4}{if $a.p4_setup!=0} + {$a.p4_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.p5!=0}<option value="p5" {if $cycle=='p5'} selected="selected"{/if}>{$a.p5|price:$currency} {$lang.p5}{if $a.p5_setup!=0} + {$a.p5_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    </select>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div></div>
        {/if}

    {if $addons}
        <div class="wbox">
            <div class="wbox_header">
                <strong>{$lang.addons_single}</strong>
            </div>
            <div class="wbox_content">
                <p>{$lang.addons_single_desc}</p>
                <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
                    <colgroup class="firstcol"></colgroup>
                    <colgroup class="alternatecol"></colgroup>
                    <colgroup class="firstcol"></colgroup>

                    {foreach from=$addons item=a key=k}
                        <tr><td width="20"><input name="addon[{$k}]" type="checkbox" value="1" {if $selected_addons.$k}checked="checked"{/if}  onchange="simulateCart('#cart3');"/></td>
                            <td>
                                <strong>{$a.name}</strong>{if $a.description!=''} - {$a.description}{/if}
                            </td>
                            <td>
                                {if $a.paytype=='Free'}
                                    {$lang.free}
                                    <input type="hidden" name="addon_cycles[{$k}]" value="free"/>
                                {elseif $a.paytype=='Once'}
                                    <input type="hidden" name="addon_cycles[{$k}]" value="once"/>
                                    {$a.m|price:$currency} {$lang.once} {if $a.m_setup!=0}/ {$a.m_setup|price:$currency} {$lang.setupfee}{/if}
                                {else}
                                    <select name="addon_cycles[{$k}]"   onchange="if ($('input[name=\'addon[{$k}]\']').is(':checked'))
                                simulateCart('#cart3');">
                                        {if $a.h!=0}<option value="h" {if $cycle=='h'} selected="selected"{/if}>{$a.h|price:$currency} {$lang.h}{if $a.h_setup!=0} + {$a.h_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.d!=0}<option value="d" {if $cycle=='d'} selected="selected"{/if}>{$a.d|price:$currency} {$lang.d}{if $a.d_setup!=0} + {$a.d_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.w!=0}<option value="w" {if $cycle=='w'} selected="selected"{/if}>{$a.w|price:$currency} {$lang.w}{if $a.w_setup!=0} + {$a.w_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.m!=0}<option value="m" {if $cycle=='m'} selected="selected"{/if}>{$a.m|price:$currency} {$lang.m}{if $a.m_setup!=0} + {$a.m_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.q!=0}<option value="q" {if $cycle=='q'} selected="selected"{/if}>{$a.q|price:$currency} {$lang.q}{if $a.q_setup!=0} + {$a.q_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.s!=0}<option value="s" {if $cycle=='s'} selected="selected"{/if}>{$a.s|price:$currency} {$lang.s}{if $a.s_setup!=0} + {$a.s_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.a!=0}<option value="a" {if $cycle=='a'} selected="selected"{/if}>{$a.a|price:$currency} {$lang.a}{if $a.a_setup!=0} + {$a.a_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.b!=0}<option value="b" {if $cycle=='b'} selected="selected"{/if}>{$a.b|price:$currency} {$lang.b}{if $a.b_setup!=0} + {$a.b_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.t!=0}<option value="t" {if $cycle=='t'} selected="selected"{/if}>{$a.t|price:$currency} {$lang.t}{if $a.t_setup!=0} + {$a.t_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.p4!=0}<option value="p4" {if $cycle=='p4'} selected="selected"{/if}>{$a.p4|price:$currency} {$lang.p4}{if $a.p4_setup!=0} + {$a.p4_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                        {if $a.p5!=0}<option value="p5" {if $cycle=='p5'} selected="selected"{/if}>{$a.p5|price:$currency} {$lang.p5}{if $a.p5_setup!=0} + {$a.p5_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    </select>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div></div>
        {/if}





    <input name='action' value='addconfig' type='hidden' /><br />

    <div class="orderbox"><div class="orderboxpadding"><center><input type="submit" value="{$lang.continue}" style="font-weight:bold;font-size:12px;"  class="padded btn  btn-primary"/></center></div></div>

</form>