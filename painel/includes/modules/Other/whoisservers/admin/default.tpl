
<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="{if $action == 'default'}active{/if}">
                <a {if $action != 'default'} href="?cmd={$modulename}"{/if}><span>Servers</span></a>
            </li>
            <li class="{if $action == 'add'}active{/if} last">
                <a {if $action != 'add'}href="?cmd={$modulename}&action=add"{/if}><span>New server</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2">
        <div class="subm1" style="display: block; height: 20px;">
        </div>
    </div>
</div>
<div >
    <table class="whitetable" width="100%" cellspacing=0>
        <tr>
            <th style="width: 160px">TLD</th>
            <th>Host</th>
            <th></th>
            <th style="width: 160px"></th>
        </tr>
        {foreach from=$list item=server}
            <tr class="havecontrols">
                <td style="padding-left: 10px">
                    <a href="?cmd={$modulename}&action=edit&id={$server.tld|upper}" >.{$server.tld|upper}</a>
                </td>
                <td>
                    {$server.server}
                </td>
                <td><a href="http://www.iana.org/domains/root/db/{$server.tld}.html" >IANA .{$server.tld|upper}</a></td>
                <td>
                    <a title="Delete" class="delbtn" href="?cmd={$modulename}&action=delete&id={$entry.id}&security_token={$security_token}" 
                       onclick="return confirm('Are you sure you want to remove this entry?');">
                    </a>
                </td>
            </tr>
        {/foreach}
    </table>
</div>
