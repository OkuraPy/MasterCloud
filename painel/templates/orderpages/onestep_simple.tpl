{*
@@author:: HostBill team
@@name:: Simple Full-Page Checkout, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
Nice clean full screen template with current plan highlighted.
@@thumb:: onestep_simple/thumb.png
@@img:: onestep_simple/prew.png
*}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<base href="{$system_url}" />
		<title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
		<script type="text/javascript" src="{$orderpage_dir}onestep_simple/jquery.js"></script>
		<script type="text/javascript" src="{$orderpage_dir}onestep_simple/common.js"></script>
		<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_simple/style.css" />
		<script type="text/javascript" src="{$orderpage_dir}onestep_simple/script.js"></script>
		{if $cmd!='chat'}
			<script type="text/javascript" src="{$system_url}?cmd=chat&amp;action=embed&amp;nojquery"></script>
		{/if}
		<!-- part below is not css valid. remove it if you want this document to be css valid -->
		<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_simple/corners.css" />
		{foreach from=$HBaddons.header_js item=module}
			{$module}
		{/foreach}
	</head>

	<body class="{$language|capitalize}">

		<div id="headpart">
			<div id="mainpart">
				<h1 class="shadow">{$business_name}</h1>
				<h1>{$business_name}</h1>
				<a href="{$system_url}" id="headback">&laquo; {$lang.backto} {$business_name}</a>
			</div>	
		</div>
		<div id="content">
			<div id="contener">
				<div id="errors" {if $error}style="display:block"{/if}>{foreach from=$error item=blad}<span>{$blad}</span>{/foreach}
					<a class="close" href="#"><img src="{$orderpage_dir}onestep_simple/img/ico_close.gif" alt="" /></a>
				</div>
				<div id="infos"  {if $info}style="display:block"{/if}>{foreach from=$info item=infos}<span>{$infos}</span>{/foreach}
					<a class="close" href="#"><img src="{$orderpage_dir}onestep_simple/img/ico_close.gif" alt="" /></a>
				</div>
				<div id="services" >
					{foreach from=$categories item=i name=categories name=cats}
					{if $i.id == $current_cat}{*
							*}<strong>{$i.name}</strong>
					{/if}
					{/foreach}
					{foreach from=$categories item=i name=categories name=cats}
						{if $i.id != $current_cat}| {*
							*}<a href="{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a>
						{/if}
					{/foreach}
					{if $logged=='1'} 
						| {if $current_cat=='addons'}<strong>{else}<a href="{$ca_url}cart&amp;step={$step}&amp;cat_id=addons">{/if}
						{$lang.prodaddons}
						{if $current_cat=='addons'}</strong>{else}</a>{/if}
					{/if}	
				</div>
				<div id="inner">
					{*<div class="right">
				{if $adminlogged}
				{$lang.adminlogged} | <a  href="{$admin_url}/index.php{if $login.id}?cmd=clients&amp;action=show&amp;id={$login.id}{/if}">{$lang.adminreturn}</a> |
				{/if}
				{if $logged=='1'}{$lang.loggedinas} <a href="{$ca_url}clientarea/">{$login.firstname} {$login.lastname}</a>  | <a href="{$ca_url}clientarea/details/">{$lang.manageaccount}</a> | <a href="?action=logout">{$lang.logout}</a>{else}
				<a href="{$ca_url}signup/">{$lang.createaccount}</a> |  <a href="{$ca_url}clientarea/">{$lang.login}</a>
				{/if}
				</div>*}
	
					<div id="r_cont">
						<div id="thankyou">
							{$lang.thankyouforchoosing} <span>{$business_name}</span>!
						</div>
						{if $opconfig.righttext}
						<div id="marketing">
						{$opconfig.righttext}	
						
						</div>
						{/if}
						<div id="summary">
							<div id="floter">
								{include file='ajax.onestep_simple.tpl' hidecart="1"}
							</div>
						</div>
						
					</div>
					<div class="p_cont">
						<div class="productbox top"></div>
						<div id="cont" >			
							<h2>{$lang.chooseyourplan}</h2>
							<a href="#" id="moreservice" onclick="$('#services').slideToggle();$(this).toggleClass('on');return false;">{$lang.moreservices}</a>
							<div class="hr"></div>
							<table id="products" cellpadding="0" cellspacing="0">
								<thead>
									<tr>
										<th class="first">{$lang.planname}</th>
										<th>{$lang.setupfee}</th>
										<th>{$lang.price}</th>
									</tr>
								</thead>
								<tbody>
									{foreach from=$products item=i name=loop key=k}
									<tr id="pr{$i.id}" {if $i.id==$product.id}class="active"{/if} onclick="changeProduct({$i.id});return false;">
                                        <td class="first"><input id="lb_{$i.id}" type="radio" name="r1" /> <label for="lb_{$i.id}" {if strlen($i.name) > 30}title="{$i.name}"{/if}>{$i.name|truncate:30:'...':false}</label></td>
										<td>
											<label for="lb_{$i.id}">
											{if $i.paytype=='Free'}
											{elseif $i.paytype=='Once'}{if $i.m_setup>0}{$i.m_setup|price:$currency} {else}{/if}
											{else}
												{if $i.m_setup!='0.00'}{$i.m_setup|price:$currency}
												{elseif $i.q_setup!='0.00'}{$i.q_setup|price:$currency}
												{elseif $i.s_setup!='0.00'}{$i.s_setup|price:$currency}
												{elseif $i.a_setup!='0.00'}{$i.a_setup|price:$currency}
												{elseif $i.b_setup!='0.00'}{$i.b_setup|price:$currency}
												{elseif $i.t_setup!='0.00'}{$i.t_setup|price:$currency}
												{elseif $i.p4_setup!='0.00'}{$i.p4_setup|price:$currency}
												{elseif $i.p5_setup!='0.00'}{$i.p5_setup|price:$currency}
												{else}{/if}
											{/if}
											</label>
										</td>
										<td class="last">
											<label for="lb_{$i.id}">
											{if $i.paytype=='Free'}{$lang.Free}
											{elseif $i.paytype=='Once'}
												{if $i.m>0}{$i.m|price:$currency}
												{else}{$lang.Free}
												{/if}
											{else} 
												{if $i.d!=0}{$lang.d} 
												{elseif $i.w!=0}{$i.w|price:$currency} 
												{elseif $i.m!=0}{$i.m|price:$currency}
												{elseif $i.q!=0}{$i.q|price:$currency}
												{elseif $i.s!=0}{$i.s|price:$currency}
												{elseif $i.a!=0}{$i.a|price:$currency}
												{elseif $i.b!=0}{$i.b|price:$currency}
												{elseif $i.t!=0}{$i.t|price:$currency}
												{elseif $i.p4!=0}{$i.p4|price:$currency}
												{elseif $i.p5!=0}{$i.p5|price:$currency}
												{/if}
											{/if}			
											</label>
										</td>
									</tr>
									{/foreach}
								</tbody>
							</table>
							<div class="relative"><div class="load-img"><img src="{$template_dir}img/ajax-loading.gif" /></div></div>
							<div id="configer">
							{include file='ajax.onestep_simple.tpl'}
							</div>
							<form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">

{if $gateways}
<div id="gatewayform" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if} class="newbox1 configbox">
  {$gatewayhtml}
  </div>
{/if}

							<input type="hidden" name="make" value="order" />
							{*CONTACT INFO*}
							{if $logged=="1"}
							<h2 class="modern">{$lang.ContactInfo}</h2>
							<div class="hr"></div>
							<div id="clientinfo">
								{include file="drawclientinfo.tpl"}
							</div>
							{else}
							<h2 class="modern">{$lang.ContactInfo}</h2>
							<div class="hr"></div>
							<ul class="wbox_menu tabbme">
								<li {if !$submit || $submit.cust_method=='newone'}class="t1 on"{else}class="t1"{/if} onclick="{literal}ajax_update('index.php?cmd=signup',{layer:'ajax'},'#clientform',true);$(this).parent().find('li.t2').removeClass('on');$(this).addClass('on');{/literal}" >
								{$lang.newclient}</li>
								<li {if $submit.cust_method=='login' || $submit.action=='login'}class="t2 on"{else}class="t2"{/if} onclick="{literal}ajax_update('index.php?cmd=login',{layer:'ajax'},'#clientform',true);$(this).parent().find('li.t1').removeClass('on');$(this).addClass('on');{/literal}"}>
								{$lang.alreadyclient}</li>
							</ul>
							
							<div id="clientform">
							{if $submit.cust_method=='login' || $submit.action=='login'}
								{include file='ajax.login.tpl}
							{else}
								{include file='ajax.signup.tpl}
							{/if}
							</div>
							{/if}
							<h2 class="modern">{$lang.cart_add}</h2>
							<div class="hr"></div>

							<div class="newbox1">
								<textarea id="c_notes" {if !$submit.notes}onblur="if (this.value=='')this.value='{$lang.c_tarea}';" onfocus="if(this.value=='{$lang.c_tarea}')this.value='';"{/if} style="width:98%" rows="3"  name="notes">{if $submit.notes}{$submit.notes}{else}{$lang.c_tarea}{/if}</textarea>
							</div>

							{if $tos}
							<h2>{$lang.tos2}</h2>
							<div class="hr"></div>
							<div id="tos">
								<span class="checkbox" onclick="if($(this).children('input').attr('checked'))$(this).removeClass('on').children('input').attr('checked',false);else $(this).addClass('on').children('input').attr('checked',true)"><input type="checkbox" value="1" name="tos"/></span>
								{$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a>
							</div>
							{/if}
							{if $opconfig.tostext}
							<p id="footertext">
								{$opconfig.tostext}
							</p>
							{/if}
							<div onclick="$('#orderform').submit();return false;" id="submitorder">{$lang.createaccount}</div>
							<div style="height:1px"></div>	
							</form>
						</div>
						<div class="productbox bottom"></div>
					</div>
					<div class="clear space100"></div>	
				</div>
			</div>
		</div>
	</body>
</html>
