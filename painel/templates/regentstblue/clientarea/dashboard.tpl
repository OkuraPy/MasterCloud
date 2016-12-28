{*

Clientarea dashboard - summary of owned services, due invoices, opened tickets

*}
<div class="spacing">
    <div class="container-fluid" id="dashboard">
        <div class="row-fluid" id="dashboard_row1">
            <div class="span9">
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
                        <div class="space">
                            <div class="table-pages">
                                <h4 class="pull-left">NEWST ADDED SERVICES</h4>
                                <div class="pull-right">
                                    <a href="#board-services" class="slide-left">
                                        <img src="{$template_dir}img/arrow-left-sm.png" alt="arrow left" title="left">
                                    </a>
                                    <span class="arrow_divider">|</span>
                                    <a href="#board-services" class="slide-right">
                                        <img src="{$template_dir}img/arrow-right-sm.png" alt="arrow right" title="right">
                                    </a>
                                </div>
                            </div>
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
                                                    <a href="{$ca_url}clientarea/domains/{$service.id}/{$service.name}/"><i class="icon icon-Settings color-grey"></i></a>
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
                                                    <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/"><i class="icon icon-Settings"></i></a>
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
                <div class="separator-horizontal"></div>

            </div>
            <div class="span3">
                <div class="row-fluid">
                    <div class="balance">
                        <div>{$lang.curbalance}</div>
                    </div>
                    {if $enableFeatures.deposit!='off' }
                        <a href="#" class="btn btn-add-funds pull-right" href="{$ca_url}clientarea/addfunds/" >{$lang.addfunds}</a>
                    {/if}
                </div> <!--/row -->
                <div class="your_balance">
                    <div class="left">
                        <span class="icon icon-Chart"></span>
                    </div>
                    <div class="right">
                        <h5>{$lang.balance}</h5>
                        <h3>{if $acc_credit}{$acc_credit|price:$currency}{else}{0|price:$currency}{/if}</h3>
                    </div>    
                </div>
                <div class="invoices">
                    <div class="left">
                        <span class="icon icon-Info"></span>
                    </div>
                    <div class="right">
                        <h5>{$lang.dueinvoices}</h5>
                        <h3>{if $acc_balance}{$acc_balance|price:$currency}{else}{0|price:$currency}{/if}</h3>
                    </div>    
                </div>
                <h4>{$lang.ticketstatus}</h4>
                <div class="row-fluid">
                    <div class="opened">
                        <div class="left">
                            <span class="icon icon-Imbox"></span>
                        </div>
                        <div class="right">
                            <h3>{clientstats type=ticketOpen tpl="%d" default=0}</h3>
                            <h5>{$lang.Open}</h5>
                        </div>   
                    </div>
                    <div class="solved">
                        <div class="left">
                            <span class="icon icon-Edit"></span>
                        </div>
                        <div class="right">
                            <h3>{clientstats type=ticketClosed tpl="%d" default=0}</h3>
                            <h5>{$lang.solved}</h5>
                        </div>   
                    </div>
                </div><!-- /row-->
            </div> <!-- /span3-->
        </div>
        {if $openedtickets}
            <div class="row-fluid" id="support">
                <div class="pull-left">
                    <h2>{$lang.tickets|capitalize}</h2>
                    <span>{$lang.ticketsfromehere}</span>
                </div>
                <div class="pull-right" style="margin-top:30px;">
                    <a href="#" class="btn btn-new-ticket" href="{$ca_url}tickets/new/">{$lang.createnew}</a>
                    <a href="#" class="btn btn-view-all" href="{$ca_url}tickets/">{$lang.viewall}</a>
                </div>
            </div>  
            {tickets}
            <div class="row-fluid" id="dashboard_row2">
                <div id="board-tickets" class="clearfix clear">
                    <div class="pull-left bottom-border-nav">
                        <div class="tabbable">

                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#all" data-toggle="tab">{$lang.all}</a></li>
                                <li><a href="#open" data-toggle="tab">{$lang.Open}</a></li>
                                <li><a href="#unanswered" data-toggle="tab">{$lang.unanswered}</a></li>
                            </ul>            

                            <div class="tab-content">
                                <div class="tab-pane active">
                                    <div class="ticket-list content-scroll">
                                        {foreach from=$openedtickets item=lticket name=foo}
                                            <div class="ticket _all {if $lticket.status!='Client-Reply' && $lticket.status!='Open'}_unanswered{else}_open{/if}{if $ticket.id==$lticket.id} active{/if}" >
                                                <a href="{$ca_url}tickets/view/{$lticket.ticket_number}/" class="aftericon-chevron">
                                                    <span>
                                                        {$lticket.subject}
                                                    </span>
                                                    <span class="date-time" title="{$lticket.date}">{$lticket.date|dateformat:$date_format}</span>
                                                </a>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        </div><!--/tabbable --> 

                    </div>
                    <div class="ticket-view">
                        {include file="support/ajax.viewticket.tpl"}
                    </div>
                </div>
            </div><!-- /row-fluid-->
            {include file="timeago.tpl"}
        {/if}

        {if $dueinvoices}
            <div class="row-fluid" id="dashboard_row3">
                <div class="span8">
                    <div class="pull-left">
                        <h2>{$lang.invoices}</h2>
                        <span>{$lang.currentbalancestatus}</span>
                    </div>
                    <div class="pull-right">
                        {if $enableFeatures.deposit!='off' }
                            <a href="{$ca_url}clientarea/addfunds/" class="btn btn-add-funds" >{$lang.addfunds}</a>
                        {/if}
                        {if $enableFeatures.bulkpayments!='off'}
                            <form method="post" action="index.php" class="pull-right">
                                <input type="hidden" name="action" value="payall"/>
                                <input type="hidden" name="cmd" value="clientarea"/>
                                <a href="#" class="btn btn-pay-all" onclick="$(this).parent().submit(); return false;"> {$lang.paynowdueinvoices}</a>
                            </form>
                            
                        {/if}
                    </div>

                    <div class="span12" id="board-invoices">
                        <div class="row-fluid" id="row1">
                            <div class="row_header">
                                <span>{$lang.dueinvoices}:</span>
                                <span>{$acc_balance|price:$currency}</span>
                                <span>|</span>
                                <span>{$lang.Unpaid}:</span>
                                {foreach from=$dueinvoices item=invoice name=foo}
                                {break}{/foreach}
                                <span>{$smarty.foreach.foo.total}</span>
                            </div>
                        </div>    
                        <div class="row-fluid" id="row2">
                            <div class="space">

                                <div class="slides-wrapper"> 
                                    <table class="table" id="header_table">
                                        <thead>
                                            <tr>
                                                <th>{$lang.status}</th>
                                                <th>{$lang.invoicenum}</th>
                                                <th>{$lang.total}</th>
                                                <th>{$lang.invoicedate}</th>
                                                <th>{$lang.duedate}</th>
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
                                                        {$lang.invoice|capitalize} #{if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}{else}{$invoice.date|invprefix:$prefix:$invoice.client_id}{$invoice.id}{/if}
                                                    </a>
                                                </td>
                                                <td>{$invoice.total|price:$invoice.currency_id}</td>
                                                <td>{$invoice.date|dateformat:$date_format}</td>
                                                <td>{$invoice.duedate|dateformat:$date_format}</td>
                                                <td>
                                                    <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank"><i class="icon icon-Settings"></i></a>
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div> 
                    <div class="row-fluid" id="row3">
                        <div class="table-pages">
                            
                            <div class="pull-right">
                                <a href="#board-invoices" class="slide-left">
                                    <i class="fa fa-chevron-left"></i>&nbsp; {$lang.previous} 
                                </a>
                                &nbsp;&nbsp;|&nbsp;&nbsp;
                                <a href="#board-invoices" class="slide-right">
                                    {$lang.next}&nbsp;<i class="fa fa-chevron-right"></i></i> 
                                </a>
                            </div>
                        </div>
                    </div>   
                </div>  
            </div>
            <div class="span4">

                <h2>{$lang.quicklinks}</h2>
                <span>{$lang.importantlinks}</span>

                <div class="contacts">
                    <a href="{$ca_url}profiles/" >
                        <div class="left">
                            <span class="icon icon-Users"></span>
                        </div>
                        <div class="right">
                            <h5>{$lang.managecontacts}</h5>
                            <p>{$lang.dashboard_phrase_3}</p>
                        </div> 
                    </a>
                </div>
                <div class="security">
                    <a href="{$ca_url}clientarea/ipaccess/">
                        <div class="left">
                            <span class="icon icon-Shield"></span>
                        </div>
                        <div class="right">
                            <h5>{$lang.security}</h5>
                            <p>{$lang.dashboard_phrase_4}</p>
                        </div>    
                    </a>
                </div>
                <div class="knowledgebase1">
                    <a href="{$ca_url}knowledgebase">
                        <div class="left">
                            <span class="icon icon-Book"></span>
                        </div>
                        <div class="right">
                            <h5>{$lang.knowledgebase}</h5>
                            <p>{$lang.dashboard_phrase_5}</p>
                        </div> 
                    </a>
                </div>
                <div class="server_status">
                    <a href="{$ca_url}netstat/">
                        <div class="left">
                            <span class="icon icon-Antenna2"></span>
                        </div>
                        <div class="right">
                            <h5>{$lang.netstat}</h5>
                            <p>{$lang.dashboard_phrase_6}</p>
                        </div> 
                    </a>
                </div>
            </div>   
        </div>
    {/if}
</div>
<div class="clear"></div>
</div>
