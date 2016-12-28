{*

Clientarea dashboard - summary of owned services, due invoices, opened tickets

*}
<div class="row-fluid" id="top_row">
    <h1>{$lang.dashboard}</h1>
</div>
<div class="spacing">
    {clientservices}
    <div class="row-fluid" id="rect">
        <div class="span3">
            <a href="#">
                <span class="entypo">&#9993;</span>
                <div>
                    {$lang.tickets}
                    <span>{clientstats type=ticketTotal tpl="%d" default=0}</span>
                </div>
                
            </a>
        </div><!-- /span3 --> 
        <div class="span3">
            <a href="#">
                <span class="entypo">&#128197;</span>
                <div>
                    {$lang.invoices}
                    <span>{clientstats type=invoices tpl="%d" default=0}</span>
                </div>
            </a>
        </div><!-- /span3 --> 
        <div class="span3">
            <a href="#">
                <span class="entypo">&#59392;</span>
                <div>
                    {$lang.backtoser}
                    <span>{$client_services_total}</span>
                </div>
            </a>
        </div><!-- /span3 --> 
        <div class="span3">
            <a href="#">
                <span class="entypo">&#8862;</span>
                <div>{$lang.addnew}
                    <span>service</span>
                </div>
            </a>
        </div><!-- /span3 --> 
    </div>

    <div class="row-fluid" id="news">
        <h3>{$lang.my_services}</h3>
        <div class="solved">
            <span class="icon icon-EmptyBox"></span>
            <h6>{$lang.solved} <br> {$lang.ticketshort}</h6>
            <span class="text">{clientstats type=ticketClosed tpl="%d" default=0}</span>
        </div>
        <div class="opened">
            <span class="icon icon-EmptyBox"></span>
            <h6>{$lang.Open} <br> {$lang.ticketshort}</h6>
            <span class="text">{clientstats type=ticketOpen tpl="%d" default=0}</span>
        </div>
    </div>


    <div class="row-fluid">
        <div id="board-services">
            <div class="tabbable tabs-left span2 hidden-phone"> 
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="{$ca_url}clientarea/#all"><span>{$lang.all}</span></a>
                    </li>
                    {if $offer_domains}
                        {clientservices}
                        <li>
                            <a href="{$ca_url}clientarea/#domains"><span>{$lang.domains}</span></a>
                        </li>
                    {/if}
                    {counter name=srlistc print=false start=0 assign=srlistc}
                    {foreach from=$offer item=offe}
                        {clientservices}
                        {if $offe.total>0}
                            {counter name=srlistc}
                            
                            <li {if $srlistc > 3}style="display: none"{/if}>
                                <a href="{$ca_url}clientarea/#{$offe.slug}"><span>{$offe.name}</span></a>
                            </li>
                            {assign value=true var=hasservice}
                        {/if}
                    {/foreach}
                </ul>
            </div> 
            <div class="slides-wrapper span10">
                <div class="wrapper">
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
                                        <td><span class="visible-desktop">{$service.recurring_amount|price:$currency}</span></td>
                                        <td><span class="visible-desktop">{$service.period} {$lang.years}</span></td>
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
                                        <td><span class="visible-desktop">{$service.total|price:$currency}</span></td>
                                        <td><span class="visible-desktop">{$lang[$service.billingcycle]}</span></td>
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
                <div class="table-pages">
                    <div class="pull-left">
                        <a href="#board-services" class="slide-left"  title="preview">
                            <span class="entypo">&#59237;</span>
                        </a>
                        <span class="page-current"></span> {$lang.pageof} <span class="page-total"></span>
                        <a href="#board-services" class="slide-right" title="next">
                            <span class="entypo">&#59238;</span>
                        </a>
                    </div>
                </div>
            </div><!--/slides wrapper --> 
        </div> <!--/tabbable --> 
    </div><!--/row-->

    <div class="row-fluid">
        {if $openedtickets}
            <div class="{if $dueinvoices}span6{else}span12{/if}" id="support-tickets">
                <span class="icon icon-EmptyBox"></span>
                <h3>{$lang.tickets}</h3>
                <div class="support_tickets">
                    <div class="slides-wrapper"> 
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>{$lang.subject}</th>
                                    <th>{$lang.status}</th>
                                </tr>    
                            </thead>
                        </table>
                        <div class="spacing">    
                            <table class="table">
                                <tbody>
                                    {foreach from=$openedtickets item=lticket name=foo}
                                        <tr class="ticket _all _ticket_{$lticket.status}">
                                            <td><a href="{$ca_url}tickets/view/{$lticket.ticket_number}/" >{$lticket.subject}</a></td>
                                            <td><span class="label label-{$lticket.status}">{if $lang[$lticket.status]}{$lang[$lticket.status]|upper}{else}{$lticket.status}{/if}</span></td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div><!--/space20-->
                        <div class="table_bottom">
                            <div class="pull-left">
                                <a href="#support-tickets" class="slide-left" title="preview"><span class="entypo">&#59237;</span></a>
                                <span class="page-current"></span> {$lang.pageof} <span class="page-total"></span>
                                <a href="#support-tickets" class="slide-right" title="next"><span class="entypo">&#59238;</span></a>
                            </div>

                        </div>
                    </div><!--/slides-wrapper-->
                </div> 
            </div><!--/span6-->
        {/if}
        {if $dueinvoices}
            <div class="{if $openedtickets}span6{else}span12{/if}" id="board-invoices">
                <span class="icon icon-Files"></span>
                <h3>{$lang.invoices}</h3>
                <div class="invoices">
                    <div class="slides-wrapper"> 
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>{$lang.invoicenum}</th>
                                    <th>{$lang.duedate}</th>
                                </tr>    
                            </thead>
                        </table>
                        <div class="spacing">    
                            <table class="table">
                                <tbody>
                                    {foreach from=$dueinvoices item=invoice name=foo}
                                        <tr>
                                            <td>
                                                <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank">
                                                    <span class="label label-Unpaid">{$lang.Unpaid}</span>
                                                    {$lang.invoice|capitalize} #{if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}
                                                    {else}{$invoice.date|invprefix:$prefix}{$invoice.id}
                                                    {/if}
                                                </a>
                                            </td>
                                            <td>{$invoice.duedate|dateformat:$date_format}</td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div><!--/space20-->
                        <div class="table_bottom">
                            <div class="pull-left">
                                <a href="#board-invoices" class="slide-left" title="preview"><span class="entypo">&#59237;</span></a>
                                <span class="page-current"></span> {$lang.pageof} <span class="page-total"></span>
                                <a href="#board-invoices" class="slide-right" title="next"><span class="entypo">&#59238;</span></a>
                            </div>

                        </div>
                    </div><!--/slides-wrapper-->
                </div> 
            </div><!--/span6-->
        {/if}
    </div>
</div><!-- spacing -->

<div class="clear"></div>
