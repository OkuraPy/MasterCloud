<li {if $cmd == 'clientarea' && $action == 'default'}class="active"{/if}>
    <a class="aftericon-chevron {if $cmd == 'clientarea' && $action == 'default'}active{/if}" href="{$ca_url}clientarea/">
        <span class="entypo">&#8962;</span>
        <span>{$lang.dashboard}</span>
    </a>
</li>
<li {if $cmd == 'cart'}class="active"{/if}>
    <a href="{$ca_url}cart/" class="aftericon-chevron {if $cmd == 'cart'}active{/if}">
        <span class="entypo">&#9729;</span>
        <span>{$lang.order}</span>
    </a>
    {include file='menus/menu.dropdown.cart.tpl'}
</li>
<li {if $cmd == 'clientarea' && ( $action == 'service' || $action == 'services' || $action == 'domains')}class="active"{/if}>
    <a href="{$ca_url}clientarea/services/" class="aftericon-chevron {if $cmd == 'clientarea' && ( $action == 'service' || $action == 'services' || $action == 'domains')}active{/if}">
        <span class="entypo">&#9881;</span>
        <span>{$lang.services}</span>
    </a>
    {include file='menus/menu.dropdown.services.tpl'}
</li>
<li {if $cmd == 'profiles' || $cmd == 'clientarea' && !( $action == 'service' || $action == 'services' || $action == 'domains') && $action != 'default'}class="active"{/if}>
    <a href="{$ca_url}clientarea/" class="aftericon-chevron {if $cmd == 'profiles' || $cmd == 'clientarea' && !( $action == 'service' || $action == 'services' || $action == 'domains') && $action != 'default'}active{/if}">
        <span class="entypo">&#128100;</span>
        <span>{$lang.account}</span>
    </a>
    {include file='menus/menu.dropdown.account.tpl'}
</li>
<li {if $cmd == 'support' || $cmd == 'tickets' || $cmd == 'downloads' || $cmd == 'knowledgebase'}class="active"{/if}>
    <a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}" class="aftericon-chevron {if $cmd == 'support' || $cmd == 'tickets' || $cmd == 'downloads' || $cmd == 'knowledgebase'}active{/if}">
        <span class="entypo">&#59140;</span>
        <span>{$lang.support}</span>
    </a>
    {include file='menus/menu.dropdown.support.tpl'}
</li>
{if $enableFeatures.affiliates!='off'}
    <li {if $cmd == 'affiliates'}class="active"{/if}>
        <a href="{$ca_url}affiliates/" class="aftericon-chevron {if $cmd == 'affiliates'}active{/if}">
            <span class="entypo">&#128101;</span>
            <span>{$lang.affiliates}</span>
        </a>
        {if $clientdata.is_affiliate}
            {include file='menus/menu.dropdown.affiliates.tpl'}
        {/if}
    </li>
{/if}

{foreach from=$HBaddons.client_mainmenu item=ad}
    <li>
        <a href="{$ca_url}{$ad.link}/">
            <span class="entypo">&#128279;</span>
            <span>{$ad.name}</span></a>
    </li>
{/foreach}


{if $infopages}

    <li>
        <a href="#" class="aftericon-chevron ">
            <span class="entypo">&#128227;</span>
            <span>{$lang.moreinfo}</span>
        </a>

        <ul class="dropdown-menu">
            {foreach from=$infopages item=paged}
                <li ><a href="{$ca_url}page/{$paged.url}/" > {$paged.title} </a>
                </li>
            {/foreach}
        </ul>  
    </li>
{/if}