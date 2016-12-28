<div class="knowledgebase">
    {if $action=='article'}
        {if $article}
            <div class="spacing">
                <h3>{$article.title|ucfirst}</h3>
            </div>
            <div class="brcrm" style="background:#ECF0F1;">
                <ul class="breadcrumb left">
                    <li>
                        <a href="{$ca_url}knowledgebase/" class="roll-link"><span data-title="{$lang.knowledgebase|capitalize}">{$lang.knowledgebase|capitalize}</span></a> <span class="divider">/</span>
                    </li>
                    {foreach from=$path item=p}
                        <li>
                            <a href="{$ca_url}knowledgebase/category/{$p.id}/{$p.slug}/" class="roll-link">
                                <span data-title="{$p.name}">{$p.name}</span></a> <span class="divider">/</span>
                        </li>
                    {/foreach}
                    <li class="active">{$article.title}</li>
                </ul>

                <a class="btn right btn-default btn-small" href="{$ca_url}knowledgebase/"><i class="icon-chevron-left"></i> {$lang.back}</a>

                <div class="clear"></div>
            </div>
            <div class="spacing">
                <p>{$article.body}</p>
            </div>
        {/if}
    {elseif $action=='category'}
        <div class="spacing">
            <h3 class="no-mb">{$lang.knowledgebase|capitalize}: {$category.category.name|capitalize}</h3>
            {if $category.category.description!=''}
                <div class="knowledgebase-article">{$category.category.description}</div>
            {/if}
        </div>
        <div class="brcrm" style="background:#ECF0F1;">
            <ul class="breadcrumb left">
                <li>
                    <a href="{$ca_url}knowledgebase/" class="roll-link">
                        <span data-title="{$lang.knowledgebase|capitalize}">{$lang.knowledgebase|capitalize}</span>
                    </a> 
                    <span class="divider">/</span>
                </li>
                {foreach from=$path item=p}
                    <li>
                        <a href="{$ca_url}knowledgebase/category/{$p.id}/{$p.slug}/" class="roll-link"><span data-title="{$p.name}">{$p.name}</span>
                        </a> 
                        <span class="divider">/</span>
                    </li>
                {/foreach}
            </ul>
            <a class="btn right btn-small" href="{$ca_url}knowledgebase/"><i class="icon-chevron-left"></i> {$lang.back}</a>
            <div class="clear"></div>
        </div>
        <div class="spacing">
            {if !$category.categories && !$category.articles}
                <h4>{$lang.nothing}</h4>
            {/if}

            {if $category.categories}
                <h4>{$lang.categoriesun} {$category.category.name}:</h4>
                {foreach from=$category.categories item=i}
                    <h5><a href="{$ca_url}knowledgebase/category/{$i.id}/{$i.slug}/" class="folder3">{$i.name}  <span class="fsize">({$i.elements})</span></a></h5>
                {/foreach}
                <br/>
            {/if}
            {if $category.articles}
                <h4>{$lang.articlesun} {$category.category.name}</h4>
                {foreach from=$category.articles item=i}
                    <h5><a href="{$ca_url}knowledgebase/article/{$i.id}/{$i.slug}/" class="roll-link"><span data-title="{$i.title}">{$i.title}</span></a></h5>

                {/foreach}
            {/if}
        </div>
    {else}
        <div class="spacing">
            <h3>{$lang.knowledgebase|capitalize}</h3>
            <p>{$lang.kbwelcome}</p>
        </div>
        <div class="ribbon form-horizontal" style="margin:0; background:#ECF0F1;">
            <form action="{$ca_url}knowledgebase/search/" method="post">
                <div class="control-group" style="margin:15px 0 10px 0;">
                    <label for="appendedPrependedInput" class="control-label" style="padding-top:8px;">{$lang.search_article}</label>
                    <div class="controls">
                        <input type="text" name="query"  value="{$query}" />

                        <input type="submit" value="{$lang.search}" class="btn btn-primary"/>
                    </div>
                </div>
                {securitytoken}
            </form>
        </div>
        <div class="spacing">
            {if $action=='search'}
                <h4>{$lang.search_results}</h4>
                {if $results}
                    {foreach from=$results item=i}
                        <a href="{$ca_url}knowledgebase/article/{$i.id}/{$i.slug}/" class="roll-link"><span data-title="{$i.title}">{$i.title}</span></a><br />
                        {$i.body|nl2br}<br />
                        <br/>
                    {/foreach}
                {else}
                    {$lang.search_nothing}
                {/if}
            {else}
                {if $categories && $categories.categories}
                    <h4>{$lang.currentcats}</h4>
                    {foreach from=$categories.categories item=i}
                        <h5>
                            <strong>
                                <a href="{$ca_url}knowledgebase/category/{$i.id}/{$i.slug}/" class="roll-link"><span data-title="{$i.name}">{$i.name}</span></a>
                            </strong> 
                            <span class="fsize">({$i.elements})</span>
                        </h5>
                    {/foreach}
                {else}
                    {$lang.nothing}
                {/if}
            {/if}
        </div>
    {/if}
</div>