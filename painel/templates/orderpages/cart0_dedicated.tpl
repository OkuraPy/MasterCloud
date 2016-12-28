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
			<td width="15%" align="center">{$lang.setupfee}</td>
			<td width="15%" align="center">{$lang.price}</td>
		</tr>
	</table>
</div>

    {foreach from=$products item=i}
<form name="" action="" method="post">
<input name="action" type="hidden" value="add">
<input name="id" type="hidden" value="{$i.id}">
<div class="orderbox sh1a">
<div class="orderboxpadding" style="">
<table width="100%">
<tbody>
  <tr>
  <td width="18">
  	<img src="{$template_dir}img/more_info.gif" alt=""/>
  </td>
    <td >
	<strong>{$i.name}</strong>
	</td>
    <td width="15%" align="center">
	{price product=$i first=true}
        {if $i.paytype=='Free'}
            <input type="hidden" name="cycle" value="Free" />
            {$lang.Free}
        {elseif $i.paytype=='Once'}
            <input type="hidden" name="cycle" value="Once" />
            @@setup
        {else}
            @@setup
        {/if}
        {/price}
	</td>
	<td width="15%" align="center">
	{price product=$i first=true}
        {if $i.paytype=='Free'}
            {$lang.Free}
        {elseif $i.paytype=='Once'}
            @@price
        {else}
            @@price
        {/if}
        {/price}
	</td>
</tr>
</tbody>
</table>
</div>
<div style="display:none" id="hid_{$i.id}" class="subdesc_">
<table width="100%" cellspacing="2">
	<tr>
	<td width="45%" valign="middle" align="left">
	{if $i.paytype=='Free'}
      
     <h3>{$lang.Free}</h3>
      
      {elseif $i.paytype=='Once'}
     {$i.m|price:$currency} {$lang.once} {if $i.m_setup>0} + {$i.m_setup|price:$currency} {$lang.setupfee}{/if}
		{if $i.free_tlds.Once}<span class="freedomain">{$lang.freedomain}</span>{/if}
   
      {else}
	  {$lang.pickcycle}
      <select name="cycle" style="margin:4px 0px;">
         {if $i.h!=0}

        <option value="h">{$i.h|price:$currency} {$lang.h}{if $i.h_setup!=0} + {$i.h_setup|price:$currency} {$lang.setupfee}{/if}{if $i.free_tlds.Hourly} {$lang.freedomain}{/if}</option>

        {/if}
           {if $i.d!=0}
        
        <option value="d">{$i.d|price:$currency} {$lang.d}{if $i.d_setup!=0} + {$i.d_setup|price:$currency} {$lang.setupfee}{/if}{if $i.free_tlds.Daily} {$lang.freedomain}{/if}</option>
        
        {/if}
		{if $i.w!=0}
        
        <option value="w">{$i.w|price:$currency} {$lang.w}{if $i.w_setup!=0} + {$i.w_setup|price:$currency} {$lang.setupfee}{/if} {if $i.free_tlds.Weekly}{$lang.freedomain}{/if}</option>
        
        {/if}
        
              {if $i.m!=0}
        
        <option value="m">{$i.m|price:$currency} {$lang.m}{if $i.m_setup!=0} + {$i.m_setup|price:$currency} {$lang.setupfee}{/if} {if $i.free_tlds.Monthly}{$lang.freedomain}{/if}</option>
        
        {/if}
              {if $i.q!=0}
        
        <option value="q">{$i.q|price:$currency} {$lang.q}{if $i.q_setup!=0} + {$i.q_setup|price:$currency} {$lang.setupfee}{/if} {if $i.free_tlds.Quarterly}{$lang.freedomain}{/if}</option>
        
        {/if}
              {if $i.s!=0}
        
        <option value="s">{$i.s|price:$currency} {$lang.s}{if $i.s_setup!=0} + {$i.s_setup|price:$currency} {$lang.setupfee}{/if} {if $i.free_tlds.SemiAnnually}{$lang.freedomain}{/if}</option>
        
        {/if}
              {if $i.a!=0}
        
        <option value="a">{$i.a|price:$currency} {$lang.a}{if $i.a_setup!=0} + {$i.a_setup|price:$currency} {$lang.setupfee}{/if} {if $i.free_tlds.Annually}{$lang.freedomain}{/if}</option>
        
        {/if}
              {if $i.b!=0}
        
        <option value="b">{$i.b|price:$currency} {$lang.b}{if $i.b_setup!=0} + {$i.b_setup|price:$currency} {$lang.setupfee}{/if} {if $i.free_tlds.Biennially}{$lang.freedomain}{/if}</option>
        
        {/if}
 {if $i.t!=0}
        
        <option value="t">{$i.t|price:$currency} {$lang.t}{if $i.t_setup!=0} + {$i.t_setup|price:$currency} {$lang.setupfee}{/if} {if $i.free_tlds.Triennially}{$lang.freedomain}{/if}</option>
        
        {/if}
        {if $i.p4!=0}
        <option value="p4">{$i.p4|price:$currency} {$lang.p4}{if $i.p4_setup!=0} + {$i.p4_setup|price:$currency} {$lang.setupfee}{/if} {if $i.free_tlds.Quadrennially}{$lang.freedomain}{/if}</option>
        {/if}
		{if $i.p5!=0}
        <option value="p5">{$i.p5|price:$currency} {$lang.p5}{if $i.p5_setup!=0} + {$i.p5_setup|price:$currency} {$lang.setupfee}{/if} {if $i.free_tlds.Quinquennially}{$lang.freedomain}{/if}</option>
        {/if}
      
      </select>

      {/if} 

  <center><input type="submit" value="{$lang.ordernow}" style="font-weight:bold;" class="padded btn"/></center>
	</td>
	<td valign="middle">
		{if $i.description!=''}{$i.description}{/if}
	</td>
	</tr>
	
</table>



      
</div>
</div>
</form>

{/foreach}
{else}
<center>{$lang.nothing}</center>
{/if}


{/if}