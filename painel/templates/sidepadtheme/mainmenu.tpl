


<!-- Left Column -->
<aside>
    <div class="topbar">
        <button class="collapse-btn">
            <i class="icon-collapse"></i>
        </button>
    </div>
    <!-- Navigation -->
    <nav class="nav nav-list main-nav">
        {if $logged=='1'}
            {include file='menus/menu.main.logged.tpl'}
        {else}
            {include file='menus/menu.main.notlogged.tpl'}
        {/if}
        
        
{*      {if $logged=='1'}
            {include file='menus/menu.sub.logged.tpl'}
        {else}
            {include file='menus/menu.sub.notlogged.tpl'}
        {/if} *}              
    </nav>
</aside>
<!-- End of Left Column -->