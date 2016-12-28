<li {if $cmd == 'clientarea' && $action == 'default'}class="active"{/if}>
    <a class="aftericon-chevron {if $cmd == 'clientarea' && $action == 'default'}active{/if}" href="{$ca_url}clientarea/">
        <div class="border">
            <span class="icon icon-House"></span>
        </div>
        <span>{$lang.dashboard}</span>
    </a>
</li>
<li {if $cmd == 'cart'}class="active"{/if}>
    <a href="{$ca_url}cart/" class="aftericon-chevron {if $cmd == 'cart'}active{/if}">
        <div class="border">
            <span class="icon icon-Cloud"></span>
        </div>
        <span>{$lang.order}</span>
    </a>
    {include file='menus/menu.dropdown.cart.tpl'}
</li>
<li {if $cmd == 'clientarea' && ( $action == 'service' || $action == 'services' || $action == 'domains')}class="active"{/if}>
    <a href="{$ca_url}clientarea/services/" class="aftericon-chevron {if $cmd == 'clientarea' && ( $action == 'service' || $action == 'services' || $action == 'domains')}active{/if}">
        <div class="border">
            <span class="icon icon-Settings"></span>
        </div>
        <span>{$lang.services}</span>
    </a>
    {include file='menus/menu.dropdown.services.tpl'}
</li>
<li {if $cmd == 'profiles' || $cmd == 'clientarea' && !( $action == 'service' || $action == 'services' || $action == 'domains') && $action != 'default'}class="active"{/if}>
    <a href="{$ca_url}clientarea/" class="aftericon-chevron {if $cmd == 'profiles' || $cmd == 'clientarea' && !( $action == 'service' || $action == 'services' || $action == 'domains') && $action != 'default'}active{/if}">
        <div class="border">
            <span class="icon icon-User"></span>
        </div>
        <span>{$lang.account}</span>
    </a>
    {include file='menus/menu.dropdown.account.tpl'}
</li>
<li {if $cmd == 'support' || $cmd == 'tickets' || $cmd == 'downloads' || $cmd == 'knowledgebase'}class="active"{/if}>
    <a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}" class="aftericon-chevron {if $cmd == 'support' || $cmd == 'tickets' || $cmd == 'downloads' || $cmd == 'knowledgebase'}active{/if}">
        <div class="border">
            <span class="icon icon-Help"></span>
        </div>
        <span>{$lang.support}</span>
    </a>
    {include file='menus/menu.dropdown.support.tpl'}
</li>
{if $enableFeatures.affiliates!='off'}
    <li {if $cmd == 'affiliates'}class="active"{/if}>
        <a href="{$ca_url}affiliates/" class="aftericon-chevron {if $cmd == 'affiliates'}active{/if}">
            <div class="border">
                <span class="icon icon-Share"></span>
            </div>
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
            <div class="border">
                <span class="icon icon-Linked"></span>
            </div>
            <span>{$ad.name}</span></a>
    </li>
{/foreach}


{if $infopages}

    <li>
        <a href="#" class="aftericon-chevron ">
            <div class="border">
                <span class="icon icon-Megaphone"></span>
            </div>
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