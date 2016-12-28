<div id="cart_contents" class="cart-sumary">
    <table border="0" cellpadding="0" cellspacing="1" width="100%" class="table table-striped">
        <tr>
            <th>{$lang.Description}</th>
            <th>{$lang.price}</th>
        </tr>
        {if $cart_contents[0]}
            <tr>
                <td class="midtext">			
                    {$cart_contents[0].category_name} - <strong>{$cart_contents[0].name}</strong>
                </td>
                <td></td>	
            </tr>

            <tr>
                <td class="smalltext">
                    {$lang.setupfee}
                </td>
                <td align="right" class="smalltext">
                    {$cart_contents[0].setup|price:$currency}
                </td>		
            </tr>

            <tr class="space">
                <td class="smalltext">
                    {if $cart_contents[0].price!=0}
                        {assign var=tit value=$cart_contents[0].recurring}
                        {$lang[$tit]}
                    {/if}

                </td>
                <td align="right" class="smalltext">
                    {if $cart_contents[0].price!=0}
                        {$cart_contents[0].price|price:$currency}
                    {else}
                        {$lang.Free}
                    {/if}

                </td>		
            </tr>
        {/if}

        {if $cart_contents[1]}
            {foreach from=$cart_contents[1] item=cstom2}
                {foreach from=$cstom2 item=cstom} 
                    {if $cstom.total>0}
                        <tr class="space">
                            <td class="smalltext">{$cstom.sname} {if $cstom.qty>=1}x {$cstom.qty}{/if}</td>
                            <td align="right" class="smalltext">{$cstom.total|price:$currency}</td>
                        </tr>
                        {/if}
                    {/foreach}
                {/foreach}
        {/if}	

        {foreach from=$cart_contents[4] item=subprod}
            <tr>
                <td colspan="2" class="midtext">
                    {$subprod.category_name} - <strong>{$subprod.name}</strong>
                </td>
            </tr>

            <tr>
                <td class="smalltext">
                    {$lang.setupfee}
                </td>
                <td align="right" class="smalltext">
                    {$subprod.setup|price:$currency}
                </td>
            </tr>

            <tr class="space">
                <td class="smalltext">
                    {if $subprod.price!=0}
                        {assign var=tit value=$subprod.recurring}
                        {$lang[$tit]}
                    {/if}

                </td>
                <td align="right" class="smalltext">
                    {if $subprod.price!=0}
                        {$subprod.price|price:$currency}
                    {else}
                        {$lang.Free}
                    {/if}

                </td>
            </tr>

        {/foreach}

        {foreach from=$cart_contents[3] item=addon}
            <tr >
                <td colspan="2"  class="midtext">{$lang.addon} <strong>{$addon.name}</strong></td>
            </tr>

            <tr>
                <td class="smalltext">
                    {$lang.setupfee}
                </td>
                <td align="right" class="smalltext">
                    {$addon.setup|price:$currency}
                </td>
            </tr>

            <tr class="space">
                <td  class="smalltext">
                    {if $addon.price!=0}
                        {assign var=tit value=$addon.recurring}
                        {$lang[$tit]}
                    {/if}

                </td>
                <td  align="right" class="smalltext">
                    {if $addon.price!=0}
                        {$addon.price|price:$currency}
                    {else}
                        {$lang.Free}
                    {/if}
                </td>
            </tr>
        {/foreach}


        {if $cart_contents[2] && $cart_contents[2][0].name!='yep'}
            {foreach from=$cart_contents[2] item=domenka key=kk}{if $domenka.action!='own'  && $domenka.action!='hostname'}
                    <tr >
                        <td colspan="2"  class="midtext">
                            <strong>{$domenka.name}</strong>
                        </td>
                    </tr>
                    <tr {if !$domenka.forms}class="space"{/if}>
                        <td class="smalltext">{if $domenka.action=='register'}{$lang.domainregister}{elseif $domenka.action=='transfer'}{$lang.domaintransfer}{elseif $domenka.action=='renew'}{$lang.domainrenewal}{/if} {$domenka.period} {$lang.years}
                        </td>
                        <td class="smalltext" align="right">{$domenka.price|price:$currency}
                        </td>
                    </tr>

                    {if $domenka.forms}
                        {foreach from=$domenka.forms item=cstom2 name=domainfo}
                            {foreach from=$cstom2 item=cstom}
                                {if $cstom.total>0}
                                    <tr {if $smarty.foreach.domainfo.last}class="space"{/if}>
                                        <td class="smalltext">{$cstom.sname} {if $cstom.qty>=1}x {$cstom.qty}{/if}</td>
                                        <td align="right" class="smalltext">{$cstom.total|price:$currency}</td>
                                    </tr>
                                    {/if}
                                {/foreach}
                            {/foreach}
                        {/if}
                    {/if}
                {/foreach}
            {/if}

        {if $subtotal.coupon}
            <tr> 
                <td class="smalltext">{$lang.promotionalcode}: <strong>{$subtotal.coupon}</strong>
                </td>
                <td class="smalltext" align="right">- {$subtotal.discount|price:$currency}
                </td>
            </tr>
            <tr class="space">
                <td class="smalltext" colspan="2" align="right">
                    <form id="remove" method="post">
                        <input type="hidden" name="step" value="{$step}" />
                        <input type="hidden" name="removecoupon" value="true" />
                    </form>
                    <a href="#" onclick="{if $step!=4}return removeCoupon();{else}$('#remove').submit();{/if}">{$lang.removecoupon}</a>
                </td>
            </tr>
        {/if}

    </table>

    {if $subtotal.coupon}

    {else}
        <div class="coupon">
            <a href="#" onclick="$(this).hide();$('#promocode').show();return false;"><strong>{$lang.usecoupon}</strong></a>
        </div>
        <div id="promocode" style="display:none;">
            <form action="" method="post" id="promoform" onsubmit="{if $step!=4}return applyCoupon();{else}{/if}">
                <input type="hidden" name="step" value="{$step}" />

                {$lang.code}: <input type="text" class="styled span2" name="promocode"/> <input type="submit" value="&raquo;" style="font-weight:bold" class="padded btn"/></form>
        </div>

    {/if}
</div>



<div style="text-align:right"><strong>{if $step==4}{$lang.total_today}{else}{$lang.carttoday}{/if}</strong></div>
<div class="cart_total">
    
    {if $step!=4}
        {$currency.sign}{$subtotal.total|price:$currency:false}
    {else}
        {if $tax}
            {$currency.sign}{$tax.total|price:$currency:false}
        {elseif $credit}
            {$currency.sign}{$credit.total|price:$currency:false}
        {else}
            {$currency.sign}{$subtotal.total|price:$currency:false}
        {/if}
    {/if}
    {$currency.code}
</div>

