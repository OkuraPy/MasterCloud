{*

Clientarea dashboard - summary of owned services, due invoices, opened tickets

*}
<div id="board-overview" class="clearfix spacing">
    <div id="board-details" class="pull-right">
        <h3 class="header-thin">{$lang.curbalance}</h3>
        <ul class="dashboard-list">
            <li>
                <span class="pulse-icon  pull-left">
                    <i class="icon-refresh"></i>
                </span>
                <span>{$lang.balance}</span>
                <p>{if $acc_credit}{$acc_credit|price:$currency}{else}{0|price:$currency}{/if}</p>
            </li>
            <li>
                <span class="pulse-icon pull-left">
                    <i class="icon-exclamation-sign "></i>
                </span>
                <span>{$lang.dueinvoices}</span>
                <p>
                    {if $acc_balance}{$acc_balance|price:$currency}
                    {else}{0|price:$currency}
                    {/if}
                </p>
            </li>
            <li>
                {if $enableFeatures.deposit!='off' }
                    <a class="btn btn-y-primary" href="{$ca_url}clientarea/addfunds/">
                        {$lang.addfunds}
                    </a>
                {/if}
                <a class="btn btn-y-primary" href="{$ca_url}clientarea/details/">
                    {$lang.details}
                </a>
            </li>
        </ul>
    </div>
    <h3 class="header-thin"><i class="icon icon-list-ol"></i> {$lang.my_services}</h3>
    <div id="board-services"> 
        <div class="nav-overflow">
            <ul class="nav nav-tabs color-sky-blue">
                <li class="active">
                    <a href="{$ca_url}clientarea/#all">{$lang.all}</a>
                </li>
                {if $offer_domains}
                    {clientservices}
                    <li>
                        <a href="{$ca_url}clientarea/#domains">{$lang.domains} <span class="badge badge-top">{$offer_domains}</span></a>
                    </li>
                {/if}
                {foreach from=$offer item=offe}
                    {clientservices}
                    {if $offe.total>0}
                        <li>
                            <a href="{$ca_url}clientarea/#{$offe.slug}">{$offe.name} <span class="badge badge-top">{$offe.total}</span></a>
                        </li>
                        {assign value=true var=hasservice}
                    {/if}
                {/foreach}
            </ul>
        </div>
        <div class="slides-wrapper">
            <table class="table">
                <tbody>
                    {if $offer_domains>0 || $hasservice}
                        {clientservices}
                        {counter name=srlist print=false start=0 assign=srlist}
                        {foreach from=$client_domains item=service}
                            {counter name=srlist}
                            <tr {if $srlist>3}style="display:none;"{/if} class="_all _domains">
                                <td>
                                    <a class="bold" href="{$ca_url}clientarea/domains/{$service.id}/{$service.name}/">
                                        <strong>{$service.name}</strong>
                                    </a>
                                </td>
                                <td><span class="label label-{$service.status}">{$lang[$service.status]}</span></td>
                                <td>{$service.recurring_amount|price:$currency}</td>
                                <td>{$service.period} {$lang.years}</td>
                                <td>
                                    {if $service.expires && $service.expires!='0000-00-00'}
                                        <small>{$lang.ccardexp}</small><br />
                                        <span>{$service.expires|dateformat:$date_format}</span>
                                    {else} - 
                                    {/if}
                                </td>
                                <td>
                                    <a href="{$ca_url}clientarea/domains/{$service.id}/{$service.name}/"><i class="icon-cog color-grey"></i></a>
                                </td>
                            </tr>
                        {/foreach}
                        {foreach from=$client_services item=service}
                            {counter name=srlist}
                            <tr {if $srlist>3}style="display:none;"{/if} class="_all _{$service.slug}">
                                <td>
                                    <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/" class="bold">
                                        <strong>{$service.name}</strong><br />
                                        <span>{$service.domain}</span>
                                    </a>
                                </td>
                                <td><span class="label label-{$service.status}">{$lang[$service.status]}</span></td>
                                <td>{$service.total|price:$currency}</td>
                                <td>{$lang[$service.billingcycle]}</td>
                                <td>
                                    {if $service.next_due && $service.next_due!='0000-00-00'}
                                        <small>{$lang.nextdue}</small><br />
                                        <span>{$service.next_due|dateformat:$date_format}</span>
                                    {else} - 
                                    {/if}
                                </td>
                                <td >
                                    <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/"><i class="icon-cog color-grey"></i></a>
                                </td>
                            </tr>
                        {/foreach}
                    {else}
                        <tr class="_all">
                            <td colspan="6" class="no-services">
                                <a href="{$ca_url}cart/" class="btn btn-info pull-left"><i class="icon-shopping-cart icon-large"></i> &nbsp; {$lang.ordermore}</a>
                            </td>
                        </tr>
                    {/if}
                </tbody>
            </table>
        </div>
        <div class="table-pages">
            <a href="#board-services" class="slide-left btn">
                <i class="icon-chevron-left"></i>
            </a>
            <a href="#board-services" class="slide-right btn">
                <i class="icon-chevron-right"></i>
            </a>
            <div class="pull-right">
                {$lang.page} <span class="page-current"></span> {$lang.pageof} <span class="page-total"></span>
            </div>
        </div>
    </div>

</div>
{if $openedtickets}
    <div class="separator-horizontal"></div>
    <div class="spacing">

        {tickets}
        <h3 class="header-thin"><i class="icon icon-envelope-alt"></i> {$lang.openedtickets|capitalize} </h3>
        <div id="board-tickets" class="clearfix clear">
            <div class="pull-left bottom-border-nav">
                <div class="board-header">
                    {$lang.tickets}
                </div>
                <div class="ticket-list content-scroll">
                    {foreach from=$openedtickets item=lticket name=foo}
                        <div class="ticket _all {if $lticket.status!='Client-Reply' && $lticket.status!='Open'}_unanswered{else}_open{/if}{if $ticket.id==$lticket.id} active{/if}" >
                            <a href="{$ca_url}tickets/view/{$lticket.ticket_number}/" class="aftericon-chevron">
                                <strong>{$lticket.subject}</strong>
                                <span class="date">
                                    <i class="icon-time"></i>
                                    {$lticket.date|dateformat:$date_format}
                                </span>
                            </a>
                        </div>
                    {/foreach}
                </div>
                <div class="foot">
                    <a class="btn btn-y-primary" href="{$ca_url}tickets/">{$lang.viewall}</a>
                </div>
            </div>
            <div class="ticket-view">
                {include file="support/ajax.viewticket.tpl"}
            </div>
        </div>
    </div>
{/if}
{if $dueinvoices}
    <div class="separator-horizontal"></div>

    <div id="board-invoices" class="spacing">
        <h3 class="header-thin"><i class="icon icon-copy"></i> {$lang.invoices}</h3>
        <ul class="dashboard-list pull-left">
            <li>
                <span class="pulse-icon  pull-left">
                    <i class="icon-refresh"></i>
                </span>
                <span>{$lang.balance}</span>
                <p>{if $acc_credit}{$acc_credit|price:$currency}{else}{0|price:$currency}{/if}</p>
            </li>
            <li>
                <span class="pulse-icon pull-left">
                    <i class="icon-exclamation-sign "></i>
                </span>
                <span>{$lang.dueinvoices}</span>
                <p>
                    {if $acc_balance}{$acc_balance|price:$currency}
                    {else}{0|price:$currency}
                    {/if}
                </p>
            </li>
            <li>
                {if $enableFeatures.deposit!='off' }
                    <a class="btn btn-y-primary" href="{$ca_url}clientarea/addfunds/">
                        {$lang.addfunds}
                    </a>
                {/if}
            </li>
        </ul>
        <div id="board-invoices-list">
            <div class="board-header">
                <div class="pull-right">
                    <a class="btn btn-y-success" href="{$ca_url}tickets/new/">{$lang.createnew}</a>
                </div>
            </div>
            <div class="slides-wrapper">
                <table class="table">
                    <thead>
                        <tr>
                            <th>{$lang.invoicenum} <i class="icon-chevron-down icon-small"></i></th>
                            <th>{$lang.status} <i class="icon-chevron-down icon-small"></i></th>
                            <th>{$lang.total} <i class="icon-chevron-down icon-small"></i></th>
                            <th>{$lang.invoicedate} <i class="icon-chevron-down icon-small"></i></th>
                            <th>{$lang.duedate} <i class="icon-chevron-down icon-small"></i></th>
                            <th></th>
                        </tr>
                    </thead>
                </table>
                <table class="table">
                    <tbody>
                        {counter name=srlist print=false start=0 assign=srlist}
                        {foreach from=$dueinvoices item=invoice name=foo}
                            {counter name=srlist}
                            <tr {if $srlist>3}style="display:none;"{/if}>
                                <td>
                                    <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank" class="blue-txt">
                                    {$lang.invoice|capitalize} #{if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}{else}{$invoice.date|invprefix:$prefix:$invoice.client_id}{$invoice.id}{/if}
                                </a>
                            </td>
                            <td>
                                <span class="label label-Unpaid">{$lang.Unpaid}</span>
                            </td>
                            <td>{$invoice.total|price:$invoice.currency_id}</td>
                            <td>{$invoice.date|dateformat:$date_format}</td>
                            <td>{$invoice.duedate|dateformat:$date_format}</td>
                            <td>
                                <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank"><i class="icon-link"></i></a>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div> 
        <div class="table-pages">
            <a href="#board-invoices" class="slide-left btn">
                <i class="icon-chevron-left"></i>
            </a>
            <a href="#board-invoices" class="slide-right btn">
                <i class="icon-chevron-right"></i>
            </a>
            <div class="pull-right">
                {$lang.page} <span class="page-current"></span> {$lang.pageof} <span class="page-total"></span>&nbsp;
                <a href="{$ca_url}clientarea/invoices" class="btn">{$lang.viewall}</a>
            </div>
        </div>

    </div>
</div>
{/if}
<div class="separator-horizontal"></div>
<div class="spacing">
    <h3 class="header-thin"><i class="icon-link"></i> {$lang.quicklinks}</h3>
    <div id="quick-links" class="clearfix">
        <div class="pull-left">
            <a href="{$ca_url}profiles/">
                <strong>{$lang.managecontacts}</strong>
                <span class="pulse-icon">
                    <i class="icon-group"></i>
                </span>
                <p>{$lang.dashboard_phrase_3}</p>
            </a>
        </div>
        <div class="pull-left">
            <a href="{$ca_url}clientarea/ipaccess/">
                <strong>{$lang.security}</strong>
                <span class="pulse-icon">
                    <i class="icon-lock"></i>
                </span>
                <p>{$lang.dashboard_phrase_4}</p>
            </a>
        </div>
        <div class="pull-left">
            <a href="{$ca_url}knowledgebase">
                <strong>{$lang.knowledgebase}</strong>
                <span class="pulse-icon">
                    <i class="icon-hdd"></i>
                </span>
                <p>{$lang.dashboard_phrase_5}</p>
            </a>
        </div>
        <div class="pull-left">
            <a href="{$ca_url}netstat/">
                <strong>{$lang.netstat}</strong>
                <span class="pulse-icon">
                    <i class="icon-signal"></i>
                </span>
                <p>{$lang.dashboard_phrase_6}</p>
            </a>
        </div>
    </div>
    <div class="clear"></div>
</div>

