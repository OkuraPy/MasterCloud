{if $action=='default'}
    {if $affiliates}
        {foreach from=$affiliates item=affiliate}
            <tr>
                <td><input type="checkbox" class="check" value="{$affiliate.client_id}" name="selected[]"/></td>
                <td><a href="?cmd=affiliates&amp;action=affiliate&amp;id={$affiliate.id}">{$affiliate.id}</a></td>
                <td><a href="?cmd=clients&amp;action=show&amp;id={$affiliate.client_id}">{$affiliate.firstname}</a></td>
                <td><a href="?cmd=clients&amp;action=show&amp;id={$affiliate.client_id}">{$affiliate.lastname}</a></td>		  
                <td >{$affiliate.visits}</td>
                <td>{$affiliate.signups}</td>
                <td>{$affiliate.balance|price:$affiliate.currency_id}</td>
                <td>{$affiliate.total_withdrawn|price:$affiliate.currency_id}</td>
                <td><span class="{$affiliate.status}">{$lang[$affiliate.status]}</span></td>
                <td><a href="?cmd=affiliates&amp;action=affiliate&amp;id={$affiliate.id}" class="editbtn">{$lang.Edit}</a></td>
                <td><a href="?cmd=affiliates&amp;make=delete&amp;id={$affiliate.id}&security_token={$security_token}"  
                       class="delbtn" onclick="return confirm('{$lang.affdelconf}')">{$lang.Remove}</a></td>
            </tr>

        {/foreach}
    {else}
        <tr>
            <td colspan="10"><p align="center">{$lang.nothingtodisplay}</p></td>
        </tr>
    {/if}
{elseif $action=='configuration'}
    {if $commisions}
        {foreach from=$commisions item=commision}
            <tr>
                <td><input type="checkbox" class="check" value="{$commision.id}" name="selected[]"/></td>
                <td><a href="?cmd={$cmd}&action=commision&make=edit&id={$commision.id}">{$commision.id}</a></td>
                <td><a href="?cmd={$cmd}&action=commision&make=edit&id={$commision.id}">{$commision.name}</a></td>
                <td> {$currency_id}
                {if $commision.type!='Percent'}{$commision.rate|price:$currency}{/if}
                {if $commision.type=='Percent'}{$commision.rate}%{/if}
            </td>		  
            <td>{$commision.notes}</td>
        </tr>
    {/foreach}
{else}
    <tr>
        <td colspan="10"><p align="center">{$lang.nothingtodisplay}</p></td>
    </tr>
{/if}
{elseif $action=='vouchers'}
    {if $vouchers}
        {foreach from=$vouchers item=voucher}
            <tr>
                <td><input type="checkbox" class="check" value="{$voucher.id}" name="selected[]"/></td>
                <td>{$voucher.code}</td>
                <td><a href="?cmd={$cmd}&action=affiliate&id={$voucher.aff_id}">{$voucher.firstname} {$voucher.lastname}</a></td>
                <td>{if $voucher.type == 'percent'}{$voucher.value}%{else}{$voucher.value|price:$currency}{/if}</td>		  
                <td>{$voucher.num_usage}</td>
            </tr>
        {/foreach}
    {else}
        <tr>
            <td colspan="10"><p align="center">{$lang.nothingtodisplay}</p></td>
        </tr>
    {/if}
{elseif $action=='commissions'}
    {if $commissions}
        {foreach from=$commissions item=order}
            <tr {if $order.paid=='1'}class="compor"{/if}>
                <td>{$order.id}</td>
                <td><a href="?cmd=orders&action=edit&id={$order.order_id}" >{$order.number}</a></td>
                <td>{$order.date_created|dateformat:$date_format}</td>
                <td><a href="?cmd=affiliates&action=affiliate&id={$order.aff_id}">{$order.firstname} {$order.lastname}</a></td>
                <td><a href="?cmd=clients&action=show&id={$order.client_id}">{$order.c_firstname} {$order.c_lastname}</a></td>
                <td>{$order.total|price:$order.c_currency_id}</td>
                <td>{$order.commission|price:$order.currency_id}</td>
                <td>
                    {if $order.paid!='1'}
                        {* <a href="?cmd=affiliates&action=affiliate&id={$affiliate.id}&acceptref={$order.id}&security_token={$security_token}">{$lang.No}</a> *}
                        {$lang.No}
                    {else}
                        {$lang.Yes}
                    {/if}
                </td>
                <td>
                    {if $order.coupon_id}{$lang.Yes}
                    {else}{$lang.No}
                    {/if}
                </td>
            </tr> 
        {/foreach}
    {else}
        <tr>
            <td colspan="10"><p align="center">{$lang.nothingtodisplay}</p></td>
        </tr>
    {/if}
{elseif $action=='withdrawals'}
    {if $list}
        {foreach from=$list item=log}
            <tr >
                <td style="width: 180px">{$log.date|dateformat:$date_format}</td>
                <td><a href="?cmd=affiliates&action=affiliate&id={$log.aff_id}">#{$log.aff_id}  {$log.client.firstname} {$log.client.lastname}</a></td>
                <td>{$log.amount|price:$order.c_currency_id}</td>
                <td>
                    {if $log.method ==0}Manual
                    {elseif $log.method ==1}Mailed Check
                    {else}Account Credit
                    {/if}
                </td>
                <td>
                    {$log.note|escape}
                </td>
            </tr> 
        {/foreach}
    {else}
        <tr>
            <td colspan="10"><p align="center">{$lang.nothingtodisplay}</p></td>
        </tr>
    {/if}
{elseif $action=='queue'}
    {if $list}
        {foreach from=$list item=log}
            <tr >
                <td style="width: 180px">{$log.date|dateformat:$date_format}</td>
                <td><a href="?cmd=affiliates&action=affiliate&id={$log.aff_id}">#{$log.aff_id} {$log.client.firstname} {$log.client.lastname}</a></td>
                <td>
                    {if $log.client.firstname || $log.client.lastname} 
                        {$log.client.firstname} {$log.client.lastname} <br />
                    {/if}
                    {if $log.client.companyname}
                        {$log.client.companyname} <br />
                    {/if}
                    {$log.client.address1} {$log.client.address2}<br />
                    {$log.client.postcode} {$log.client.city}<br />
                    {$log.client.country} {if $log.client.state}, {$log.client.state}{/if}
                </td>
                <td>{$log.amount|price:$order.c_currency_id}</td>
                <td>
                    <div class="textarea-overlay-control">
                        <textarea data-id="{$log.id}" style="width:200px; height: 50px;">{$log.note|escape}</textarea>
                    </div>
                </td>
                <td style="white-space: nowrap">
                    <form action="" method="post">
                        <input type="hidden" name="id" value="{$log.id}" />
                        <input type="hidden" name="make" value="sent" />
                        <button data-id="{$log.id}" class="marksent" type="submit">Mark as sent</button>
                        {securitytoken}
                    </form>
                </td>
            </tr> 
        {/foreach}
    {else}
        <tr>
            <td colspan="10"><p align="center">{$lang.nothingtodisplay}</p></td>
        </tr>
    {/if}
{/if}