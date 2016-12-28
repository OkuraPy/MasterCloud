{*
@@author:: HostBill team
@@name:: Package sliders, One-step
@@description::  A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. 
@@thumb:: onestep_packsliders/thumb.png
@@img:: onestep_packsliders/prev.png
*}
<link rel="stylesheet" href="{$orderpage_dir}onestep_packsliders/css/style.css">
<link rel="stylesheet" href="{$orderpage_dir}onestep_packsliders/css/jquery-ui-1.8.21.custom.css">
<script src="{$orderpage_dir}onestep_packsliders/js/script.js"></script>
{cartfieldlogic}
<ul class="hosting-type">
    {foreach from=$categories item=i name=categories name=cats}
        {if $i.id != $current_cat}
            <li class="{if $smarty.foreach.cats.last}last{/if}"><a href="{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a></li>
        {else}
            <li class="{if $smarty.foreach.cats.last}last{/if} active-hosting">{$i.name}</li>
        {/if}
    {/foreach}
</ul>
<input type="hidden" value="{$product.id}" name="product"  id="pidi" />
<div class="cart-page left">
    <div class="select-plan-box">
        <h1>{$lang.selectyourplan}</h1>
        <h2>{if $opconfig.subheader1}{$opconfig.subheader2}{else}chose best options{/if}</h2>
        <div class="underline-title">
            <div class="underline-bold"></div>
        </div>

        <div class="select-plan-bg-fix">
            <div class="select-plan-bg">
                <table class="plan-table-header center">
                    <tr>
                        <th class="option-th">{$lang.option}</th>
                        <th class="bundle-th">{$lang.premadepackages}</th>
                        <th class="customize-th">{$lang.customize}</th>
                        <th>{$lang.qty}</th>
                    </tr>
                </table>
                <div class="ribbon-orderpage">
                    <div class="ribbon-left"></div>
                    <div class="ribbon-right"></div>
                    <div class="ribbon-middle">
                        <span>1GB</span>
                    </div>
                    <div class="ribbon-bottom"></div>
                </div>
                <div class="plan-table-bg-fix center">
                    <div class="plan-table-bg">
                        <table id="plan-tab">
                            {productspec products=$products features=features parsed=$products limit=5}
                            {foreach from=$features item=values key=feature name=loop}
                                {assign value=false var=rowval}
                                <tr>
                                    <td class="option-td">{$feature}</td>
                                    {foreach from=$values item=value key=id name=loop2}
                                        <td class="bundle-td bundle-{$smarty.foreach.loop2.index}{if $smarty.foreach.loop2.index%2==0} dark-col{/if}{if $products[$id].id==$product.id} active-col{/if}" {if $smarty.foreach.loop.first}id="p{$products[$id].id}"{/if}>
                                            {if $value !== false}{$value}
                                            {else}{$lang.none}
                                            {/if}
                                        </td>
                                        {if intval($value) && !$rowval}
                                            {assign value=true var=rowval}
                                        {/if}
                                    {/foreach}
                                    <td class="customize-td">
                                        <div class="{if $rowval}slider-box{else}no-slider{/if}">
                                            <div id="slider-{$smarty.foreach.loop.index}" class="slider-bg"></div>
                                        </div>
                                    </td>
                                    <td id="amount-{$smarty.foreach.loop.index}" class="qty-td">0</td>
                                </tr>
                            {/foreach}
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="configer">
    {include file='ajax.onestep_packsliders.tpl'}
</div>
<form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
    <input type="hidden" name="make" value="order" />

    <div class="client-box clear">
        {* PAYMENT METHOD *}
        {if $gateways}
            <div class="gateways">
                <h1>{$lang.payment}</h1>
                <h2>{if $opconfig.subheader2}{$opconfig.subheader2}{else}choose desired payment method{/if}</h2>
                <div class="underline-title">
                    <div class="underline-bold"></div>
                </div>
                <div class="gateways-list clearfix">
                    {foreach from=$gateways item=module key=mid name=payloop}
                        <div class="left"><input type="radio" name="gateway" value="{$mid}"  onclick="return pop_ccform($(this).val())" {if $submit && $submit.gateway==$mid || $mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if}/> {$module} </div>
                        {/foreach}
                </div>
                <div class="clear"></div>

                <div id="gatewayform" class="clear"{if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
                    {$gatewayhtml}
                    <script type="text/javascript"> reform_ccform(); </script>
                </div>
            </div>
        {/if}

        {*CONTACT INFO*}
        <!-- Client Information -->

        <h1>{$lang.clientinfo}</h1>
        <h2>{if $opconfig.subheader2}{$opconfig.subheader2}{else}your personal details{/if}</h2>
        <div class="underline-title">
            <div class="underline-bold"></div>
        </div>
        {if $logged=="1"}
            <div id="clientinfo">
                {include file="drawclientinfo.tpl"}
            </div>
        {else}
            <div class="client-toggle">
                <div class="toggle-slider">
                    <div class="toggle-option-fix {if !$submit || !$submit.make || $submit.cust_method=='newone' || $submit.action!='login'}t1 active-toggle{else}t1{/if}" onclick="return clientForm(false)">
                        <span class="active-toggle">{$lang.newclient}</span>
                    </div>
                    <div class="toggle-option-fix {if $submit.cust_method=='login' || $submit.action=='login'}t2  active-toggle{else}t2{/if}" onclick="return clientForm(true)">
                        <span>{$lang.registered}</span>
                    </div>
                </div>
            </div>
            <div id="clientform" class="clear {if !$submit || !$submit.make || $submit.cust_method=='newone' || $submit.action!='login'}new-client{/if}">
                {if $submit.cust_method=='login' || $submit.action=='login'}
                    {include file='ajax.login.tpl}
                {else}
                    {include file='ajax.signup.tpl}
                {/if}
            </div>
        {/if}
        <div class="notes">
            <h1>{$lang.cart_add}</h1>
            <div class="underline-title">
                <div class="underline-bold"></div>
            </div>
            <textarea id="c_notes" placeholder="{$lang.c_tarea}" style="width: 99%; margin-top: 10px" name="notes">{if $submit.notes}{$submit.notes}{/if}</textarea>
        </div>
    </div>
    
    <div class="shadow center"></div>
    <div class="tos">
        {if $tos}<p><input id="checkbox-tos" value="1" name="tos" type="checkbox"> {$lang.tos1} <a href="{$tos}"  target="_blank">{$lang.tos2}</a></p>
        {/if}
        <div class="checkout-center">
            <div class="checkout-button-fix center">
                <input type="submit" class="checkout-button disabled" disabled="disabled" value="Checkout">
            </div>
        </div>
    </div>
</form>
