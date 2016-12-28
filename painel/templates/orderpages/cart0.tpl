<h3>{$lang.browseprod}</h3>



<div style="padding:10px 0px;text-align:center;">
    {foreach from=$categories item=i name=categories name=cats}
        {if $i.id == $current_cat} <strong>{$i.name}</strong> {if !$smarty.foreach.cats.last}|{/if}
        {else} <a href="{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a> {if !$smarty.foreach.cats.last}|{/if}
        {/if}
    {/foreach}
{if $logged=='1'} | {if $current_cat=='addons'}<strong>{else}<a href="{$ca_url}cart&amp;step={$step}&amp;cat_id=addons">{/if}{$lang.prodaddons}{if $current_cat=='addons'}</strong>{else}</a>{/if}{/if}



{foreach from=$categories item=i name=categories name=cats}
    {if $i.id == $current_cat && $i.description!=''}
        <div style="text-align:left;margin-top:10px;">{$i.description}</div>
    {/if}
{/foreach}
</div>

{if $current_cat!='addons' && $current_cat!='transfer' && $current_cat!='register'}
    <br />

    {if $products}

        {if count($currencies)>1}
            <form action="" method="post" id="currform"><p align="right">
                    <input name="action" type="hidden" value="changecurr">
                    {$lang.Currency} <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                        {foreach from=$currencies item=crx}
                            <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                        {/foreach}
                    </select>
                </p></form>
            {/if}

        <div class="serv_head1">
            <table border="0" width="100%">
                <tr>
                    <td align="left">{$lang.service}</td>

                    <td width="15%" align="center">{$lang.order}</td>
                </tr>
            </table>
        </div>
        {foreach from=$products item=i}
            <form name="" action="" method="post">
                <input name="action" type="hidden" value="add">
                <input name="id" type="hidden" value="{$i.id}">
                <div class="orderbox sh1a">
                    <div class="orderboxpadding nomrlc">
                        <table width="100%">
                            <tbody>
                                <tr>
                                    <td width="75%">
                                        <strong>{$i.name}</strong>{if $i.description!=''}<br/>{$i.description}{/if}<br/>
                                        {price product=$i}
                                        {if $i.paytype=='Free'}
                                            <input type="hidden" name="cycle" value="Free" />
                                            {$lang.price}: <strong> {$lang.Free}</strong>
                                        {elseif $i.paytype=='Once'}
                                            <input type="hidden" name="cycle" value="Once" />
                                            @@line
                                        {else}
                                            {$lang.pickcycle}
                                            <select name="cycle">
                                                <option value="@@cycle" @@selected>@@line</option>
                                            </select>
                                        {/if}
                                        {/price}
                                    </td>
                                    <td width="25%" align="right">

                                        <input type="submit" value="{$lang.ordernow}" style="font-weight:bold;" class="padded btn"/>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>

        {/foreach}
    {else}
        <center>

            {* {$lang.nothing} *}
            {$lang.noservicesyet}
            {if $adminlogged}
                <br><br>
                <span style="text-align: left; padding: 1em; border:solid 1px #FFFEb1; background:#FFFEd1; display:inline-block ">
                    {$lang.noservicesyetadmin}
                    {if !$categories}<a href="{$admin_url}/?cmd=configuration" target="_blank">{$lang.Configuration}</a> &#187;
                        <a href="{$admin_url}/?cmd=services" target="_blank">{$lang.productsandservices}</a> &#187;
                        <a href="{$admin_url}/?cmd=services&action=addcategory" target="_blank">{$lang.addneworpage}</a>
                    {else} 
                        <a href="{$admin_url}/?cmd=configuration" target="_blank">{$lang.Configuration}</a> &#187;
                        <a href="{$admin_url}/?cmd=services" target="_blank">{$lang.productsandservices}</a> &#187;
                        <a href="{$admin_url}/?cmd=services&action=category&id={$current_cat}" target="_blank">{foreach from=$categories item=i}{if $i.id == $current_cat}{$i.name}{/if}{/foreach}</a> &#187;
                        <a href="{$admin_url}/?cmd=services&action=product&id=new&cat_id={$current_cat}" target="_blank">{$lang.addnewproduct}</a>
                    {/if}
                </span>	
            {/if}
        </center>
    {/if}

{elseif $current_cat=='addons'}
    <br />

    {if $addons}

        {if count($currencies)>1}
            <form action="" method="post" id="currform"><p align="right">
                    <input name="action" type="hidden" value="changecurr">
                    {$lang.Currency} <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                        {foreach from=$currencies item=crx}
                            <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                        {/foreach}
                    </select>
                </p></form>
            {/if}
            {foreach from=$addons.addons item=i  key=k}
            <form name="" action="" method="post">
                <input name="action" type="hidden" value="add">
                <input name="id" type="hidden" value="{$i.id}">
                <div class="orderbox">
                    <div class="orderboxpadding">
                        <table width="100%">
                            <tbody>
                                <tr>
                                    <td width="75%">
                                        <strong>{$i.name}</strong>{if $i.description!=''}<br />{$i.description}{/if}<br />

                                        {if $i.paytype=='Free'}
                                            <input type="hidden" name="addon_cycles[{$k}]" value="free" />
                                            {$lang.price}:<strong> {$lang.Free}</strong>

                                        {elseif $i.paytype=='Once'}
                                            <input type="hidden" name="addon_cycles[{$k}]" value="once" />
                                            {$lang.price}: {$i.m|price:$currency} {$lang.once} / {$i.m_setup|price:$currency} {$lang.setupfee}
                                        {else}
                                            <select name="addon_cycles[{$k}]" >
                                                {if $i.h!=0}<option value="d" {if $cycle=='h'} selected="selected"{/if}>{$i.h|price:$currency} {$lang.h}{if $i.h_setup!=0} + {$i.h_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}

                                                {if $i.d!=0}<option value="d" {if $cycle=='d'} selected="selected"{/if}>{$i.d|price:$currency} {$lang.d}{if $i.d_setup!=0} + {$i.d_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                                {if $i.w!=0}<option value="w" {if $cycle=='w'} selected="selected"{/if}>{$i.w|price:$currency} {$lang.w}{if $i.w_setup!=0} + {$i.w_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                                {if $i.m!=0}<option value="m" {if $cycle=='m'} selected="selected"{/if}>{$i.m|price:$currency} {$lang.m}{if $i.m_setup!=0} + {$i.m_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                                {if $i.q!=0}<option value="q" {if $cycle=='q'} selected="selected"{/if}>{$i.q|price:$currency} {$lang.q}{if $i.q_setup!=0} + {$i.q_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                                {if $i.s!=0}<option value="s" {if $cycle=='s'} selected="selected"{/if}>{$i.s|price:$currency} {$lang.s}{if $i.s_setup!=0} + {$i.s_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                                {if $i.a!=0}<option value="a" {if $cycle=='a'} selected="selected"{/if}>{$i.a|price:$currency} {$lang.a}{if $i.a_setup!=0} + {$i.a_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                                {if $i.b!=0}<option value="b" {if $cycle=='b'} selected="selected"{/if}>{$i.b|price:$currency} {$lang.b}{if $i.b_setup!=0} + {$i.b_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                                {if $i.t!=0}<option value="t" {if $cycle=='t'} selected="selected"{/if}>{$i.t|price:$currency} {$lang.t}{if $i.t_setup!=0} + {$i.t_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                                {if $i.p4!=0}<option value="p4" {if $cycle=='p4'} selected="selected"{/if}>{$i.p4|price:$currency} {$lang.p4}{if $i.p4_setup!=0} + {$i.p4_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                                {if $i.p4!=0}<option value="p5" {if $cycle=='p5'} selected="selected"{/if}>{$i.p5|price:$currency} {$lang.p5}{if $i.p5_setup!=0} + {$i.p5_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                            </select>

                                        {/if} 
                                        <br /> {$lang.applyto}
                                        <select name="account_id">
                                            {foreach from=$i.products item=a}
                                                {if $addons.packages[$a]}
                                                    {foreach from=$addons.packages[$a] item=b}
                                                        <option value="{$b.id}" {if $s_account==$b.id}selected="selected"{/if}>{$b.name}</option>
                                                    {/foreach}
                                                {/if}
                                            {/foreach}
                                        </select>

                                    </td>
                                    <td width="25%" align="right">

                                        <input type="submit" value="{$lang.ordernow}" style="font-weight:bold;" class="padded btn"/>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>

        {/foreach}

    {else}
        {$lang.nothing}
    {/if}

{elseif $current_cat=='transfer' || $current_cat=='register'}

{/if}