{if $logs}
    {foreach from=$logs item=log}
        <tr>
            <td>{$log.description}</td>
            <td>{$log.queue}</td>
            <td>{$log.added|dateformat:$date_format}</td>
            <td>{$log.changed|dateformat:$date_format}</td>
            <td>{$statuses[$log.status]}</td>
        </tr>
    {/foreach}
{else}
    <tr><td colspan="5"><p align="center" >{$lang.nothingtodisplay}</p></td></tr>

{/if}