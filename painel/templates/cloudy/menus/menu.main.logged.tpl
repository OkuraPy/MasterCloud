<li>
    <a class="aftericon-chevron {if $cmd == 'clientarea' && $action == 'default'}active{/if}" href="{$ca_url}clientarea/">
        <i class="icon-home"></i> <span>{$lang.dashboard}</span>
    </a>
</li>
<li>
    <a href="{$ca_url}cart/" class="aftericon-chevron {if $cmd == 'cart'}active{/if}">
        <i class="icon-cloud"></i> <span>{$lang.order}</span>
    </a>
    {include file='menus/menu.dropdown.cart.tpl'}
</li>
<li>
    <a href="{$ca_url}clientarea/services/" class="aftericon-chevron {if $cmd == 'clientarea' && ( $action == 'service' || $action == 'services' || $action == 'domains')}active{/if}">
        <i class="icon-cog"></i>
        <span>{$lang.services}</span>
    </a>
    {include file='menus/menu.dropdown.services.tpl'}
</li>
<li>
    <a href="{$ca_url}clientarea/" class="aftericon-chevron {if $cmd == 'profiles' || $cmd == 'clientarea' && !( $action == 'service' || $action == 'services' || $action == 'domains') && $action != 'default'}active{/if}">
        <i class="icon-user"></i> <span>{$lang.account}</span>
    </a>
    {include file='menus/menu.dropdown.account.tpl'}
</li>
<li>
    <a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}" class="aftericon-chevron {if $cmd == 'support' || $cmd == 'tickets' || $cmd == 'downloads' || $cmd == 'knowledgebase'}active{/if}">
        <i class="icon-question-sign"></i> <span>{$lang.support}</span>
    </a>
    {include file='menus/menu.dropdown.support.tpl'}
</li>
{if $enableFeatures.affiliates!='off'}
    <li>
        <a href="{$ca_url}affiliates/" class="aftericon-chevron {if $cmd == 'affiliates'}active{/if}">
            <i class="icon-pencil"></i> <span>{$lang.affiliates}</span>
        </a>
        {if $clientdata.is_affiliate}
        {include file='menus/menu.dropdown.affiliates.tpl'}
        {/if}
    </li>
{/if}

{foreach from=$HBaddons.client_mainmenu item=ad}
    <li>
        <a href="{$ca_url}{$ad.link}/"><i class="icon-link"></i> <span>{$ad.name}</span></a>
    </li>
{/foreach}


{if $infopages}
    
<li>
    <a href="#" class="aftericon-chevron ">
        <i class="icon-question-sign"></i> <span>{$lang.moreinfo}</span>
    </a>
    
        <ul class="dropdown-menu color-sky-blue">{foreach from=$infopages item=paged}
    <li ><a href="{$ca_url}page/{$paged.url}/" >{$paged.title}</a></li>
	{/foreach}</ul>  
  
  
</li>
 
  {/if}