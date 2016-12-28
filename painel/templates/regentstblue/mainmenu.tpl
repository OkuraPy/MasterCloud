<aside id="main-side" class="pull-left">
    <header>
        <i class="fa fa-bars"></i>
    </header>
    <nav class="nav nav-stacked">
        {if $logged=='1'}
            {include file='menus/menu.main.logged.tpl'}
        {else}
            {include file='menus/menu.main.notlogged.tpl'}
        {/if}           
    </nav>
</aside>
