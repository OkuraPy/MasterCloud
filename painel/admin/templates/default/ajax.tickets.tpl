{if $showlog}
    <div class="right"><strong><a href="javascript:void(0)" onclick="$('#ticket_log').hide();">{$lang.Hide}</a></strong></div>
    <div class="clear"></div>
    <table border="0" width="100%" class="tlog">
        {foreach from=$showlog item=log}
            <tr>
                <td class="light" align="right" width="140">{$log.date|dateformat:$date_format}</td>
                <td>{$log.action}</td>
            </tr>
        {/foreach}
    </table>
{/if}
{if $quote}
    {$quote}
{elseif $draftdate}
    {$lang.draftsavedat}{$draftdate|dateformat:$date_format}
{/if}
{if $action=='menubutton' && $make=='poll'}
    {include file="support/poll.tpl"}
{elseif $action=='view' && $ticket}
    {include file="support/ticket.tpl"}
{elseif $action=='new'}
    {include file="support/create.tpl"}
{elseif $action=='default'}
    {include file="support/list.tpl"}
{elseif $action=='menubutton' && $make=='getrecent'}
    {if $reply}
        <div class="ticketmsg{if $reply.type!='Admin'} ticketmain{/if}" id="reply_{$reply.id}"><input type="hidden" name="viewtime" class="viewtime" value="{$reply.viewtime}"/>
            <div class="left">
                {if $reply.type!='Admin' && $ticket.client_id}
                    <a href="?cmd=clients&action=show&id={$ticket.client_id}" target="_blank">
                    {/if}
                    <strong {if $reply.type=='Admin'}class="adminmsg"{else}class="clientmsg reply_{$reply.type}"{/if}>
                        {$reply.name}</strong> 
                        {if $reply.type!='Admin' && $ticket.client_id}
                    </a>
                {/if}
                {if $reply.type=='Admin'}
                    {$lang.staff}
                {elseif $reply.replier_id!='0'}
                    {$lang.client}
                {/if}, {$lang.wrote}
            </div>

            <div class="right">{$lang.replied} {$reply.date|dateformat:$date_format}&nbsp;&nbsp;&nbsp;</div>
            <div class="clear"></div>
            <p> {$reply.body|httptohref|nl2br} </p>
        </div>
    {/if}
{elseif $action=='menubutton' && $make=='editreply'}
    <p id="msgbody{$reply.id}">{$reply.newbody|httptohref|regex_replace:"/[^\S\n]+\n/":"<br>"|nl2br}</p>
    <div class="editbytext fs11" style="color:#555; font-style: italic">{$lang.lastedited} {$reply.editby} at {$reply.lastedit|dateformat:$date_format}</div>
{elseif $action=='menubutton' && $make=='loadnotes'}
    {if $adminnotes}
        {foreach from=$adminnotes item=entry name=adminnt}
            <tr class="admin-note {if $smarty.foreach.adminnt.index%2!=0}odd{/if}">
                <td class="first">{$entry.date|dateformat:$date_format}</td>
                {assign var='admincolor' value=$entry.color%17}
                <td>
                    <small class="right" ><a href="#{$entry.id}" class="ticketnotesremove">[{$lang.Remove}]</a></small>
                    <strong class="admincolor{$admincolor}" style="color:#{if $ucolors.$admincolor}{$ucolors.$admincolor}{else}000{/if}">{$entry.name}</strong>  
                    <div class="admin-note-body">{$entry.note|escape:'html':'UTF-8'|httptohref:'html'}</div>
                    {if !empty($entry.attachments[0])}
                        <div class="admin-note-attach">
                            {foreach from=$entry.attachments item=attachment}
                                <div class="attachment"><a href="?cmd=root&action=download&type=downloads&id={$attachment.id}">{$attachment.name}</a></div>
                                {/foreach}
                        </div>
                    {/if}
                </td>  
            </tr>
        {/foreach}
    {/if}   
{elseif $action=='getclients'}
    {foreach from=$clients item=cl}
        <option {if $cl.id == $client_id}selected="selected"{/if} value="{$cl.id}">#{$cl.id} {if $cl.companyname!=''}{$lang.Company}: {$cl.companyname}{else}{$cl.firstname} {$cl.lastname}{/if}</option>
    {/foreach}
{elseif $action=='clienttickets'}
    <div class="blu" style="text-align:right">
        <form action="?cmd=tickets&action=new" method="post">
            <input type="hidden" name="client_id" value="{$client_id}" />
            <input type="submit" value="{$lang.opennewticket}" onclick="window.location = '?cmd=tickets&action=new&client_id={$client_id}';
                        return false;"/>{securitytoken}
        </form>
    </div>
    {if $tickets}
        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike hover">
            <tbody>
                <tr>

                    <th>{$lang.datesubmitted}</th>
                    <th>{$lang.department}</th>
                    <th>{$lang.Subject}</th>

                    <th>{$lang.Status}</th>
                    <th class="lastelb">{$lang.Lastreply}</th>

                </tr>
            </tbody>
            <tbody >
                {foreach from=$tickets item=ticket}
                    <tr>
                        <td>{$ticket.date|dateformat:$date_format}</td>
                        <td>{$ticket.deptname}</td>
                        <td>
                            <a {if $ticket.admin_read=='0'}style="font-wight:bold"{/if} href="?cmd=tickets&action=view&list={$currentlist}&num={$ticket.ticket_number}" class="tload2" rel="{$ticket.ticket_number}">{$ticket.tsubject|wordwrap:80:"\n":true|escape}</a>
                        </td>
                        <td>
                            <span {if $ticket.status_color && $ticket.status_color != '000000'}style="color:#{$ticket.status_color}"{/if} class="{$ticket.status}">{if $ticket.status == 'Open'}{$lang.Open}{elseif $ticket.status == 'Answered'}{$lang.Answered}{elseif $ticket.status == 'Closed'}{$lang.Closed}{elseif $ticket.status == 'Client-Reply'}{$lang.Clientreply}{elseif $ticket.status == 'In-Progress'}{$lang.Inprogress}{else}{$ticket.status}{/if}</span>
                        </td>
                        <td class="border_{$ticket.priority}">{$ticket.lastreply}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        {if $totalpages}
            <center class="blu">
                <strong>{$lang.Page} </strong>
                {section name=foo loop=$totalpages}
                    {if $smarty.section.foo.iteration-1==$currentpage}
                        <strong>{$smarty.section.foo.iteration}</strong>
                    {else}
                        <a href='?cmd=tickets&action=clienttickets&id={$client_id}&page={$smarty.section.foo.iteration-1}' class="npaginer">{$smarty.section.foo.iteration}</a>
                    {/if}
                {/section}
            </center>
            <script type="text/javascript">
                {literal}
                    $('a.npaginer').click(function () {
                        ajax_update($(this).attr('href'), {}, 'div.slide:visible');
                        return false;
                    });
                {/literal}
            </script>
        {/if}
    {else}
        <strong>{$lang.nothingtodisplay}</strong>
    {/if}
{elseif $action=='getadvanced'}
    <div class="filter-actions">
        {if $tview}
            <a href="?cmd={$cmd}&tview={$tview.id}&resetfilter=1" {if $currentfilter}style="display:inline"{/if} class="freseter">{$lang.filterisactive}</a>
        {else}
            <a href="?cmd=ticketviews&action=fromfilter"  {if $currentfilter}style="display:inline"{/if} ><b>Create View</b></a>
            <a href="?cmd=tickets&resetfilter=1"  {if $currentfilter}style="display:inline"{/if}  class="freseter">{$lang.filterisactive}</a>
        {/if}
    </div>
    <form class="searchform filterform" action="?cmd=tickets" method="post" onsubmit="return filter(this)">
        <table width="100%" cellspacing="2" cellpadding="3" border="0" class="">
            <tbody>
                <tr>
                    <td width="15%">{$lang.Searchin}</td>
                    <td><select name="filter[status]">
                            <option value="">{$lang.Anystatus}</option>
                            {foreach from=$statuses item=st}
                                <option {if $currentfilter.status==$st}selected="selected"{/if} value="{$st}">{if $lang.$st}{$lang.$st}{else}{$st}{/if}</option>
                            {/foreach}
                        </select>
                    </td>
                    <td width="15%">{$lang.submitername}</td>
                    <td><input type="text" value="{$currentfilter.name}" size="40" name="filter[name]"/></td>
                </tr>
                <tr>
                    <td>{$lang.department}</td>
                    <td>
                        <select name="filter[dept_id]">
                            <option value="">{$lang.Anydepartment}</option>
                            {foreach from=$departments item=dept}
                                <option value="{$dept.id}"  {if $currentfilter.dept_id==$dept.id}selected="selected"{/if}>{$dept.name}</option>
                            {/foreach}
                        </select></td>
                    <td>{$lang.ticketnum}</td>
                    <td><input maxlength="6" size="10" name="filter[ticket_number]"/></td>
                </tr>
                <tr>
                    <td>{$lang.Message}</td>
                    {assign value='body|rp_body' var=rpbody}
                    <td><input type="text" value="{$currentfilter.$body}" size="40" name="filter[body]" /></td>
                    <td>{$lang.email}</td>
                    <td><input type="text" value="{$currentfilter.email}" size="40" name="filter[email]"/></td>
                </tr>
                <tr>
                    <td>{$lang.tags}</td>
                    <td >
                        <input type="text" value="{$currentfilter.tag|escape}" size="40" name="filter[tag]" style="width:200px;" /> 
                        <a href="#" id="tagdescr" class="vtip_description" title="You can use &quot;and&quot;, &quot;or&quot;, &quot;not&quot; keywords when filtering with tags, default is &quot;and&quot;, example: <br> &bullet;&nbsp;tag1 tag2 or tag3 &raquo; (tag1 and tag2) or tag3"></a>
                        <script type="text/javascript">$("#tagdescr").vTip();</script>
                        {*}<select name="filter[_tag]"  style="width:56px;">
                        <option {if $currentfilter._tag=='any'}selected="selected"{/if} value="any">Any</option>
                        <option {if $currentfilter._tag=='all'}selected="selected"{/if} value="all">All</option>
                        </select>{*}
                    </td>
                    <td>Unread only</td>
                    <td ><input type="checkbox" name="filter[admin_read]" {if $currentfilter.body=="0"}checked="checked"{/if} value="0" /></td>

                </tr>
                <tr>
                    <td>Assigned to</td>
                    <td >
                        <select name="filter[owner_id]" >
                            <option value=""> - </option>
                            {foreach from=$staff_members item=stfmbr}
                                <option value="{$stfmbr.id}" {if $currentfilter.body==$stfmbr.id}selected="selected"{/if}>
                                    {$stfmbr.firstname} {$stfmbr.lastname}
                                </option>
                            {/foreach}
                        </select>
                    </td>
                    <td></td>
                    <td ></td>
                </tr>
                <tr><td colspan="4"><center><input type="submit" value="{$lang.Search}" />&nbsp;&nbsp;&nbsp;<input type="submit" value="{$lang.Cancel}" onclick="$('#hider2').show();
                        $('#hider').hide();
                        return false;"/></center></td></tr>
            </tbody>
        </table>
        {securitytoken}
    </form>

    <script type="text/javascript">bindFreseter();</script>
{/if}
