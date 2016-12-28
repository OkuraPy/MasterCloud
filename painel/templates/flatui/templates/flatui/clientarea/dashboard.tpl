{*

Clientarea dashboard - summary of owned services, due invoices, opened tickets

*}

<div class="dashboard-right-content">
    <h4 class="main-h">{$lang.accountinfo}</h4>
    <p class="main-p">Basic info about your account.</p>
    
    <ul class="square-list horizontal-list clearfix">
        <li>
            <a href="{$ca_url}clientarea/details/">
                <div class="square-box small-box green-box">
                    <div class="middle-cricle">
                        <i class="icon-cog"></i>
                    </div>
                    <p>{$lang.mydetails}</p>
                </div>
            </a>
        </li>
        {if $enableFeatures.deposit!='off' }
        <li>
            <a href="{$ca_url}clientarea/addfunds/">
                <div class="square-box small-box yellow-box">
                    <div class="middle-cricle">
                        <i class="icon-money"></i>
                    </div>
                    <p>{$lang.addfunds}</p>
                </div>
            </a>
        </li>
        {/if}
    </ul>
    
    
    
    <h4 class="main-h">{$lang.quicklinks}</h4>
    <p class="main-p">{$lang.importantlinks}</p>
    
    <ul class="square-list">
        <li>
            <a href="{$ca_url}tickets/new/">
                <div class="square-box large-box red-box">
                    <div class="middle-cricle">
                        <i class="icon-question "></i>
                    </div>
                    <p>{$lang.openticket|capitalize}</p>
                </div>
            </a>
        </li>
        <li>
            <a href="{$ca_url}profiles/">
                <div class="square-box large-box yellow-box">
                    <div class="middle-cricle">
                        <i class="icon-user"></i>
                    </div>
                    <p>{$lang.managecontacts|capitalize}</p>
                </div>
            </a>
        </li>
        <li>
            <a href="{$ca_url}clientarea/ipaccess/">
                <div class="square-box large-box purple-box">
                    <div class="middle-cricle">
                        <i class="icon-lock"></i>
                    </div>
                    <p>{$lang.security|capitalize}</p>
                </div>
            </a>
        </li>
        <li>
            <a href="{$ca_url}knowledgebase/">
                <div class="square-box large-box dark-green-box">
                    <div class="middle-cricle">
                        <i class="icon-book"></i>
                    </div>
                    <p>{$lang.knowledgebase}</p>
                </div>
            </a>
        </li>
        <li>
            <a href="{$ca_url}netstat/">
                <div class="square-box large-box blue-box">
                    <div class="middle-cricle">
                        <i class="icon-signal"></i>
                    </div>
                    <p>{$lang.netstat|capitalize}</p>
                </div>
            </a>
        </li>
    </ul>
</div>


<div class="dashboard-left-content">

    <h4 class="main-h">{$lang.servicedetails}</h4>
    <p class="main-p">{$lang.my_servicesinfo}.</p>
    
    <ul class="square-list horizontal-list clearfix">
    	{if $mydomains>0}
        <li>
            <a href="{$ca_url}clientarea/domains">
                <div class="square-box domains-box">
                    <div class="middle-cricle">
                        <i class="icon-globe"></i>
                    </div>
                    <p>{$lang.mydomains} [{$mydomains}]</p>
                </div>
            </a>
        </li>
        {/if}
        {foreach from=$offer item=offe}
        	{if $offe.total>0}
                <li>
                    <a href="{$ca_url}clientarea/services/{$offe.slug}/">
                        <div class="square-box services-box">
                            <div class="middle-cricle">
                                <i class="icon-cloud"></i>
                            </div>
                            <p>{$offe.name} [{$offe.total}]</p>
                        </div>
                    </a>
                </li>
        	{/if}
        {/foreach}
        <li>
            <a href="{$ca_url}cart/">
                <div class="square-box add-more-box">
                    <div class="middle-cricle">
                        <i class="icon-plus-sign"></i>
                    </div>
                    <p>{$lang.ordermore|capitalize}</p>
                </div>
            </a>
        </li>
    </ul>



{if $dueinvoices}
    <h4 class="main-h">{$lang.invoices}</h4>
    <p class="main-p">{$lang.currentbalancestatus}.</p>
    
    <div class="flat-ui-tab clearfix mb-50">
        <ul id="invoice-tab" class="nav nav-tabs table-nav">
            <li class="active">
                <a href="#Unpaid" data-toggle="tab">
                    {$lang.Unpaid}
                </a>
            </li>
            {if $enableFeatures.deposit!='off' }
            <li class="custom-tab">
                <a href="{$ca_url}clientarea/addfunds/">
                    <i class="icon-add"></i> {$lang.addfunds}
                </a>
            </li>
            {/if}
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab1">
                <div class="table-details">
                    <div class="right-btns">
                        {if $enableFeatures.bulkpayments!='off'}
                            <form method="post" action="index.php" style="margin:0px">
                                <button type="submit" class="btn btn-small btn-flat-success"><i class="icon-pay-due"></i>  {$lang.paynowdueinvoices}</button>
                                <input type="hidden" name="action" value="payall"/>
                                <input type="hidden" name="cmd" value="clientarea"/>
                            </form>
                        {/if}
                    </div>
                    <div class="detailed-info">
                        <span>{$acc_balance|price:$currency}</span>
                        <p>{$lang.dueinvoices}</p>
                    </div>
                    <div class="detailed-info">
                    	{foreach from=$dueinvoices item=invoice name=foo}{break}{/foreach}
                        <span class="txt-Unpaid">{$smarty.foreach.foo.total}</span>
                        <p>{$lang.Unpaid}</p>
                    </div>
                </div>
                <table class="table styled-table">
                    <thead>
                        <tr>
                            <th><i class="icon-sort"></i> {$lang.status}</th>
                            <th><i class="icon-sort"></i> {$lang.invoicenum}</th>
                            <th><i class="icon-sort"></i> {$lang.total}</th>
                            <th><i class="icon-sort"></i> {$lang.invoicedate}</th>
                            <th><i class="icon-sort"></i> {$lang.duedate}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$dueinvoices item=invoice name=foo}
                            <tr class="styled-row">
                                <td class="bold ">
                                    <div class="td-rel">
                                        <div class="left-row-side Unpaid-row"></div>
                                    </div>
                                    <span class="txt-Unpaid">{$lang.Unpaid}</span>
                                </td>
                                <td class="bold">
                                <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank" class="roll-link">
                                	<span data-title="{$lang.invoice} #{if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}{else}{$invoice.date|invprefix:$prefix:$invoice.client_id}{$invoice.id}{/if}">{$lang.invoice} #{if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}{else}{$invoice.date|invprefix:$prefix:$invoice.client_id}{$invoice.id}{/if}</span>
                                </a>
                                </td>
                                <td>{$invoice.total|price:$invoice.currency_id}</td>
                                <td>{$invoice.date|dateformat:$date_format}</td>
                                <td>{$invoice.duedate|dateformat:$date_format}</td>
                                <td>
                                    <div class="td-rel">
                                        <div class="right-row-side"></div>
                                    </div>
                                    <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank" class="icon-link"><i class="icon-single-arrow"></i></a></td>
                            </tr>
                            <tr class="empty-row">
                            </tr>
                        {/foreach}
                        </tbody>
                </table>
            </div>
        </div>
    </div>
{/if}
    
    
{if $openedtickets}  
    <h4 class="main-h">{$lang.openedtickets|capitalize} </h4>
    <p class="main-p">{$lang.ticketsfromehere}.</p>
    
    
    <div class="flat-ui-tab clearfix">
        <ul id="invoice-tab" class="nav nav-tabs table-nav">
            <li class="active"><a href="#" data-toggle="tab">{$lang.all}</a></li>
            <li><a href="#Open" data-toggle="tab">{$lang.Open}</a></li>
            <li><a href="#Answered" data-toggle="tab">{$lang.Answered}</a></li>
            <li class="custom-tab"><a href="{$ca_url}tickets/new/"><i class="icon-add"></i> {$lang.createnew}</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab1">
                <div class="table-details">
                    {counter print=false name=openticketsc start=0 assign=openticketsc}
                    {counter print=false name=answeredtsc start=0 assign=answeredtsc}
                    {foreach from=$openedtickets item=ticket name=foo}
                        {if $ticket.status == 'Answered'}
                            {counter name=answeredtsc}
                        {elseif $ticket.status != 'Answered'}
                            {counter name=openticketsc}
                        {/if}
                    {/foreach}
                    <div class="detailed-info">
                        <span>{$smarty.foreach.foo.total}</span>
                        <p>{$lang.total}</p>
                    </div>
                    <div class="detailed-info">
                        <span class="txt-Open">{$openticketsc}</span>
                        <p>{$lang.Open}</p>
                    </div>
                    <div class="detailed-info">
                        <span class="txt-Answered">{$answeredtsc}</span>
                        <p>{$lang.Answered}</p>
                    </div>
                </div>
                <table class="table styled-table">
                    <thead>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th class="w15"><i class="icon-sort"></i> {$lang.status}</th>
                        <th class="w60"><i class="icon-sort"></i> {$lang.subject}</th>
                        <th><i class="icon-sort"></i> {$lang.department}</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach from=$openedtickets item=ticket name=foo}
                        <tr class="styled-row">
                            <td>
                                <div class="td-rel">
                                    <div class="left-row-side {$ticket.status}-row"></div>
                                </div>
                                <input type="checkbox" name="number" value="{$ticket.ticket_number}">
                            </td>
                            <td class="bold">
                                <span class="label flat-ui-label {$ticket.status}-label">{$lang[$ticket.status]}</span>
                            </td>
                            <td class="invoice-c  {if $ticket.client_read=='0'}bold{/if}">
                                <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" class="roll-link">
                                	<span data-title="{$ticket.subject}">{$ticket.subject}</span>
                                </a>
                            </td>
                            <td>{$ticket.deptname}</td>
                            <td>
                                <div class="td-rel">
                                    <div class="right-row-side"></div>
                                </div>
                                <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" class="icon-link"><i class="icon-single-arrow"></i></a></td>
                        </tr>
                        <tr class="empty-row">
                        </tr>
                    {/foreach}
                        </tbody>
                </table>
            </div>
        </div>
    </div>
    {/if}
</div>
                   