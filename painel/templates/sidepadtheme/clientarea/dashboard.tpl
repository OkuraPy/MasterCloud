{*

Clientarea dashboard - summary of owned services, due invoices, opened tickets

*}




<div class="text-block clear clearfix">
    <h4>{$lang.welcomeback}, {$login.firstname} {$login.lastname}</h4>
    <span>{$offer_total} {$lang.services}</span>
</div>

<!-- Services -->
{if $offer_total > 0}
<div class="text-block clear clearfix">
    <h5><i class="icon-service-header"></i>{$lang.servicedetails}</h5>
    <div class="separator-down-arrow"></div>
    <div class="line-separaotr"></div>
    
    <div class="clear clearfix">
        {if $mydomains>0}
        
        <div class="service-box">
            <div class="service-box-config">
                <a class="clearstyle btn dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="icon-config-service"></i>
                </a>
                <ul class="dropdown-menu">
                    <div class="dropdown-padding">
                    {if $expdomains}
                        <li><a href="{$ca_url}clientarea/domains/">{$expdomains_count} {$lang.ExpiringDomains}</a></li>
                    {/if}
                        <li><a href="{$ca_url}checkdomain/">{$lang.ordermore}</a><span></span></li>
                        <li><a href="{$ca_url}clientarea/domains/">{$lang.listmydomains}<span></span></a></li>
                    </div>
                </ul>
            </div>
            <a href="{$ca_url}clientarea/domains/"><span>{$mydomains}</span></a>
            <p><i class="icon-domain-service"></i>{$lang.mydomains}</p>
        </div>
        {/if}
        
        {foreach from=$offer item=offe}
        	{if $offe.total>0}
        	{assign var="offa" value="1"}
        <div class="service-box">
        	{if $offe.visible}
            <div class="service-box-config">
                <a class="clearstyle btn dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="icon-config-service"></i>
                </a>
                <ul class="dropdown-menu">
                    <div class="dropdown-padding">
                        <li><a href="{$ca_url}cart/{$offe.slug}/">{$lang.ordermore}</a><span></span></li>
                        <li><a href="{$ca_url}clientarea/services/{$offe.slug}/"> {$lang.servicemanagement}</a><span></span></li>
                    </div>
                </ul>
            </div>
            {/if}
            <a href="{$ca_url}clientarea/services/{$offe.slug}/"><span>{$offe.total}</span></a>
            <p><i class="icon-hosting-service"></i>{$offe.name}</p>
        </div>
        	{/if}
		{/foreach}
        
        {if $mydomains>0 || $offa}
        <div class="service-box order-more">
            <a href="{$ca_url}cart/">
                <i class="icon-order-more"></i>
                <span><p class="order-more-txt">{$lang.ordermore}</p></span>
            </a>
        </div>
        {/if}
    </div>
 </div>
 {/if}
 <!-- End of Services -->
 
 <!-- Invoices -->
 {if $dueinvoices}
 <div class="text-block clear clearfix">
    <h5><i class="icon-service-invoice"></i>{$lang.invoices}</h5>
    <div class="separator-down-arrow"></div>
    <div class="line-separaotr"></div>
    
    <div class="clear clearfix">
        <div class="table-box">
            <div class="table-header">
                <div class="right-btns">
                	<form method="post" action="index.php" style="margin:0px">
{if $enableFeatures.bulkpayments!='off'} <input type="hidden" name="action" value="payall"/>{else} <input type="hidden" name="action" value="invoices"/>{/if}
                        <input type="hidden" name="cmd" value="clientarea"/>
                        <button type="submit" class="clearstyle green-custom-btn btn"><i class="icon-success"></i> {$lang.paynowdueinvoices}</button>
                    </form>
                </div>
                <p>{$lang.dueinvoices} {if $acc_balance && $acc_balance>0}<span class="redone">{$acc_balance|price:$currency}</span>{/if}</p>
            </div>
            <table class="table table-striped table-hover">
                <tr class="table-header-row">
                    <th>{$lang.invoicenum} <i class="icon-sort-arrow-down"></i></th>
                    <th class="w25 cell-border">{$lang.total}</th>
                    <th class="w25 cell-border">{$lang.duedate}</th>
                </tr>
                {foreach from=$dueinvoices item=invoice name=foo}
                <tr>
                    <td><a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank">
                    {$invoice|@invoice}
                    </a></td>
                    <td class="cell-border grey-c">{$invoice.total|price:$invoice.currency_id}</td>
                    <td class="cell-border grey-c no-bold">{$invoice.duedate|dateformat:$date_format}</td>
                </tr>
                {/foreach}
            </table>
        </div>
    </div>
 </div>
 {/if}
 <!-- End of Invoices -->
 
 <!-- Tickets -->
 <div class="text-block clear clearfix">
    <h5><i class="icon-service-ticket"></i>{$lang.openedtickets|capitalize}</h5>
    <div class="separator-down-arrow"></div>
    <div class="line-separaotr"></div>
    
    <div class="clear clearfix">
        <div class="table-box">
            <div class="table-header">
                <div class="right-btns">
                    <a href="{$ca_url}tickets/new/" class="clearstyle grey-custom-btn btn"><i class="icon-view-all"></i>{$lang.ca_createticket}</a>
                    <a href="{$ca_url}tickets/" class="clearstyle grey-custom-btn btn"><i class="icon-grey-add"></i>{$lang.viewalltickets}</a>
                </div>
                <p>{$lang.openedtickets|capitalize}</p>
            </div>
            <table class="table table-hover">
                <tr class="table-header-row">
                    <th class="w20">{$lang.status}<i class="icon-sort-arrow-down"></i></th>
                    <th class="cell-border">{$lang.subject}</th>
                    <th class="w20 cell-border">{$lang.department}</th>
                </tr>
                {foreach from=$openedtickets item=ticket name=foo}
                <tr>
                    <td><span class="ticket-{$ticket.status}">{$lang[$ticket.status]}</span></td>
                    {if $ticket.client_read=='0'}
                    	<td class="cell-border">
                    {else}
                    	<td class="cell-border no-bold">
                    {/if}
                    <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/">{$ticket.subject}</a></td>
                    <td class="cell-border grey-c">{$ticket.deptname}</td>
                </tr>
                {/foreach}
            </table>
        </div>
    </div>
 </div>
 <!-- End of Tickets -->
    
    
<!--</div>-->

