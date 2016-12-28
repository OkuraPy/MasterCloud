{if $logs}
    {foreach from=$logs item=log name=foo}
        <tr>
            <td>{$log.date|dateformat:$date_format}</td>
            <td>{$log.description}</td>
            <td><span class="label label-{if $log.result}success{else}danger{/if}">{if $log.result}{$lang.success}{else}{$lang.fail}{/if}</span></td>
            <td>
                {if $log.type == 'account'}
                    <a href="?cmd=clientarea&action=services&service={$log.id}" target="_blank"  class="roll-link">
                        <span data-title="ID {$log.id}">ID {$log.id}</span>
                    </a>
                {elseif $log.type=='domain'}
                    <a href="?cmd=clientarea&action=domains&id={$log.id}" target="_blank"  class="roll-link">
                        <span data-title="ID {$log.id}">ID {$log.id}</span>
                    </a>
                {else}
                    <a href="#" target="_blank" onclick="return false;" class="roll-link">
                        <span data-title=""></span>
                    </a>
                {/if}
            </td>
        </tr>
        {foreachelse}
    <tr><td colspan="3">{$lang.nothing}</td></tr>
    {/foreach}
{/if}