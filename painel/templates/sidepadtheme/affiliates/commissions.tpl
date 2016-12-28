<div class="text-block clear clearfix ">

    {include file='affiliates/summary.tpl'}

    <div class="clear clearfix">
        <div class="table-box">
            <div class="table-header">
                <h6>{$lang.yreferrals}</h6>
                <p class="inline-block header-p">{$lang.referals_t}</p>
            </div>
            <table class="table table-striped table-hover table-bordered">
                <tr class="table-header-high">
                    <th class="w30">{$lang.signupdate}</th>
                    <th class="w15">{$lang.services}</th>
                    <th class="w10 cell-border">{$lang.commission}</th>
                    <th class="w15 cell-border">{$lang.status}</th>
                </tr>
            
            {if $orders}
                
                    {foreach from=$orders item=order name=orders}
                        <tr {if $smarty.foreach.orders.index%2 == 0}class="even"{/if}>

                            <td>{$order.date_created|dateformat:$date_format}</td>
                            <td>
                                {if $order.acstatus}
                                    {$lang.Account}: {$order.pname}
                                {/if}
                                {if $order.domstatus}
                                    <br />{$lang.Domain}: {$order.domain}
                                {/if}
                                <br />
                                {$lang.total}: {$order.total|price:$order.currency_id}
                                {if $moredetails }
                                    <br />
                                    {if $order.firstname || $order.lastname || $order.companyname}
                                        {$lang.clientinfo}: 
                                        {if $order.companyname}{$order.companyname}
                                        {else}{$order.firstname}{$order.lastname}{$order.companyname}
                                        {/if}
                                        <br />
                                    {/if}
                                    {if $order.inv_id}
                                        <br /><b>{$lang.related_invoice}</b> <br />
                                        {$lang.invoicenum}: 
                                        {if $proforma && ($order.inv_status=='Paid' || $order.inv_status=='Refunded') && $order.inv_paid!=''}{$order.inv_paid}
                                    {else}{$order.inv_date|invprefix:$prefix:$order.client_id}{$order.inv_id}{/if}
                                    <br />
                                    {$lang.date}: {$order.inv_date|dateformat:$date_format} <br />
                                    {$lang.duedate}: {$order.inv_due|dateformat:$date_format} <br />
                                    {$lang.total}: {$order.inv_total|price:$order.currency_id} 
                                {/if}
                            {/if}
                        </td>
                        <td align="center">{$order.commission|price:$affiliate.currency_id}</td>
                        <td align="center"><strong>{if $order.paid=='1'}{$lang.approved}{else}{$lang.Pending}{/if}</strong></td>
                    </tr>
                {/foreach}
            
        {else}
            <div class="no-results">
                <p>{$lang.nothing}</p>
            </div>
        {/if}
        </table>
    </div>
</div>
</div>
