{tickets}
<div class="ticket-controls clearfix">
    <a href="{$ca_url}tickets/view/{$ticket_next.ticket_number}/" title="Reply" class="link-circle"><i class="icon-reply"></i></a>
    <a href="{$ca_url}tickets/view/{$ticket_next.ticket_number}/&make=closeticket" title="Close" class="link-circle"><i class="icon-remove"></i></a>
    <div class="pull-right">
        {if $ticket_prev}
            <a href="{$ca_url}tickets/view/{$ticket_prev.ticket_number}/" title="Previous" class="link-circle"><i class="icon-chevron-left"></i></a>
            {/if}
            {if $ticket_next}
            <a href="{$ca_url}tickets/view/{$ticket_next.ticket_number}/" title="Next" class="link-circle"><i class="icon-chevron-right"></i></a>
            {/if}
    </div>
</div>
<br>
<div class="content-scroll">
    {foreach from=$replies_rev item=reply}
        <div class="ticket-reply {if $reply.type!='Admin'}ticket-client{else}ticket-admin{/if}">
            <div class="ticket-timeline">
                <div class="date">{$reply.date|regex_replace:"/ \d\d:\d\d:\d\d/":""|dateformat:$date_format}</div>
                <div class="time">{$reply.date|regex_replace:"/.* (\d\d:\d\d).*/":"\\1"}</div>
            </div>
            <div class="ticket-reply-msg">
                <div class="reply-bubble">
                    <p><strong>{$reply.name}</strong></p>
                    <p>{$reply.body|httptohref|nl2br}</p>
                </div>
            </div>
        </div>
    {/foreach}
    <div class="ticket-reply {if $ticket.type!='Admin'}ticket-client{else}ticket-admin{/if}">
        <div class="ticket-timeline">
            <div class="date">{$ticket.date|regex_replace:"/ \d\d:\d\d:\d\d/":""|dateformat:$date_format}</div>
            <div class="time">{$ticket.date|regex_replace:"/.* (\d\d:\d\d).*/":"\\1"}</div>
        </div>
        <div class="ticket-reply-msg">
            <div class="reply-bubble">
                <p><strong>{$ticket.name}</strong></p>
                <p>{$ticket.body|httptohref|nl2br}</p>
            </div>
        </div>
    </div>
</div>