
<span class="blue-line"></span>
<h1 class="museoSans">{$lang.productconfig}</h1>
<p class="openSansLight italic">{$lang.config_then_checkout}!</p>

<div class="left-column left text-right">
    <form id="cartform" action="" method="post">
        {if ($product.paytype!='Free' && $product.paytype!='Once')
        || ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain) }

        <h2 class="openSansRegular dashedBorder">{$lang.serverdetails}</h2>
        {if ($product.paytype!='Free' && $product.paytype!='Once')}
            <div class="openSansBold server-detail left">
                {$lang.pickcycle}
            </div>
            <div class="server-detail-field left">
                <div class="billing-select-field">
                    {include file="common/price.tpl" allprices='cycle'}
                </div>
            </div>
        {/if}
        {if ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain)}
            <div class="openSansBold server-detail">
                {$lang.hostname}
            </div>
            <div class="server-detail-field right">
                <input name="domain" value="{$item.domain}" class="styled" size="50" onchange="if(typeof simulateCart == 'function') simulateCart();"/>
            </div>   
        {/if}
        {/if}
            {if $custom || $addons || $subproducts}
                <h2 class="openSansRegular dashedBorder">{$lang.serverconfiguration}</h2>
                {include file='common/onestep_forms.tpl'}
                {include file='common/onestep_addons.tpl'}
                {include file='common/onestep_subproducts.tpl'}
            {/if}
        </form>
        {if ($cart_contents[0].domainoptions.register)=='1' && ($allowregister || $allowtransfer || $allowown || $subdomain)}
            <h2 class="openSansRegular dashedBorder left">{$lang.mydomains}</h2>
            <div class="btn-group right">
                {if $allowregister}
                    <button rel="t1" class="btn {if $contents[2].action=='register' || !$contents[2]}active{/if}" onclick="tabbme(this);">{$lang.register}</button>
                {/if}
                {if $allowtransfer}
                    <button rel="t2" class="btn {if $contents[2].action=='transfer'}active{/if}" onclick="tabbme(this);">{$lang.transfer}</button>
                {/if}
                {if $allowown}
                    <button rel="t3" class="btn {if $contents[2].action=='own' && !$subdomain}active{/if}" onclick="tabbme(this);">{$lang.alreadyhave}</button>
                {/if}
                {if $subdomain}
                    <button rel="t4" class="btn {if $contents[2].action=='own' && $subdomain}active{/if}" onclick="tabbme(this);">{$lang.subdomain}</button>
                {/if}
            </div>
            <div class="clear" style="text-align: left">
                {include file='common/onestep_domains.tpl' bulktld_col=2}
            </div>
        {/if}
        <div class="clear"></div>
    </div>


    <div class="right-column right">
        <h2 class="openSansRegular dashedBorder">{$lang.ordersummary}</h2>
        <div class="order-summary clearfix ">

            <div class="order-summary-header dashedBorder openSansBold">
                <div class="order-summary-header-desc left">
                    {$lang.Description}
                </div>
                <div class="order-summary-header-price left">
                    {$lang.price}
                </div>
            </div>
            {if $product}
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$contents[0].category_name} - <strong>{$contents[0].name}</strong> 
                        {if $contents[0].domain}({$contents[0].domain})
                        {/if}
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            {if $contents[0].price==0}<strong>{$lang.Free}</strong>
                            {elseif $contents[0].prorata_amount}
                                <strong> {$contents[0].prorata_amount|price:$currency}</strong>
                                ({$lang.prorata} {$contents[0].prorata_date|dateformat:$date_format})
                            {else}<strong>{$contents[0].price|price:$currency}</strong>
                            {/if}
                            {if $contents[0].setup!=0} + {$contents[0].setup|price:$currency} {$lang.setupfee}
                            {/if}
                        </span>
                    </div>
                </div>
            {/if}
            {if $cart_contents[1]}
                {foreach from=$cart_contents[1] item=cstom2}
                    {foreach from=$cstom2 item=cstom}
                        {if $cstom.total>0}
                            <div class="order-summary-row center openSansRegular">
                                <div class="order-summary-header-desc-col left">
                                {$cstom.fullname}  {if $cstom.qty>=1}x {$cstom.qty}{/if}
                            </div>
                            <div class="order-summary-header-price-col left">
                                <span class="openSansBold">
                                    {if $cstom.price==0}{$lang.Free}
                                    {elseif $cstom.prorata_amount}{$cstom.prorata_amount|price:$currency}
                                    {else}{$cstom.price|price:$currency}
                                    {/if} 
                                    {if $cstom.setup!=0} + {$cstom.setup|price:$currency} {$lang.setupfee}
                                    {/if}
                                </span>
                            </div>
                        </div>
                    {/if}
                {/foreach}
            {/foreach}
        {/if}
        {if $contents[3]}
            {foreach from=$contents[3] item=addon}
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$lang.addon} <strong>{$addon.name}</strong>
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            {if $addon.price==0}<strong>{$lang.Free}</strong>
                            {elseif $addon.prorata_amount}<strong>{$addon.prorata_amount|price:$currency}</strong> ({$lang.prorata} {$addon.prorata_date|dateformat:$date_format})
                            {else}<strong>{$addon.price|price:$currency}</strong>
                            {/if}
                            {if $addon.setup!=0} + {$addon.setup|price:$currency} {$lang.setupfee}
                            {/if}
                        </span>
                    </div>
                </div>
            {/foreach}
        {/if}	
        {if $contents[2] && $contents[2][0].action!='own'}
            {foreach from=$contents[2] item=domenka key=kk}
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {if $domenka.action=='register'}{$lang.domainregister}
                        {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                        {/if}</strong> - {$domenka.name} - {$domenka.period} {$lang.years}
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            {$domenka.price|price:$currency}
                        </span>
                    </div>
                </div>
            {/foreach}
        {/if}

        {if $contents[4]}
            {foreach from=$contents[4] item=subprod}
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$subprod.category_name} - <strong>{$subprod.name}</strong>
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            {if $subprod.price==0}<strong>{$lang.Free}</strong>
                            {elseif $subprod.prorata_amount}
                                <strong> {$subprod.prorata_amount|price:$currency}</strong>
                                ({$lang.prorata} {$subprod.prorata_date|dateformat:$date_format})
                            {else}<strong>{$subprod.price|price:$currency}</strong>
                            {/if}
                            {if $subprod.setup!=0} + {$subprod.setup|price:$currency} {$lang.setupfee}
                            {/if}
                        </span>
                    </div>
                </div>
            {/foreach}
        {/if}

        {if !empty($tax.recurring)}
            <div class="order-summary-row center order-summary-row-hover openSansRegular">
                <div class="order-summary-header-desc-col left">
                    {$lang.total_recurring}
                </div>
                <div class="order-summary-header-price-col left">
                    {foreach from=$tax.recurring item=rec key=k}
                        {$rec|price:$currency} {$lang.$k}<br/>
                    {/foreach}
                </div>
            </div>
        {elseif !empty($subtotal.recurring)}
            <div class="order-summary-row center order-summary-row-hover openSansRegular">
                <div class="order-summary-header-desc-col left">
                    {$lang.total_recurring}
                </div>
                <div class="order-summary-header-price-col left">
                    {foreach from=$subtotal.recurring item=rec key=k}
                        {$rec|price:$currency} {$lang.$k}<br/>
                    {/foreach}
                </div>
            </div>
        {/if}
        {if $tax}
            {if $subtotal.coupon}  
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$lang.discount}
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            - {$subtotal.discount|price:$currency}
                        </span>
                    </div>
                </div>
            {/if}
            {if $tax.tax1 && $tax.taxed1!=0}
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$tax.tax1name} @ {$tax.tax1}%
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            {$tax.taxed1|price:$currency}
                        </span>
                    </div>
                </div>
            {/if}
            {if $tax.tax2  && $tax.taxed2!=0}
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$tax.tax2name} @ {$tax.tax2}%
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            {$tax.taxed2|price:$currency}
                        </span>
                    </div>
                </div>
            {/if}
            {if $tax.credit!=0}
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$lang.credit}
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            {$tax.credit|price:$currency}
                        </span>
                    </div>
                </div>
            {/if}
        {elseif $credit}
            {if  $credit.credit!=0}
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$lang.credit}
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            {$credit.credit|price:$currency}
                        </span>
                    </div>
                </div>

            {/if}

            {if $subtotal.coupon}  
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$lang.discount}
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            - {$subtotal.discount|price:$currency}
                        </span>
                    </div>
                </div>

            {/if}
        {else}
            {if $subtotal.coupon}  
                <div class="order-summary-row center openSansRegular">
                    <div class="order-summary-header-desc-col left">
                        {$lang.discount}
                    </div>
                    <div class="order-summary-header-price-col left">
                        <span class="openSansBold">
                            - {$subtotal.discount|price:$currency}
                        </span>
                    </div>
                </div>
            {/if}
        {/if}

        <div class="order-summary-total center">
            <div class="order-summary-coupon left">
                {if !$subtotal.coupon}
                    <a class="openSansBold left" href="#" onclick="$(this).hide().next().show(); return false;">{$lang.usecoupon}</a>
                    <form style="display:none" action="" method="post" id="promoform" onsubmit="return applyCoupon();">
                        <input type="hidden" name="addcoupon" value="true" />
                        {$lang.code}: <input type="text" class="styled" style="width: 130px" name="promocode"/> 
                        <input type="submit" value="&raquo;" style="font-weight:bold" class="padded btn"/>
                    </form>
                {else}
                    <a class="openSansBold left" href="#" onclick="removeCoupon();">{$lang.remove_coupon}</a>
                {/if}
            </div>
            <div class="order-summary-total-price right">
                <p class="openSansRegular"><span>{$lang.total_today}</span></p>
                <p class="openSansBold">
                    {if $tax}{$tax.total|price:$currency}
                    {elseif $credit}{$credit.total|price:$currency}
                    {else}{$subtotal.total|price:$currency}
                    {/if}
                </p>
            </div>
        </div>


    </div>
    {if $gateways}
        <h2 {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if} class="openSansRegular dashedBorder">{$lang.choose_payment}</h2>
        <div {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if} class="payment-methods">
            <ul>
                {foreach from=$gateways item=module key=mid name=payloop}
                    <li><input onclick="$('#gatewayform').show();ajax_update('?cmd=cart&action=getgatewayhtml&gateway_id='+$(this).val(), '', '#gatewayform',true)" type="radio" name="gateway" value="{$mid}" {if $submit && $submit.gateway==$mid || $mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if}/> {$module} </li>
                    {/foreach}
            </ul>
        </div>
    {/if}
    {if $gateways}
        <div id="gatewayform" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
            {$gatewayhtml}
        </div>
    {/if}
    <div class="clear"></div>
</div>
<div class="clear"></div>
<script type="text/javascript">bindSimulateCart();</script>