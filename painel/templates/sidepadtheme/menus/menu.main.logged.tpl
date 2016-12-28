

    <li class="nav-header no-border"><span>{$lang.mainmenu}</span></li>
    <li {if $cmd == 'clientarea' && $action == 'default'}class="active-menu"{/if}><a {if $cmd == 'clientarea' && $action == 'default'} class="active-menu"{/if} href="{$ca_url}clientarea/"><div class="vert-center">
            <i class="icon-cloud"></i>
            <p>{$lang.dashboard}</p>
    </div></a>
    </li>
    <li {if $cmd == 'cart'}class="active-menu"{/if}><a {if $cmd == 'cart'}class="active-menu"{/if} href="{$ca_url}cart/"><div class="vert-center">
            <i class="icon-order"></i>
            <p>{$lang.order}</p>
    </div></a>
    {include file='menus/menu.dropdown.cart.tpl'}
    </li>
    <li 
    {if $cmd == 'clientarea' && ($action=='services' || $action=='accounts' || $action=='reseller' || $action=='vps' || $action=='servers' || $action == 'domains')}
    	class="active-menu"
    {/if}
    ><a 
    {if $cmd == 'clientarea' && ($action=='services' || $action=='accounts' || $action=='reseller' || $action=='vps' || $action=='servers'
    || $action == 'domains')}
    	class="active-menu"
    {/if}
    href="{$ca_url}clientarea/"><div class="vert-center">
            <i class="icon-services"></i>
            <p>{$lang.services}</p>
            {if $offer_total>0}
            <div class="link-info">{$offer_total}</div>
            {else}
            {/if}
    </div></a>
    {include file='menus/menu.dropdown.services.tpl'}
    </li>
    <li 
    {if $cmd == 'clientarea' && ($action == 'addfunds' || $action == 'details' || $action == 'profilepassword' || $action == 'password'
    || $action == 'ccard' || $action=='invoices' || $action=='cancel' || $action=='ccprocessing' || $action=='emails' || $action=='history'
    || $action=='ipaccess')}
    	class="active-menu"
    {/if}
    ><a 
    {if $cmd == 'clientarea' && ($action == 'addfunds' || $action == 'details' || $action == 'profilepassword' || $action == 'password'
    || $action == 'ccard' || $action=='invoices' || $action=='cancel' || $action=='ccprocessing' || $action=='emails' || $action=='history'
    || $action=='ipaccess')}
    	class="active-menu"
    {/if}  
    href="{$ca_url}clientarea/"><div class="vert-center">
            <i class="icon-account"></i>
            <p>{$lang.account}</p>
    </div></a>
    {include file='menus/menu.dropdown.account.tpl'}
    </li>
    <li {if $cmd == 'knowledgebase' || $cmd == 'tickets'}class="active-menu"{/if}><a {if $cmd == 'knowledgebase' || $cmd == 'tickets'}class="active-menu"{/if} href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}"><div class="vert-center">
            <i class="icon-support"></i>
            <p>{$lang.support}</p>
    </div></a>
    {include file='menus/menu.dropdown.support.tpl'}
    </li>
    {if $enableFeatures.affiliates!='off'}
    <li {if $cmd == 'affiliates'}class="active-menu"{/if}><a {if $cmd == 'affiliates'}class="active-menu"{/if} href="{$ca_url}affiliates/"><div class="vert-center">
            <i class="icon-affilates"></i>
            <p>{$lang.affiliates}</p>
    </div></a>
    {include file='menus/menu.dropdown.affiliates.tpl'}
    </li>
    {/if}
    
    {foreach from=$HBaddons.client_mainmenu item=ad}
    <li><a href="{$ca_url}{$ad.link}/"><div class="vert-center">
            <i class="icon-cloud"></i>
            <p>{$ad.name}</p>
    </div></a>
    </li>
    {/foreach}
    {if $acc_credit>0}
        <li class="credit-node">
            <div class="credit"><i class="icon-funds"></i><p>{$lang.credit}: <strong>{$acc_credit|price:$currency}</strong></p></div>
            <div class="submenu">
                <div class="submenu-header">
                    <h4>{$lang.credit}</h4>
                    <p>{$lang.addfunds_d}</p>
                </div>
                    
                    <!-- Second box with links-->
                <div class="nav nav-list">
                    <div class="nav-submenu">
                        <p>{$acc_credit|price:$currency}</p>
                    </div>
                </div>
                {if $enableFeatures.deposit!='off' }<div class="center-btn">
                    <a href="{$ca_url}clientarea/addfunds/" class="btn support-btn l-btn">
                        <i class="icon-funds"></i>
                        {$lang.addfunds}
                    </a>
                </div>{/if}
            </div>
        </li>
    {/if}
    