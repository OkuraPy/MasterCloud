<div class="hidden-submenu">
    <ul class="dropdown-menu flat-ui-dropdown">
    {foreach from=$offer item=offe}
        {if $offe.total>0}
            <li>
                <a href="{$ca_url}clientarea/services/{$offe.slug}/"> {$offe.name} <span>{$offe.total}</span> </a>
            </li>
        {/if}
    {/foreach}
    {if $offer_domains}
        <li>
            <a href="{$ca_url}clientarea/domains/">{$lang.domains} <span>{$offer_domains}</span></a>
        </li>
    {/if}
    </ul>
</div>