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
                <td class="bold {$invoice.status}-label">
                    <div class="td-rel">
                        <div class="left-row-side {$invoice.status}-row"></div>
                    </div>
                    {$lang[$invoice.status]}
                </td>
            {/if}
            
            <td class="bold invoice-c">
                <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank">
                    {$invoice|@invoice}
                </a>
            </td>
            <td>{$invoice.total|price:$invoice.currency_id}</td>
            <td>{$invoice.date|dateformat:$date_format}</td>
            <td>
                {$invoice.duedate|dateformat:$date_format}
            </td>
            <td>
                <div class="td-rel">
                    <div class="right-row-side"></div>
                </div>
                <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank" class="view3"><i class="icon-single-arrow"></i></a>
            </td>
        </tr>
        <tr class="empty-row">
        </tr>
    {foreachelse}
    <tr><td colspan="3">{$lang.nothing}</td></tr>
    {/foreach}
{/if}