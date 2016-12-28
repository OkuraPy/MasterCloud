{include file="`$onappdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.billing}</h3>
    <div class="clear"></div>
</div>
<div class="content-bar ">
    
    
     {if $service.flavor_enabled && $service.showbilling && ($service.status=='Active' || $service.status=='Suspended')}


          <div class="report">
             
               <div class="button">
                    <span class="value" style="color:red">{$service.flavor_total|price:$currency}</span>
                    <span >{$lang.curbalance}</span>
                </div>

                <div class="button ">
                    <span class="value" style="color:#7caa06">{$acc_credit|price:$currency}</span>
                    <span >Credit left</span>
                </div>
                <a class="button green" href="{$ca_url}clientarea&action=addfunds">
                    <span class="value" >{$lang.addfunds}</span>
                    <span ><i class="icon-plus-sign"></i> click to add funds</span>
                </a>

            </div>
                    
                    

            <link rel="stylesheet" href="includes/types/onappcloud/clientarea/demo_table.css" type="text/css" />
            <script type="text/javascript" src="includes/types/onappcloud/js/jquery.dataTables.min.js"></script>
        {literal}   
             <style>
                 .report .value {
                    font-size: 27px;
                    padding:10px;
                    }
                        </style>
            <script type="text/javascript">
                var bPaginate={
                    "bFilter": false,
                    "sPaginationType": "full_numbers",
                    "bLengthChange":false,
                    "iDisplayLength": 24,
                    "aaSorting": []
                };
               
                function bindMeUp() {
                    $('#pricingdetails  table').eq(0).dataTable(bPaginate);
                }
                if(typeof(appendLoader)=='function') {
                    appendLoader('bindMeUp');
                } else {
                    $(document).ready(function(){bindMeUp();});
                }
</script>    {/literal}

    <div class="mseparator"></div>
            {* metered table *}
            <div id="pricingdetails">
                <div style="margin-bottom:8px;padding-bottom:2px;border-bottom:1px solid #DADBDD">
                    <h3 class="summarize left" style="border-bottom:none;margin:0px;padding:0px;">{$lang.usagedetails} <span>({$lang.updatedhourly})</span></h3>
                    
                    <div class="clear"></div>
                </div>
        <div id="pricingtable"> {include file="`$onappdir3`flavor_table.tpl"}</div>

        
                <div class="clear"></div>
            </div>

                    {/if}
    
    <h3 class="summarize">{$lang.summary}</h3>
    <table cellpadding="0" cellspacing="0" class="ttable" width="100%" style="margin-top:0px">
        <tr>
            <td class="title" width="160" align="right"><b>{$lang.registrationdate}</b></td>
            <td  width="268">{$service.date_created|dateformat:$date_format}</td>
            <td class="title" align="right"  width="160"><b>{$lang.status}</b></td>
            <td   width="268"><span class="{$service.status}"><strong>{$lang[$service.status]}</strong></span></td>
        </tr>
        {if $service.showbilling &&  $service.billingcycle!='Free' && $service.billingcycle!='Once'}

        <tr>
            <td class="title" align="right"><b>{if $service.billingcycle=='Hourly' || $service.flavor_enabled}{$lang.curbalance}{else}{$lang.reccuring_amount}{/if}</b></td>
            <td> 
                {if $service.flavor_total}   
                    {$service.flavor_total|price:$currency}
                 {else}
                    {$service.total|price:$currency}{/if}
                <span class="fs11">{if $service.billingcycle=='Hourly'}({$lang.updatedhourly}){elseif $service.flavor_total}{else}({$lang[$service.billingcycle]}){/if}</span>
              </td>
            {if $service.billingcycle!='Free' && $service.billingcycle!='Once'}
            <td class="title" align="right"><b>{$lang.nextinvoice}:</b></td>
            <td>{$service.next_invoice|dateformat:$date_format}</td>
            {else}
            <td colspan="2"></td>
            {/if}
        </tr>
        {/if}
            </table>
    <div class="mseparator"></div>
            {if $service.flavor_enabled && $service.showbilling && ($service.status=='Active' || $service.status=='Suspended')}


            {/if}

            {if $service.custom}
                <table class="table table-striped table-aff-center p-top">
                    {foreach from=$service.custom item=cst}
                        <tr >
                            <td class="w30 bold">{$cst.name}  </td>
                            <td>{include file=$cst.configtemplates.clientarea} </td>
                        </tr>
                    {/foreach}
                </table>
            {/if}
		{if $addons}
            <table cellpadding="0" cellspacing="0" class="ttable" width="100%">
                <tr>
                    <td colspan="4">
                        <div>
                            <strong>{$lang.accaddons|capitalize}</strong>  
                            <div >
                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
                            <tr>
                                <td colspan="2" style="border:none">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
                                    <colgroup class="firstcol"></colgroup>
                                    <colgroup class="alternatecol"></colgroup>
                                    <colgroup class="firstcol"></colgroup>
                                    <colgroup class="alternatecol"></colgroup>
                                    <tbody>
                                        <tr>
                                            <th width="40%" align="left">{$lang.addon}</th>
                                            <th align="left">{$lang.price}</th>
                                            <th>{$lang.nextdue}</th>
                                            <th >{$lang.status}</th>
                                        </tr>
                                        {foreach from=$addons item=addon name=foo}
                                            <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
                                                <td>{$addon.name}</td>
                                                <td>{$addon.recurring_amount|price:$currency}</td>
                                                <td align="center">{$addon.next_due|dateformat:$date_format}</td>
                                                <td align="center" ><span class="{$addon.status}">{$lang[$addon.status]}</span></td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                                </td>
                                </tr>
                                
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    {$service.id|string_format:$lang.clickaddaddons}
                </td>
            </tr>
        </table>
        {elseif $haveaddons && $service.status!='Fraud' && $service.status!='Cancelled' && $service.status!='Terminated'}
         <table cellpadding="0" cellspacing="0" class="ttable" width="100%">
            <tr>
                <td colspan="4">
                    <div><strong>{$lang.accaddons|capitalize}</strong></div>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    {$service.id|string_format:$lang.clickaddaddons}
                </td>
            </tr>
         </table>
        {/if}

    
</div>

{include file="`$onappdir`footer.cloud.tpl"}