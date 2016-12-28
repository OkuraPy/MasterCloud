{tickets}
{include file="timeago.tpl"}
<div class="board-header">
    <div class="nav-overflow">
        <ul class="nav nav-tabs" id="tickets_nav">
            <li>
                <div class="ticket-controls clearfix">
                    <div class="pull-left">
                        {if $ticket_prev}
                            <a href="{$ca_url}tickets/view/{$ticket_prev.ticket_number}/" title="Previous"><img src="{$template_dir}img/arrow-left.png" alt="arrow">&nbsp;{$lang.previous}</a>
                            {if $ticket_next}<span>|</span>{/if}
                        {/if}
                        {if $ticket_next}
                            <a href="{$ca_url}tickets/view/{$ticket_next.ticket_number}/" title="Next">{$lang.next}&nbsp;<img src="{$template_dir}img/arrow-right.png" alt="arrow"></a>
                            {/if}
                    </div>
                    <div class="pull-right">
                        <span>{$lang.status}: </span>
                        <span class="label label-{$ticket.status}">
                            {$ticket.status}
                        </span>
                    </div>
                </div>
            </li>
            <li>
                <a href="{$ca_url}tickets/new" title="Create new" class="actions"><span class="icon icon-Pencil"></span></a>
            </li>
            <li>
                <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" title="Reply" class="actions"><span class="icon icon-Goto"></span></a>
            </li>
            <li>
                <a href="{$ca_url}tickets/view/{$ticket_next.ticket_number}/&make=closeticket" title="Close" class="actions"><span class="icon icon-Delete"></span></a>
            </li>
        </ul>
    </div>                     
</div>
<div class="content-scroll">
    {foreach from=$replies_rev item=reply}
        <div class="ticket-reply {if $reply.type!='Admin'}ticket-client{else}ticket-admin{/if}">
            <div class="ticket-timeline">&nbsp;</div>
            <div class="ticket-reply-msg">
                <div class="reply-bubble">
                    <div class="reply-bubble-inner">
                        <div class="time">
                            <span class="icon icon-Time"></span>
                            <span>{$reply.date|regex_replace:"/ \d\d:\d\d:\d\d/":""|dateformat:$date_format}</span>
                            <span>{$reply.date|regex_replace:"/.* (\d\d:\d\d).*/":"\\1"} </span>
                        </div>
                        <p><strong>{$reply.name}</strong></p>
                        <p>{$reply.body|httptohref|nl2br}</p>
                    </div>
                </div>
            </div>
        </div>
    {/foreach}
    <div class="ticket-reply {if $ticket.type!='Admin'}ticket-client{else}ticket-admin{/if}">
        <div class="ticket-timeline">&nbsp;</div>
        <div class="ticket-reply-msg">
            <div class="reply-bubble">
                <div class="reply-bubble-inner">
                    <div class="time">
                        <span class="icon icon-Time"></span>
                        <span>{$ticket.date|regex_replace:"/ \d\d:\d\d:\d\d/":""|dateformat:$date_format}</span>
                        <span>{$ticket.date|regex_replace:"/.* (\d\d:\d\d).*/":"\\1"} </span>
                    </div>
                    <p><strong>{$ticket.name}</strong></p>
                    <p>{$ticket.body|httptohref|nl2br}</p>
                </div>
            </div>
        </div>
    </div>
</div>