{*
@@author:: HostBill team
@@name:: Bootstrap Sliders, One-step
@@description:: A One-Step checkout, designed for single package configured with the use of at least three sliders, clients can add domains, select addons, config options and signup, all on one page.
Nice clean full screen template with current plan highlighted.
@@thumb:: onestep_bootstrap/thumb.png
@@img:: onestep_bootstrap/prev.png
*}
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_bootstrap/style.css" />
{literal}
<script type="text/javascript">
if(typeof jQuery().dropdown == 'undefined'){{/literal}
    $.getScript("{$orderpage_dir}onestep_bootstrap/bootstrap/js/bootstrap.js");
    $.getScript("{$orderpage_dir}onestep_bootstrap/bootstrap/js/bootstrap-dropdown.js");
{literal}}
</script>
{/literal}
<script type="text/javascript" src="{$orderpage_dir}onestep_bootstrap/script.js"></script>
<div class="category-list">
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
</div>
<div id="refreash">
    {include file=ajax.onestep_bootstrap.tpl}
</div>

<form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
    <input type="hidden" name="make" value="order" />
    <div class="customizer2" style="display:none">
        <div id="gatewayform" class="clear" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
        {$gatewayhtml}
        </div>
        <div class="contact-info clear" >
        {*CONTACT INFO*}
            {if $logged=="1"}
            <h1 style="padding-left:10px">{$lang.ContactInfo}</h3>
            <div id="clientinfo">
                {include file="drawclientinfo.tpl"}
            </div>
            {else}
            <h1>{$lang.ContactInfo}</h3>
            <div style="position: relative">
            <ul class="wbox_menu tabbme">
                <li {if !$submit || !$submit.make || $submit.cust_method=='newone'}class="t1 on"{else}class="t1"{/if} onclick="{literal}ajax_update('index.php?cmd=signup',{layer:'ajax'},'#clientform',true);$(this).parent().find('li.t2').removeClass('on');$(this).addClass('on');{/literal}" >
                {$lang.newclient}</li>
                <li {if $submit.cust_method=='login' || $submit.action=='login'}class="t2 on"{else}class="t2"{/if} onclick="{literal}ajax_update('index.php?cmd=login',{layer:'ajax'},'#clientform',true);$(this).parent().find('li.t1').removeClass('on');$(this).addClass('on');{/literal}"}>
                {$lang.alreadyclient}</li>
            </ul>
            </div>
            <div id="clientform">
            {if $submit.cust_method=='login' || $submit.action=='login'}
                {include file='ajax.login.tpl}
            {else}
                {include file='ajax.signup.tpl}
            {/if}
            </div>
            {/if}
        </div>
        <div class="order-submit">
            <textarea id="c_notes" placeholder="{$lang.c_tarea}" style="width:99%" rows="3"  name="notes">{if $submit.notes}{$submit.notes}{/if}</textarea>
            {if $tos}<span style="padding: 0 30px;"> <input type="checkbox" value="1" name="tos"/> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a></span>{/if}
            <button class="btn btn-success btn-large" type="submit">{$lang.checkout}</button>
        </div>
    </div>
</form>
    