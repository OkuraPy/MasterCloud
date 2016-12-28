<aside class="left-menu">
    <div class="header clearfix">
        <div class="pull-right">
            <i class="icon-reorder"></i>
        </div>
    </div>
    
    <nav class="nav nav-stacked">
        {if $logged=='1'}
            {include file='menus/menu.main.logged.tpl'}
        {else}
            {include file='menus/menu.main.notlogged.tpl'}
        {/if}           
    </nav>
</aside>
