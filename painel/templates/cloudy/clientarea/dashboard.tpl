{*

Clientarea dashboard - summary of owned services, due invoices, opened tickets

*}
<div id="board-overview" class="clearfix">
    <div id="board-details" class="pull-right">
        <div class="btn-group">
            <a class="btn btn-primary btn-large {if $enableFeatures.deposit!='on' }full-width{/if}" href="{$ca_url}clientarea/details/"><i class="icon-cog"></i> {$lang.details}</a>
            {if $enableFeatures.deposit!='off' }
                <a class="btn btn-success btn-large" href="{$ca_url}clientarea/addfunds/"><i class="icon-plus-sign"></i> {$lang.addfunds}</a>
            {/if}
        </div>
        <div class="spacing">
            <h4>{$lang.curbalance}</h4>
            <div class="separator-horizontal"></div>
            <div class="row-fluid">
                <div class="span6">
                    <span>{$lang.balance}</span>
                    <p class="color-sky-blue">{if $acc_credit}{$acc_credit|price:$currency}{else}{0|price:$currency}{/if}</p>
                </div>
                <div class="span6">
                    <span>{$lang.dueinvoices}</span>
                    <p class="color-red">{if $acc_balance}{$acc_balance|price:$currency}{else}{0|price:$currency}{/if}</p>
                </div>
            </div>
            <h5>{$lang.ticketstatus}</h5>
            <div class="row-fluid">
                <div class="span6">
                    <i class="icon-edit pull-left icon-2x"></i>
                    <span>{$lang.Open}</span>
                    <p class="color-red">{clientstats type=ticketOpen tpl="%d" default=0}</p>
                </div>
                <div class="span6">
                    <i class="icon-check pull-left icon-2x"></i>
                    <span>{$lang.solved}</span>
                    <p class="color-sky-blue">{clientstats type=ticketClosed tpl="%d" default=0}</p>
                </div>
            </div>
        </div>
    </div>

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
        <div class="spacing">
            <div class="pull-right pull-up">
                <a href="#board-services" class="slide-left link-circle"><i class="icon-chevron-left"></i></a>
                <a href="#board-services" class="slide-right link-circle"><i class="icon-chevron-right"></i></a>
            </div>
            <h4>{$lang.my_services}</h4>
            <div class="separator-horizontal"></div>
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
                                <td colspan="6">
                                    <a href="{$ca_url}cart/" class="btn btn-primary pull-left"><i class="icon-shopping-cart icon-large"></i> &nbsp; {$lang.ordermore}</a>
                                </td>
                            </tr>
                        {/if}
                    </tbody>
                </table>
        </div>
    </div>
</div>
{if $openedtickets}
    <div id="board-tickets-well" class="well clear">
        <div class="pull-right">
            <ul class="pull-left">
                <li class="ticket-icon-Open"><i class="icon-circle-blank ticket-icon"></i> {$lang.Open}</li>
                {assign value='Client-Reply' var=ClientReply}
                <li class="ticket-icon-Client-Reply"><i class="icon-circle-blank ticket-icon"></i> {$lang.$ClientReply}</li>
            </ul>
            <a class="btn btn-stdwidth btn-success" href="{$ca_url}tickets/new/">{$lang.createnew}</a>
            <a class="btn btn-stdwidth" href="{$ca_url}tickets/">{$lang.viewall}</a>
        </div>

        <h2 class="main-h lite color-sky-blue">{$lang.openedtickets|capitalize} </h2>
        <p class="main-p">{$lang.ticketsfromehere}</p>
    </div>
    {tickets}
    <div id="board-tickets" class="clearfix">
        <div class="pull-right bottom-border-nav">
            <ul class="nav nav-pills ">
                <li class="active"><a href="#all" data-toggle="tab">{$lang.all}</a></li>
                <li><a href="#open" data-toggle="tab">{$lang.Open}</a></li>
                <li><a href="#unanswered" data-toggle="tab">{$lang.unanswered}</a></li>
            </ul>
            <div class="ticket-list content-scroll">
                {foreach from=$openedtickets item=lticket name=foo}
                    <div class="ticket _all {if $lticket.status!='Client-Reply' && $lticket.status!='Open'}_unanswered{else}_open{/if}{if $ticket.id==$lticket.id} active{/if}" >
                        <a href="{$ca_url}tickets/view/{$lticket.ticket_number}/" class="aftericon-chevron">
                            <strong>
                                <i class="icon-circle-blank ticket-icon ticket-icon-{$lticket.status} "></i> 
                                {$lticket.subject}
                            </strong>
                            <span class="date">{$lticket.date|dateformat:$date_format}</span>
                        </a>
                    </div>
                {/foreach}
            </div>
        </div>
        <div class="ticket-view">
            {include file="support/ajax.viewticket.tpl"}
        </div>
    </div>
{/if}
<div id="quick-links" class="pull-right">
    <div class="spacing">
        <h3 class="lite color-sky-blue">{$lang.quicklinks}</h3>
        <strong>{$lang.importantlinks}</strong>
    </div>
    <div class="color-blue aftericon-chevron">
        <a href="profiles/">
            <span class="icon-stack pull-left icon-2x">
                <i class="icon-circle icon-stack-base"></i>
                <i class="icon-group icon-light"></i>
            </span>
            <strong>{$lang.managecontacts}</strong>
            <p>{$lang.dashboard_phrase_3}</p>
        </a>
    </div>
    <div class="color-sky-blue aftericon-chevron">
        <a href="clientarea/ipaccess/">
            <span class="icon-stack pull-left icon-2x">
                <i class="icon-circle icon-stack-base"></i>
                <i class="icon-lock icon-light"></i>
            </span>
            <strong>{$lang.security}</strong>
            <p>{$lang.dashboard_phrase_4}</p>
        </a>
    </div>
    <div class="color-orange aftericon-chevron">
        <a href="knowledgebase">
            <span class="icon-stack pull-left icon-2x">
                <i class="icon-circle icon-stack-base"></i>
                <i class="icon-hdd icon-light"></i>
            </span>
            <strong>{$lang.knowledgebase}</strong>
            <p>{$lang.dashboard_phrase_5}</p>
        </a>
    </div>
    <div class="color-purple aftericon-chevron">
        <a href="netstat/">
            <span class="icon-stack pull-left icon-2x">
                <i class="icon-circle icon-stack-base"></i>
                <i class="icon-signal icon-light"></i>
            </span>
            <strong>{$lang.netstat}</strong>
            <p>{$lang.dashboard_phrase_6}</p>
        </a>
    </div>
</div>
{if $dueinvoices}
    <div id="board-invoices">
        <div class="view">
            {if $enableFeatures.bulkpayments!='off'}
                <form method="post" action="index.php" class="pull-right">
                    <button type="submit" class="btn"> {$lang.paynowdueinvoices}</button>
                    <input type="hidden" name="action" value="payall"/>
                    <input type="hidden" name="cmd" value="clientarea"/>
                </form>
            {/if}
            <h2><i class="icon-inv"></i> {$lang.invoices}</h2>
            <p>{$lang.currentbalancestatus}</p>

            <div class="table-shadow">
                <div class="table-header btn-sticky">
                    {if $enableFeatures.deposit!='off' }
                    <a href="{$ca_url}clientarea/addfunds/" class="btn btn-sticky-right btn-success">
                        <i class="icon-plus-sign"></i> {$lang.addfunds}
                    </a>
                    {/if}
                    {$lang.dueinvoices}:
                    <span class="color-sky-blue">{$acc_balance|price:$currency}</span>
                    <span class="separator-vertical"></span>
                    {$lang.Unpaid}:
                    {foreach from=$dueinvoices item=invoice name=foo}
                    {break}{/foreach}
                    <span class="color-red">{$smarty.foreach.foo.total}</span>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>{$lang.status} <i class="icon-chevron-down icon-small"></i></th>
                            <th>{$lang.invoicenum} <i class="icon-chevron-down icon-small"></i></th>
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
                                    <span class="label label-Unpaid">{$lang.Unpaid}</span>
                                </td>
                                <td>
                                    <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank" class="blue-txt">
                                        {$lang.invoice|capitalize} #{if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}{else}{$invoice.date|invprefix:$prefix}{$invoice.id}{/if}
                                    </a>
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
            
            <div class="pull-right">
                <a href="#board-invoices" class="slide-left"><i class="icon-chevron-left icon-small"></i> {$lang.previous}</a>
                <span class="separator-vertical"></span>
                <a href="#board-invoices" class="slide-right">{$lang.next} <i class="icon-chevron-right icon-small"></i></a>
            </div>
        </div>
    </div>
{/if}
<div class="clear"></div>
