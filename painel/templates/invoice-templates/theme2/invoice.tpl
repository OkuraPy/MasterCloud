{if $invoice}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
<base href="{$system_url}" />

<link rel="stylesheet" type="text/css" href="{$template_dir}simpledark/css/print.css"  media="print" />
<link rel="stylesheet" type="text/css" href="{$template_dir}simpledark/css/frame.css" media="screen" />
<link rel="stylesheet" href="{$template_dir}simpledark/css/bootstrap.min.css">
<link rel="stylesheet" href="{$template_dir}simpledark/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>



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
</div>

<div class="top"></div>
<div id="bg">

	<div class="overlay-bg">
				<div class="overlay-content">
				
				{if $invoice.status=='Unpaid'}
					<form action="" method="post" style="margin-bottom:0px;">
					<select name="paymethod" onchange="submit()" style="width:100%" class="paymethod">
					{if $invoice.payment_module == 0}<option value="0"> - </option>{/if}
					{foreach from=$gateways key=gatewayid item=paymethod}
					<option value="{$gatewayid}"{if $invoice.payment_module == $gatewayid} selected="selected"{/if} >{$paymethod}</option><br/>
					{/foreach}
					</select>
					{securitytoken}</form>
					<div id="gateway">
					{$gateway}
					</div>
					{/if}<br/>
					<button class="close-btn">Close</button>
				</div>
			</div>
			
			
	<div id="container">
	
		<div class="nav">
		<div class="status {$invoice.status}"><span style="margin: 0 auto;"><center>{$lang[$invoice.status]}</span></div>
		
		<div class="menu">
		
		<table align="right" class="a-menu" style="margin-top: 25px;">
		<tr>
		<td align="center" width="95px" style="border-right: 1px solid #ededed;">
		<a href="#" target="_blank" onclick="window.print();"><div style="width: 100%" height="100%"><center><i class="icon-print icon-2x"></i> <br/>{$lang.print_invoice}</center></div></a>
		</td>
	
		<td align="center" width="95px" style="border-right: 1px solid #ededed;">
		<a href="{$ca_url}root&amp;action=download&amp;invoice={$invoice.id}"><div style="width: 100%" height="100%"><center><i class="icon-cloud-download icon-2x"></i> <br/>{$lang.download}</center></div></a>
		</td>
		
		{if $invoice.status=='Unpaid'}
		<td align="center" width="95px">
		<a class="show-popup" href="#"><div style="width: 100%" height="100%"><i class="icon-credit-card icon-2x"></i> <br/>{$lang.paynow}</div></a>
		</td>{/if}
		</table>

		</div>
		</div>
		
		
	
		<div class="clearfix"></div>

	<div class="invoice-content">
		{$invoicebody}
	</div>
	
	</div>
	</div>

<div class="bottom"></div>
<div class="space"></div>


				
    <div style="clear:both"></div>

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