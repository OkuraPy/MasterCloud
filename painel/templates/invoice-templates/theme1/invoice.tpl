{if $invoice}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
<base href="{$system_url}" />

<link media="screen" type="text/css" rel="stylesheet" href="{$template_dir}css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="{$template_dir}invoice/css/frame.css" />
<link media="print" type="text/css" rel="stylesheet" href="{$template_dir}invoice/css/invoice_print.css" />

<title>{$hb}{$business_name} - {if $proforma && $invoice.status!='Paid'}{$lang.proforma}{else}{$lang.invoice}{/if} #{if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}{else}{$invoice.date|invprefix:$prefix}{$invoice.id}{/if}</title>
{if !empty($HBaddons.header_js)}
{foreach from=$HBaddons.header_js item=module}
	{$module}
{/foreach}
{/if}



</head>

<body>
{if $credit_available && $invoice.status=='Unpaid'}
<div id="credit-applicable">
    <div class="content">
        <span id="inv-credit-info">{$lang.youhavecredit} <a href="#" onclick="$('#inv-credit-info').hide();$('#inv-credit-form').show();return false"><b>{$lang.youhavecredit2}</b></a></span>
        <div id="inv-credit-form" style="display:none">
            <form method="post" action="" >
                <input type="hidden" name="make" value="applycredit" />
                {$lang.amountcredittoapply} <input type="text" value="{$credit_available}" size="4" name="amount" />
                <input type="submit" value="{$lang.applycredit}" style="padding:2px 2px;font-size:12px;font-weight:bold;" />
            {securitytoken}</form>
        </div>
    </div>
</div>
{/if}
<div id="backlink"><a href="{$ca_url}clientarea/">- {$lang.backtoclientarea} -</a></div>
<div class="container" class="unpaid-container">
{if $error}
    <div >
            <div class="alert alert-error">

            {foreach from=$error item=blad}{$blad}<br/>{/foreach}
        </div>

    </div>{/if}
    {if $info}
    <div >

        <div class="alert alert-info">
            {if $info}
            {foreach from=$info item=infos}{$infos}<br/>{/foreach}
            {/if}
        </div>
    </div>
{/if}



<div id="leftmenu">
		
		<ul class="cbp-vimenu">
		<li><img class="ico" src="{$template_dir}invoice/img/ico1.png"><br/>Invoice</li>
		<li><a href="#" target="_blank" onclick="window.print();" class="pelem"><img class="ico" src="{$template_dir}invoice/img/ico2.png"><br/>{$lang.print_invoice}</a></li>
		<li><a href="{$ca_url}root&amp;action=download&amp;invoice={$invoice.id}"><img class="ico" src="{$template_dir}invoice/img/ico3.png"><br/>Download</a></li>
		{if $invoice.status=='Unpaid'}<li><a class="show-popup" href="#"><img class="ico" src="{$template_dir}invoice/img/ico4.png"><br/>{$lang.paynow}</a></li> {/if}
		</ul>

				
			<div class="overlay-bg">
				<div class="overlay-content">
				{if $invoice.status=='Unpaid'}
					<form action="" method="post" style="margin-bottom:0px;">
					<select name="paymethod" onchange="submit()" style="width:100%" class="paymethod">
					{if $invoice.payment_module == 0}<option value="0"> - </option>{/if}
					{foreach from=$gateways key=gatewayid item=paymethod}
					<option value="{$gatewayid}"{if $invoice.payment_module == $gatewayid} selected="selected"{/if} >{$paymethod}</option>
					{/foreach}
					</select>
					{securitytoken}</form>
					<div id="gateway">
					{$gateway}
					</div>
					{/if}
					<button class="close-btn">Close</button>
				</div>
			</div>
</div>

<div class="invoice-content">
		<div class="status {$invoice.status}"><div class="rotation">{$lang[$invoice.status]}</div></div>

		<div>
			
			{$invoicebody}

		</div>
	</div>



    <div style="clear:both"></div>
</div>
{literal}
<script>
$(document).ready(function(){
    // show popup when you click on the link
    $('.show-popup').click(function(event){
        event.preventDefault(); // disable normal link function so that it doesn't refresh the page
        $('.overlay-bg').show(); //display your popup
    });
 
    // hide popup when user clicks on close button
    $('.close-btn').click(function(){
        $('.overlay-bg').hide(); // hide the overlay
    });
});
</script>

<script>
    $(document).ready(function(){
        $('#gateway input[type=submit]').addClass('btn').addClass('btn-success').addClass('btn-large');
    });
</script>
{/literal}
</body>
</html>
{/if}