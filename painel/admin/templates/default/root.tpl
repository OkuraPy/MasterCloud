<table border="0" cellpadding="0" cellspacing="0" width="100%" >

    <tr>
        <td class="leftNav" style="line-height:20px;position:relative">
            <strong>{$lang.Shortcuts}:</strong><br />
            <a href="?cmd=newclient">{$lang.addcustomer}</a><br />
            <a href="?cmd=tickets&action=new">{$lang.opensupticket}</a><br />
            <a href="?cmd=orders&action=add">{$lang.placeneworder}</a><br />
            <a href="?cmd=stats">{$lang.systemstatistics}</a>
            <br />
            <br />
            <div style="font-size:11px;line-height:15px;">
                <strong>{$lang.whosonline}</strong>
                <br />

                {foreach from=$others item=o}
                    <span>{$o.username}</span>
                {/foreach}

                <br />
                <br />	

                <span style="font-size:11px;">
                    {$lang.Licenseto}: <strong>{$license.to}</strong><br />
                    {$lang.Expires}: <strong>{$license.expires}</strong><br />
                    {$lang.Version}: <strong>{$version}</strong>{if $build}<em>:{$build}</em>{/if}
                    {if $newversion}<br /><span style="color:red">{$lang.newVersion}: <strong>{$newversion}</strong></span> 
                        (<a class="external" target="_blank" href="http://hostbillapp.com/changelog" >{$lang.more|capitalize}</a>)
                    {/if}
                </span>
                <br />

                {if $forecast}
                    <br />

                    <strong>{$lang.incomeforecast}</strong>
                    <div id="forecast">
                        <strong>{$lang.i6m}:</strong> <br />
                        <div style="text-align:right"><strong>{$forecast.total6|price:$currency}</strong></div>
                        <strong>{$lang.i12m}:</strong> <br />
                        <div style="text-align:right"><strong>{$forecast.total|price:$currency}</strong></div>
                        <strong>{$lang.i24m}:</strong> <br />
                        <div style="text-align:right"><strong>{$forecast.total24|price:$currency}</strong></div>
                    </div>	
                {/if}
            </div>
        </td>
        <td  valign="top" id="dashboard-table">

            {if $qc_features}
                <script type="text/javascript" src="{$template_dir}js/facebox/facebox.js?v={$hb_version}"></script>
                <link rel="stylesheet" href="{$template_dir}js/facebox/facebox.css" type="text/css" />
                {literal}
                    <script type="text/javascript">
                        function appendMe1() {
                            $.facebox({ajax: '?cmd=root&action=initialconfig'});
                        }
                        appendLoader('appendMe1');
                    </script>
                {/literal}
            {/if}

            {if $stats}
                <div class="gbox1 dashboard-header">
                    <div class="left">
                        <span class="dashboard-income-line">{$lang.incometoday}: <strong>{$stats.today|price:$currency}</strong></span>
                        <span class="dashboard-income-line">{$lang.thismonth}: <strong>{$stats.month|price:$currency}</strong></span>
                        <span class="dashboard-income-line">{$lang.thisyear}: <strong>{$stats.year|price:$currency}</strong></span>
                    </div>
                    <div class="right">
                        {$lang.orders|capitalize}:
                        <a class="dashboard-stat-line" href="?cmd=orders">Today <strong>{$stats.orders}</strong></a>
                        <a class="dashboard-stat-line" href="?cmd=orders&list=active">{$lang.Activated} <strong>{$stats.active_orders}</strong></a>
                        <a class="dashboard-stat-line" href="?cmd=orders&list=pending">{$lang.Pending} <strong>{$stats.pending_orders}</strong></a>
                        <a class="dashboard-stat-line {if $stats.requests>0}dashboard-stat-red{/if}" href="?cmd=logs&action=cancelations">{$lang.pendingtocancel} <strong>{$stats.requests}</strong></a>
                    </div>
                    <div class="clear"></div>
                </div>
            {/if}
            <div id="fp_leftcol">
                <table id="dashboard-sections">
                    <tr>
                        <td class="{if $dashboard.orders || $dashboard.domains}dashboard-half{/if}">
                            {if $dashboard.orders}
                                <div class="bborder dashboard-half-table dashboard-orders">
                                    <div class="bborder_header">
                                        {$lang.recentorders}
                                        <div class="bborder-legend"><span class="orderpaid"></span> {$lang.paymentreceived}</div>
                                    </div>
                                    <div class="bborder_content">
                                        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike" style="">
                                            <tbody>
                                                <tr>
                                                    <th>{$lang.orderhash}</th>
                                                    <th>{$lang.clientname}</th>
                                                    <th>{$lang.Date}</th>
                                                    <th>{$lang.Total}</th>
                                                    <th>{$lang.Status}</th>
                                                </tr>
                                                {foreach from=$dashboard.orders item=order}
                                                    <tr {if $order.balance=='Completed'}class="orderpaid"{/if}>

                                                        <td><a href="?cmd=orders&action=edit&id={$order.id}&list=all">{$order.number}</a></td>
                                                        <td><a href="?cmd=clients&action=show&id={$order.client_id}">{$order.name}</a></td>
                                                        <td>{$order.date_created|dateformat:$date_format}</td>
                                                        <td>{$order.total|price:$order.currency_id}</td>
                                                        <td>
                                                            <span class="{$order.status}">{if $lang[$order.status]}{$lang[$order.status]}{else}{$order.status}{/if}</span>
                                                        </td>
                                                    </tr>
                                                {/foreach}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            {/if}

                            {if $dashboard.domains}
                                <div class="bborder dashboard-half-table dashboard-domains">
                                    <div class="bborder_header">
                                        {$lang.recentdomains}
                                        <div class="bborder-legend"><span class="notseen"></span> New since last visit</div>
                                    </div>
                                    <div class="bborder_content">
                                        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike" style="">
                                            <tbody>
                                                <tr>
                                                    <th>{$lang.Domain}</th>
                                                    <th width="30%">{$lang.Action}</th>
                                                    <th>{$lang.Success}</th>
                                                    <th>{$lang.Date}</th>
                                                </tr>
                                                {foreach from=$dashboard.domains item=dom}
                                                    <tr {if $dom.notseen}class="notseen"{/if}>
                                                        <td><a href="?cmd=domains&action=edit&id={$dom.domain_id}">{$dom.name}</a></td>
                                                        <td ><span class="text-overflow" title="{$dom.action}">{$dom.action}</span></td>
                                                        <td>{if $dom.result=='1'}{$lang.Yes}{else}<font color="red">{$lang.No}</font>{/if}</td>
                                                        <td>{$dom.date|dateformat:$date_format}</td>
                                                    </tr>
                                                {/foreach}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            {/if}
                        </td>
                        <td class="{if $dashboard.mytickets || $dashboard.accounts}dashboard-half{/if}">
                            {if $dashboard.mytickets}
                                <div class="bborder dashboard-half-table dashboard-tickets">
                                    <div class="bborder_header">
                                        {$lang.mysuptickets} <a href="?cmd=tickets">({$mytickets_count} {$lang.unread})</a>
                                    </div>
                                    <div class="bborder_content">
                                        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike"  style="">
                                            <tbody>
                                                <tr>
                                                    <th width="40%">{$lang.Subject}</th>
                                                    <th>{$lang.Submitter}</th>
                                                    <th>{$lang.Status}</th>
                                                    <th>Last Reply</th>
                                                </tr>
                                                {foreach from=$dashboard.mytickets item=ticket}
                                                    <tr {if $ticket.admin_read=='0'}class="unread"{/if}>
                                                        <td>
                                                            <a class="subject" href="?cmd=tickets&action=view&list=all&num={$ticket.ticket_number}" >{$ticket.tsubject}</a>
                                                        </td>
                                                        <td>
                                                            {if $ticket.client_id!='0'}<a href="?cmd=clients&action=show&id={$ticket.client_id}">{/if}{$ticket.name}{if $ticket.client_id!='0'}</a>{/if}
                                                        </td>
                                                        <td>
                                                            <span class="{$ticket.status}">{if $lang[$ticket.status]}{$lang[$ticket.status]}{else}{$ticket.status}{/if}</span>
                                                        </td>
                                                        <td>{$ticket.lastreply}</td>
                                                    </tr>
                                                {/foreach}
                                            </tbody>
                                        </table>	
                                    </div>
                                </div>
                            {/if}
                            {if $dashboard.accounts}
                                <div class="bborder dashboard-half-table dashboard-accounts">
                                    <div class="bborder_header">
                                        {$lang.recentaccfailures}
                                        <div class="bborder-legend"><span class="notseen"></span> New since last visit</div>
                                    </div>
                                    <div class="bborder_content">
                                        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike" style="">
                                            <tbody>
                                                <tr>
                                                    <th>{$lang.Account}</th>
                                                    <th>{$lang.Action}</th>
                                                    <th width="40%">{$lang.Error}</th>
                                                    <th>{$lang.Date}</th>
                                                </tr>
                                                {foreach from=$dashboard.accounts item=acc}
                                                    <tr {if $acc.notseen}class="notseen"{/if}>
                                                        <td>
                                                            <a href="?cmd=accounts&action=edit&id={$acc.account_id}">
                                                                {if $acc.domain}{$acc.domain}
                                                                {else}<em>#{$acc.account_id} <small>( {$lang.emptyhost} )</small></em>
                                                                {/if}
                                                            </a>
                                                        </td>
                                                        <td >{$acc.action}</td>
                                                        <td><span class="text-overflow" title="{$acc.error}">{$acc.error}</span></td>          
                                                        <td>{$acc.date|dateformat:$date_format}</td>
                                                    </tr>
                                                {/foreach}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            {/if}
                        </td>
                    </tr>
                </table>


                {if $HBaddons.mainpage}
                    <div class="bborder">
                        <div class="bborder_header">
                            {$lang.Plugins}
                        </div>
                        <div class="bborder_content">
                            {foreach from=$HBaddons.mainpage item=module}
                                <div class="addon_module"><strong><a href="?cmd=module&module={$module.id}">{$module.name}</a></strong></div>
                                <div class="clear"></div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

            </div>
            {include file='adminwidgets/todolist.tpl'}

            <div id="fp_bottomcol">

            </div>

            {include file='adminwidgets/systeminfo.tpl'}
        </td>
    </tr>
</table>
{literal}
    <style type="text/css">.banner-el {

            box-shadow: 0px 2px 2px 0px  rgba(1, 1, 1, 0.5);
            color:#fff !important;
            line-height:13px;
            padding:10px 5px;
            width:120px;
            text-align:right;
            margin-top:20px;
            margin-bottom:5px;
            background-image: -moz-linear-gradient(top, #E72626 0%, #CF1B1B 100%);
            background-image: -o-linear-gradient(top, #E72626 0%, #CF1B1B 100%);
            background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E72626), color-stop(1, #CF1B1B));
            background-image: -webkit-linear-gradient(top, #E72626 0%, #CF1B1B 100%);
            background-image: linear-gradient(to bottom, #E72626 0%, #CF1B1B 100%);
        }

    </style>
{/literal}