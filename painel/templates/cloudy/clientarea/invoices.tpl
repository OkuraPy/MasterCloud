{*

Browse invoices history

*}
<div class="spacing">
    <h3>{$lang.invoices|capitalize}</h3>
    <p>{$lang.currentbalancestatus}</p>
</div>
<div class="bottom-border-nav">
    <ul class="nav nav-pills ">
        <li class="active"><a href="#" data-sorter="filter[status]">{$lang.all}</a></li>
        <li><a href="#Paid" data-sorter="filter[status]">{$lang.Paid}</a></li>
        <li>
            <a href="#Unpaid" data-sorter="filter[status]">{$lang.Unpaid}</a>
        </li>
        {if $enableFeatures.deposit!='off' }
            <li>
                <a href="{$ca_url}clientarea/addfunds/" class="color-green"> <i class="icon-plus"></i>  {$lang.addfunds}</a>
            </li>
        {/if}
        {if $acc_balance && $acc_balance>0 && $enableFeatures.bulkpayments!='off'}
            <li>
                <a href="#" onclick="$(this).next().submit();
                        return false;" class="color-sky-blue">
                    <i class="icon-tags"></i> <span class="payall-all">{$lang.paynowdueinvoices}</span>
                    <span class="payall-selected">Pay selected invoices</span>
                </a>
                <form method="post" action="index.php" style="display: none;" id="payall">
                    <input type="hidden" name="action" value="payall"/>
                    <input type="hidden" name="cmd" value="clientarea"/>
                    {securitytoken}
                </form>
            </li>
        {/if}
    </ul>
    <a href="{$ca_url}clientarea/invoices/" id="currentlist" style="display:none" updater="#updater"></a>
    <input type="hidden" id="currentpage" value="0" />
    <table class="table table-striped table-spacing">
        <thead>
            <tr>
                {if $enableFeatures.bulkpayments!='off'}<th width="14"></th>{/if}
                <th class="w10"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=status|ASC"  data-sorter="orderby"><i class="icon-sort"></i>{$lang.status}</a></th>
                <th ><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=id|ASC" data-sorter="orderby"><i class="icon-sort"></i>{$lang.invoicenum}</a></th>
                <th class="w15"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=total|ASC"  data-sorter="orderby"><i class="icon-sort"></i>{$lang.total}</a></th>
                <th class="w10"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=date|ASC"  data-sorter="orderby"><i class="icon-sort"></i>{$lang.invoicedate}</a></th>
                <th class="w10"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=duedate|ASC"  data-sorter="orderby"><i class="icon-sort"></i>{$lang.duedate}</a></th>
                <th class="w5"></th>
            </tr>
        </thead>

        <tbody id="updater">
            {include file='ajax/ajax.invoices.tpl'}
        </tbody>

        {if $totalpages > 1}
            <tbody class="pagination">
                <tr>
                    <td colspan="7" >
                        <ul rel="{$totalpages}">
                            <li class="pull-left dis"><a href="#"><i class="icon-pagin-left"></i> {$lang.previous}</a></li>
                            <li class="pull-right dis"><a href="#">{$lang.next} <i class="icon-pagin-right"></i></a></li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        {/if}
    </table>
</div>
{if $enableFeatures.bulkpayments!='off'}
    <script type="text/javascript">
        {literal}
            var checks = $('input[name="selected[]"]'),
                pay = $('#payall');
        
            checks.change(function(){
                if(checks.filter(':checked').length){
                    $('.payall-selected').show();
                    $('.payall-all').hide();
                }else{
                    $('.payall-selected').hide();
                    $('.payall-all').show();
                }
            }).change();
            pay.submit(function(){
                if(checks.filter(':checked').length){
                    var a = checks.serializeArray();
                    for(var i = 0; i < a.length; i++){
                        pay.append('<input type="hidden" name="selected[]" value="'+a[i].value+'" />');
                    }
                }
            });
        {/literal}
    </script>
{/if}