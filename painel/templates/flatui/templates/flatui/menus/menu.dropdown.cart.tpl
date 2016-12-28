<div class="hidden-submenu">
    <ul class="dropdown-menu flat-ui-dropdown">
    {foreach from=$orderpages item=op}
        <li>
            <a href="{$ca_url}cart/{$op.slug}/">{$op.name}</a>
        </li>
    {/foreach}
    </ul>
</div>