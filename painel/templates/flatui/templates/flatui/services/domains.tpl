<article class="affiliates-container">
    {if $edit}
        {include file='services/domain_details.tpl'}
    {else}
        {if $domains}
            
            

            <div class="flat-ui-tab">
            	<ul id="invoice-tab" class="nav nav-tabs table-nav" data-filter="status">
                    <li class="active"><a href="#tab1" data-toggle="tab" data-filter="">{$lang.all}</a></li>
                    <li><a href="#tab2" data-toggle="tab" data-filter="Active"> {$lang.Active}</a></li>
                    <li><a href="#tab3" data-toggle="tab" data-filter="Pending"> {$lang.Pending}</a></li>
                </ul>
                <div class="tab-content no-overflow">

                    <!-- Tab #1 -->
                    <div class="tab-pane active" id="tab1">
                        <div class="tab-header">
                            <div class="pull-right">
                                <ul class="nav nav-pills tooltip-group">
                                    <li class="disabled widget_domainrenewal">
                                        <a href="{$ca_url}clientarea/domains/renew/" title="{$lang.renew_widget}" data-toggle="tooltip">
                                            <i class="icon-book"></i>
                                        </a>
                                    </li>
                                    {if $domwidgets}
                                        {foreach from=$domwidgets item=widg}
                                            {assign var=widg_name value="`$widg.name`_widget"}
                                            <li class="disabled widget_{$widg.widget}">
                                                <a href="{$ca_url}clientarea/domains/bulkdomains/&widget={$widg.widget}" title="{*
                                                   *} {if $lang[$widg_name]}{*
                                                   *} {$lang[$widg_name]}{*
                                                   *}{elseif $lang[$widg.widget]}{*
                                                   *}{$lang[$widg.widget]}{*
                                                   *}{else}{*
                                                   *}{$widg.name}{*
                                                   *}{/if}" 
                                                   data-toggle="tooltip" onclick="return bulk_widget(this)">
                                                    <i class="{if $widg.widget=='renew'}icon-d-bag{*
                                                       *}{elseif $widg.widget=='contactinfo'}icon-user-md{*
                                                       *}{elseif $widg.widget=='autorenew'}icon-undo{*
                                                       *}{elseif $widg.widget=='reglock'}icon-lock{*
                                                       *}{elseif $widg.widget=='domainforwarding' || $widg.widget=='emailforwarding'}icon-share-alt{*
                                                       *}{elseif $widg.widget=='nameservers' || $widg.widget=='registernameservers' || $widg.widget=='dnsmanagement_widget'}icon-external-link{/if}"></i>
                                                </a><span class="separator"></span>
                                            </li>
                                        {/foreach} 
                                    {/if}
                                </ul>
                            </div>
                            <p class="line-fix"><i class="icon-arrow-down"></i> {$lang.withdomains} </p>
                        </div>
                        <div class="affiliates-box">
                            <a href="{$ca_url}clientarea&amp;action=domains" id="currentlist" style="display:none" updater="#updater"></a>
                            <input type="hidden" id="currentpage" value="0" />
                            <table class="table table-striped domains-table">
                            	<thead>
                                    <tr>
                                        <th class="w5"><input type="checkbox" onclick="c_all(this)"></th>
                                        <th><a href="{$ca_url}clientarea/domains/&amp;orderby=name|ASC"><i class="icon-sort"></i></a>{$lang.domain}</th>
                                        <th style="width: 130px"><a href="{$ca_url}clientarea/domains/&amp;orderby=date_created|ASC"><i class="icon-sort"></i></a>{$lang.registrationdate}</th>
                                        <th style="width: 130px"><a href="{$ca_url}clientarea/domains/&amp;orderby=expires|ASC"><i class="icon-sort"></i></a>{$lang.expirydate}</th>
                                        <th style="width: 130px"><a href="{$ca_url}clientarea/domains/&amp;orderby=expires|ASC"><i class="icon-sort"></i></a>{$lang.status}</th>
                                        <th colspan="2" style="width: 110px"><a href="#"><i class="icon-sort"></i></a>{$lang.autorenew}</th>
    
                                    </tr>
                                </thead>

                                <tbody id="updater">
                                    {include file='ajax/ajax.domains.tpl'}
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
            {if $totalpages > 1}
            <div class="pagination flat-ui-pagination clearfix">
                <ul rel="{$totalpages}">
                    <li class="pull-left dis"><a href="#"><i class="icon-pagin-left"></i> {$lang.previous}</a></li>
                    <li class="pull-right dis"><a href="#">{$lang.next} <i class="icon-pagin-right"></i></a></li>
                </ul>
            </div>
            {/if}
        {else}
            <p>{$lang.nothing}</p>
            {if $lang.add_domain}
                <form method="post" action="{$ca_url}checkdomain">
                    <button class="clearstyle btn c-orange-btn"  style="font-weight:bold;font-size:16px;padding:15px 10px;"></i> {$lang.add_domain}</button>
                    {securitytoken}
                </form>
            {/if}
        {/if}      
    {/if}
    <script type="text/javascript" src="{$template_dir}js/domains.js"></script>
</article>