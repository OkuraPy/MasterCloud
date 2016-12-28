{*

This file is rendered on main HostBill screen when browsed by user

*}
<h1>{$lang.welcome}</h1>


<div class="mt-35 clearfix">
	<ul class="square-list root-list">
        <li class="root-item">
            <a href="{$ca_url}cart/">
                <div class="square-box green-box">
                    <div class="middle-cricle">
                        <i class="icon-shopping-cart"></i>
                    </div>
                    <p>{$lang.placeorder|capitalize}</p>
                </div>
            </a>
        </li>
    
        <li class="root-item">
            <a href="{$ca_url}clientarea/">
                <div class="square-box yellow-box">
                    <div class="middle-cricle">
                        <i class="icon-cog"></i>
                    </div>
                    <p>{$lang.clientarea|capitalize}</p>
                </div>
            </a>
        </li>
    
        <li class="root-item">
            <a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/">
                <div class="square-box blue-box">
                    <div class="middle-cricle">
                        <i class="icon-question-sign"></i>
                    </div>
                    <p>{$lang.support|capitalize}</p>
                </div>
            </a>
        </li>
    </ul>
</div>

<div class="shadow"></div>

{if $enableFeatures.news!='off' && $annoucements}

    <h3>{$lang.annoucements}</h3>
    <div class="clearfix p15">
        {foreach from=$annoucements item=annoucement name=announ}
            <div class="news-container mb-25">
                <div class="news-body">
                    <h4 class="no-mb"><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/" class="roll-link"><span data-title="{$annoucement.title}">{$annoucement.title}</span></a></h4>
                    <p class="day">{$annoucement.date}</p>
                    <p>
                        {$annoucement.content}
                    </p>
                </div>
            </div>
        {/foreach}
        <div class="news-btns">
            <a href="{$ca_url}news/" class="btn btn-flat-success btn-small">{$lang.newsarchive}</a>
            <a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/" class="btn btn-flat-default btn-small">{$lang.readall} <i class="icon-single-arrow"></i></a>
        </div>
    </div>
{/if}