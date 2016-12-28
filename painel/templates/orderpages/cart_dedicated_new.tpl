{*
@@author:: HostBill team
@@name:: Dedicated Servers Full-screen
@@description:: This order page has been created specifically to help you sell dedicated servers in modern, professional way.
@@thumb:: dedicated_new/thumb.png
@@img:: dedicated_new/preview.png
*}
{include file='dedicated_new/cart_header.tpl'}
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}dedicated_new/styles.css" />
{if $step==0}
    {include file='dedicated_new/cart0.tpl'}
{elseif $step==1 || $step==2}
    <h3>This catd does not support domains</h3>
    <a class="btn btn-warning" href="?cmd=cart&step=3">{$lang.contnue}</a>
{elseif $step==3}
	{include file='dedicated_new/cart3.tpl'}
{elseif $step==4} 
	{include file='dedicated_new/cart4.tpl'}
{*{elseif $step==5} 
	{include file='dedicated_new/cart5.tpl'}*}
{/if}

{include file='dedicated_new/cart_footer.tpl'}