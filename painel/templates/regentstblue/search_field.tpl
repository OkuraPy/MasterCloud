{if ( $enableFeatures.kb && $enableFeatures.kb!='off' )
    || ($enableFeatures.domains && $enableFeatures.domains!='off')
    || ($enableFeatures.support && $enableFeatures.support!='off')
}
<li id="main-search" class="round">
    <a href="#search">
        <i class="fa fa-search"></i>
    </a>
    <div class="search-content">        
        <div class="dropdown pull-right">
            <a class="dropdown-toggle" data-toggle="dropdown" href="{if $enableFeatures.domains && $enableFeatures.domains!='off'}{$ca_url}clientarea/domains/{else}{$ca_url}knowledgebase/search/{/if}">
            {if $enableFeatures.domains && $enableFeatures.domains!='off'}{$lang.domains}{else}{$lang.knowledgebase}{/if}
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu" >
                {if $logged=='1' && $enableFeatures.domains && $enableFeatures.domains!='off'}
                    <li>
                        <a href="{$ca_url}clientarea/domains/">{$lang.domains}</a>
                        <form id="search-domains" class="form-inline" action="{$ca_url}clientarea/domains/" method="post" style="display: none">
                            <input type="hidden" class="search-field" name="filter[name]" >
                        </form>
                    </li>
                {/if}
                {if $enableFeatures.kb && $enableFeatures.kb!='off'}
                    <li>
                        <a href="{$ca_url}knowledgebase/search/">{$lang.knowledgebase}</a>
                        <form id="search-knowledgebase" class="form-inline" action="{$ca_url}knowledgebase/search/" method="post" style="display: none">
                            <input type="hidden" name="query" class="search-field">
                        </form>
                    </li>
                {/if}
 
                {if $logged=='1' && $enableFeatures.support && $enableFeatures.support!='off'}
                    <li>
                        <a href="{$ca_url}tickets">{$lang.tickets}</a>
                        <form id="search-tickets" class="form-inline" action="{$ca_url}tickets" method="post" style="display: none">
                            <input type="hidden" name="filter[subject]" class="search-field">
                        </form>
                    </li>
                {/if}
            </ul>
        </div>
        <span><input type="text" /></span>
    </div>
</li>
{/if}