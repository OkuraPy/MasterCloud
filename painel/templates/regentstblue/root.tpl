{*

This file is rendered on main HostBill screen when browsed by user

*}
<div class="spacing">
    <div class="container-fluid" id="logout">
        <div class="row-fluid text-center">
            <h2>{$lang.welcome}</h2>
        </div> <!-- /row-fluid-->

        <div class="circles">
            <div class="row-fluid">
                <div class="span4 text-center">
                    <a href="{$ca_url}cart/">
                        <div class="circle circle_order">
                            <span class="icon icon-ShoppingCart"></span>
                        </div>
                    </a>
                    <h3><a href="{$ca_url}cart/">{$lang.placeorder|capitalize}</a></h3>
                    <h5>Place a new order</h5>
                    <a href="{$ca_url}cart/" class="btn btn-view">View</a>
                </div>  <!-- /span4-->
                <div class="span4 text-center">
                    <a href="{$ca_url}clientarea/">
                        <div class="circle circle_client">
                            <span class="icon icon-Settings"></span>
                        </div>   
                    </a>
                    <h3><a href="{$ca_url}clientarea/">{$lang.clientarea|capitalize}</h3>
                    <h5>Viev and update your account details</h5>
                    <a href="{$ca_url}clientarea/"class="btn btn-view">View</a>
                </div>  <!-- /span4-->
                <div class="span4 text-center">
                    <a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/">
                        <div class="circle circle_support">
                            <span class="icon icon-Help"></span>
                        </div>  
                    </a>
                    <h3><a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/">{$lang.support|capitalize}</a></h3>
                    <h5>Find answer to your questions</h5>
                    <a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/" class="btn btn-view">View</a>
                </div>  <!-- /span4-->
            </div> <!-- /row-fluid-->
        </div> <!-- /circles--> 

        {if $enableFeatures.news!='off' && $annoucements}

            <hr>
            <div class="row-fluid text-center" id="news">
                <h3>{$lang.annoucements}</h3>
            </div> <!-- /row-fluid-->
            {foreach from=$annoucements item=annoucement name=announ}
                <div class="row-fluid" id="updates">
                    <h4><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/" >Lorem ipsum dolor sit amet.</a></h4>
                    <div class="time_date">
                        <span class="icon icon-Time"></span><span>{$annoucement.date|dateformat:$date_format}</span>
                    </div>
                    <p>{$annoucement.content}</p>
                </div>
            {/foreach}
            <div class="row-fluid text-center">
                <a href="{$ca_url}news/" class="btn btn-news">{$lang.newsarchive}</a>
                <a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/" class="btn btn-view">{$lang.readall}</a>
            </div>
        {/if}
    </div>
</div>
<div id="tweets"></div>