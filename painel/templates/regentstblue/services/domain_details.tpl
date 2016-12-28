{if $bulkdetails}
    <div class="widget spacing">
        <div class="wbox">
            <div class="wbox_header">{$lang.bulkdomains}</div>
            <div  class="wbox_content" id="cartSummary">
                {foreach from=$bulkdetails item=b}
                    <a href="{$ca_url}clientarea/domains/{$b.id}/{$b.name}/"><span class="label label-danger">{$b.name}</span></a>
                    {/foreach}
            </div>
        </div>

        {if $widget.replacetpl}
            {include file=$widget.replacetpl}
        {elseif $widget.appendtpl}
            {include file=$widget.appendtpl}
        {elseif $widget.appendaftertpl}
            <a name="{$widget.name}"></a>
            {include file=$widget.appendaftertpl}
        {/if}
    </div>
{elseif $details}
    <div class="spacing">
        
        <h2 class="lite color-sky-blue">{$details.name}</h2>
        <h5>{$lang.domdetails}</h5>
        
        {include file="menus/menu.sub.loc.tpl" inside=true}
        
        <div class="shared-wrapper clearfix">
            <aside class="shared-hosting-menu">
                <div class="header">
                    <p>{$lang.menu}</p>
                </div>
                <ul class="nav">

                    {if $details.status=='Active'}
                        <li {if !$widget}class="active"{/if}>
                            <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/">
                                <i class="icon-sh-details"></i>
                                <p>{$lang.domdetails}</p>
                            </a>
                            <div class="c-border">
                                <span></span>
                            </div>
                            <div class="bg-fix"></div>
                        </li>
                        {foreach from=$widgets item=widg name=cst}
                            {if $widg.name!='reglock' && $widg.name!='nameservers'  && $widg.name!='autorenew' }
                                {if $widg.name=='idprotection' && $details.offerprotection && !$details.offerprotection.purchased}
                                    {continue}
                                {/if}

                                <li {if $widget.name==$widg.name}class="active"{/if}>
                                    <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}#{$widg.name}">
                                        <i>
                                            <img src="{$system_url}{$widg.location}/small.png" alt="" />
                                        </i>
                                        <p>
                                            {assign var=widg_name value="`$widg.name`_widget"}
                                            {if $lang[$widg_name]}
                                                {$lang[$widg_name]}
                                            {elseif $lang[$widg.name]}
                                                {$lang[$widg.name]}
                                            {elseif $widg.fullname}
                                                {$widg.fullname}
                                            {else}
                                                {$widg.name}
                                            {/if}
                                        </p>
                                    </a>
                                    <div class="c-border">
                                        <span></span>
                                    </div>
                                    <div class="bg-fix"></div>
                                </li>
                            {/if}
                        {/foreach}
                        {if $custom}
                            {foreach from=$custom item=btn name=cst}
                                <li>
                                    <a href="#" onclick="$('#cbtn_{$btn}').click();
                                            return false;">
                                        <p>{$lang.$btn}</p>
                                    </a> 
                                    <div class="c-border">
                                        <span></span>
                                    </div>
                                    <div class="bg-fix"></div>
                                </li>
                            {/foreach}
                        {/if}
                    {/if}
                </ul>
                {if $details.status!='Active'}
                    <div class="sidebar-block">
                        {if $details.status=='Pending' ||  $details.status=='Pending Registration'}
                            {$lang.domainpendinginfo}
                        {elseif $details.status=='Pending Transfer'}
                            {$lang.domainpendingtransferinfo}
                        {elseif $details.status=='Expired'}
                            {$lang.domainexpiredinfo}
                        {elseif $details.status=='Cancelled' ||  $details.status=='Fraud'}
                            {$lang.domaincanceledinfo}
                        {/if}
                    </div>
                {/if}
            </aside>
            <section class="shosting-container">
                <div class="header">
                    <p>{$lang.mydetails}</p>
                </div>
                <div class="padding">

                    {if $widget.appendtpl}
                        <div class="widget">
                            {include file=$widget.appendtpl}
                        </div>
                    {/if}

                    {if $widget.replacetpl}
                        <div class="widget">
                            {include file=$widget.replacetpl}
                        </div>
                    {else}
                        
                        <table class="table table-striped table-aff-center p-top">
                            <tr>
                                <td class="w30">{$lang.domain}</td>
                                <td><span class="label flat-ui-label label-{$details.status}">{$lang[$details.status]}</span> <a href="http://{$details.name}" target="_blank" class="roll-link bold"><span data-title="{$details.name}">{$details.name}</span></a></td>
                            </tr>
                            <tr>
                                <td class="w30">{$lang.registrationdate}</td>
                                <td>{if !$details.date_created || $details.date_created == '0000-00-00'}{$lang.none}{else}{$details.date_created|dateformat:$date_format}{/if}</td>
                            </tr>
                            {if $details.status == 'Active' || $details.status == 'Expired'}
                                <tr>
                                    <td class="w30">{$lang.expirydate}</td>
                                    <td class="w30">
                                        {if !$details.expires || $details.expires == '0000-00-00'}{$lang.none}
                                        {else}{$details.expires|dateformat:$date_format}
                                            {if $details.daytoexpire >= 0}
                                                <small>
                                                    ({$details.daytoexpire} 
                                                    {if $domain.daytoexpire==1}{$lang.day}
                                                    {else}{$lang.days}
                                                    {/if} {$lang.toexpire})
                                                </small>
                                            {/if}
                                        {/if}
                                        {if $allowrenew}
                                            <span class="m-icon"><i class="icon icon-ShoppingCart"></i></span> 
                                            <a href="{$ca_url}clientarea/domains/renew/&ids[]={$details.id}" class="roll-link">
                                                <span data-title="{$lang.renewdomain}">{$lang.renewdomain}</span>
                                            </a>
                                        {/if}
                                    </td>
                                </tr>
                            {/if}
                            {if $details.status == 'Active'}
                                <tr>
                                    <td class="w30"><div>
                                        {$lang.reglock}
										</div><i class="icon-tooltip"></i>
                                    </td>
                                    <td>
                                        {if $details.reglock=='1'}<span class="label label-Active">{$lang.On}</span> 
                                        {else}<span class="labellabel-Pending">{$lang.Off}</span> 
                                        {/if}
                                        {foreach from=$widgets item=widg name=cst}
                                            {if $widg.name=='reglock'}
                                                <span class="m-icon"><i class="icon-sh-password"></i></span> 
                                                <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#reglock" class="roll-link"><span data-title="{assign var=widg_name value="`$widg.name`_widget"}
                                                    {if $lang[$widg_name]}{$lang[$widg_name]}
                                                    {elseif $lang[$widg.name]}{$lang[$widg.name]}
                                                    {elseif $widg.fullname}{$widg.fullname}
                                                    {else}{$widg.name}
                                                    {/if}">                                      {assign var=widg_name value="`$widg.name`_widget"}
                                                    {if $lang[$widg_name]}{$lang[$widg_name]}
                                                    {elseif $lang[$widg.name]}{$lang[$widg.name]}
                                                    {elseif $widg.fullname}{$widg.fullname}
                                                    {else}{$widg.name}
                                                    {/if}</span>
                                                </a>{break}
                                            {/if}
                                        {/foreach}&nbsp;
                                    </td>
                                </tr>
                            {/if}
                            {if !$details.not_renew}
                                <tr>
                                    <td class="w30">
                                        <div>{$lang.autorenew}</div><a href="#"><i class="icon-tooltip"></i></a>
                                    </td>
                                    <td>
                                        {if $details.autorenew=='1'}
                                            <span class="label label-Active">{$lang.On}</span>
                                        {else}
                                            <span class="label label-Pending">{$lang.Off}</span>
                                        {/if}
                                        {foreach from=$widgets item=widg name=cst}
                                            {if $widg.name=='autorenew'}
                                                <span class="m-icon"><i class="icon-renewal inline-block"></i></span> 
                                                <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#autorenew" class="roll-link"><span data-title="{assign var=widg_name value="`$widg.name`_widget"}
                                                    {if $lang[$widg_name]}{$lang[$widg_name]}
                                                    {elseif $lang[$widg.name]}{$lang[$widg.name]}
                                                    {elseif $widg.fullname}{$widg.fullname}
                                                    {else}{$widg.name}
                                                    {/if}">
                                                    {assign var=widg_name value="`$widg.name`_widget"}
                                                    {if $lang[$widg_name]}{$lang[$widg_name]}
                                                    {elseif $lang[$widg.name]}{$lang[$widg.name]}
                                                    {elseif $widg.fullname}{$widg.fullname}
                                                    {else}{$widg.name}
                                                    {/if}
                                                    </span>
                                                </a>
                                                {break}
                                            {/if}
                                        {/foreach}
                                    </td>
                                </tr>
                            {/if}
                        </table>

                        <div class="separator-line"></div>

                        <h4>{$lang.nameservers}</h4>
                        <div class="table-box mt-15 overflow-h">
                            <div class="table-header">
                            </div>
                            <table class="table table-header-fix table-striped p-td">
                                <tr>
                                    <th>{$lang.hostname}</th>
                                    <th>{$lang.ipadd}</th>
                                </tr>
                                {foreach from=$details.nameservers item=ns name=namserver}
                                    {if $ns!=''}
                                        <tr class="no-border">
                                            <td>{$ns}</td>
                                            <td>
                                                {if $details.nsips[$smarty.foreach.namserver.index]}{$details.nsips[$smarty.foreach.namserver.index]}
                                                {/if}
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                                {foreach from=$widgets item=widg name=cst}
                                    {if $widg.name=='nameservers'}
                                        <tr>
                                            <td>
                                                <i class="icon-manage-ns inline-block"></i> 
                                                <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#nameservers">
                                                    {assign var=widg_name value="`$widg.name`_widget"}
                                                    {if $lang[$widg_name]}
                                                        {$lang[$widg_name]}
                                                    {elseif $lang[$widg.name]}
                                                        {$lang[$widg.name]}
                                                    {elseif $widg.fullname}
                                                        {$widg.fullname}
                                                    {else}
                                                        {$widg.name}
                                                    {/if}
                                                </a>
                                            <td></td>
                                        </tr>
                                        {break}
                                    {/if}
                                {/foreach}
                            </table>
                        </div>

                        {if $widget.appendaftertpl}
                            <div class="separator-line"></div>
                            <a name="{$widget.name}"></a>
                            <div class="widget">
                                {include file=$widget.appendaftertpl}
                            </div>
                        {/if}

                        {* eof: if widget replace *}

                    {/if}
                </div>
            </section>
        </div>
    </div>
    {* eof: if details *}
{/if}