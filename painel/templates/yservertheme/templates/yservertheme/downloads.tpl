<div class="spacing">
    <h3>{$lang.downloads|capitalize}</h3>
    <p>{$lang.browsedownloads}</p>
</div>
<div class="spacing">
    {if $categories }
        <!-- Support Menu -->
        <div class="support-menu">
            <h4>{$lang.categories}</h4>
            <ul class="nav mt-10">

                {foreach from=$categories item=i}
                    <li>
                        <a href="{$ca_url}downloads/category/{$i.id}/{$i.slug}/" class="roll-link inline-block">
                            <span data-title="{$i.name}[{$i.files} {$lang.files}]">{$i.name}[{$i.files} {$lang.files}]</span>
                        </a>
                    </li>
                {/foreach}
            </ul>
        </div>
        <!-- End of Suppoty Menu -->
    {/if}
</div>
<!-- Support Container -->
<div class="spacing">
    <!-- Services -->
    {if $category}
        <div class="pull-right">
            <a  href="{$ca_url}downloads/" class="btn btn-small"><i class="icon-chevron-left"></i> {$lang.back}</a>
        </div>
    {/if}
    {if $action=='default'}
        {if $myfiles}
            <h4 class="clear">{$lang.myfiles_down}</h4>
            <div class="separator-line"></div>
            {foreach from=$myfiles item=i name=loop}
                <div class="download-box pull-left">
                    <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="roll-link"><span data-title="{$i.name}">{$i.name}</span></a>
                    <p>{$i.description}</p>
                    <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="btn btn-primary btn-small">
                        <i class="icon-file"></i> 
                        {$lang.download} {if $i.size>0}({$i.size} KB)
                        {/if}
                    </a>
                </div>
            {/foreach}
        {/if}

        {if $popular}
            <h4 class="clear">{$lang.popular_down}</h4>
            <div class="separator-line"></div>

            {foreach from=$popular item=i name=loop}
                <div class="download-box pull-left">
                    <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="roll-link"><span data-title="{$i.name}">{$i.name}</span></a>
                    <p>{$i.description}</p>
                    <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="btn btn-primary btn-small">
                        <i class="icon-file"></i> 
                        {$lang.download} {if $i.size>0}({$i.size} KB)
                        {/if}
                    </a>
                </div>
            {/foreach}
        {/if}

    {elseif $action=='category'}
        <h4>{$lang.filesunder} {$category.name}</h4>
        <div class="separator-line"></div>

        {if $category.description!=''}
            <p>{$category.description}</p>
        {/if}

        {foreach from=$files item=i name=loop}
            <div class="download-box pull-left">
                <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="roll-link"><span data-title="{$i.name}">{$i.name}</span></a>
                <p>{$i.description}</p>
                <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="btn btn-primary btn-small">
                    <i class="icon-file"></i> 
                    {$lang.download} {if $i.size>0}({$i.size} KB)
                    {/if}
                </a>
            </div>
        {/foreach}
    {/if}
</div>

<!-- End of Support Container-->
