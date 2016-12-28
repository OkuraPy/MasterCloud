
<li class="nav-header no-border"><span>{$lang.mainmenu}</span></li>
<li><a href="{$ca_url}"><div class="vert-center">
        <i class="icon-cloud"></i>
        <p>{$lang.homepage}</p>
</div></a>
</li>
<li><a href="{$ca_url}cart/"><div class="vert-center">
        <i class="icon-order"></i>
        <p>{$lang.order}</p>
</div></a>
{include file='menus/menu.dropdown.cart.tpl'}
</li>
<li><a href="{$ca_url}clientarea/"><div class="vert-center">
        <i class="icon-account"></i>
        <p>{$lang.clientarea}</p>
</div></a></li>
<li><a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}"><div class="vert-center">
        <i class="icon-support"></i>
        <p>{$lang.support}</p>
</div></a>
{include file='menus/menu.dropdown.support.tpl'}
</li>
{if $enableFeatures.affiliates!='off'}
<li><a href="{$ca_url}affiliates/"><div class="vert-center">
        <i class="icon-affilates"></i>
        <p>{$lang.affiliates}</p>
</div></a>
</li>
{/if}

{foreach from=$HBaddons.client_mainmenu item=ad}
<li><a href="{$ca_url}{$ad.link}/"><div class="vert-center">
        <i class="icon-cloud"></i>
        <p>{$ad.name}</p>
</div></a>
</li>
{/foreach}




