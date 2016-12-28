
{if $edit}
    {include file='services/domain_details.tpl'}
{else}
    {if $domains}
        <div class="spacing">
            <h3>{$lang.domains|capitalize}</h3>
            <p>{$lang.listallyoursdomain}</p>
        </div>
        <div class="bottom-border-nav">
            <ul class="nav nav-pills ">
                <li class="active"><a href="#" data-sorter="filter[status]">{$lang.all}</a></li>
                <li><a href="#Active" data-sorter="filter[status]">{$lang.Active}</a></li>
                <li><a href="#Pending" data-sorter="filter[status]">{$lang.Pending}</a></li>
                <li><a href="{$ca_url}checkdomain" class="color-sky-blue"> <i class="icon-plus"></i> {$lang.add_domain}</a></li>
            </ul>

            <a href="{$ca_url}clientarea&amp;action=domains" id="currentlist" style="display:none" updater="#updater"></a>
            <input type="hidden" id="currentpage" value="0" />
            <table class="table table-striped table-spacing services-table">
                <thead>
                    <tr>
                        <th colspan="2" style="vertical-align: middle"><i class="icon-arrow-down"></i> {$lang.withdomains} </th>
                        <th colspan="5">
                            <ul class="pull-right domain-widgets">
                                <li>
                                    <a href="{$ca_url}clientarea/domains/renew/" onclick="return bulk_widget(this)" title="{$lang.renew_widget}" data-toggle="tooltip" class="btn btn-primary disabled widget_domainrenewal">
                                        <i class="icon-book icon-large"></i>
                                    </a>
                                </li>
                                {if $domwidgets}
                                    {foreach from=$domwidgets item=widg}
                                        {assign var=widg_name value="`$widg.name`_widget"}
                                        <li>
                                            <a href="{$ca_url}clientarea/domains/bulkdomains/&widget={$widg.widget}" title="{*
                                               *} {if $lang[$widg_name]}{*
                                               *} {$lang[$widg_name]}{*
                                               *}{elseif $lang[$widg.widget]}{*
                                               *}{$lang[$widg.widget]}{*
                                               *}{else}{*
                                               *}{$widg.name}{*
                                               *}{/if}" 
                                               data-toggle="tooltip" onclick="return bulk_widget(this)" class="btn btn-primary disabled widget_{$widg.widget}">
                                                <i class="icon-large {if $widg.widget=='renew'}iicon-repeat{*
                                                   *}{elseif $widg.widget=='contactinfo'}icon-group{*
                                                   *}{elseif $widg.widget=='autorenew'}icon-refresh{*
                                                   *}{elseif $widg.widget=='reglock'}icon-lock{*
                                                   *}{elseif $widg.widget=='domainforwarding' || $widg.widget=='emailforwarding'}icon-mail-forward{*
                                                   *}{elseif $widg.widget=='nameservers' || $widg.widget=='registernameservers' || $widg.widget=='dnsmanagement_widget'}icon-sitemap{/if}"></i>
                                            </a><span class="separator"></span>
                                        </li>
                                    {/foreach} 
                                {/if}
                            </ul>
                        </th>
                    </tr>
                    <tr>
                        <th class="w5"><input type="checkbox" onclick="return c_all(this);"></th>
                        <th><a href="{$ca_url}clientarea/domains/&orderby=name|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.domain}</a></th>
                        <th style="width: 130px"><a href="{$ca_url}clientarea/domains/&orderby=date_created|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.registrationdate}</a></th>
                        <th style="width: 130px"><a href="{$ca_url}clientarea/domains/&orderby=expires|ASC" data-sorter="orderby"> <i class="icon-sort"></i> {$lang.expirydate}</a></th>
                        <th style="width: 130px"><a href="{$ca_url}clientarea/domains/&orderby=expires|ASC" data-sorter="orderby"><i class="icon-sort"></i> {$lang.status}</a></th>
                        <th colspan="2" style="width: 110px">{$lang.autorenew}</th>

                    </tr>
                </thead>

                <tbody id="updater">
                    {include file='ajax/ajax.domains.tpl'}
                </tbody>
                {if $totalpages > 1}
                    <tbody class="pagination">
                        <tr>
                            <td colspan="7" >
                                <ul rel="{$totalpages}">
                                    <li class="pull-left dis"><a href="#"><i class="icon-pagin-left"></i> {$lang.previous}</a></li>
                                    <li class="pull-right dis"><a href="#">{$lang.next} <i class="icon-pagin-right"></i></a></li>
                                </ul>
                            </td>
                        </tr>
                    </tbody>
                {/if}
            </table>
        </div>
    {else}
        <div class="spacing">
            <h3>{$lang[$action]|capitalize}</h3>
            <p>{$lang.nothing}</p>
            
            {if $lang.add_domain}
                <form method="post" action="{$ca_url}checkdomain" style="text-align: center">
                    <button class="clearstyle btn btn-danger"  style="font-weight:bold;font-size:16px;padding:15px 10px;">
                        <i class="icon-shopping-cart icon-white"></i> {$lang.add_domain}
                    </button>
                    {securitytoken}
                </form>
            {/if}
        </div>
    {/if}      
{/if}
<script type="text/javascript" src="{$template_dir}js/domains.js"></script>
