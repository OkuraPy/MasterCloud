
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
                        <th>{$lang.total}</th>
                        <th>{$lang.commission}</th>
                        <th>{$lang.status}</th>
                    </tr>
                    {if $orders}
                        {foreach from=$orders item=order name=orders}
                            <tr>
                                <td>{$order.date_created|dateformat:$date_format}</td>
                                <td>
                                    {if $order.acstatus}
                                        {$lang.Account}: {$order.pname}
                                    {/if}
                                    {if $order.domstatus}
                                        <br />{$lang.Domain}: {$order.domain}
                                    {/if}
                                </td>
                                <td>{$order.total|price:$order.currency_id}</td>
                                <td>{$order.commission|price:$affiliate.currency_id}</td>
                                <td><strong>{if $order.paid=='1'}{$lang.approved}{else}{$lang.Pending}{/if}</strong></td>
                            </tr>
                        {/foreach}
                    {else}
                        <tr>
                            <td colspan="5">
                               {$lang.nothing}
                            </td>
                        </tr>
                    {/if}
                </table>
            
          </div>
        </div>
    </div>
</div>

