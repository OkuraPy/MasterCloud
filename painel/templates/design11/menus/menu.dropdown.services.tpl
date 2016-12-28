<ul class="dropdown-menu color-sky-blue">
    {foreach from=$offer item=offe}
        {if $offe.total>0}
            <li>
                <a href="{$ca_url}clientarea/services/{$offe.slug}/"> {$offe.name} <span class="badge badge-top">{$offe.total}</span> </a>
            </li>
            {assign value=true var=hasservicedrop}
        {/if}
    {/foreach}
    {if $offer_domains}
        <li>
            <a href="{$ca_url}clientarea/domains/">{$lang.domains} <span class="badge badge-top">{$offer_domains}</span></a>
        </li>
    {/if}
    {if $offer_domains==0 && !$hasservicedrop}
        <li>
            <a href="{$ca_url}cart/">{$lang.noservicesyet}</a>
        </li>
    {/if}
</ul>
