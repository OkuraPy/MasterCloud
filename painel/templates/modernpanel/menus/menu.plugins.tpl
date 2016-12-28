{if count($HBaddons.client_mainmenu) > 1}
    <li class="dropdown drop-submenu">
        <a class="dropdown-toggle" data-toggle="dropdown">
            <i class="icon-order"></i>
            {$lang.other}
        </a>
        <div class="dropdown-menu submenu white-space" style="display: none;">
            <div class="wrapper">
                <ul class="nav nav-pills nav-stacked submenu-nav">
                    {foreach from=$HBaddons.client_mainmenu item=ad}
                        <li>
                            <a href="{$ca_url}{$ad.link}/">{$ad.name}</a>
                        </li>
                    {/foreach}
                </ul>
                <div class="submenu-order-bg"></div>
            </div>
        </div>
    </li>
{else}
    {foreach from=$HBaddons.client_mainmenu item=ad}
        <li class="dropdown drop-submenu">
            <a class="dropdown-toggle {if $cmd == 'affiliates'}active{/if}" href="{$ca_url}{$ad.link}/">
                <i class="icon-order"></i>
                {$ad.name}
            </a>
        </li>
    {/foreach}
{/if}