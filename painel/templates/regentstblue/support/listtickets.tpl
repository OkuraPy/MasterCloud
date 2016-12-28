<div class="spacing">
    <h3>{$lang.tickets|capitalize}</h3>
    <p>{$lang.mytickets_desc}</p>
</div> 

<div class="bottom-border-nav">
    <ul class="nav nav-pills ">
        <li class="active"><a href="#" data-sorter="filter[status]">{$lang.all}</a></li>
        <li><a href="#Open" data-sorter="filter[status]">{$lang.Open}</a></li>
        <li><a href="#Answered" data-sorter="filter[status]">{$lang.Answered}</a></li>
        <li><a href="{$ca_url}tickets/new/" class="color-sky-blue"> <i class="icon icon-Pencil"></i> {$lang.createnew}</a></li>
    </ul>
    <a href="{$ca_url}tickets/" id="currentlist" style="display:none" updater="#updater"></a>
    <input type="hidden" id="currentpage" value="0" />
    <table class="table table-striped table-spacing tickets-table">
        <thead>
            <tr>
                <th style="width: 45%"><a href="{$ca_url}tickets/&orderby=subject|ASC" data-sorter="orderby"><i class="icon-sort"></i>{$lang.subject}</a></th>
                <th style="width: 12%"><a href="{$ca_url}tickets/&orderby=status|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.status}</a></th>
                <th><a href="{$ca_url}tickets/&orderby=name|ASC" data-sorter="orderby"><i class="icon-sort"></i>{$lang.department}</a></th>
                <th><a href="{$ca_url}tickets/&orderby=date|ASC" data-sorter="orderby"><i class="icon-sort"></i>{$lang.date}</a></th>
                <th></th>
            </tr>
        </thead>
        <tbody id="updater">
            {include file='ajax.tickets.tpl'}
        </tbody>
        {if $totalpages > 1}
            <tbody class="pagination">
                <tr>
                    <td colspan="5" >
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
