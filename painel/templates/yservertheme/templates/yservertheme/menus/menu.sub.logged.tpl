
{if ($cmd=='root' || $cmd=='page') && $infopages}
    {foreach from=$HBaddons.client_submenu item=ad}
        <li><a href="{$ca_url}{$ad.link}/"><div class="vert-center">
                    <i class="icon-cloud"></i>
                    <p>{$ad.name}</p>
                </div></a>
        </li>
    {/foreach}
    
{elseif $cmd=='cart' || $cmd=='checkdomain'}
    <li class="nav-header no-border"><span>{$lang.quicklinks}</span></li>
    <li {if $cmd=='cart'}class='active'{/if}>
        <a href="{$ca_url}cart/">
            <div class="vert-center">
                <i class="icon-order"></i>
                <p>{$lang.placeorder}</p>
            </div>
        </a>
    </li>
    {if $enableFeatures.domains!='off' && $domaincategories}
        {foreach from=$domaincategories item=cat}
            <li {if $cmd=='checkdomain' && $domain_cat==$cat.id}class='active'{/if}>
                <a href="{$ca_url}checkdomain/{$cat.slug}/">
                    <div class="vert-center">
                        <i class="icon-main-server"></i>
                        <p>{$cat.name}</p>
                    </div>
                </a>
            </li>
        {/foreach}
    {/if}

{elseif $cmd=='cart' || $cmd=='checkdomain'}
    <li class="nav-header no-border"><span>{$lang.quicklinks}</span></li>
    <li {if $cmd=='cart'}class='active'{/if}>
        <a href="{$ca_url}cart/">
            <div class="vert-center">
                <i class="icon-order"></i>
                <p>{$lang.placeorder}</p>
            </div>
        </a>
    </li>
    {if $enableFeatures.domains!='off' && $domaincategories}
        {foreach from=$domaincategories item=cat}
            <li {if $cmd=='checkdomain' && $domain_cat==$cat.id}class='active'{/if}>
                <a href="{$ca_url}checkdomain/{$cat.slug}/">
                    <div class="vert-center">
                        <i class="icon-main-server"></i>
                        <p>{$cat.name}</p>
                    </div>
                </a>
            </li>
        {/foreach}
    {/if}
{/if}
