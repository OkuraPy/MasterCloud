<script type="text/javascript">loadelements.clients = true;</script>
<table border="0" cellspacing="0" cellpadding="0" width="100%" id="content_tb" {if $currentfilter}class="searchon"{/if}>
    <tr>
        <td ><h3>{if $action!='configuration'}{$lang.Affiliates}{else}{$lang.affconfig}{/if}</h3></td>
        <td  ></td>
    </tr>
    <tr>
        <td class="leftNav">
            <a href="?cmd=newclient"  class="tstyled"><strong>{$lang.registernewcustomer}</strong></a><br />
            <a href="?cmd=clients"  class="tstyled">{$lang.managecustomers}</a> 
            <a href="?cmd=clients&list=active"  class="tstyled tsubit ">{$lang.Active}</a>
            <a href="?cmd=clients&list=closed"  class="tstyled tsubit ">{$lang.Closed}</a>
            <a href="?cmd=clients&action=fields"  class="tstyled">{$lang.customerfields}</a>
            <br />
            <a href="?cmd=affiliates"  class="tstyled  {if $action=='affiliate' || $action=='default' || !$action}selected{/if}">{$lang.Affiliates}</a>
            <a href="?cmd=affiliates&action=configuration"  class="tstyled {if $action=='configuration' || $action=='commision'}selected{/if}">{$lang.affconfig}</a>
        </td>   
        <td  valign="top"  class="bordered"><div id="bodycont">
                {literal}
                    <style type="text/css">
                        .sectioncontent.cpadding td{padding:6px; background: #F5F9FF}
                        .sectioncontent td{background: #E0ECFF}
                        .newhorizontalnav .list-2 .navsubmenu {background: #FFFFFF; border-bottom: 1px solid #DFDFDF;}
                        .newhorizontalnav .list-2 .hasitems {height: 20px; padding: 8px 16px;}
                    </style>
                {/literal}
                {if $action=='default' || $action=='commissions' || $action=='withdrawals' || $action=='queue'}
                    <div class="newhorizontalnav" id="newshelfnav">
                        <div class="list-1">
                            <ul>
                                <li class="direct {if !$action || $action=='default'}active{/if}" >
                                    <a href="?cmd={$cmd}"><span>{$lang.Affiliates}</span></a>
                                </li>
                                <li class="direct {if $action=='commissions'}active{/if}">
                                    <a href="?cmd={$cmd}&action=commissions"><span>{$lang.commissions}</span></a>
                                </li>
                                <li class="direct {if $action=='withdrawals'}active{/if}">
                                    <a href="?cmd={$cmd}&action=withdrawals"><span>Withdrawals</span></a>
                                </li>
                                <li class="direct last {if $action=='queue'}active{/if}">
                                    <a href="?cmd={$cmd}&action=queue"><span>Pending withdrawals</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="list-2">
                            <div class="navsubmenu " >
                                <ul>
                                </ul>
                            </div>
                        </div>
                    </div>
                {/if}
                {if $action=='default'}

                    <form action="" method="post" id="testform" >
                        <input type="hidden" value="{$totalpages}" name="totalpages2" id="totalpages"/>
                        <div class="blu">
                            <div class="right"><div class="pagination"></div></div>
                            <div class="left">
                                {$lang.withselected}
                                <input type="submit" name="sendmail" value="{$lang.SendMessage}" onclick="return send_msg('clients')" />
                            </div>
                            <div class="clear"></div>
                        </div>   
                        <a href="?cmd=affiliates" id="currentlist" style="display:none"></a>
                        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike hover">
                            <tbody>
                                <tr>
                                    <th width="20"><input type="checkbox" id="checkall"/></th>
                                    <th><a href="?cmd=affiliates&list={$currentlist}&orderby=id|ASC" class="sortorder">{$lang.affiliatehash}</a></th>
                                    <th><a href="?cmd=affiliates&list={$currentlist}&orderby=firstname|ASC"  class="sortorder">{$lang.firstname}</a></th>
                                    <th><a href="?cmd=affiliates&list={$currentlist}&orderby=lastname|ASC"  class="sortorder">{$lang.lastname}</a></th>
                                    <th><a href="?cmd=affiliates&list={$currentlist}&orderby=visits|ASC"  class="sortorder">{$lang.visitors}</a></th>
                                    <th><a href="?cmd=affiliates&list={$currentlist}&orderby=signups|ASC"  class="sortorder">{$lang.signups}</a></th>
                                    <th><a href="?cmd=affiliates&list={$currentlist}&orderby=balance|ASC"  class="sortorder">{$lang.balance}</a></th>  
                                    <th><a href="?cmd=affiliates&list={$currentlist}&orderby=total_withdrawn|ASC"  class="sortorder">{$lang.withdrawn}</a></th>      
                                    <th><a href="?cmd=affiliates&list={$currentlist}&orderby=status|ASC"  class="sortorder">{$lang.status}</a></th>    
                                    <th width="20"></th>   
                                    <th width="20"></th>   
                                </tr>
                            </tbody>

                            <tbody id="updater">
                                {include file='ajax.affiliates.tpl'}
                            </tbody>

                            <tbody id="psummary">
                                <tr>
                                    <th></th>
                                    <th colspan="10">
                                        {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                                    </th>
                                </tr>
                            </tbody>
                        </table>

                        <div class="blu">
                            <div class="right"><div class="pagination"></div></div>
                            <div class="left">
                                {$lang.withselected}
                                <input type="submit" name="sendmail" value="{$lang.SendMessage}" onclick="return send_msg('clients')" /></div>
                            <div class="clear"></div>		
                        </div>

                        {securitytoken}
                    </form>
                {elseif $action=='commissions'}

                    <a href="?cmd={$cmd}&action={$action}" id="currentlist" style="display:none"></a>
                    <table width="100%" cellspacing="0" cellpadding="3" border="0" style="" class="glike">
                        <tbody>
                            <tr>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=id|ASC" class="sortorder">ID</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=number|ASC" class="sortorder">{$lang.Order}</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=|ASC" class="sortorder">{$lang.signupdate}</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=lastname|ASC" class="sortorder">{$lang.Affiliate}</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=c_lastname|ASC" class="sortorder">{$lang.Client}</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=total|ASC" class="sortorder">{$lang.Sale}</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=commission|ASC" class="sortorder">{$lang.commission}</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=paid|ASC" class="sortorder">{$lang.approved}</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=coupon_id|ASC" class="sortorder">{$lang.voucher}</a></th>
                            </tr> 
                        </tbody>

                        <tbody id="updater">
                            {include file='ajax.affiliates.tpl'}
                        </tbody>

                        <tbody id="psummary">
                            <tr>
                                <th></th>
                                <th colspan="9">
                                    {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                                </th>
                            </tr>
                        </tbody>
                    </table> 
                {elseif $action=='withdrawals'}

                    <a href="?cmd={$cmd}&action={$action}" id="currentlist" style="display:none"></a>
                    <table width="100%" cellspacing="0" cellpadding="3" border="0" style="" class="glike">
                        <tbody>
                            <tr>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=id|ASC" class="sortorder">Date</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=aff_id|ASC" class="sortorder">Affiliate</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=total|ASC" class="sortorder">{$lang.Amount}</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=commission|ASC" class="sortorder">Method</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=paid|ASC" class="sortorder">Notes</a></th>
                            </tr> 
                        </tbody>

                        <tbody id="updater">
                            {include file='ajax.affiliates.tpl'}
                        </tbody>

                        <tbody id="psummary">
                            <tr>

                                <th colspan="9">
                                    {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                                </th>
                            </tr>
                        </tbody>
                    </table> 
                {elseif $action=='queue'}
                    {literal}
                        <script type="text/javascript">
                                $(function(){
                                $(document).on('input update', '.textarea-overlay-control textarea', function (e) {
                                var self = $(this),
                                    value = self.val(),
                                    data = self.data();
                                    if (typeof data.initial === 'undefined') {
                                data.initial = value;
                                }

                                if (data.initial != value && !data.savebtn) {
                                data.savebtn = $('<a href="#" class="btn-overlay">Save</a>');
                                    data.savebtn.on('click', function () {
                                    var note = self.val();
                                        data.initial = note;
                                        self.prop('disabled', true).trigger('update');
                                        $.post(window.location.href, {
                                        id: data.id,
                                            make: 'update',
                                            note: note
                                        }, function (data) {
                                            parse_response(data);
                                            self.prop('disabled', false);
                                        })
                                        return false;
                                    })
                                    self.before(data.savebtn)
                                } else if (data.initial == value && data.savebtn) {
                                data.savebtn.remove();
                                    data.savebtn = false;
                                }
                                }).find('textarea').trigger('update');
                                })
                        </script>
                    {/literal}
                    <a href="?cmd={$cmd}&action={$action}" id="currentlist" style="display:none"></a>
                    <table width="100%" cellspacing="0" cellpadding="3" border="0" style="" class="glike">
                        <tbody>
                            <tr>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=id|ASC" class="sortorder">Date</a></th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=aff_id|ASC" class="sortorder">Affiliate</a></th>
                                <th>Address</th>
                                <th><a href="?cmd={$cmd}&action={$action}&orderby=total|ASC" class="sortorder">{$lang.Amount}</a></th>
                                <th style="width: 80px;"><a href="?cmd={$cmd}&action={$action}&orderby=paid|ASC" class="sortorder">Notes</a></th>
                                <th style="width: 80px;"></th>
                            </tr> 
                        </tbody>

                        <tbody id="updater">
                            {include file='ajax.affiliates.tpl'}
                        </tbody>

                        <tbody id="psummary">
                            <tr>

                                <th colspan="9">
                                    {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                                </th>
                            </tr>
                        </tbody>
                    </table> 
                {elseif $action=='affiliate'}   
                    {literal}
                        <script type="text/javascript" >
                                $(function(){
                                $('.commission-val').change(function(){
                                var self = $(this),
                                    data = self.data(),
                                    accept = self.parents('tr').eq(0).find('.acceptref');
                                    accept.attr('href', accept.attr('href').replace(/&amount=[^&]*/, '')
                                        + '&amount=' + self.val());
                                    if (!data.save){
                                data.save = $('<a style="color:red" href="#">Save</a>');
                                    self.parent().append(data.save);
                                    data.save.click(function(){
                                    var va = self.val();
                                        data.save.remove();
                                        data.save = false;
                                        self.prop('disabled', true);
                                        $.post(window.location.href, {
                                        editorder: 1,
                                            order_id: data.ref,
                                            value: va
                                        }, function(data){
                                            parse_response(data);
                                            self.prop('disabled', false);
                                        })
                                    })
                                }
                                })
                                })
                        </script>
                    {/literal}
                    <div class="blu">
                        <a href="?cmd=affiliates"><strong>{$lang.backtoaffi}</strong></a>
                        <a href="#" onclick="$('#affiliateform').submit();
                                    return false;" class="menuitm"><span>{$lang.savechanges}</span></a>
                        <a class="menuitm clDropdown" id="hd1" onclick="return false;" href="#"><span class="morbtn">More actions</span></a>
                        <ul class="ddmenu" id="hd1_m">
                            <li><a onclick="$('#withdrawal').click();
                                        return false;" href="#">{$lang.makewithd}</a></li>
                            <li><a class="directly" href="?cmd=affiliates&action=toggle&id={$affiliate.id}&security_token={$security_token}">
                                    {if $affiliate.status == 'Active'}
                                        Disable Affiliate
                                    {else}
                                        Enable Affiliate
                                    {/if}
                                </a>
                            </li>
                            <li><a onclick="confirm('{$lang.affdelconf}') && (window.location = '?cmd=affiliates&make=delete&id={$affiliate.id}&security_token={$security_token}');
                                        return false;"
                                   href="#AffDelete"> Delete Affiliate</a></li>

                        </ul>
                    </div>
                    <div id="ticketbody">
                        <h1>{$lang.affiliatehash}{$affiliate.id} {$affiliate.firstname} {$affiliate.lastname}</h1>
                        <div id="client_nav">
                            <!--navigation-->
                            <a class="nav_el nav_sel left" href="#">{$lang.affdetails}</a> 
                            <a class="nav_el left" id="withdrawal" href="#">{$lang.makewithd}</a> 
                            {include file="_common/quicklists.tpl"}
                            <div class="clear"></div>
                        </div>

                        <div class="ticketmsg ticketmain" id="client_tab">
                            <div class="slide" style="display:block">
                                <form action='' method='post' id="affiliateform">
                                    <table cellspacing="2" cellpadding="3" border="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td style="width: 15%; text-align: right" >{$lang.affiliatehash}</td>
                                                <td >#{$affiliate.id}</td>
                                                <td style="width: 15%; text-align: right" >{$lang.pendingcom}</td>
                                                <td >{$pending|price:$affiliate.currency_id}</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right">{$lang.Client}</td>
                                                <td ><a href="?cmd=clients&action=show&id={$affiliate.client_id}">{$affiliate.firstname} {$affiliate.lastname}</a> </td>

                                                <td style="width: 15%; text-align: right">{$lang.affsince}</td>
                                                <td >{$affiliate.date_created|dateformat:$date_format}</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right">{$lang.status}</td>
                                                <td ><span class="{$affiliate.status}">{$lang[$affiliate.status]}</span></td>

                                                <td style="width: 15%; text-align: right">{$lang.convrate}</td>
                                                <td >{$affiliate.conversion} %</td> 

                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right">{$lang.visitors}</td>
                                                <td ><input size="3" value="{$affiliate.visits}" name="visits"/></td>

                                                <td style="width: 15%; text-align: right">{$lang.withdrawn}</td>
                                                <td ><input size="3" value="{$affiliate.total_withdrawn}" name="total_withdrawn"/></td>

                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right">Parent Affiliate</td>
                                                <td >
                                                    <select name="parent_id">
                                                        <option value="0"> - </option>
                                                        {foreach from=$affiliates item=aff}
                                                            {if $aff.id != $affiliate.id}
                                                                <option value="{$aff.id}" {if $affiliate.parent_id==$aff.id}selected="selected"{/if} >
                                                                    #{$aff.id} {$aff.firstname} {$aff.lastname}
                                                                </option>
                                                            {/if}
                                                        {/foreach}  
                                                    </select>
                                                </td>

                                                <td style="width: 15%; text-align: right">Auto Withdraw</td>
                                                <td >
                                                    <select name="withdraw_method">
                                                        <option {if $affiliate.withdraw_method==0}selected="selected"{/if} value="0">Disabled</option>
                                                        <option {if $affiliate.withdraw_method==1}selected="selected"{/if} value="1">Mailed Check</option>
                                                        <option {if $affiliate.withdraw_method==2}selected="selected"{/if} value="2">Account Credit</option>
                                                    </select>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right">{$lang.commissions}</td>
                                                <td ><input size="3" value="{$affiliate.total_commissions}" name="total_commissions"/></td>

                                                <td style="width: 15%; text-align: right; vertical-align: top" rowspan="2">Available Commission plans</td>
                                                <td rowspan="2">
                                                    <select name="commision_plans[]" multiple="multiple" size=3 style="min-width:200px">
                                                        <option value="all" {if !$affiliate.commision_plans}selected="selected"{/if}>All Commission plans</option>
                                                        {foreach from=$commisionsplans item=cp}
                                                            <option value="{$cp.id}" {if in_array($cp.id, $affiliate.commision_plans)}selected="selected"{/if}>{$cp.name}</option>
                                                        {/foreach}
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right">{$lang.affiliateurl}</td>
                                                <td><input value="{$system_url}?affid={$affiliate.id}" readonly="readonly" style="width:300px"/></td>

                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right">{$lang.AffLandingPage}</td>
                                                <td><input value="{$landingurl}" name="landingurl" style="width:300px"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <input type="hidden" value="{$lang.savechanges}" name="savechanges"/>
                                    {securitytoken}
                                </form>
                            </div>
                            <div class="slide" id="withdrawal_tab" style="display:none;">
                                <form action='' method='post' >
                                    <table cellspacing="2" cellpadding="3" border="0" width="100%">
                                        <tr>
                                            <td style="width: 15%; text-align: right">{$lang.amount}:</td>
                                            <td> <input size="3" value="{$affiliate.balance}" name="payout"/> </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 15%; text-align: right">{$lang.Type}:</td>
                                            <td> 
                                                <select name="type">
                                                    <option value="0">{$lang.manualmode}</option>
                                                    <option value="1">{$lang.addtransaction}</option>
                                                    <option value="2">{$lang.addcredit|capitalize}</option>
                                                </select> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 15%; text-align: right">{$lang.notes}</td>
                                            <td><textarea name="note"> </textarea> </td>
                                        </tr>
                                    </table>

                                    <input type="submit" name="withok" value="{$lang.makewithd}" style="font-weight:bold"/>	
                                    {securitytoken}
                                </form>
                            </div>
                            {include file="_common/quicklists.tpl" _placeholder=true}
                        </div> 
                        <div style="padding: 0 5px 5px 0">
                            <a href="#" onclick="$('#affiliateform').submit();
                                        return false;" class="menuitm"><span>{$lang.savechanges}</span></a>
                            <a class="menuitm clDropdown" id="hd1" onclick="return false;" href="#"><span class="morbtn">More actions</span></a>

                        </div>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="100%">
                                    <div class="bborder">
                                        <div class="bborder_header">
                                            <div style="float: left;">{$lang.commissions}</div>  
                                            <div style="float: right; font-weight: normal; font-size: 11px; color: rgb(83, 83, 83);"><span class="pord"></span>&nbsp; {$lang.paidcommissions}</div>
                                            <div style="clear: both;"></div>
                                        </div>

                                        <div class="bborder_content">

                                            <table width="100%" cellspacing="0" cellpadding="3" border="0" class="glike" style="line-height: 20px;">
                                                <tbody>
                                                    {if $orders}
                                                        <tr>
                                                            <th style="width: 50px">ID</th>
                                                            <th style="width: 130px">{$lang.signupdate}</th>
                                                            <th style="width: 180px">{$lang.Client}</th>
                                                            <th style="width: 180px">{$lang.service|capitalize}</th>
                                                            <th style="width: 180px">{$lang.commission}</th>
                                                            <th style="width: 180px" colspan="2" style="text-align: center">{$lang.servicestatus}</th>
                                                            <th style="width: 180px"></th>
                                                        </tr> 
                                                        {foreach from=$orders item=order}
                                                            <tr {if $order.paid=='1'}class="compor"{/if}>
                                                                <td>{$order.id}</td>
                                                                <td>{$order.date_created|dateformat:$date_format}</td>
                                                                <td><a href="?cmd=clients&action=show&id={$order.client_id}">{$order.firstname} {$order.lastname}</a></td>
                                                                <td style="vertical-align: top">
                                                                    {$lang.Order}: <a href="?cmd=orders&action=edit&id={$order.order_id}">#{$order.order_id}</a> {$lang.Total}: {$order.total|price:$order.currency_id}
                                                                    {if $order.invoice_id}
                                                                        <br />{$lang.Invoice}: <a href="?cmd=invoices&action=edit&id={$order.invoice_id}">#{$order.invoice_id}</a>
                                                                    {/if}
                                                                    {if $order.accounts}
                                                                        {foreach from=$order.accounts item=acc}
                                                                            <br />{$lang.Account}: <a href="?cmd=accounts&action=edit&id={$acc.id}">#{$acc.id} - {$acc.name}</a>
                                                                        {/foreach}
                                                                    {/if}
                                                                    {if $order.domains}
                                                                        {foreach from=$order.domains item=dom }
                                                                            <br />{$lang.Domain}: <a href="?cmd=domains&action=edit&id={$dom.id}">#{$dom.id} - {$dom.name}</a>
                                                                        {/foreach}
                                                                    {/if}
                                                                    {if $order.invoice_id}
                                                                        <br />
                                                                        <span style="color: red">This is a recurring commission</span>
                                                                    {/if}
                                                                </td>
                                                                <td style="vertical-align: middle">
                                                                    {if $order.paid=='1'}{$order.commission|price:$affiliate.currency_id}
                                                                    {else}
                                                                        <input type="text" class="commission-val" data-ref="{$order.id}"
                                                                               value="{$order.commission|price:$affiliate.currency_id:false}" size="6"> 
                                                                        {$affiliate.currency.code}
                                                                    {/if}
                                                                </td>
                                                                <td style="vertical-align: top; text-align: right">
                                                                    {$lang.Order}: 
                                                                    {if $order.invoice_id}
                                                                        <br />{$lang.Invoice}:
                                                                    {/if}
                                                                    {if $order.accounts}
                                                                        {foreach from=$order.accounts item=acc}
                                                                            <br />{$lang.Account} #{$acc.id}: 
                                                                        {/foreach}
                                                                    {/if}
                                                                    {if $order.domains}
                                                                        {foreach from=$order.domains item=dom}
                                                                            <br />{$lang.Domain} #{$dom.id}: 
                                                                        {/foreach}
                                                                    {/if}
                                                                </td>
                                                                <td style="vertical-align: top">
                                                                    <span class="{$order.status}"><strong>{$lang[$order.status]}</strong></span>
                                                                            {if $order.invoice_id}
                                                                        <br /><span class="{$order.invstatus}"><strong>{$lang[$order.invstatus]}</strong></span>
                                                                            {/if}
                                                                            {if $order.accounts}
                                                                                {foreach from=$order.accounts item=acc}
                                                                            <br /><span class="{$acc.status}"><strong>{$lang[$acc.status]}</strong></span>
                                                                                {/foreach}
                                                                            {/if}
                                                                            {if $order.domains}
                                                                                {foreach from=$order.domains item=dom}
                                                                            <br /><span class="{$dom.status}"><strong>{$lang[$dom.status]}</strong></span>
                                                                                {/foreach}
                                                                            {/if}
                                                                </td>
                                                                <td style="text-align: right">
                                                                    {if $order.paid!='1'}

                                                                        <a href="?cmd=affiliates&action=affiliate&id={$affiliate.id}&acceptref={$order.id}&security_token={$security_token}" 
                                                                           class="menuitm menuf acceptref">
                                                                            {if $order.invoice_id}
                                                                                Accept commission 
                                                                            {else}
                                                                                {$lang.acceptref}
                                                                            {/if}
                                                                        </a>{*}
                                                                        {*}{/if}{*}
                                                                        {*}<a href="?cmd=affiliates&action=affiliate&id={$affiliate.id}&removeref={$order.id}&security_token={$security_token}" 
                                                                           class="menuitm {if $order.paid!='1'}menul{/if}" onclick="return confirm('{$lang.confirmlogab}')"><span class="delsth"></span></a>
                                                                    </td>
                                                                </tr> 
                                                                {/foreach}
                                                                    {else}
                                                                        <tr><td><center>{$lang.nothingtodisplay}</center></td></tr>
                                                                        {/if}
                                                                        </tbody>
                                                                    </table>	
                                                                </div> 
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td valign="top" >
                                                            <div class="bborder">

                                                                <div class="bborder_header">
                                                                    {$lang.withhistory}
                                                                </div>
                                                                <div class="bborder_content">

                                                                    <table width="100%" cellspacing="0" cellpadding="3" border="0" style="" class="glike">
                                                                        <tbody>
                                                                            {if $withdrawals}
                                                                                <tr>
                                                                                    <th width="130">{$lang.Date}</th>        
                                                                                    <th>{$lang.amount}</th>
                                                                                    <th>{$lang.notes}</th>
                                                                                    <th width="20"></th>
                                                                                </tr>
                                                                                {foreach from=$withdrawals item=wid}
                                                                                    <tr>
                                                                                        <td width="130">{$wid.date|dateformat:$date_format}</td>        
                                                                                        <td>{$wid.amount|price:$affiliate.currency_id}</td>
                                                                                        <td>{$wid.note}</td>
                                                                                        <td><a href="?cmd=affiliates&action=affiliate&id={$affiliate.id}&removelog={$wid.id}&security_token={$security_token}" class="delbtn" onclick="return confirm('{$lang.confirmloga}')">{$lang.Remove}</a></td>
                                                                                    </tr>
                                                                                {/foreach}
                                                                            {else}
                                                                                <tr><td><center>{$lang.nothingtodisplay}</center></td></tr>
                                                                            {/if}

                                                                        </tbody>
                                                                    </table>	
                                                                </div>    
                                                            </div>
                                                        </td>    
                                                    </tr>
                                                </table>     
                                            </div> 
                                            <div class="blu">
                                                <a href="?cmd=affiliates"><strong>{$lang.backtoaffi}</strong></a>
                                                <a href="#" onclick="$('#affiliateform').submit();
                                                            return false;" class="menuitm"><span>{$lang.savechanges}</span></a>
                                                <a class="menuitm clDropdown" id="hd1" onclick="return false;" href="#"><span class="morbtn">More actions</span></a>
                                            </div>
                                            </form>
                                            {elseif $action=='configuration'}
                                                {literal}
                                                    <script type="text/javascript">
                                                            $(function () {
                                                            $('#newshelfnav').TabbedMenu({elem:'.sectioncontent', picker:'.list-1 li:not(.direct)', aclass:'active'{/literal}{if $pickedtab}, picked:'{$pickedtab}'{/if}{literal}});
                                                                        $('#newshelfnav').TabbedMenu({elem:'.navsubmenu', picker:'.list-1 li:not(.direct)', aclass:'active'{/literal}{if $pickedtab}, picked:'{$pickedtab}'{/if}{literal}});
                                                                                    $('.toggle-box').on('click update', function () {
                                                                                var self = $(this);
                                                                                    if (self.is(':checked'))
                                                                                    self.next().prop('disabled', false)
                                                                                    else
                                                                                    self.next().prop('disabled', true)
                                                                                }).trigger('update')
                                                                                });
                                                    </script>
                                                {/literal}
                                                <form action="" method="post" id="testform">
                                                    <div class="newhorizontalnav" id="newshelfnav">
                                                        <div class="list-1">
                                                            <ul>
                                                                <li>
                                                                    <a href="#"><span>{$lang.affconfig}</span></a>
                                                                </li>
                                                                <li >
                                                                    <a href="#"><span>{$lang.commission_plans}</span></a>
                                                                </li>
                                                                <li class="direct last">
                                                                    <a href="?cmd={$cmd}&action=vouchers"><span>{$lang.affvoucher}</span></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="list-2">
                                                            <div class="navsubmenu" >
                                                                <ul>

                                                                </ul>
                                                            </div>
                                                            <div class="navsubmenu hasitems" style="display: none;">
                                                                <ul>
                                                                    <li class="list-2elem"><a href="?cmd={$cmd}&action=commision&make=add"><span>{$lang.addcommision}</span></a></li>
                                                                    <li class="list-2elem"><a class="submiter confirm" name="deletecomm" href="#"><span>{$lang.deleteselected}</span></li>      
                                                                </ul>
                                                            </div>
                                                            <div class="navsubmenu hasitems" style="display: none;">
                                                                <ul>
                                                                    <li class="list-2elem"><a href="#"></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                        <tbody class="sectioncontent cpadding">
                                                            <tr>
                                                                <td align="right" width="25%"><strong>{$lang.enableaff}:</strong></td>
                                                                <td>
                                                                    <input type="checkbox" {if $configuration.EnableAffiliates=='on'}checked="checked"{/if} value="1" name="EnableAffiliates"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">Show refered customer data in affiliate panel:</td>
                                                                <td>
                                                                    <input type="checkbox" {if $configuration.AffShowReffered=='on'}checked="checked"{/if} value="1" name="AffShowReffered"/>
                                                                </td>
                                                            </tr>

                                                            <tr> 
                                                                <td align="right">{$lang.AffBonus}:</td>
                                                                <td> <input size="3" name="AffBonus" value="{$configuration.AffBonus}" class="inp currency"/> {if $currency.code}{$currency.code}{else}{$currency.iso}{/if}

                                                                 <input type="checkbox" {if $configuration.AffAutoWithBonus}checked="checked"{/if} value="1" name="AffAutoWithBonus"/> Auto-withdraw bonus to credit.
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">{$lang.AffDelay}:</td>
                                                                <td><input size="3" name="AffDelay" value="{$configuration.AffDelay}" class="inp"/></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">{$lang.AffMinWid}: </td>
                                                                <td><input size="3" name="AffMinWid" value="{$configuration.AffMinWid}" class="inp currency"/> {if $currency.code}{$currency.code}{else}{$currency.iso}{/if}</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    Auto-widthdrawals account credit commissions over:
                                                                    <a class="vtip_description" title="Automatically create a withdrawal as account credit for affiliates that selected that method"></a>
                                                                </td>
                                                                <td>
                                                                    <input type="checkbox" {if $configuration.AffAutoPayInCredit}checked="checked"{/if} class="toggle-box"/>
                                                                    <input size="3" name="AffAutoPayInCredit" value="{$configuration.AffAutoPayInCredit}" class="inp currency"/> {if $currency.code}{$currency.code}{else}{$currency.iso}{/if}
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    Auto-add to check queue commissions over:
                                                                    <a class="vtip_description" title="Automatically creates an entry in withdrawal queue for affiliates that selected this method"></a>
                                                                </td>
                                                                <td>
                                                                    <input type="checkbox" {if $configuration.AffAutoPayByCheck}checked="checked"{/if} class="toggle-box"/>
                                                                    <input size="3" name="AffAutoPayByCheck" value="{$configuration.AffAutoPayByCheck}" class="inp currency"/> {if $currency.code}{$currency.code}{else}{$currency.iso}{/if}
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                                <td align="right">Default auto-withdrawal option
                                                                    <a class="vtip_description" title="Disabled - client would need to request for withdraw manually.<br/>
                                                                    Credit - if enabled above, auto-add credit<br/>
                                                                    Check - if enabled above, add to check queue.">
                                                                </td>
                                                                <td>
                                                                    <select name="AffAutoWithOption" class="inp">
                                                                        <option value="0" {if !$configuration.AffAutoWithOption}selected="selected"{/if}>Disabled </option>
                                                                        <option value="2" {if $configuration.AffAutoWithOption=='2'}selected="selected"{/if}>Credit </option>
                                                                        <option value="1" {if $configuration.AffAutoWithOption=='1'}selected="selected"{/if}>Check </option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    Multi-Level Affiliates
                                                                    <a class="vtip_description" title="Affiliates refereed by another affiliate establish a relation in which % amount of commission gained by sub-affiliate can be acquired by referring affiliate."></a>
                                                                </td>
                                                                <td>
                                                                    <input type="checkbox" {if $configuration.AffMultiLevel}checked="checked"{/if} class="toggle-box"/>
                                                                    Add <input size="3" name="AffMultiLevel" value="{$configuration.AffMultiLevel}" class="inp"/> % of sub-affiliate commissions to parent affiliate<br />
                                                                    <input type="checkbox"  name="AffMultiLevelCut" {if $configuration.AffMultiLevelCut=='on'}checked="checked"{/if} value="1" class="inp"/> 
                                                                    Subtract from sub-affiliate commission 
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">Promotion codes commission calculation 
                                                                    <a class="vtip_description" title="Select how commision from sale should be calculated if customer use staff-created promo code on referred order. <br>
                                                                       <b>After discount</b>: affiliate will receive commission calculated from discounted order total<br />
                                                                       <b>Before discount</b>: affiliate will receive commission calculated from order total without discount calculated">
                                                                </td>
                                                                <td>
                                                                    <select name="AffPromoCalc" class="inp">
                                                                        <option value="0" {if !$configuration.AffPromoCalc}selected="selected"{/if}> After discount </option>
                                                                        <option value="1" {if $configuration.AffPromoCalc == 1}selected="selected"{/if}> Before discount </option>
                                                                    </select> 
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">Affiliate vouchers audience <a class="vtip_description" title="Select who can use vouchers created by affiliate"></td>
                                                                <td>
                                                                    <select name="AffVAudience" class="inp">
                                                                        <option value="0" {if !$configuration.AffVAudience}selected="selected"{/if}> New clients only </option>
                                                                        <option value="1" {if $configuration.AffVAudience == 1}selected="selected"{/if}> All clients </option>
                                                                    </select> 
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">Check voucher cookie <a class="vtip_description" title="With this option enabled only clients refered from affiliate link will be able to use their voucher"></td>
                                                                <td><input type="checkbox" name="AffVCookie" value="1" {if $configuration.AffVCookie}checked="checked"{/if} /> </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">{$lang.AffLandingPage} <a class="vtip_description" title="{$lang.afflandingpage_desc}"></a></td>
                                                                <td>
                                                                    <input style="width:500px" name="AffLandingPage" value="{$configuration.AffLandingPage}" class="inp"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">{$lang.AffSignupPage}</td>
                                                                <td>
                                                                    <input style="width:500px" value="{$configuration.AffSingup}" readonly="readonly" class="inp"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ></td>
                                                                <td >
                                                                    {$lang.AffIntegration}:<br />
                                                                    <textarea style="width:500px;height:150px;" name="AffIntegration">{$configuration.AffIntegration}</textarea>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="padding:0">
                                                                    <div class="blu">
                                                                        <input type="submit" value="{$lang.savechanges}" style="font-weight:bold" name="savechanges"/>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>

                                                        <tbody class="sectioncontent" style="display:none">
                                                            <tr>
                                                                <td colspan="2">
                                                                    {if $commisions}
                                                                        <a href="?cmd={$cmd}&action={$action}" id="currentlist" style="display:none" updater="#updater"></a>
                                                                        <br />
                                                                        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike hover">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th width="20"><input type="checkbox" id="checkall"/></th>
                                                                                    <th><a href="?cmd={$cmd}&action={$action}&orderby=id|ASC" class="sortorder">ID</a></th>
                                                                                    <th><a href="?cmd={$cmd}&action={$action}&orderby=name|ASC"  class="sortorder">{$lang.Name}</a></th>
                                                                                    <th><a href="?cmd={$cmd}&action={$action}&orderby=rate|ASC"  class="sortorder">{$lang.commission}</a></th>
                                                                                    <th style="width:40%"><a href="?cmd={$cmd}&action={$action}&orderby=notes|ASC"  class="sortorder">{$lang.notes}</a></th>      
                                                                                </tr>
                                                                            </tbody>

                                                                            <tbody id="updater">
                                                                                {include file='ajax.affiliates.tpl'}
                                                                            </tbody>

                                                                            <tbody id="psummary">
                                                                                <tr>
                                                                                    <th></th>
                                                                                    <th colspan="9">
                                                                                        {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                                                                                    </th>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                        <div class="blu"></div>
                                                                    {else}
                                                                        <div class="blank_state blank_services">
                                                                            <div class="blank_info">
                                                                                <h1>{$lang.commission_plans}</h1>
                                                                                {$lang.commission_plans_blank}
                                                                                <div class="clear"></div>
                                                                                <a style="margin-top:10px" href="?cmd={$cmd}&action=commision&make=add" class="new_add new_menu">
                                                                                    <span>{$lang.addcommision}</span>
                                                                                </a>
                                                                                <div class="clear"></div>
                                                                            </div>
                                                                        </div>
                                                                    {/if}
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    {securitytoken}
                                                </form>
                                                {elseif $action=='commision'}
                                                    <form action="" method="post">
                                                        <div class="lighterblue2">
                                                            <table border="0" cellpadding="6" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="160" align="right"><strong>{$lang.Name}</strong></td>
                                                                    <td><input class="inp" name="name" value="{$commision.name}"/></td>		
                                                                </tr>
                                                                <tr>
                                                                    <td align="right"><strong>{$lang.commission} {$lang.rate}</strong></td>
                                                                    <td>
                                                                        <input class="inp" size="3" name="rate" value="{$commision.rate}"/> 
                                                                        <select class="inp" name="type">
                                                                            <option value="Percent" {if $commision.type=='Percent'}selected="selected"{/if}>{$lang.Percent}</option>
                                                                            <option value="Fixed" {if $commision.type=='Fixed'}selected="selected"{/if}>{$lang.Fixed}</option>
                                                                        </select>
                                                                    </td>		
                                                                </tr>
                                                                 <tr>
                                                                    <td align="right"><strong>{$lang.enableovercommission}:</strong></td>
                                                                    <td>
                                                                        <input type="checkbox" {if $commision.enable_overcommission > 0}checked="checked"{/if} value="1" name="enable_overcommission" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right"><strong>{$lang.enablevouchers}:</strong></td>
                                                                    <td>
                                                                        <input type="checkbox" {if $commision.enable_voucher > 0}checked="checked"{/if} value="1" name="enable_voucher" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right"><strong>{$lang.recurringaff}:</strong></td>
                                                                    <td>
                                                                        <input type="checkbox" {if $commision.recurring > 0}checked="checked"{/if} value="1" name="recurring" >
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right"><strong>{$lang.appliesto}:</strong></td>
                                                                    <td>
                                                                        <div class="left" style="text-align: center">
                                                                            {$lang.appliproduc} <br />
                                                                            <select multiple="multiple" name="applicable_products[]"  class="inp" style="width:250px;height:100px">
                                                                                {foreach from=$products item=i }
                                                                                    <option value="p{$i.id}" {if $commision.applicable_products.products[$i.id]}selected="selected"{/if}>{$i.catname}: {$i.name}</option>
                                                                                {/foreach}
                                                                                {foreach from=$addons item=i }
                                                                                    <option value="a{$i.id}" {if $commision.applicable_products.addons[$i.id]}selected="selected"{/if}>{$lang.Addon}: {$i.name}</option>
                                                                                {/foreach}
                                                                            </select>
                                                                        </div>
                                                                        <div class="left" style="padding: 0 10px; text-align: center">
                                                                            {$lang.appcycles} <br />
                                                                            <select multiple="multiple" name="applicable_cycles[]"  class="inp" style="width:250px;height:100px">
                                                                                <option value="all" {if $commision.applicable_cycles.all == 'all'}selected="selected"{/if}>{$lang.appallcyc}</option>
                                                                                <option value="Hourly" {if $commision.applicable_cycles.Hourly} selected="selected"{/if}>{$lang.Hourly}</option>
                                                                                <option value="Daily" {if $commision.applicable_cycles.Daily} selected="selected"{/if}>{$lang.Daily}</option>
                                                                                <option value="Weekly" {if $commision.applicable_cycles.Weekly} selected="selected"{/if}>{$lang.Weekly}</option>
                                                                                <option value="Monthly" {if $commision.applicable_cycles.Monthly} selected="selected"{/if}>{$lang.Monthly}</option>
                                                                                <option value="Quarterly" {if $commision.applicable_cycles.Quarterly} selected="selected"{/if}>{$lang.Quarterly}</option>
                                                                                {assign var='semi' value='Semi-Annually'}
                                                                                <option value="Semi-Annually" {if $commision.applicable_cycles[$semi]} selected="selected"{/if}>{$lang.SemiAnnually}</option>
                                                                                <option value="Annually" {if $commision.applicable_cycles.Annually} selected="selected"{/if}>{$lang.Annually}</option>
                                                                                <option value="Biennially" {if $commision.applicable_cycles.Biennially} selected="selected"{/if}>{$lang.Biennially}</option>
                                                                                <option value="Triennially" {if $commision.applicable_cycles.Triennially} selected="selected"{/if}>{$lang.Triennially}</option>
                                                                                {foreach from=$periods item=p}
                                                                                    {assign var='tld' value="tld$p"}
                                                                                    <option value="tld{$p}" {if $commision.applicable_cycles.$tld} selected="selected"{/if}>{$lang.Domains} {$p} {if $p < 2}{$lang.Year}{else}{$lang.years}{/if}</option>
                                                                                {/foreach}
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="160" align="right"><strong>{$lang.notesadmin}</strong></a></td>
                                                                    <td><textarea name="notes" style="height: 4em; width: 100%;">{if $commision.notes}{$commision.notes}{/if}</textarea></td>		
                                                                </tr> 
                                                            </table>
                                                        </div>
                                                        <div class="blu">	
                                                            <table border="0" cellpadding="2" cellspacing="0" >
                                                                <tr>
                                                                    <td><a href="?cmd={$cmd}&action=configuration&tab=commisions"><strong>&laquo; {$lang.backto} {$lang.commission_plans}</strong></a>&nbsp;</td>
                                                                    <td><input type="submit" name="save" value="{if $make=='add'}{$lang.addcommision}{else}{$lang.savechanges}{/if}" style="font-weight:bold;"/></td>                            
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        {securitytoken}
                                                    </form>
                                                    {elseif $action=='vouchers'}
                                                        <form action="" method="post" id="testform">
                                                            <div class="newhorizontalnav" id="newshelfnav">
                                                                <div class="list-1">
                                                                    <ul>
                                                                        <li>
                                                                            <a href="?cmd={$cmd}&action=configuration&tab=settings"><span>{$lang.affconfig}</span></a>
                                                                        </li>
                                                                        <li >
                                                                            <a href="?cmd={$cmd}&action=configuration&tab=commisions"><span>{$lang.commission_plans}</span></a>
                                                                        </li>
                                                                        <li class="direct active last">
                                                                            <a href="?cmd={$cmd}&action=vouchers"><span>{$lang.affvoucher}</span></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="list-2">
                                                                    <div class="navsubmenu {if $vouchers}hasitems{/if}" >
                                                                        <ul>{if $vouchers}
                                                                            <li class="list-2elem"><a class="submiter confirm" name="deletevouchers" href="#"><span>{$lang.deleteselected}</span></a></li>{/if}
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            {if $vouchers}
                                                                <div class="blu">
                                                                    <a href="?cmd={$cmd}&action={$action}" id="currentlist" style="display:none" updater="#updater"></a>
                                                                </div>
                                                                <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike hover">
                                                                    <tbody>
                                                                        <tr>
                                                                            <th width="20"><input type="checkbox" id="checkall"/></th>
                                                                            <th><a href="?cmd={$cmd}&action={$action}&orderby=code|ASC" class="sortorder">{$lang.couponcode}</a></th>
                                                                            <th><a href="?cmd={$cmd}&action={$action}&orderby=name|ASC"  class="sortorder">{$lang.affiliate}</a></th>
                                                                            <th><a href="?cmd={$cmd}&action={$action}&orderby=value|ASC"  class="sortorder">{$lang.Discount}</a></th>
                                                                            <th><a href="?cmd={$cmd}&action={$action}&orderby=usage|ASC"  class="sortorder">{$lang.Used}</a></th>   
                                                                        </tr>
                                                                    </tbody>

                                                                    <tbody id="updater">
                                                                        {include file='ajax.affiliates.tpl'}
                                                                    </tbody>

                                                                    <tbody id="psummary">
                                                                        <tr>
                                                                            <th></th>
                                                                            <th colspan="9">
                                                                                {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                                                                            </th>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <div class="blu">
                                                                    {*<input type="submit" value="{$lang.savechanges}" style="font-weight:bold" name="savechanges"/>*}
                                                                </div>
                                                            {else}
                                                                <div class="blank_state blank_services">
                                                                    <div class="blank_info">
                                                                        <h1>{$lang.affvoucher}</h1>
                                                                        {$lang.affvoucher_blank}
                                                                        <div class="clear"></div>
                                                                    </div>
                                                                </div>
                                                            {/if}
                                                            {securitytoken}
                                                        </form>
                                                        {/if}
                                                        </div>
                                                        {securitytoken}
                                                        </form>
                                                    </td>
                                                </tr>
                                            </table>