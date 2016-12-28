{if $prices}
    <div class="cleart clear"></div>
    {if count($currencies)>1}
        <div class="left" style="padding-top: 1em">
            <form action="" method="post" id="currform">
                <input type="hidden" name="showpricing" value="true" />
                <input type="hidden" name="action" value="{$action}" />
                {$lang.Currency} 
                <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                    {foreach from=$currencies item=crx}
                        <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                    {/foreach}
                </select>
            </form>
        </div> 
    {/if}

    <div class="clear fs11" >
        <a href="#domainprices"  onclick="$('.regprices').show();
                $(this).hide();
                return false;"  
           {if $showpricing}style="display:none"{/if} >
            {$lang.domainpricing} &raquo;
        </a>
    </div>
{/if}

<a name="domainprices"></a>
<div class="regprices"  {if !$showpricing}style="display:none"{/if} >{if $prices}
    <div class="clear" style="margin-bottom:10px;"></div>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="styled">
        {if count($prices)>6}

            <colgroup>
                <col width="25%" />
                <col width="25%" />
                <col width="25%" />
                <col width="25%" />
            </colgroup>
            <tr  class="head-table status-head">
                <td>{$lang.tld}</td>
                <td>{$lang.minperiod}</td>
                <td>{if $transfer}{$lang.transfer}{else}{$lang.register}{/if}</td>
                <td>{$lang.renew}</td>
            </tr>
            {foreach from=$prices item=price name=foo}
                <tr class="row-table {if $smarty.foreach.foo.index == 0}row-table-row1{elseif $smarty.foreach.foo.index%2 == 1}row-table-white{/if}">
                    <td align="left" class="kols1">{$price.tld}</td>
                    <td align="center">{$price.period}</td>
                    <td align="center">
                        {if $transfer}
                    {if $price.transfer>0}{$price.transfer|price:$currency}{elseif $price.transfer==0}{$lang.free}{else}-{/if}
                {else}
            {if $price.register>0}{$price.register|price:$currency}{elseif $price.register==0}{$lang.free}{else}-{/if}
        {/if}
    </td>

    <td  align="center">{if $price.renew>0}{$price.renew|price:$currency}{elseif $price.renew==0}{$lang.free}{else}-{/if}</td>
</tr>
{/foreach}

{else}

    <colgroup><col  />{foreach from=$prices item=price name=foo}
        <col  />{/foreach}
    </colgroup>
    <tr  class="head-table status-head">
        <td></td>
        {foreach from=$prices item=price name=foo}<td>{$price.tld}</td>{/foreach}
    </tr>
    <tr class="row-table row-table-white">
        <td>{foreach from=$prices item=price name=foo}{$price.period} {$lang.years}{break}{/foreach}</td>
    {foreach from=$prices item=price name=foo}<td>{if $transfer}{if $price.transfer>0}{$price.transfer|price:$currency}{elseif $price.transfer==0}{$lang.free}{else}-{/if}
    {else}{if $price.register>0}{$price.register|price:$currency}{elseif $price.register==0}{$lang.free}{else}-{/if}
    {/if}</td>{/foreach}
</tr>


{/if} </table>{/if}
</div>