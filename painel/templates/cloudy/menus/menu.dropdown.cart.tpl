<ul class="dropdown-menu">
{foreach from=$orderpages item=op}
    <li>
        <a href="{$ca_url}cart/{$op.slug}/">{$op.name}</a>
    </li>
{/foreach}
</ul>
