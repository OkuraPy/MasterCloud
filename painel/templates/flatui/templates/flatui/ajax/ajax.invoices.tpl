{if $invoices}
    {foreach from=$invoices item=invoice name=foo}
        <tr class="styled-row">
            {if $enableFeatures.bulkpayments!='off'}
                <td>
                    <div class="td-rel">
                        <div class="left-row-side {$invoice.status}-row"></div>
                    </div>
                    <input type="checkbox" value="{$invoice.id}" name="selected[]" {if $invoice.status != 'Unpaid' || $invoice.merge_id}disabled="disabled"{/if}>
                </td>
                <td class="bold {$invoice.status}-label">
                    {$lang[$invoice.status]}
                </td>
            {else}
                <td class="bold">
                    <div class="td-rel">
                        <div class="left-row-side {$invoice.status}-row"></div>
                    </div>
                    <span class="label flat-ui-label {$invoice.status}-label">{$lang[$invoice.status]}</span>
                </td>
            {/if}
            
            <td class="bold invoice-c">
                <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" class="roll-link">
                    <span data-title="{if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}
                    {else}{$invoice.date|invprefix:$prefix:$invoice.client_id}{$invoice.id}
                    {/if}">
                        {if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}
                        {else}{$invoice.date|invprefix:$prefix:$invoice.client_id}{$invoice.id}
                        {/if}
                    </span>
                </a>
            </td>
            <td>{$invoice.total|price:$invoice.currency_id}</td>
            <td>{$invoice.date|dateformat:$date_format}</td>
            <td>
                <div class="td-rel">
                    <div class="right-row-side"></div>
                </div>
                {$invoice.duedate|dateformat:$date_format}
            </td>
        </tr>
        <tr class="empty-row">
        </tr>
    {foreachelse}
    <tr><td colspan="3">{$lang.nothing}</td></tr>
    {/foreach}
{/if}