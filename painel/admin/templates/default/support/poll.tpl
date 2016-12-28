{foreach from=$tickets item=ticket}
    <tr {if $ticket.escalated == 1}class="sla_level_one"{elseif $ticket.escalated > 1}class="sla_level_two"{/if}>
        {if $tview}
            {include file="ajax.ticketviews.tpl" display=trow}
        {else}
            <td width="20"><input type="checkbox" class="check" value="{$ticket.id}" name="selected[]"/></td>
            <td>{if $ticket.client_id!='0'}<a href="?cmd=clients&action=show&id={$ticket.client_id}">{/if}{$ticket.name}{if $ticket.client_id!='0'}</a>{/if}</td>
            <td class="subjectline">
                <div class="df1">
                    <div class="df2">
                        <div class="df3">
                            <a href="?cmd=tickets&action=view{if $backredirect}&brc={$backredirect}{/if}{if $currentdept && $currentdept!='all'}&dept={$currentdept}{/if}{if $currentlist && $currentlist!='all'}&list={$currentlist}{/if}&num={$ticket.ticket_number}" class="tload2 {if $ticket.admin_read=='0'}unread{/if}" rel="{$ticket.ticket_number}">{$ticket.tsubject|wordwrap:80:"\n":true|escape}</a>
                        </div>
                    </div>
                </div>
            </td>
            <td class="tagnotes">
                {if $ticket.flags & 1}
                    <div class="right hasnotes ticketflag-note" title="Ticket with admin notes"></div>
                {/if}
                {if $ticket.flags & 2}
                    <div class="right ticketflag-bill" title="Ticket with additional support fees"></div>
                {/if}
                {if $ticket.flags & 4}
                    <div class="right ticketflag-writing" title="Another staff member started to write a response to this ticket"></div>
                {/if}
                {if $ticket.tags}
                    <div class="right inlineTags">
                        {foreach from=$ticket.tags item=tag name=tagloop}
                            {if $smarty.foreach.tagloop.index < 3} 
                                <span>{$tag.tag}</span>
                            {/if}
                        {/foreach}
                    </div>
                {/if}
            </td>
            <td><span {if $ticket.status_color && $ticket.status_color != '000000'}style="color:#{$ticket.status_color}"{/if} class="{$ticket.status}">{if $ticket.status == 'Open'}{$lang.Open}{elseif $ticket.status == 'Answered'}{$lang.Answered}{elseif $ticket.status == 'Closed'}{$lang.Closed}{elseif $ticket.status == 'Client-Reply'}{$lang.Clientreply}{elseif $ticket.status == 'In-Progress'}{$lang.Inprogress}{else}{$ticket.status}{/if} </span></td>
            <td class="subjectline">{$ticket.rpname}</td>
            <td class="border_{$ticket.priority}">{$ticket.lastreply}</td>
        {/if}
    </tr>
{/foreach}