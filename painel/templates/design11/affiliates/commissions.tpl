
<div class="spacing">
    <h3>{$lang.affiliate}</h3>
    <p>{$lang.affiliate_description}..</p>



    <div class="flat-ui-tab">
        {include file='menus/affiliates.sub.tpl'}
        <div class="tab-content p-10">
            <div class="tab-pane active">

                <h4 class="mt-10">{$lang.yreferrals}</h3>
                    <p>{$lang.referals_t}</p>


                    <table class="table table-header-fix table-striped p-td" style="width: 100%">
                        <tr>
                            <th>{$lang.signupdate}</th>
                            <th>{$lang.services}</th>
                            <th>{$lang.commission}</th>
                            <th>{$lang.status}</th>
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
                        <tr class="even">
                            <td colspan="4" style="text-align: center">{$lang.nothing}</td>
                        </tr>
                    {/if}
                </table>

        </div>
    </div>
</div>
</div>

