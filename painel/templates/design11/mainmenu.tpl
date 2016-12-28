<aside id="main-side" class="pull-left not-cart">
    <header>
        <h4>MAIN MENU</h4>
        <i class="icon-reorder icon-light"></i>
    </header>
    <nav class="nav nav-stacked">
        {if $logged=='1'}
            {include file='menus/menu.main.logged.tpl'}
        {else}
            {include file='menus/menu.main.notlogged.tpl'}
        {/if}           
    </nav>
</aside>

<ul id="logout">
    <li >
        {if $logged=='1'}
            <a href="?action=logout" title="logout">
                <span class="entypo">&#59201;</span>
                <span>{$lang.logout}</span>
            </a>
        {else}
            <a href="clientarea/" class="login-widget" title="logout">
                <span class="entypo">&#59200;</span>
                <span>{$lang.login}</span>
            </a>
        {/if} 
    </li>
</ul>
