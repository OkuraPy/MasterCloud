{*
@@author:: HostBill team
@@name:: Four comparison boxes, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. Nice clean template with current plan highlighted, designed to hold 4 packages. 
@@thumb:: onestep_comparison_boxes/thumb.png
@@img:: onestep_comparison_boxes/preview.png
*}
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_comparison_boxes/css/style.css" />
<script type="text/javascript" src="{$orderpage_dir}onestep_comparison_boxes/js/script.js"></script>

{foreach from=$categories item=i name=categories name=cats}
{if $i.id == $current_cat}{assign var=category_name value=$i.name}{/if}
{/foreach}
<div id="page" class="center">
    <div class="step_1 clearfix page-full">
        <span class="blue-line"></span>
        <h1 class="museoSans">{$lang.serverpricing}</h1>
        <p class="openSansLight italic">{$lang.afterchoise}.</p>
        {foreach from=$products item=i name=loop key=k}
            <div class="server-details {if $product.id == $i.id}selected{/if} left">
                <div class="server">
                    <div class="server-header">
                        <h3 class="openSansBold text-center">{$i.name}</h3>
                        <p class="openSansSemiBold text-center">{$category_name}</p>
                    </div>
                    <span class="server-shadow"></span>
                    <div class="server-params center">
                        {specs var="awords" string=$i.description}
                        {foreach from=$awords item=prod name=lla key=k}
                            {if $prod.specs} 
                                {foreach from=$prod.specs item=feat name=ll key=ka}
                                    <div class="server-info text-center">
                                        <p class="openSansBold">{$feat[0]}: <span>{$feat[1]}</span></p>
                                    </div>
                                {/foreach}
                            {/if}

                        {/foreach}
                        {assign var=awords value=false}
                    </div>
                    <div class="server-order clearfix">
                        
                        <div class="server-price left">
                            <p class="openSansBold">{include file='common/price.tpl' product=$i}</p>
                        </div>
                        <div class="server-button-field right">
                            <div class="server-button">
                                <span class="openSansBold text-center">{$lang.order|capitalize}</span>
                                <input type="hidden" value="{$i.id}"/>
                            </div>
                        </div>
                        <div class="server-price left" style="clear:left">
                            <small class="openSansRegular">{include file='common/cycle.tpl' product=$i}</small>
                        </div>
                        
                    </div>
                </div>
                {if $prod.features} 
                    {$prod.features}
                {/if}            
            </div>
        {/foreach}
    </div>
    <script type="text/javascript">equalHeight();</script>
    <div class="step_2 page-full" id="configer">
       	{include file='ajax.onestep_comparison_boxes.tpl'}
    </div>
    <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
        <input type="hidden" name="make" value="order" />
        <div class="middle-column page-full">
            {*CONTACT INFO*}
            <h2 class="openSansRegular dashedBorder left">{$lang.ContactInfo}</h2>
            {if $logged=="1"}
                {include file="drawclientinfo.tpl"}
            {else}
                <div class="client-toggle left">
                    <div class="client-toggle-button">
                    </div>
                    <p id="new-client" class="left-client-option {if !$submit || !$submit.make || $submit.cust_method=='newone' || $submit.action!='login'}active-client{/if} openSansBold">{$lang.newclient}</p>
                    <p id="registered-client" class="right-client-option {if $submit.cust_method=='login' || $submit.action=='login'}active-client{/if} inactive-client openSansBold">{$lang.registered}</p>
                </div>
                <div id="updater" class="clear">
                    {if $submit.cust_method=='login' || $submit.action=='login'}
                        {include file='ajax.login.tpl}
                    {else}
                        {include file='ajax.signup.tpl}
                    {/if}
                </div>
            {/if}

        </div>


        <div class="middle-column step_2-shadow page-full">
            <h2 class="openSansRegular colWidthFix dashedBorder left">{$lang.cart_add}</h2>
            <div class="textarea-field">
                <textarea id="c_notes" placeholder="{$lang.c_tarea}"  name="notes">{if $submit.notes}{$submit.notes}{/if}</textarea>
            </div>
        </div>


        <div class="step_3">
            <span class="blue-line"></span>
            {if $opconfig.footer}<h1 class="museoSans">{$opconfig.footer}</h1>{/if}
            {if $opconfig.subfooter}<p class="openSansLight italic">{$opconfig.subfooter}</p>{/if}

            <div class="checkout-info">
                <div class="checkout-text left">
                    {if $opconfig.footertext}
                    <p class="openSansRegular italic">
                        {$opconfig.footertext}
                    </p>
                    {/if}
                    <p class="openSansRegular italic">
                        {if $tos}
                            <br />
                            <input type="checkbox" value="1" name="tos"/> 
                            {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a>
                        {/if}
                    </p>
                </div>
                <div class="checkout-button left {if $opconfig.footertext == ''}tosup{/if}">
                    <span class="museoSans text-center" onclick="$('#orderform').submit(); return false;" >{$lang.checkout}<small class="museoSans">>></small></span>
                </div>
                <div class="checkout-arrow"></div>
            </div>
        </div>
        <div style="display:none" id="formtail"></div>
    </form>
</div>