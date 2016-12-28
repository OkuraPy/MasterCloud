{*

This file is rendered on main HostBill screen when browsed by user

*}
<div class="text-block clear clearfix">
    <h5><i class="icon-home-l"></i>{$lang.welcome}</h5>
    <div class="line-separaotr"></div>
    <div class="row box-feature-divider clear clearfix">
        <div class="w30 pull-left">
            <a href="{$ca_url}cart/">
            <div class="box-feature">
                <div class="cp-icon-h"><i class="icon-cp-bag"></i></div>
                <h1>{$lang.placeorder|capitalize}</h1>
                <p>{$lang.placeorder_desc}</p>
            </div>
            </a>
        </div>
        <div class="w30 pull-left">
            <a href="{$ca_url}clientarea/">
            <div class="box-feature">
                <div class="cp-icon-h"><i class="icon-cp-gear"></i></div>
                <h1>{$lang.clientarea|capitalize}</h1>
                <p>{$lang.clientarea_desc}</p>
            </div>
            </a>
         </div>
         <div class="w30 pull-left">
            <a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/">
            <div class="box-feature">
                <div class="cp-icon-h"><i class="icon-cp-support"></i></div>
                <h1>{$lang.support|capitalize}</h1>
                <p>{$lang.support_desc}</p>
            </div>
            </a>
        </div>
    </div>
</div>
{if $enableFeatures.news!='off' && $annoucements}
<div class="text-block clear clearfix">
    <h5><i class="icon-news-archive"></i>{$lang.annoucements}</h5>
    <div class="line-separaotr"></div>
    {foreach from=$annoucements item=annoucement name=announ}
    {if $smarty.foreach.announ.index != 0 }
    <div class="dotted-line-m"></div>
    {/if}
    <div class="not-logged-news clear clearfix">
        <h6><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$annoucement.title}</a></h6>
        <span><i class="icon-ticket-date"></i>{$lang.published} {$annoucement.date|dateformat:$date_format}</span>
        <p>
            {$annoucement.content}
        </p>
        <div class="pull-right btn-margin">
            <a href="{$ca_url}news/" class="clearstyle btn grey-custom-btn">{$lang.newsarchive}</a>
            <a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/" class="clearstyle btn green-custom-btn">{$lang.readall} <i class="icon-submit-arrow"></i></a>
        </div>
    </div>
    {/foreach}
</div>
{/if}


