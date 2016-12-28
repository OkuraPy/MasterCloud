<li class="nav-header"><div><i class="icon-play-circle"></i>{$lang.expandall}</div></li>
<li>
    <a href="{$ca_url}" {if $cmd == 'clientarea' && $action == 'default'} class="active"{/if}>
        <i class="icon-home"></i> <span>{$lang.homepage}</span>
    </a>
</li>

<li>
    <a href="{$ca_url}cart/" {if $cmd == 'cart'}class="active"{/if}>
        <i class="icon-cloud"></i> <span>{$lang.order}</span>
    </a>
    {include file='menus/menu.dropdown.cart.tpl'}
</li>

<li>
    <a href="{$ca_url}clientarea/" {if $cmd == 'clientarea' && !( $action == 'service' || $action == 'services' || $action == 'domains') && $action != 'default'} class="active"{/if}>
        <i class="icon-user"></i> <span>{$lang.clientarea}</span>
    </a>
</li>

<li>
    <a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}" {if $cmd == 'support' || $cmd == 'tickets' || $cmd == 'downloads' || $cmd == 'knowledgebase'} class="active" {/if}>
        <i class="icon-question-sign"></i> <span>{$lang.support}</span>
    </a>
    {include file='menus/menu.dropdown.support.tpl'}
</li>

{if $enableFeatures.affiliates!='off'}
    <li>
        <a href="{$ca_url}affiliates/" {if $cmd == 'affiliates'} class="active" {/if}>
            <i class="icon-pencil"></i> <span>{$lang.affiliates}</span>
        </a>
    </li>
{/if}

{foreach from=$HBaddons.client_mainmenu item=ad}
    <li>
        <a href="{$ca_url}{$ad.link}/">
            <i class="icon-cog"></i> <span>{$ad.name}</span>
        </a>
    </li>
{/foreach}


{if $infopages}
    <li>
        <a href="#" class="aftericon-chevron ">
            <i class="icon-question-sign"></i> <span>{$lang.moreinfo}</span>
        </a>
        <div class="hidden-submenu">
        <ul class="dropdown-menu flat-ui-dropdown">
            {foreach from=$infopages item=paged}
                <li ><a href="{$ca_url}page/{$paged.url}/" >{$paged.title}</a></li>
            {/foreach}
        </ul>  
        </div>
    </li>
{/if}

