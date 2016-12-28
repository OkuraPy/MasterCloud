{tickets}
{include file="timeago.tpl"}
<div class="board-header">
    <div class="pull-right">
        <a class="btn btn-y-success" href="{$ca_url}tickets/new/">{$lang.createnew}</a>
    </div>
    <div class="ticket-controls clearfix">
        <span class="label label-{$ticket.status} label-white">
            {$lang[$ticket.status]}
        </span>
        <span class="date">
            <i class="icon-time icon-large"></i>
            {$lticket.date|dateformat:$date_format}
        </span>
        <div class="pull-right">
            <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" title="{$lang.submitreply}" class="link-circle">
                <i class="icon-reply"></i>
            </a>
            <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/&make=closeticket" title="{$lang.close}" class="link-circle">
                <i class="icon-remove "></i>
            </a>
        </div>
    </div>
</div>
<div class="content-scroll">
    {foreach from=$replies_rev item=reply}
        <div class="ticket-reply {if $reply.type!='Admin'}ticket-client{else}ticket-admin{/if}">
            <div class="ticket-timeline">&nbsp;</div>
            <div class="ticket-reply-msg">
                <div class="reply-bubble">
                    <div class="reply-bubble-inner">
                        <p><strong>{$reply.name}</strong></p>
                        <p>{$reply.body|httptohref|nl2br}</p>
                        <small class="date-time" title="{$ticket.date}">
                            {$ticket.date|dateformat:$date_format}
                        </small>
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
                    <p><strong>{$ticket.name}</strong></p>
                    <p>{$ticket.body|httptohref|nl2br}</p>
                    <small class="date-time" title="{$ticket.date}">
                        {$ticket.date|dateformat:$date_format}
                    </small>
                </div>
            </div>
        </div>
    </div>
</div>