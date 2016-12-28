<ul class="dropdown-menu">
    <li>
        <a{if $cmd=="tickets" && $action=="new"} class="active"{/if}  href="{$ca_url}tickets/new/">{$lang.openticket}</a>
    </li>
    <li>
        <a{if $cmd=="tickets" && $action == 'default'} class="active"{/if}  href="{$ca_url}tickets/">{$lang.ticketarchive}</a>
    </li>
{if $enableFeatures.kb!='off'}
    <li>
        <a{if $cmd=="knowledgebase"} class="active"{/if}  href="{$ca_url}knowledgebase/">{$lang.vsarticles}</a>
    </li>
{/if}
{if $enableFeatures.downloads!='off'}
    <li>
        <a{if $cmd=="downloads"} class="active"{/if}  href="{$ca_url}downloads/">{$lang.browsedownloads}</a>
    </li>
{/if}
{if $enableFeatures.chat!='off'}
    <li>
        <a{if $cmd=="chat"} class="active"{/if}  href="{$ca_url}chat/">{$lang.chat}</a>
    </li>
{/if}
{if $enableFeatures.netstat!='off'}
    <li>
        <a{if $cmd=="netstat"} class="active"{/if}  href="{$ca_url}netstat/">{$lang.netstat}</a>
    </li>
{/if}
</ul>


