{if $action=='default'}
    {if $tickets}
        {foreach from=$tickets item=ticket name=foo}
            <tr>
                <td>
                    <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" class="roll-link">
                        <i class="icon-circle-blank ticket-icon ticket-icon-{$ticket.status}"></i>
                        <span data-title="{$ticket.subject|escape:'html':'utf-8'}">{$ticket.subject|escape:'html':'utf-8'}</span>
                    </a>
                </td>
                <td class="bold overflow-elipsis">
                    <span class="label label-{$ticket.status}">{$lang[$ticket.status]}</span>
                </td>
                <td>{$ticket.deptname}</td>
                <td>{$ticket.date|dateformat:$date_format}</td>
                <td>
                    <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" class="icon-link"><i class="icon-single-arrow"></i></a>
                </td>
            </tr>
        {/foreach}
    {else}
        <tr>
            <td colspan="5">{$lang.nothing}</td>
        </tr>   
    {/if}
{elseif $action=='view'}
    {include file="support/ajax.viewticket.tpl"}
{elseif $action=='kbhint'}
    {if $replies}
        {foreach from=$replies item=reply}
            <li>
                <a href='{$ca_url}knowledgebase/article/{$reply.id}/' target="_blank">
                    <p title="{$lang.match} {$reply.fits|escape:'html':'utf-8'} %">{$reply.title|truncate}</p>
                    <span><i class="icon-time"></i> {$reply.date|dateformat:$date_format}</span>
                </a>
            </li>
        {/foreach}
    {else}
        <li>
            <a href='#' onclick="return false;">
                <p>{$lang.nothing}</p>
            </a>
        </li>
    {/if}
{/if}