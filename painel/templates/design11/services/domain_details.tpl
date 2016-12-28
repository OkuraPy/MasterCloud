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
        {*}
        <h2 class="lite color-sky-blue">{$details.name}</h2>
        <h5>{$lang.domdetails}</h5>
        
        {include file="menus/menu.sub.loc.tpl" inside=true}
        {*}
        <div id="client_menu">
            {include file="services/domain_sidemenu.tpl"}

            <section id="cmenu_content" class="span9">

                <div class="cmenu_header"><span>{$lang.mydetails}</span></div>

                {if $widget.appendtpl}
                    <div class="spacing">
                        <div class="widget">
                            {include file=$widget.appendtpl}
                        </div>
                    </div>
                {/if}

                {if $widget.replacetpl}
                    <div class="spacing">
                        <div class="widget">
                            {include file=$widget.replacetpl}
                        </div>
                    </div>
                {else}
                    <div class="spacing">
                        <h4>{$lang.domain}</h4>
                        <div class="top_divider"></div>
                        <div class="row-fluid">
                            <span class="label flat-ui-label label-{$details.status}">{$lang[$details.status]}</span> 
                            <a href="http://{$details.name}" target="_blank" ><span>{$details.name}</span></a>
                        </div>
                        <div class="row-fluid" style="margin-top:30px;">
                            <div class="span4">
                                <h5>{$lang.registrationdate}</h5>
                                <div class="top_divider"></div>
                                <span>{if !$details.date_created || $details.date_created == '0000-00-00'}{$lang.none}{else}{$details.date_created|dateformat:$date_format}{/if}</span>
                            </div><!-- /span4-->
                            {if $details.status == 'Active' || $details.status == 'Expired'}
                                <div class="span8">
                                    <h5>{$lang.expirydate}</h5>
                                    <div class="top_divider"></div>
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
                                        <span class="m-icon"><i class="icon-shopping-cart"></i></span> 
                                        <a href="{$ca_url}clientarea/domains/renew/&ids[]={$details.id}" class="roll-link">
                                            <span data-title="{$lang.renewdomain}">{$lang.renewdomain}</span>
                                        </a>
                                    {/if}
                                </div><!-- /span8-->   
                            {/if}
                        </div>
                        {if $details.status == 'Active'}
                            <div class="row-fluid" style="margin-top:30px; margin-bottom:30px;">
                                <div class="span6">
                                    <h5>{$lang.reglock} &nbsp;&nbsp;<span class="vtip_description" title="{$lang.autorenew_desc}"></span></h5>
                                    <div class="top_divider"></div>
                                    {if $details.reglock=='1'}<span href="#" class="btn btn-on">{$lang.On}</span>
                                    {else}<span href="#" class="btn btn-on">{$lang.Off}</span>
                                    {/if}
                                    {foreach from=$widgets item=widg name=cst}
                                        {if $widg.name=='reglock'}
                                            <span class="m-icon"><i class="icon-sh-password"></i></span> 
                                            <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#reglock" class="roll-link">
                                                <span data-title="{assign var=widg_name value="`$widg.name`_widget"}
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
                                </div><!-- /span6-->
                                {if !$details.not_renew}
                                    <div class="span6">
                                        <h5>{$lang.autorenew} &nbsp;&nbsp;<span class="vtip_description" title="{$lang.autorenew_desc}"></span></h5>
                                        <div class="top_divider"></div>
                                        {if $details.autorenew=='1'}
                                            <span  class="btn btn-on">{$lang.On}</span>
                                        {else}
                                            <span  class="btn btn-off">{$lang.Off}</span>
                                        {/if}
                                        {foreach from=$widgets item=widg name=cst}
                                            {if $widg.name=='autorenew'}
                                                <span class="m-icon"><i class="icon-renewal inline-block"></i></span> 
                                                <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#autorenew" class="roll-link">
                                                    <span data-title="{assign var=widg_name value="`$widg.name`_widget"}
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
                                    </div><!-- /span6-->   
                                {/if}
                                {if $details.offerprotection}
                                    <div class="span6">
                                        <h5>
                                            {$lang.privacyprotection} &nbsp;&nbsp; <span class="vtip_description" title="{$lang.privacyprotection_desc}"></span>
                                        </h5>
                                        <div class="top_divider"></div>
                                        {if $details.offerprotection.enabled}
                                            <span class="btn btn-on">{$lang.On}</span>
                                        {else}
                                            <span class="btn btn-off">{$lang.Off}</span>
                                        {/if}

                                        {if $details.offerprotection.purchased}
                                            {foreach from=$widgets item=widg name=cst}
                                                {if $widg.name=='idprotection'}
                                                    <span class="m-icon"><i class="icon-sh-password inline-block"></i></span> 
                                                    <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#autorenew" class="roll-link">
                                                        <span data-title="{assign var=widg_name value="`$widg.name`_widget"}
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
                                        {else}
                                            <span class="m-icon"><i class="icon-sh-password inline-block"></i></span> 
                                            <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&make=domainaddons"><span>{$lang.addprivacy}</span></a>
                                                {/if}
                                    </div>
                                {/if}

                            </div>

                            <div class="cmenu_header"><span>{$lang.nameservers}</span></div>

                            <table class="table table-striped">
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
                            <div class="spacing">

                                {if $widget.appendaftertpl}
                                    <div class="separator-line"></div>
                                    <a name="{$widget.name}"></a>
                                    <div class="widget">
                                        {include file=$widget.appendaftertpl}
                                    </div>
                                {/if}

                                {* eof: if widget replace *}
                            </div>
                        {/if}
                    {/if}
            </section>
        </div>
    </div>
    {* eof: if details *}
{/if}
