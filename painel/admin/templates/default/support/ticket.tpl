<input type="hidden" id="ticket_number" name="ticket_number" value="{$ticket.ticket_number}" />
<input type="hidden" id="ticket_id" name="ticket_id" value="{$ticket.id}" />
<div class="blu">
    <div class="menubar">
        {include file="support/ticket_actions.tpl"}
    </div>
</div>
<div id="ticket_log"></div>
<div class="lighterblue" id="ticket_editdetails" style="display:none">
    <form action="?cmd={$cmd}&action={$action}&num={$ticket.ticket_number}" method="post" id="ticket_editform"></form>
</div>
<div id="ticketbody">
    <h1 {if $ticket.priority=='1'}class="prior_Medium"{elseif $ticket.priority=='2'}class="prior_High"{/if}>#{$ticket.ticket_number} - {$ticket.subject|wordwrap:100:"\n":true|escape}
        <span {if $ticket.status_color && $ticket.status_color != '000000'}style="color:#{$ticket.status_color}"{/if} class="{$ticket.status}" id="ticket_status">{if $ticket.status == 'Open'}{$lang.Open}{elseif $ticket.status == 'Answered'}{$lang.Answered}{elseif $ticket.status == 'Closed'}{$lang.Closed}{elseif $ticket.status == 'Client-Reply'}{$lang.Clientreply}{elseif $ticket.status == 'In-Progress'}{$lang.Inprogress}{else}{$ticket.status}{/if}</span>
    </h1>
    {literal}
        <script type="text/javascript">
            $(function () {

                ticket.bindTagsActions('#tagsCont', 10,
                    function (tag) {
                        $.post('?cmd=tickets&action=addtag', {tag: tag, id: $('#ticket_number').val()}, function (data) {
                            ticket.updateTags(data.tags)
                        });
                    },
                    function (tag) {
                        $.post('?cmd=tickets&action=removetag', {tag: tag, id: $('#ticket_number').val()}, function (data) {
                            if (typeof data != 'undefined' && typeof data.reloadwhole != 'undefined' && data.reloadwhole == true) {
                                ajax_update('?cmd=tickets&action=view&list=all&num=' + $('#ticket_number').val(), {}, '#bodycont');
                            } else if (typeof data != 'undefined') {
                                ticket.updateTags(data.tags);
                                if (data.tickettags !== undefined) {
                                    insertTags(data.tickettags);
                                }
                            }
                        });
                    });

                $(document).off('click', '#tagsCont span a:first-child').on('click', '#tagsCont span a:first-child', function () {
                    window.open('?cmd=tickets&filter[tag]=' + $(this).text());
                });
            });

        </script>
    {/literal}
    <div id="tagsCont">
        {foreach from=$tags item=tag}
            <span class="tag"> <a{if $specialtags.$tag} class="{$specialtags.$tag}"{/if} >{$tag}</a> |<a class="cls">x</a></span>
        {/foreach}
        <label style="position:relative" for="tagsin">
            <em style="position:absolute">{$lang.tags}</em>
            <input id="tagsin">
            <ul></ul>
        </label>
        <div class="clear"></div>
    </div>

    {if $ticket.client_id!='0'}
        <div id="client_nav">
            <!--navigation-->
            <a class="nav_el nav_sel left" href="#">{$lang.ticketmessage}</a>
            {include file="_common/quicklists.tpl"}
            <div class="clear"></div>
        </div>
    {else}
        <div id="client_nav">
            <!--navigation-->
            <a class="nav_el nav_sel left" href="#">{$lang.ticketmessage}</a>
            <div>
                <span class="left" style="padding-top:5px;padding-left:5px;">
                    <form action="?cmd=newclient" method="post" target="_blank">
                        <a href="#" onclick="$(this).parent().submit();
                                return false;">Register as new client</a>
                        <input type="hidden" name="email" value="{$ticket.email}" />
                        <input type="hidden" name="firstname" value="{$ticket.name|regex_replace:"/^([^ ]+)\s.+$/":'$1'|escape}" />
                        <input type="hidden" name="lastname" value="{$ticket.name|regex_replace:"/^[^ ]+\s?/":'$1'|escape}" />
                        <input type="hidden" name="ticket_id" value="{$ticket.id}" />
                    </form>
                </span>
            </div>
            <div class="clear"></div>
        </div>
    {/if}
    <div class="ticketmsg {if $ticket.type!='Admin'}ticketmain{/if}"  id="client_tab">
        <div class="slide" style="display:block">
            <div class="left">
                {if $ticket.client_id!='0'  && $ticket.type!='Admin'}
                    <a href="?cmd=clients&action=show&id={$ticket.client_id}" target="_blank">
                    {/if}
                    <strong {if $ticket.type=='Admin'}class="adminmsg"{else}class="clientmsg reply_{$ticket.type}"{/if}>{$ticket.name}</strong>
                    {if $ticket.client_id!='0'  && $ticket.type!='Admin'}
                    </a>
                {/if}
                {if $ticket.client_id!='0' && $ticket.type=='Client'}{$lang.client}
                {elseif $ticket.type=='Admin'}{$lang.staff}
                {/if}, {$lang.wrote}
                {if $ticket.type!='Admin' && $ticket.email}
                    <div style="color: rgb(153, 153, 153); font-size: 11px; width: 200px; line-height: 12px;">{$ticket.email}</div>
                {/if}
            </div>

            <div class="tdetails auto-height" style="float: right; border-left: 1px solid #bbb; background: #f7f7f7; padding: 5px; margin: -5px -5px -5px 15px; width: 230px;">
                {if !$forbidAccess.editTicket}
                    <a href="#" class="editTicket fs11 right" onclick="$(this).toggle().next().toggle()">Edit details</a>
                    <a href="#" class="editTicket editbtn none right" onclick="$(this).toggle().prev().toggle()">Save details</a>
                {/if}
                <table border="0" width="100%">
                    <tr>
                        <td align="right" class="light" style="min-width: 90px">{$lang.department}:</td>
                        <td align="left">
                            <strong>{$ticket.deptname}</strong>
                            <select class="inp" name="deptid" style="display: none; width: 221px">
                                {foreach from=$departments item=dept}
                                    <option value="{$dept.id}" {if $ticket.dept_id==$dept.id}selected="selected"{/if}>{$dept.name}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="light">{$lang.submitter}</td>
                        <td align="left">
                            <span>{$ticket.name|escape}</span>
                            <input name="name" value="{$ticket.name|escape}" style="display: none; width: 250px" class="inp"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="light">{$lang.asignedclient}</td>
                        <td align="left">
                            <span>
                                {if $ticket.client_id}#{$ticket.client_id} {$client.firstname} {$client.lastname}
                                {else}{$lang.notreg}
                                {/if}
                            </span>
                            <div style="display: none;">
                                <select class="inp" style="width: 255px;" name="owner_id"  load="clients" default="{$ticket.client_id}">
                                    <option value="0">{$lang.notreg}</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    {if !$ticket.share || $ticket.share=='master'}
                        <tr>
                            <td align="right"  class="light">{$lang.emaill|capitalize}</td>
                            <td align="left">
                                <div class="fold-text"><a href="mailto:{$ticket.email}">{$ticket.email}</a></div>
                                <input name="email" value="{$ticket.email}" style="display: none; width: 250px" class="inp"/>
                            </td>
                        </tr>
                    {else}
                        <tr>
                            <td align="right"  class="light">{$lang.author_uuid}</td>
                            <td align="left">
                                <div class="fold-text">{$ticket.email}</div>
                                <input name="email" value="{$ticket.email}" style="display: none; width: 250px" class="inp"/>
                            </td>
                        </tr>
                    {/if}
                    <tr style="display:none" class="sh_row force">
                        <td align="right" class="light">{$lang.subject|capitalize}</td>
                        <td align="left">
                            <div class="fold-text">{$ticket.subject|escape}</div>
                            <input name="subject" value="{$ticket.subject|escape}"  style="display: none; width: 250px" class="inp"/>
                        </td>
                    </tr>
                    <tr {if !$ticket.cc}style="display:none"{/if} class="sh_row">
                        <td align="right" class="light">CC</td>
                        <td align="left">
                            <div class="fold-text">{if $ticket.cc}{$ticket.cc}{else}{$lang.none}{/if}</div>
                            <input name="cc" value="{$ticket.cc}"  style="display: none; width: 250px" class="inp"/>
                        </td>
                    </tr>
                    <tr {if !$ticket.owner_id}style="display:none"{/if} class="sh_row">
                        <td align="right" class="light">Assigned to</td>
                        <td align="left">
                            <span>
                                {if $ticket.owner_id}
                                    {foreach from=$staff_members item=stfmbr}
                                        {if $stfmbr.id==$ticket.owner_id}
                                            {$stfmbr.firstname} {$stfmbr.lastname}{break}
                                        {/if}
                                    {/foreach}
                                {else}
                                    {$lang.none}
                                {/if}
                            </span>
                            <select name="owner" class="inp" style="display: none ; width: 221px">
                                <option value="0">{$lang.none}</option>
                                {foreach from=$staff_members item=stfmbr}
                                    <option {if $stfmbr.id==$ticket.owner_id}selected="selected"{/if} value="{$stfmbr.id}">{$stfmbr.firstname} {$stfmbr.lastname}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="light">{$lang.IPaddress}</td>
                        <td align="left">
                            {if $ticket.senderip}{$ticket.senderip}
                            {else}{$lang.none}
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <td align="right"  class="light">{$lang.lastreply|capitalize}</td>
                        <td align="left">
                            {$ticket.lastreply|dateformat:$date_format}
                        </td>
                    </tr>
                </table>
            </div>
            <script type="text/javascript">{literal}$(function () {
                    if ($('.auto-height').height() < $('#client_tab').height())
                        $('.auto-height').css('min-height', $('#client_tab').height() + 'px');
                });
                $('.fold-text').click(function () {
                    $(this).toggleClass('show')
                }){/literal}</script>
            <div class="right">
                <strong><a href="#reply" class="scroller">{$lang.Reply}</a></strong>
            </div>
            {if !$forbidAccess.editTicket || (!$forbidAccess.editOwnMesg && $admindata.id == $ticket.creator_id)}
                <div class="right">
                    <a href="#" class="editor">{$lang.Edit}</a>&nbsp;&nbsp;&nbsp;
                </div>
            {/if}
            <div class="right">
                <a href="{$ticket.id}" class="quoter">{$lang.Quote}</a>&nbsp;&nbsp;&nbsp;
            </div>
            <div class="right" style="margin:0px 5px;">
                <a href="#" class="quoter2">{$lang.Quoteselected}</a>
            </div>
            <div class="right">
                {$lang.opened} {$ticket.date|dateformat:$date_format}

                {if $ticket.type == 'Client'} using client area, logged in
                {elseif $ticket.type == 'Unregistered'} from client area, not logged in
                {elseif $ticket.type != 'Admin'} via Email
                {/if}
                &nbsp;&nbsp;&nbsp;
            </div>
            <div style="clear:left"></div>
            <p id="msgbody"> {$ticket.body|httptohref|regex_replace:"/^\S\n]+\n/":"<br>"|nl2br} </p>
            {if $ticket.editby != ''}<div class="editbytext fs11" style="color:#555; font-style: italic">{$lang.lastedited} {$ticket.editby} at {$ticket.lastedit|dateformat:$date_format}</div>{/if}
            <div id="editbody{$reply.id}" style="overflow:hidden; display:none; margin: 9px 0 0">
                <textarea style="width:100%"></textarea>
                <div style="padding:5px 0">
                    <a href="{$reply.id}" class="menuitm editorsubmit"><span>{$lang.savechanges}</span></a> {$lang.Or} 
                    <a onclick="$('#msgbody{$reply.id}').show().siblings('.editbytext:first').show();
                                $('#editbody{$reply.id}').hide();
                                return false" href="#" class="menuitm"><span>{$lang.Cancel}</span></a>
                </div>
            </div>
            {if !empty($attachments[0])}
                <hr />
                {foreach from=$attachments[0] item=attachment}
                    <div class="attachment"><a href="?action=download&id={$attachment.id}">{$attachment.org_filename}</a></div>
                    {/foreach}

            {/if}
            <div style="clear:both"></div>
        </div>
        {include file="_common/quicklists.tpl" _placeholder=true}
    </div>
    {if $replies && !empty($replies) }

        {foreach from=$replies item=reply}

            {if $reply.status!='Draft'}
                <div class="ticketmsg{if $reply.type!='Admin'} ticketmain{/if}" id="reply_{$reply.id}">
                    <div class="left">
                        {if $reply.type!='Admin' && $reply.replier_id}
                            <a href="?cmd=clients&action=show&id={$reply.replier_id}" target="_blank">
                            {/if}
                            <strong {if $reply.type=='Admin'}class="adminmsg"{else}class="clientmsg"{/if}>
                                {$reply.name}
                            </strong> 
                            {if $reply.type!='Admin' && $reply.replier_id}
                            </a>
                        {/if}
                        {if $reply.type=='Admin'}{$lang.staff}
                        {elseif $reply.replier_id!='0'}{$lang.client}
                        {/if}, {$lang.wrote}
                        {if $reply.type!='Admin' && $reply.email}
                            <div style="color: rgb(153, 153, 153); font-size: 11px; width: 200px; line-height: 12px;">{$reply.email}</div>
                        {/if}
                    </div>
                    
                    {if !$forbidAccess.editTicket || (!$forbidAccess.editOwnMesg && $reply.type=='Admin' && $admindata.id == $reply.replier_id)}
                        <div class="right replybtn">
                            <strong>
                                <a href="{$reply.id}" class="deletereply">{$lang.Delete}</a> 
                                <a href="{$reply.id}" class="deletereply"><img src="{$template_dir}img/trash.gif" alt="{$lang.Delete}"/></a>
                            </strong>
                        </div>
                        <div class="right"><a href="{$reply.id}" class="editor" type="reply">{$lang.Edit}</a></div>
                    {/if}
                    <div class="right"><a href="{$reply.id}" class="quoter" type="reply">{$lang.Quote}</a>&nbsp;&nbsp;&nbsp;</div>
                    <div class="right" style="margin:0px 5px;"><a href="#" class="quoter2">{$lang.Quoteselected}</a></div>
                    <div class="right">
                        {$lang.replied} {$reply.date|dateformat:$date_format} <span style="color:#555">id: {$reply.id}</span>
                        <span style="display: none;">
                            {if $reply.type == 'Client'} using client area, logged in
                            {elseif $reply.type == 'Unregistered'} from client area, not logged in
                            {elseif $reply.type != 'Admin'} via Email
                            {/if}
                        </span>
                        &nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="clear"></div>
                    <p id="msgbody{$reply.id}"> {$reply.body|httptohref|regex_replace:"/[^\S\n]+\n/":"<br>"|nl2br}</p>
                    {if $reply.editby != ''}<div class="editbytext fs11" style="color:#555; font-style: italic">{$lang.lastedited} {$reply.editby} at {$reply.lastedit|dateformat:$date_format}</div>
                    {/if}
                    <div id="editbody{$reply.id}" style="overflow:hidden; display:none; margin: 9px 0 0">
                        <textarea style="width:100%"></textarea>
                        <div style="padding:5px 0">
                            <a href="{$reply.id}" class="menuitm editorsubmit"><span>{$lang.savechanges}</span></a> {$lang.Or} 
                            <a onclick="$('#msgbody{$reply.id}').show().siblings('.editbytext').show();
                                    $('#editbody{$reply.id}').hide();
                                    return false" href="#" class="menuitm"><span>{$lang.Cancel}</span></a>
                        </div>
                    </div>
                    {if !empty($attachments[$reply.id])}
                        <hr />
                        {foreach from=$attachments[$reply.id] item=attachment}
                            <div class="attachment"><a href="?action=download&id={$attachment.id}">{$attachment.org_filename}</a>
                            </div>
                        {/foreach}
                    {/if} 
                </div>
            {/if}
        {/foreach}
    {/if}

    <div id="recentreplies"></div>
    <div style="{if !($ticket.flags & 1)}display:none;{/if}" id="ticketnotebox" >
        <div class="hr-info">
            <span>
                Notes <a title="Notes are only visible to Administrators and Staff Members assigned to this department. Clients do not see what you write here." class="vtip_description" style="padding-left:16px">&nbsp;</a>
            </span>
        </div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" >
            <tbody id="ticketnotes">

                <tr class="odd">
                    <td></td>
                    <td> Loading... <img src="{$template_dir}img/ajax-loading2.gif"> </td>
                </tr>

            </tbody>
            <tbody>
                <tr class="odd">
                    <td style="vertical-align: baseline; white-space: nowrap; padding: 5px">
                        <script src="{$template_dir}js/fileupload/init.fileupload.js?v={$hb_version}"></script>
                        <strong style="">{if $admindata.lastname!='' && $admindata.firstname!=''}{$admindata.firstname} {$admindata.lastname}{else}{$admindata.username}{/if}</strong>
                    </td>
                    <td width="100%">
                        <div class="admin-note-new">
                            <div class="admin-note-input">
                                <textarea rows="4" id="ticketnotesarea" name="notes" class="notes_field notes_changed"></textarea>
                                <div class="admin-note-attach"></div>
                            </div>
                            <div id="notes_submit" class="notes_submit admin-note-submit">
                                <input value="{$lang.LeaveNotes}" type="button" id="ticketnotessave">
                            </div>
                            <a href="#" class="editbtn" id="ticketnotesfile">Attach file</a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    {if $enableFeatures.supportext}
        <div style="{if !($ticket.flags & 2)}display:none;{/if}" id="ticketbils" >
            <div class="hr-info">
                <span>
                    Time Tracking & Bills <a title="You can add bills for support service here. New items are added as drafts - staff members with billing privilages can generate invoices from them." class="vtip_description" style="padding-left:16px">&nbsp;</a>
                </span>
            </div>
            <div class="ticket-msgbox">
                Loading... <img src="{$template_dir}img/ajax-loading2.gif">
                {if $ticket.flags & 2}<script type="text/javascript">{literal}$(function () {
                                    ticket.getBilling();
                                }){/literal}</script>{/if}
                    </div>
                </div>
                {/if}
                </div>

                <table border="0" cellpadding="0" cellspacing="0" width="100%" id="replytable" {if $ticket.status=='Closed'}style="display:none"{/if}>
                    <tr>
                        <td valign="top" style="background:#E0ECFF" >
                            <div class="gbar">
                                <a href="#reply" name="reply" class="active bgo" onclick="return false;"><strong>{$lang.Reply}</strong></a>
                                <a href="#reply" name="notes" class="badd"  onclick="$(this).hide();
                        $('#ticketnotebox').slideDown('fast');
                        $('#ticketnotesarea').focus();
                        return false;" style="{if $ticket.flags & 1}display:none;{/if}">{$lang.LeaveNotes}</a>
                                {if $enableFeatures.supportext}
                                    <a href="#reply" name="notes" class="badd"  onclick="$(this).hide();
                            ticket.getBilling();
                            $('#ticketbils').slideDown('fast');
                            return false;" style="{if $ticket.flags & 2}display:none;{/if}">Time Tracking & Bills</a>
                                {/if}
                                <div class="clear"></div>
                            </div>
                            <div class="blu" >
                                <div id="alreadyreply">
                                    {foreach from=$replies item=reply}
                                        {if $reply.status=='Draft' && $reply.replier_id!=$admindata.id}
                                            <span class="numinfos adminr_{$reply.replier_id}">
                                                <strong>{$reply.name}</strong> 
                                                {$lang.startedreplyat} {$reply.date|dateformat:$date_format} 
                                                <a href="#" onclick="ticket.loadReply('{$reply.id}');
                                        return false">{$lang.preview}</a>
                                            </span>
                                        {/if}
                                    {/foreach}
                                </div>

                                <div class="imp_msg" id="justadded" style="display:none">
                                    {$lang.newreplyjust}  &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="#" rel="{$ticket.viewtime}" id="showlatestreply"><strong>{$lang.updateticket}</strong></a>&nbsp;&nbsp;
                                    <a href="#" onclick="$('#justadded').hide();
                            return false;">{$lang.Hide}</a>
                                </div>

                                <form action="?cmd=tickets&action=view&num={$ticket.ticket_number}&list={$currentlist}" method="post" enctype="multipart/form-data" >
                                    <input type="hidden" name="make" value="addreply" />
                                    <div id="previewinfo" style="display:none">
                                        <span class="right"><a href="#" onclick="$('#previewinfo').hide();
                                return false">{$lang.hide}</a></span>
                                        <span class="left"></span><span class="clear"></span>
                                    </div>
                                    <textarea style="width:99%" rows="14" id="replyarea" name="body">{*}
                                        {*}{foreach from=$replies item=reply}{*}
                                        {*}{if $reply.status=='Draft' && $reply.replier_id==$admindata.id}{$reply.body}{*}
                                        {*}{/if}{*}
                                        {*}{/foreach}{*}
                                        {*}</textarea>
                                    <div id="draftinfo">
                                        <span class="draftdate" {foreach from=$replies item=reply}{if $reply.status=='Draft' && $reply.replier_id==$admindata.id}style="display:inline"{/if}{/foreach}>
                                            {foreach from=$replies item=reply}
                                                {if $reply.status=='Draft' && $reply.replier_id==$admindata.id}{$lang.draftsavedat}{$reply.date|dateformat:$date_format}
                                                {/if}
                                            {/foreach}
                                        </span> 
                                        <span class="controls" {foreach from=$replies item=reply}{if $reply.status=='Draft' && $reply.replier_id==$admindata.id}style="display:inline"{/if}{/foreach}>
                                            <a href="#" onclick="return ticket.savedraft()">{$lang.savedraft|capitalize}</a> 
                                            <a href="#" onclick="return ticket.removedraft()">{$lang.removedraft|capitalize}</a></span>
                                    </div>
                                    <a  class="attach" href="#" >{$lang.addattachment}</a> &nbsp;&nbsp;({$lang.allowedextensions} {$extensions})<br />
                                    <div id="attachments"> </div>
                                    <br />



                                    <table border="0" cellspacing="0" cellpadding="3" width="100%">
                                        <tr><td width="300">


                                                <table border="0" cellspacing="0" cellpadding="3">
                                                    <tr>
                                                        <td><strong>{$lang.Setstatus}: </strong></td>
                                                        <td>
                                                            <select name="status_change" class="inp" >
                                                                {foreach from=$statuses item=status}
                                                                    <option value="{$status}" {if $status=='Answered'}selected="selected"{/if}>{$lang.$status}</option>
                                                                {/foreach}
                                                            </select> 
                                                            <strong>&amp;</strong>
                                                            <button name="justsend" value="{$lang.Send}" style="font-weight: bold;width: 94px;padding: 10px 20px;font-size: 12px;" id="ticketsubmitter" class=" new_control greenbtn">{$lang.Send}</button>
                                                        </td>
                                                    </tr>
                                                    
                                                    {if !$forbidAccess.manageMacros}
                                                    <tr>
                                                        <td style="text-align: right"><input type="checkbox" name="send_save" onclick="$('label[for=\'replyaddid\']').next().toggle();" id="replyaddid"/> </td>
                                                        <td colspan="2">
                                                            <label style="float: left; min-width: 180px;line-height: 23px;" for="replyaddid">{$lang.asmacro}</label>
                                                            <label style="display: none"><input class="inp" type="text" name="send_save_name" value=""/></label>
                                                        </td>
                                                    </tr>
                                                    {/if}
                                                    <tr>
                                                        <td style="text-align: right"><input type="checkbox" name="send_save2" onclick="$('label[for=\'addasarticle\']').next().toggle();" id="addasarticle"/> </td>
                                                        <td colspan="2">
                                                            <label style="float: left; min-width: 180px;line-height: 23px;" for="addasarticle">{$lang.askbarticle}</label>
                                                            <label style="display: none"><input class="inp" type="text" name="send_save_name2" value=""/></label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td id="ticketwidgetarea" valign="top" style="padding:10px;background:#f5f9ff">
                                                {foreach from=$ticketwidgets item=ticketwidget}
                                                    <a  class="new_control" href="?cmd={$ticketwidget.module}&ticket_id={$ticket.id}" 
                                                        style="margin:10px 10px 10px 0px;"><span>{$ticketwidget.modname}</span></a>
                                                        {/foreach}
                                            </td>
                                        </tr>

                                    </table>


                                    <input type="hidden" id="backredirect" name="brc" value="{$backredirect}" />
                                    {securitytoken}
                                </form>
                            </div>
                        </td>
                        <td valign="top" class="blu" style="padding: 0; width: 10px;">
                            <div style="height: 25px; width: 100%; background: rgb(247, 247, 247);"></div>
                            <div class="blu" style="width:237px;" id="ticketwidget">
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="blu"> 
                    <div class="menubar">
                        {include file="support/ticket_actions.tpl" bottom=true}
                    </div>
                </div>
                {if $ajax}
                    <script type="text/javascript">bindEvents();
        bindTicketEvents();</script>
                {/if}