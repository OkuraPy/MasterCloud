
    {if $service}
        {include file='services/service_details.tpl'}
    {else}
        {if $services}
            {if $custom_template}
                <div class="spacing">
                {include file=$custom_template}
                </div>
            {else}
                <div class="spacing">
                    <h3> 
                        {if $action=='services' && $cid}
                            {foreach from=$offer item=o}{if $action=='services' && $cid==$o.id}{$o.name}
                                {/if}
                            {/foreach}
                        {else}
                            {$lang[$action]|capitalize}
                        {/if}
                    </h3>
                    <p>{$lang.listservices}</p>
                </div>
                
                <div class="bottom-border-nav">
                    <ul class="nav nav-pills ">
                        <li class="active"><a href="#" data-sorter="filter[status]">{$lang.all}</a></li>
                        <li><a href="#Active" data-sorter="filter[status]">{$lang.Active}</a></li>
                        <li><a href="#Cancelled" data-sorter="filter[status]">{$lang.Cancelled}</a></li>
                        <li><a href="{$ca_url}cart&cat_id={$cid}" class="color-sky-blue"> <i class="icon-plus icon-white"></i> {$lang.Add} {$oo.name}</a></li>
                    </ul>
                    <a href="{$ca_url}clientarea&amp;action=services&amp;cid={$cid}" id="currentlist" style="display:none" updater="#updater"></a>
                    <input type="hidden" id="currentpage" value="0" />
                    <table class="table table-striped table-spacing services-table">
                        <thead>
                            <tr>
                                <th class="w40">
                                    <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=name|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.service}</a>
                                </th>
                                <th>
                                    <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=status|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.status}</a>
                                </th>
                                {if $action=='vps'}
                                    <th>
                                        <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=domain|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.hostname}</a>
                                    </th>
                                    <th>
                                        {$lang.ipadd}
                                    </th>
                                {else}
                                    <th>
                                        <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=total|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.price}</a>
                                    </th>
                                    <th>
                                        <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=billingcycle|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.bcycle}</a>
                                    </th>
                                {/if}
                                <th colspan="2">
                                    <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=next_due|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.nextdue}</a>
                                </th>

                            </tr>
                        </thead>
                        <tbody id="updater">
                            {include file='ajax/ajax.services.tpl'}
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
            {/if}
        {else}
            <div class="spacing">
            <h3>{$lang[$action]|capitalize}</h3>
            <p style="border: none;">{$lang.nothing}</p>

            {if $cid}
                {foreach from=$offer item=oo}
                    {if $cid==$oo.id && $oo.visible=='1'}
                        <form method="post" action="{$ca_url}cart&cat_id={$cid}" style="text-align: center">
                            <button  class="btn btn-danger btn-large">
                                <i class="icon icon-ShoppingCart"></i> {$lang.Add} {$oo.name}
                            </button>
                            {securitytoken}
                        </form>
                    {/if}
                {/foreach}
            {/if}
            </div>
        {/if}
    {/if}
