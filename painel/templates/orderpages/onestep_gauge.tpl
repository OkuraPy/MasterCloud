{*
@@author:: HostBill team
@@name:: Gauge Sliders, One-step
@@description:: A One-Step checkout, designed for single package configured with the use of at least three sliders, clients can add domains, select addons, config options and signup, all on one page.
@@thumb:: onestep_gauge/thumb.png
@@img:: onestep_gauge/prev.png
*}
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_gauge/css/style.css" />
{*<link media="all" rel="stylesheet" href="{$orderpage_dir}onestep_gauge/css/jquery-ui-1.8.21.custom.css" />*}
{*<script type="text/javascript" src="{$orderpage_dir}onestep_gauge/js/jQuery-1.7.js"></script>*}
{*<script type="text/javascript" src="{$orderpage_dir}onestep_gauge/js/jquery-ui-1.8.21.custom.min.js">
</script>*}
{literal}
<script type="text/javascript">
if(typeof jQuery().dropdown == 'undefined'){{/literal}
    $.getScript("{$orderpage_dir}onestep_bootstrap/bootstrap/js/bootstrap.js");
    $.getScript("{$orderpage_dir}onestep_bootstrap/bootstrap/js/bootstrap-dropdown.js");
{literal}}
</script>
{/literal}
<script type="text/javascript" src="{$orderpage_dir}onestep_gauge/js/raphael.js"></script>
<script type="text/javascript" src="{$orderpage_dir}onestep_gauge/js/script.js"></script>

{if $opconfig.description}
    <h1>{$opconfig.description}</h1>
{/if}
<div class="category-list text-center">
{foreach from=$categories item=i name=categories name=cats}
        {if $i.id == $current_cat}{*
            *}<strong>{$i.name}</strong>
        {/if}
    {/foreach}
    {foreach from=$categories item=i name=categories name=cats}
        {if $i.id != $current_cat}| {*
        *}<a href="{$system_url}{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a>
        
    {/if}
{/foreach}
<input type="hidden" value="{$system_url}" id="system_url" />
</div>
<div id="shadow-top" class="center"></div>
<div class="clicktrough"></div>
<div class="main-container center {if $submit}submit{/if}">

<!-- Left Column -->
<div id="left-column" class="left">
	<div class="setup-plan">
        <div class="circle-header clearfix">
            <div>{counter name=step}</div>
            <h2>{$lang.setupyourplan}</h2>
            <span class="hr"></span>
        </div>
        <form id="cart0" action="" method="post">
        <div class="setup-plan-box clearfix">
            {counter name=vsliderc print=false assign=vslider start=0}
            {foreach from=$custom item=cf name=vsliders}
                {if $cf.type == 'slider'}
                    {if $vslider == 0}
                    {include file="onestep_gauge/slider.tpl" slideno=$smarty.foreach.vsliders.index}
                    {/if}
                    {counter name=vsliderc}
                {/if}
            {/foreach}
            {counter name=vsliderc print=false assign=vslider start=0}
            {foreach from=$custom item=cf name=vsliders}
                {if $cf.type == 'slider'}
                    {if $vslider == 1}
                    {include file="onestep_gauge/slider.tpl" slideno=$smarty.foreach.vsliders.index}
                    {/if}
                    {counter name=vsliderc}
                {/if}
            {/foreach}
            {counter name=vsliderc print=false assign=vslider start=0}
            {foreach from=$custom item=cf name=vsliders}
                {if $cf.type == 'slider'}
                    {if $vslider == 2}
                    {include file="onestep_gauge/slider.tpl" slideno=$smarty.foreach.vsliders.index}
                    {/if}
                    {counter name=vsliderc}
                {/if}
            {/foreach}
        </div>
        </form>
    </div>
    
    <div {if $submit}style="display:none"{/if} class="why-us left step-1">
        <div class="circle-header clearfix">
            <div class="green">?</div>
            <h2>{$lang.whyus}</h2>
            <span class="hr"></span>
        </div>
        <div class="iemask">
            <div class="why-us-box clearfix">
            {if $opconfig.whyus1}
                <div class="box left">
                    {$opconfig.whyus1}
                </div>
            {/if}

            {if $opconfig.whyus2}
                <div class="box left">
                    {$opconfig.whyus2}
                </div>
            {/if}

            {if $opconfig.whyus3}
                <div class="box left">
                    {$opconfig.whyus3}
                </div>
            {/if}

            {if $opconfig.whyus4}
                <div class="box left">
                    {$opconfig.whyus4}
                </div>
            {/if}
            </div>
        </div>
        <div class="read-more">
            {if $opconfig.aboutus}
        	<a href="{$opconfig.aboutus}" class="openSansBold">{$lang.readaboutus}</a>
            {else}
            <a class="openSansBold" href="?cmd=tickets&action=new">{$lang.getintouch}!</a>
            {/if}
            <div class="tiny-arrow right"></div>
        </div>
    </div>
    
    
    
    <div {if !$submit}style="display:none"{/if} class="left step-2">
        <div class="circle-header clearfix">
            <div class="green">?</div>
            <h2>{$lang.productconfig}</h2>
            <span class="hr"></span>
        </div>
        <div class="iemask">
            {counter name=alter start=0 assign=alterval}
            <div class="product-configuration clearfix">
               {*FORMS*}
                <form id="cart1" action="" method="post">
                    <input type="hidden" name="custom[-1]" value="dummy" />
                {counter name=vsliderc print=false assign=vslider start=0}
                {foreach from=$custom item=cf name=sliders}
                    {if $cf.type == 'slider'}
                        {counter name=vsliderc}
                    {/if}
                    {if $vslider > 3 && $cf.type == 'slider'}
                    <div class="item {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}">
                    {include file="onestep_gauge/horizontalslider.tpl"}
                    </div>
                    {counter name=alter}
                    {/if}
                {/foreach}
                {foreach from=$custom item=cf} 
                    {if $cf.items && $cf.type && $cf.type != 'slider' }
                    <div class="item {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}"> 
                        <h3>{$cf.name} {if $cf.options &1}*{/if}</h3>
                        {include file=$cf.configtemplates.cart}
                        {if $cf.description!=''}<div class="fs11 descr" >{$cf.description}</div>{/if}
                    </div>
                    {counter name=alter}
                    {/if}
                {/foreach}
                {if $product.paytype=='Free'}
                    <input type="hidden" name="cycle" value="Free" />
                {elseif $product.paytype=='Once'}
                    <input type="hidden" name="cycle" value="Once" />
                {else}
                    <input type="hidden" name="cycle" value="{$cycle}" />
                {/if}
                </form>
                    {* SUBPRODUCTS *}
                    {if $subproducts}
                        <form id="cart2" action="" method="post">
                        <input type="hidden" name="subproducts[0]" value="0" />
                        <input type="hidden" name="addon[0]" value="0" />
                            {foreach from=$subproducts item=a key=k}
                            <div class="item {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}"> 
                                <h3>
                                    <input name="subproducts[{$k}]" type="checkbox" value="1" {if $selected_subproducts.$k}checked="checked"{/if}  onclick="simulateCart('#cart2');"/> 
                                    {$a.category_name} - {$a.name}
                                </h3>
                                {price product=$a}
                                {if $a.paytype=='Free'}
                                    {$lang.free}
                                    <input type="hidden" name="subproducts_cycles[{$k}]" value="free"/>
                                {elseif $a.paytype=='Once'}
                                    <input type="hidden" name="subproducts_cycles[{$k}]" value="once"/>
                                    @@line
                                {else}
                                    <select name="subproducts_cycles[{$k}]"   onchange="if($('input[name=\'subproducts[{$k}]\']').is(':checked'))simulateCart('#cart2');">
                                        <option value="@@cycle" @@selected>@@line</option>
                                    </select>
                                {/if}
                                {/price}
                                </div>
                                {counter name=alter}
                        {/foreach}
                        </form>
                    {/if}
                    <form id="cart3" action="" method="post">
                    {* ADDONS *}
                    {if $addons}
                        <input type="hidden" name="addon[0]" value="0" />                               
                        {foreach from=$addons item=a key=k}
                            <div class="item form-inline {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}"> 
                                <h3>
                                    <input name="addon[{$k}]" type="checkbox" value="1" {if $selected_addons.$k}checked="checked"{/if}  onclick="simulateCart('#cart3');"/> 
                                    {$a.name} 
                                </h3>
                                {if $a.description!=''} - {$a.description}{/if}

                                {if $a.paytype=='Free'}
                                    {$lang.free}
                                    <input type="hidden" name="addon_cycles[{$k}]" value="free"/>
                                {elseif $a.paytype=='Once'}
                                    <input type="hidden" name="addon_cycles[{$k}]" value="once"/>
                                {$a.m|price:$currency} {$lang.once} {if $a.m_setup!=0}/ {$a.m_setup|price:$currency} {$lang.setupfee}{/if}
                                {else}
                                    <select name="addon_cycles[{$k}]"   onchange="if($('input[name=\'addon[{$k}]\']').is(':checked'))simulateCart('#cart3');">
                                    {if $a.h!=0}<option value="h" {if (!$contents[3][$k] && $cycle=='h') || $contents[3][$k].recurring=='h'} selected="selected"{/if}>{$a.h|price:$currency} {$lang.h}{if $a.h_setup!=0} + {$a.h_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.d!=0}<option value="d" {if (!$contents[3][$k] && $cycle=='d') || $contents[3][$k].recurring=='d'} selected="selected"{/if}>{$a.d|price:$currency} {$lang.d}{if $a.d_setup!=0} + {$a.d_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.w!=0}<option value="w" {if (!$contents[3][$k] && $cycle=='w') || $contents[3][$k].recurring=='w'}  selected="selected"{/if}>{$a.w|price:$currency} {$lang.w}{if $a.w_setup!=0} + {$a.w_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.m!=0}<option value="m" {if (!$contents[3][$k] && $cycle=='m') || $contents[3][$k].recurring=='m'}  selected="selected"{/if}>{$a.m|price:$currency} {$lang.m}{if $a.m_setup!=0} + {$a.m_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.q!=0}<option value="q" {if (!$contents[3][$k] && $cycle=='q') || $contents[3][$k].recurring=='q'} selected="selected"{/if}>{$a.q|price:$currency} {$lang.q}{if $a.q_setup!=0} + {$a.q_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.s!=0}<option value="s" {if (!$contents[3][$k] && $cycle=='s') || $contents[3][$k].recurring=='s'} selected="selected"{/if}>{$a.s|price:$currency} {$lang.s}{if $a.s_setup!=0} + {$a.s_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.a!=0}<option value="a" {if (!$contents[3][$k] && $cycle=='a') || $contents[3][$k].recurring=='a'} selected="selected"{/if}>{$a.a|price:$currency} {$lang.a}{if $a.a_setup!=0} + {$a.a_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.b!=0}<option value="b" {if (!$contents[3][$k] && $cycle=='b') || $contents[3][$k].recurring=='b'} selected="selected"{/if}>{$a.b|price:$currency} {$lang.b}{if $a.b_setup!=0} + {$a.b_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.t!=0}<option value="t" {if (!$contents[3][$k] && $cycle=='t') || $contents[3][$k].recurring=='t'} selected="selected"{/if}>{$a.t|price:$currency} {$lang.t}{if $a.t_setup!=0} + {$a.t_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.p4!=0}<option value="p4" {if (!$contents[3][$k] && $cycle=='p4') || $contents[3][$k].recurring=='p4'} selected="selected"{/if}>{$a.p4|price:$currency} {$lang.p4}{if $a.p4_setup!=0} + {$a.p4_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    {if $a.p5!=0}<option value="p5" {if (!$contents[3][$k] && $cycle=='p5') || $contents[3][$k].recurring=='p5'} selected="selected"{/if}>{$a.p5|price:$currency} {$lang.p5}{if $a.p5_setup!=0} + {$a.p5_setup|price:$currency} {$lang.setupfee}{/if}</option>{/if}
                                    </select>
                                    {/if}

                            </div>
                            {counter name=alter}
                        {/foreach}
                    {/if}
                    {* HOSTNAME *}
                    {if ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain)}
                        <div class="item form-inline {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}"> 
                            <h3>{$lang.hostname}*</h3>
                            <input name="domain" value="{$item.domain}" class="styled" size="50" onchange="simulateCart('#cart3');"/>
                        </div>
                        {counter name=alter}
                        {if $product.extra.enableos=='1' && !empty($product.extra.os)}
                            <div class="item form-inline {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}"> 
                                <h3>{$lang.ostemplate} *</h3>
                                <select name="ostemplate" class="styled"   onchange="simulateCart('#cart3');">
                                    {foreach from=$product.extra.os item=os}
                                        <option value="{$os.id}"  {if $item.ostemplate==$os.id}selected="selected"{/if}>{$os.name}</option>
                                    {/foreach}
                                </select>      
                            </div>
                            {counter name=alter}
                        {/if}
                    {/if}
                    </form>
                    {*DOMAIN OPTIONS*}
                    {if ($cart_contents[0].domainoptions.register)=='1' && ($allowregister || $allowtransfer || $allowown || $subdomain)}
                    <div class="item {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}"> 
                        <h3>{$lang.mydomains}</h3>
                        <div class="btn-group">
                        {if $allowregister}<button rel="t1" class="btn {if $contents[2].action=='register' || !$contents[2]}active{/if}" onclick="tabbme(this);">{$lang.register}</button>{/if}
                        {if $allowtransfer}<button rel="t2" class="btn {if $contents[2].action=='transfer'}active{/if}" onclick="tabbme(this);">{$lang.transfer}</button>{/if}
                        {if $allowown}<button rel="t3" class="btn {if $contents[2].action=='own' && !$subdomain}active{/if}" onclick="tabbme(this);">{$lang.alreadyhave}</button>{/if}
                        {if $subdomain}<button rel="t4" class="btn {if $contents[2].action=='own' && $subdomain}active{/if}" onclick="tabbme(this);">{$lang.subdomain}</button>{/if}
                        </div>
                        <br />

                        {if $contents[2]}
                            <div id="domoptions22">
                                {foreach from=$contents[2] item=domenka key=kk}
                                    {if $domenka.action!='own'  && $domenka.action!='hostname'}
                                        <strong>{if $domenka.action=='register'}{$lang.domainregister}{elseif $domenka.action=='transfer'}{$lang.domaintransfer}{/if}</strong> - {$domenka.name} - {$domenka.period} {$lang.years}
                                        {$domenka.price|price:$currency}<br />
                                    {else}
                                        {$domenka.name}<br />
                                    {/if}
                                    {if $domenka.custom}
                                        <form class="cartD" action="" method="post">
                                            <table class="styled" width="100%" cellspacing="" cellpadding="6" border="0">
                                                {foreach from=$domenka.custom item=cf}
                                                    {if $cf.items}
                                                        <tr>
                                                            <td class="configtd" >
                                                                <label for="custom[{$cf.id}]" class="styled">{$cf.name}{if $cf.options & 1}*{/if}</label>
                                                                {if $cf.description!=''}<div class="fs11 descr" style="">{$cf.description}</div>{/if}
                                                                {include file=$cf.configtemplates.cart cf_opt_formId=".cartD" cf_opt_name="custom_domain"}
                                                            </td>
                                                        </tr>
                                                    {/if}   
                                                {/foreach}
                                            </table>
                                        </form>
                                    {/if}
                                {/foreach}
                                <a href="#" onclick="$('#domoptions22').hide();$('#domoptions11').show();return false;">{$lang.change}</a>
                            </div>
                        {/if}

                        <div {if $contents[2]}style="display:none"{/if} id="domoptions11">
                            <form action="" method="post"  name="domainpicker" onsubmit="return on_submit();">
                                <input type="hidden" value="{$cart_contents[0].id}" id="product_id" name="product_id" />
                                <input type="hidden" name="make" value="checkdomain" />
                                <div id="options">
                                    {if $allowregister}
                                        <div id="illregister" class="t1 slidme">
                                            <input type="radio" name="domain" value="illregister" style="display: none;" checked="checked"/>
                                            <div id="multisearch" class="left">
                                                <textarea name="sld_register" id="sld_register" style="resize: none"></textarea>
                                            </div>
                                            <div style="margin-left:10px;width:310px;float:left">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="" class="fs11">
                                                {foreach from=$tld_reg item=tldname name=ttld}
                                                    {if $smarty.foreach.ttld.index % 3 =='0'}<tr>{/if}
                                                        <td width="33%"><input type="checkbox" name="tld[]" value="{$tldname}" {if $smarty.foreach.ttld.first}checked="checked"{/if} class="tld_register"/> 
                                                            {$tldname}
                                                        </td>
                                                    {if $smarty.foreach.ttld.index % 3 =='5'}</tr>{/if}
                                                {/foreach}
                                                    <tr></tr>
                                                </table>
                                            </div>
                                            <div class="clear"></div>
                                            <p class="margin-top">
                                                <input type="submit" value="{$lang.check}" class="btn"/>
                                            </p>
                                        </div>
                                    {/if}
                                    {if $allowtransfer}
                                        <div id="illtransfer" style="{if $allowregister}display: none;{/if}"  class="t2 slidme align-center form-horizontal">
                                            <input type="radio" style="display: none;" value="illtransfer" name="domain" {if !$allowregister}checked="checked"{/if}/>
                                            www.
                                            <input type="text" value="" size="40" name="sld_transfer" id="sld_transfer" class="styled"/>
                                            <select name="tld_transfer" id="tld_transfer" class="span2">
                                                {foreach from=$tld_tran item=tldname}
                                                    <option>{$tldname}</option> 	
                                                {/foreach}
                                            </select>  
                                            <input type="submit" value="{$lang.check}" class="btn"/>
                                        </div>
                                    {/if}
                                    {if $allowown}
                                        <div id="illupdate" style="{if $allowregister || $allowtransfer}display: none;{/if}"  class="t3 slidme align-center form-horizontal">
                                            <input type="radio" style="display: none;" value="illupdate" name="domain" {if !$allowregister && !$allowtransfer}checked="checked"{/if}/>
                                            www.
                                            <input type="text" value="" size="40" name="sld_update" id="sld_update" class="styled"/>
                                            .
                                            <input type="text" value="" size="7" name="tld_update" id="tld_update" class="styled span2"/>  <input type="submit" value="{$lang.check}" class="btn"/>
                                        </div>
                                    {/if}
                                    {if $subdomain}
                                        <div id="illsub" style="{if $allowregister || $allowtransfer || $allowown}display: none;{/if}"  class="t4 slidme align-center form-horizontal">
                                            <input type="radio" style="display: none;" value="illsub" name="domain"  {if !($allowregister || $allowtransfer || $allowown)}checked="checked"{/if}/>
                                            www.
                                            <input type="text" value="" size="40" name="sld_subdomain" id="sld_subdomain" class="styled"/>  
                                            {$subdomain} <input type="submit" value="{$lang.check}" class="btn"/>
                                        </div>
                                    {/if}
                                </div>
                            </form>
                            <form method="post" action="" onsubmit="return onsubmit_2();" id="domainform2">
                                <div id="updater2">{include file="ajax.checkdomain.tpl"} </div>
                            </form>
                        </div>
                    </div>
                    {counter name=alter}
                {/if}
                {if $alterval == 0}
                    <div class="item first"> {$lang.nocustomizations} </div>
                {/if}
                {*CONFIG END*}
                <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
                <input type="hidden" name="make" value="order" />

                    {* PAYMENT METHOD *}
                    <div id="gatewayform" class="clear {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}"{counter name=alter} {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
                        {$gatewayhtml}
                    </div>

                    <div class="item {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}"{counter name=alter}> 
                        {*CONTACT INFO*}
                        {if $logged=="1"}
                        <h3 style="padding-left:10px">{$lang.ContactInfo}</h3>
                        <div id="clientinfo">
                            {include file="drawclientinfo.tpl"}
                        </div>
                        {else}
                        <div class="cart-switch tabbme">
                            <span {if !$submit || !$submit.make || $submit.cust_method=='newone' || $submit.action!='login'}class="t1 active on"{else}class="t1"{/if} onclick="ajax_update('{$system_url}index.php?cmd=signup',{literal}{layer:'ajax'},'#clientform',true);$(this).parent().find('li.t2').removeClass('on');$(this).addClass('on');{/literal}" >
                            {$lang.newclient}</span>
                            <span {if $submit.cust_method=='login' || $submit.action=='login'}class="t2 active on"{else}class="t2"{/if} onclick="ajax_update('{$system_url}index.php?cmd=login',{literal}{layer:'ajax'},'#clientform',true);$(this).parent().find('li.t1').removeClass('on');$(this).addClass('on');{/literal}"}>
                            {$lang.alreadyclient}</span>
                            <div></div>
                        </div>
                        <h3>{$lang.ContactInfo}</h3>
                        <div id="clientform" class="clear">
                        {if $submit.cust_method=='login' || $submit.action=='login'}
                            {include file='ajax.login.tpl}
                        {else}
                            {include file='ajax.signup.tpl}
                        {/if}
                        </div>
                        {/if}
                    </div>
                    <div class="item {if $alterval % 2 == 0}even{/if} {if $alterval == 0}first{/if}"{counter name=alter}> 
                        <h3>{$lang.cart_add}</h3>
                        <textarea id="c_notes" placeholder="{$lang.c_tarea}" style="width:100%" rows="3"  name="notes">{if $submit.notes}{$submit.notes}{/if}</textarea>
                    </div>
            </form>
            </div>
        </div>
    </div>
     {* hghfg*}
    
    
</div>


<!-- Right Column -->
<div id="right-column" class="right">
        <div id="update">
        {include file='ajax.onestep_gauge.tpl'}
        </div>
        <div class="step-2" {if !$submit}style="display:none"{/if}>
        {if $gateways}
        {* PAYMENT METHOD *}
            <h3>{$lang.choose_payment}</h3>
            <form action="" method="post" id="gatewaylist" onchange="simulateCart('gatewaylist');">
                <select class="payment-method" name="gateway" >
                {foreach from=$gateways item=module key=mid name=payloop}
                <option value="{$mid}"  {if $submit && $submit.gateway==$mid||$mid==$paygateid}selected="selected"{elseif $smarty.foreach.payloop.first}selected="selected"{/if}>{$module}</option>
                {/foreach}
                </select>
            </form>
        {/if}
        
        {if $tos}
            <br/>
            <div>
                <h3>{$lang.tos2}</h3>
                <input type="checkbox" value="1" onclick="if(this.checked)$('#orderform').append('<input type=\'hidden\' name=\'tos\' value\'1\' />'); else $('input[name=\'tos\']').remove();" /> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a>
            </div>
        {/if}
        </div>
        <div class="order-now clearfix">
            <div class="iemask">
            <a {if $submit}style="display:none"{/if} id="customize" href="#" class="openSansBold text-center">{$lang.ordernow}</a>
            <a {if !$submit}style="display:none"{/if} href="#" onclick="$('#orderform').submit(); return false;" class="openSansBold text-center">{$lang.checkout}</a>
            </div>
        </div>
    </div>
    <div class="clear">&nbsp;</div>
</div>
{literal}
<script type="text/javascript">
    function singup_image_reload(){var d = new Date(); $('.capcha:first').attr('src', $('#system_url').val()+'?cmd=root&action=captcha#' + d.getTime());return false;}
</script>
{/literal}