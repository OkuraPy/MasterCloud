<div>
    <h4 rel="{$cart_contents[0].id}">{*<img src="{$orderpage_dir}dedicated_new/img/opteron.png" alt="cpu" />*}
        {$cart_contents[0].name}
    </h4>  

    {if $cart_contents[1]}
        {foreach from=$cart_contents[1] item=cstom2 name=foo}
            {foreach from=$cstom2 item=cstom}
                {if ($cstom.price > 0 || $cstom.itname != $cstom.name || $cstom.qty > 1) && $cstom.itname != $lang.none}
                    <span class="summary-line first">{$cstom.name}</span>
                    <span class="summary-line last">{$cstom.itname} {if $cstom.qty>=1}x {$cstom.qty}{/if}</span>
                    <div class="hr"></div>
                {/if}
            {/foreach}
        {/foreach}
    {/if}

    {foreach from=$cart_contents[3] item=addon name=foo}
        <span class="summary-line first">{$lang.addon}</span>
        <span class="summary-line last">{$addon.name}</span>
        <div class="hr"></div>
    {/foreach}

    {foreach from=$cart_contents[4] item=subprod}
        <span class="summary-line first">{$subprod.category_name}</span>
        <span class="summary-line last">{$subprod.name}</span>
        <div class="hr"></div>
    {/foreach}

    {if $subtotal.coupon}
        <li class="i2  ">
            <span class="summary-line first">{$lang.discount}</span>
            <span class="summary-line last">- {$subtotal.discount|price:$currency}</span>
        </li>
    {/if}
</div>
<div class="separator"></div>
<div class="cart-price">
    {if $tax}
        <span>{$lang.subtotal}</span> 
        <strong> {$tax.subtotal|price:$currency}</strong>

        {if $tax.tax1 && $tax.taxed1!=0}
            <span>{$tax.tax1name} @ {$tax.tax1}% </span> 
            <strong>{$tax.taxed1|price:$currency}</strong>
        {/if}

        {if $tax.tax2  && $tax.taxed2!=0}
            <span>{$tax.tax2name} @ {$tax.tax2}%   </span>
            <strong>{$tax.taxed2|price:$currency}</strong>
        {/if}

        {if $tax.credit!=0}
            <span>{$lang.credit}</span>
            <strong>{$tax.credit|price:$currency}</strong>
        {/if}
    {elseif $credit}
        {if  $credit.credit!=0}
            <span>{$lang.credit} </span>
            <strong> {$credit.credit|price:$currency}</strong>
        {/if}
        <span>{$lang.subtotal} </span>
        <strong>{$subtotal.total|price:$currency}</strong>
    {else}
        <span>{$lang.subtotal} </span>
        <strong>{$subtotal.total|price:$currency}</strong>
    {/if}

    {if !empty($tax.recurring)}
        <span>{$lang.total_recurring}</span>
        <strong>
            {foreach from=$tax.recurring item=rec key=k}
                {$rec|price:$currency} {$lang.$k}<br/>
            {/foreach}
        </strong>

    {elseif !empty($subtotal.recurring)}
        <span>{$lang.total_recurring}</span>
        <strong>
            {foreach from=$subtotal.recurring item=rec key=k}
                {$rec|price:$currency} {$lang.$k}<br/>
            {/foreach} 
        </strong>
    {/if}

    <span>{$lang.total_today} </span>
    <strong class="order-total">
        {if $tax}
            {$tax.total|price:$currency}
        {elseif $credit}
            {$credit.total|price:$currency}
        {else}
            {$subtotal.total|price:$currency}
        {/if}
    </strong>
    {if count($currencies)>1}


        <span id="currform">
            {$lang.Currency} 
        </span>
        <div>
        <form method="post" action="">
            <input type="hidden" value="{$step}" name="step"/>           
            <select name="currency" class="styled span2" onchange="$(this).parent().submit(); ">
                {foreach from=$currencies item=crx}
                    <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                {/foreach}
            </select>
        </form>
        </div>
    {/if}
    {if !$subtotal.coupon}
        <span>
            <a href="#" onclick="$(this).hide();$('#promocode').show(); $('#right').height($('.cart-summary').outerHeight(true)); return false;"><strong>{$lang.usecoupon}</strong></a>
        </span>
        <div id="promocode" style="display:none;">
            <form action="" method="post" id="promoform" onsubmit="return applyCoupon();">
                <input type="hidden" name="step" value="{$step}" />
                <span>{$lang.code}:</span> 
                <input type="text" class="styled span2" name="promocode"/> 
                <input type="submit" value="&raquo;" style="font-weight:bold" class="padded btn"/>
            </form>
        </div>

    {/if}
    <div class="clear"></div>
</div>
<script type="text/javascript">
    $('#right').height($('.cart-summary').outerHeight(true));
    $('#cartSummary .hr:last-child').hide();
</script>