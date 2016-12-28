{counter print=false name=cyclecount assign=cyclecount start=0}
{foreach from=$product item=value key=key}
{if ($key == 'd' || $key == 'w' || $key == 'm' || $key == 'q' || $key == 's' || $key == 'a' || $key == 'b' || $key == 't' || $key == 'p4' || $key == 'p5') && $value != 0}
{counter name=cyclecount}{/if}
{/foreach}
<div class="plan-includes">
    <div class="circle-header clearfix">
        <div>{counter name=step}</div>
        <h2>{$lang.planincludes}</h2>
        <span class="ajax ajax-small" style="display:none"></span>
        <span class="hr"></span>
    </div>
    <div class="plan">
        <ul>
            {*SUMMARY*}
            {* PRODUCT *}
            {if $product}
                <li class="clearfix">
                    <div class="left-txt">{$contents[0].category_name}: <strong>{$contents[0].name}</strong></div>
                    <div class="right-txt">
                        {*{if $contents[0].domain}({$contents[0].domain}){/if}<br/>*}
                        <span class="price">
                            {if $contents[0].price==0}
                                <strong>{$lang.Free}</strong>
                            {elseif $contents[0].prorata_amount}
                                <strong> {$contents[0].prorata_amount|price:$currency:true:false:false}</strong>
                                ({$lang.prorata} {$contents[0].prorata_date|dateformat:$date_format})
                            {else}
                                <strong>{$contents[0].price|price:$currency:true:false:false}</strong>
                            {/if}
                        </span>	
                        {if $cyclecount == 1 && $contents[0].recurring && $contents[0].price > 0}
                            <br />{assign value=$contents[0].recurring var=recurring}{$lang[$recurring]}
                        {/if}
                    </div>
                        
                    {if $contents[0].setup!=0} 
                        <div class="left-txt"><small>{$lang.setupfee}</small></div>
                        <div class="right-txt"><small>+ {$contents[0].setup|price:$currency:true:false:false}</small></div>
                    {/if}
                </li>
            {/if}
            {* FORMS *}
            
            {if $cart_contents[1]}
                {counter name=sliderto_s print=false assign=sliderto_s start=0 }
                {foreach from=$cart_contents[1] item=cstom2 key=cfi}
                    <li class="clearfix">
                        {counter name=headc start=0 step=1 assign=headc}
                        {foreach from=$cstom2 item=cstom}
                            {if !$headc}
                                {counter name=headc}
                                <div class="left-txt">
                                    <strong>{$cstom.name}</strong>  {if $cstom.qty>=1}x {$cstom.qty}{/if}
                                </div>
                            {/if}
                            {if $cstom.name != $cstom.itname}
                                <div class="left-txt">
                                    <small>{$cstom.itname}</small>  {if $cstom.qty>=1}x {$cstom.qty}{/if}
                                </div>
                            {/if}
                            <div class="right-txt">
                                <span class="price">
                                    <strong>
                                        {if $cstom.price==0}
                                            {$lang.Free}
                                        {elseif $cstom.prorata_amount}
                                            {$cstom.prorata_amount|price:$currency:true:false:false}
                                        {else}
                                            {$cstom.price|price:$currency:true:false:false}
                                        {/if} 
                                    </strong>
                                    {*{if $cstom.recurring}
                                    {assign value=$cstom.recurring var=recurring}{$lang[$recurring]}
                                    {elseif $cstom.price > 0}
                                    {$lang.once}
                                    {/if}*}
                                </span>
                                {if $cstom.setup!=0}
                                    <br />
                                    <span class="price">
                                        <strong>+ </strong> {$lang.setupfee}
                                    </span>
                                {/if}
                                
                            </div>
                            {if $cstom.setup!=0} 
                                <div class="left-txt"><small>{$lang.setupfee}</small></div>
                                <div class="right-txt"><small>+ {$cstom.setup|price:$currency:true:false:false}</small></div>
                            {/if}
                            {if $cstom.type == 'slider'}
                                {counter name=sliderto_s }
                                <script type="text/javascript">
                                    $('#custom_field_{$cfi}').val('{$cstom.qty}');
                                    $('#slider_{$cfi}').slider('value', '{$cstom.qty}')
                                </script>
                            {/if}
                        {/foreach}
                    </li>
                    
                {/foreach}
            {/if}
            {* ADDONS *}
            {if $contents[3]}
                {foreach from=$contents[3] item=addon}
                    <li class="clearfix">
                        <div class="left-txt">{$lang.addon} - <strong>{$addon.name}</strong></div>
                        <div class="right-txt">
                            <span class="price">
                                {if $addon.price==0}
                                    <strong>{$lang.Free}</strong>
                                {elseif $addon.prorata_amount}
                                    <strong>{$addon.prorata_amount|price:$currency:true:false:false}</strong> ({$lang.prorata} {$addon.prorata_date|dateformat:$date_format})
                                {else}
                                    <strong>{$addon.price|price:$currency:true:false:false}</strong>
                                {/if}
                                
                            </span>	
                            {if $addon.recurring && $addon.recurring != 'free'}
                                {assign value=$addon.recurring var=recurring}{$lang[$recurring]}
                            {elseif $addon.price > 0}
                                {$lang.once}
                            {/if}
                        </div>
                        {if $addon.setup!=0} 
                            <div class="left-txt"><small>{$lang.setupfee}</small></div>
                            <div class="right-txt"><small>+ {$addon.setup|price:$currency:true:false:false}</small></div>
                        {/if}
                    </li>
                {/foreach}
            {/if}
            {* DOMAINS *}
            {if $contents[2] && $contents[2][0].action!='own'}
                {foreach from=$contents[2] item=domenka key=kk}
                    <li class="clearfix">
                        <div class="left-txt">
                            <strong>
                                {if $domenka.action=='register'}
                                    {$lang.domainregister}:
                                {elseif $domenka.action=='transfer'}
                                    {$lang.domaintransfer}:
                                {/if}
                            </strong> {$domenka.name}
                        </div>
                        <div class="right-txt">
                            <span class="price">
                                {if $domenka.dns}
                                    &raquo; {$lang.dnsmanage} (+ {$domenka.dns|price:$currency:true:false:false})<br/>
                                {/if}
                                {if $domenka.idp}
                                    &raquo; {$lang.idprotect}(+ {$domenka.idp|price:$currency:true:false:false})<br/>
                                {/if}
                                {if $domenka.email}
                                    &raquo; {$lang.emailfwd} (+ {$domenka.email|price:$currency:true:false:false})<br/>
                                {/if}
                                <strong>{$domenka.price|price:$currency:true:false:false}</strong>
                            </span>
                            <br />
                            {$domenka.period} {$lang.years}
                        </div>
                    </li>
                {/foreach}
            {/if}
            {* SUBPRODUCTS *}
            {if $contents[4]}

                {foreach from=$contents[4] item=subprod}
                    <li class="clearfix">
                        <div class="left-txt">{$subprod.category_name}:  <strong>{$subprod.name}</strong></div>
                        <div class="right-txt">
                            <span class="price">
                                {if $subprod.price==0}
                                    <strong>{$lang.Free}</strong>
                                {elseif $subprod.prorata_amount}
                                    <strong> {$subprod.prorata_amount|price:$currency:true:false:false}</strong>
                                    ({$lang.prorata} {$subprod.prorata_date|dateformat:$date_format})
                                {else}
                                    <strong>{$subprod.price|price:$currency:true:false:false}</strong>
                                {/if}
                            </span>	
                            {if $subprod.recurring && $subprod.recurring != 'free' }
                                {assign value=$subprod.recurring var=recurring}{$lang[$recurring]}
                            {elseif $subprod.price > 0}
                                {$lang.once}
                            {/if}
                        </div>
                        {if $subprod.setup!=0} 
                            <div class="left-txt"><small>{$lang.setupfee}</small></div>
                            <div class="right-txt"><small>+ {$subprod.setup|price:$currency:true:false:false}</small></div>
                        {/if}
                    </li>
                {/foreach}
            {/if}
        </ul>
    </div>
</div>
{if $product.paytype!='Free' && $product.paytype!='Once' && $cyclecount > 1 }
    <div class="billing-option clearfix">
        <div class="circle-header clearfix">
            <div>{counter name=step}</div>
            <h2>{$lang.billoptions}</h2>
            <span class="hr"></span>
        </div>
        <div class="cart-switch" id="cycleswitch">
    {if $product.h!=0}<span rel="h" {if $cycle == 'h'}class="active"{/if}>{$lang.h}</span>{/if}
{if $product.d!=0} <span rel="d" {if $cycle == 'd'}class="active"{/if}>{$lang.d}</span>{/if}
{if $product.w!=0} <span rel="w" {if $cycle == 'w'}class="active"{/if}>{$lang.w}</span>{/if}
{if $product.m!=0} <span rel="m" {if $cycle == 'm'}class="active"{/if}>{$lang.m}</span>{/if}
{if $product.q!=0} <span rel="q" {if $cycle == 'q'}class="active"{/if}>{$lang.q}</span>{/if}
{if $product.s!=0} <span rel="s" {if $cycle == 's'}class="active"{/if}>{$lang.s}</span>{/if}
{if $product.a!=0} <span rel="a" {if $cycle == 'a'}class="active"{/if}>{$lang.a}</span>{/if}
{if $product.b!=0} <span rel="b" {if $cycle == 'b'}class="active"{/if}>{$lang.b}</span>{/if}
{if $product.t!=0} <span rel="t" {if $cycle == 't'}class="active"{/if}>{$lang.t}</span>{/if}
{if $product.p4!=0} <span rel="p4" {if $cycle == 'p4'}class="active"{/if}>{$lang.p4}</span>{/if}
{if $product.p5!=0} <span rel="p5" {if $cycle == 'p5'}class="active"{/if}>{$lang.p5}</span>{/if}
<div></div>
</div>
</div>
{/if} 
{if $currencies && count($currencies) > 1}     
    <div class="currency">
        <div class="circle-header clearfix">
            <div>{counter name=step}</div>
            <h2>{$lang.Currency}</h2>
            <span class="hr"></span>
        </div>
        <div class="currency-box dropdown">
            <p class="openSansBold dropdown-toggle"  data-toggle="dropdown">{$lang.Currency}: 
                <span>
                    {foreach from=$currencies item=crx}
                    {if !$selcur && $crx.id==0}{if $crx.code}{$crx.code}{else}{$crx.iso}{/if} {if $crx.sign}({$crx.sign}){/if}{elseif $selcur==$crx.id}{if $crx.code}{$crx.code}{else}{$crx.iso}{/if} {if $crx.sign}({$crx.sign}){/if}{/if}
                    {/foreach}
</span>
<span class="right dropdown-mark"></span>
</p>

<div class="dropdown-list dropdown-menu">
    <ul>
        {foreach from=$currencies item=crx}
            <li><a href="#" onclick="return changecurrency({$crx.id});">{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</a></li>
        {/foreach}
    </ul>
</div>
</div>
</div>
{/if}
<div class="total">
    
    <div class="amount clearfix">
        <div class="left total-price">
            {$lang.total}
        </div>
        <div class="left display-amount blue">
            <span class="ajax ajax-big" style="display:none"></span>
            <sup>{$currency.sign}</sup>{if $tax}{$tax.total|price:$currency:false:false}{elseif $credit}{$credit.total|price:$currency:false:false}{else}{$subtotal.total|price:$currency:false:false}{/if}
        </div>{*
        <div class="left period">
        / <span>Monthly</span>
        </div>
        *}
    </div>
</div>
<div id="promocode" style="display:none" >
    <form action="" method="post" id="promoform" onsubmit="return applyCoupon();" class="form-horizontal" >
        <input type="hidden" name="addcoupon" value="true" />    
        <h3>{if !$subtotal.coupon}{$lang.addcouponcode}{else}<a href="#" onclick="removeCoupon(); return false;">{$lang.remove_coupon}</a>{/if}</h3>
        {if !$subtotal.coupon}
        <div class="input-append">
            <input type="text" size="16" name="promocode" class="input2"><button type="button" class="btn" onclick="$('#promoform').submit();">{$lang.Go}!</button>
        </div>
        {/if}
    </form>
</div>
<script type="text/javascript">{literal}$(function(){fixHeaders();bindCycleSwitch();}); if($('.step-2').is(':visible'))$('#promocode').show(){/literal}</script>