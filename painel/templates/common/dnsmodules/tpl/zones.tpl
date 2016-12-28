{if $service.status=='Active'}
    {literal}
        <script type="text/javascript">
            $(function () {
                if ($('#cont').length) {
                    var ch = $('#more_list').parents('#cont').height()
                    while ($('#more_list').height() > ch)
                        $('#more_list').width($('#more_list').width() + 1);
                }


                $('.idchecker').click(function () {
                    if ($('.idchecker:checked').length < 1)
                        unbind_ico();
                    else
                        bind_ico();
                });
                unbind_ico();

                $(document).click(function (event) {
                    if ($('#more_list:visible').length && !$(event.target).parents('#more_icon').length && !$(event.target).is('#more_icon').length) {
                        $("#more_list").hide();
                    }
                });
            });
            function switchRenew(el, id) {
                ajax_update("{/literal}{$ca_url}clientarea/services/{$service.slug}/{$service.id}/{literal}", {did: id, make: 'renewstate', state: $(el).hasClass('off') ? 1 : 0}, function (a) {
                            $(el).toggleClass('off');
                        });
                        return false;
                    }
                    function bind_ico() {
                        $('.icons ul a:[href]').unbind().click(function () {
                            var ids = $('.idchecker:checked').serialize();
                            if (ids == '') {
                                return false;
                            }
                            window.location = $(this).attr('href') + '&' + ids;
                            return false;
                        });
                        $('.icons > ul > li > a:last').unbind().click(function () {
                            $('#more_list').toggle();
                        });
                        $('.icons > ul > li').removeClass('disabled');
                    }
                    function unbind_ico() {
                        $('.icons > ul > li > a:last').unbind().click(function () {
                            return false
                        });
                        $('.icons ul a:[href]').unbind().click(function () {
                            return false
                        });
                        $('.icons > ul > li').addClass('disabled');
                    }
        </script>
    {/literal}
    {if $widget.appendtpl}
        {include file=$widget.appendtpl}
    {/if}

    {include file='../common/dnsmodules/upgrades.tpl'}

    <div class="icons">
        <div class="left dwarrow">{$lang.withdomains}</div>  

        <ul class="right">
            {if $dns_templates}
                <li class="disabled">
                    <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=dns_templates" >
                        <img src="{$type_dir}icons/ico-renew.png" alt="">
                        <span>{$lang.dnstemplates}</span>
                    </a>
                </li> 
            {/if}
            <li class="disabled">
                <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=add_record&type=A" >
                    <img src="{$type_dir}icons/ico_domains2.jpg" alt="">
                    <span>{$lang.addrecorda}</span>
                </a>
            </li> 
            <li class="disabled">
                <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=add_record&type=MX" >
                    <img src="{$type_dir}icons/email_foward.png" alt="">
                    <span>{$lang.addentrymx}</span>
                </a>
            </li>
            <li class="disabled">
                <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=add_record&type=CNAME" >
                    <img src="{$type_dir}icons/foward.png" alt="">
                    <span>{$lang.addaliasname}</span>
                </a>
            </li>
            <li class="disabled">
                <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=clone_record" >
                    <img src="{$type_dir}icons/ico_invoices2.jpg" alt="">
                    <span>{$lang.clonesettingsdns}</span>
                </a>
            </li>
            <li class="disabled" id="more_icon">
                <a>
                    <img src="{$type_dir}icons/ico_resources.png" alt="">
                    <span>{$lang.more}</span>
                </a>
                <ul style="display:none" id="more_list">
                    {foreach from=$supp_type item=stype}
                        {if $stype != 'MX' && $stype != 'A' && $stype != 'CNAME'}
                            <li><a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=add_record&type={$stype}">{$lang.Add} {$stype} {$lang.record}</a></li>
                            {/if}
                        {/foreach}
                </ul>
            </li>
        </ul>
        <div class="clear"></div>
    </div>
    <form action="" method="POST">
        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="display">
            <thead>
                <tr>
                    <th width="20">
                        <input type="checkbox" {literal}onclick="if (this.checked && $('.idchecker').length) {
                                    $('.idchecker').attr('checked', true);
                                    bind_ico();
                                } else {
                                    $('.idchecker').attr('checked', false);
                                    unbind_ico();
                                }"{/literal} />
                    </th>
                    <th align="left">{$lang.domain}</th>
                    <th width="150">{$lang.creationdate}</th>
                        {if $metered_enable}
                        <th width="80">{$lang.price}</th>
                        {/if}
                    <th width="20"></th>
                </tr>
            </thead>

            {if $user_domains}	
                <tbody>
                    {foreach from=$user_domains item=domain name=row}
                        <tr {if  $smarty.foreach.row.index%2 == 0}class="even"{else}class="odd"{/if}>
                            <td width="20"><input class="idchecker" type="checkbox" onclick="" name="dom[]"  value="{$domain.$domain_indent}"/></td>
                            <td align="left"><a  href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=dns_manage&domain_id={$domain.$domain_indent}">{$domain.domain}</a></td>
                            <td>{if $domain.created}{$domain.created|dateformat:$date_format}{else}-{/if}</td>
                            {if $metered_enable}
                                <td>{if $domain.charge}{$domain.charge|price:$domain.currency_id}{else}-{/if}</td> 
                            {/if}
                                <!--<td><a class="autorefreash {if $domain.qty==0}off{/if}" href="#" onclick="return switchRenew(this,'{$domain.id}')" title="{$lang.autorenew}: {if $domain.qty==0}{$lang.Off}{else}{$lang.On}{/if}"></a></td>-->
                            <td><a title="{$lang.delete}" onclick="return confirm('{$lang.suretoremovedomain}');" href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&did={$domain.$domain_indent}&make=removedomain" class="deleteico icon-trash"> </a></td>
                        </tr>
                    {/foreach}
                </tbody>

                <tbody>
                    <tr>
                        <th colspan="{if $metered_enable}2{else}4{/if}" style="font-weight:normal">{$lang.domainscount}:  <b {if $dom_limit && $user_domains_cnt==$dom_limit}style="color:red"{/if}>{$user_domains_cnt}</b>{if $dom_limit!="disabled"} {$lang.maxallowed}: <b>{$dom_limit}</b>{/if}</th>
                            {if $metered_enable}
                            <th style="text-align:right">{$lang.total}:</th>
                            <th colspan="2" > <b>{$service.metered_total|price:$currency}</b></th>
                            {/if}
                    </tr>
                </tbody>
            {else}
                <tbody>
                    <tr>
                        <td colspan="{if $metered_enable}5{else}4{/if}" align="center">{$lang.nodomainsaddedyet}</td>
                    </tr>
                </tbody>
            {/if}
        </table>
        <table border="0" width="100%">
            <tr>
                <td >
                    {if $dom_limit && $dom_limit!='unlimited' && $dom_limit!="disabled" && $user_domains_cnt>=$dom_limit}
                        <span class="fs11" style="color:red">{$lang.youvereachedyourdomainslimit}</span>
                    {elseif $dom_limit!="disabled"}
                        <a class="btnx btn_dS fl" href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=add_domain">{$lang.adddomain}</a>
                    {/if}
                </td>
                <td  style="text-align: right">
                    {if $metered_enable}
                        {if $next_price} 
                            {$lang.yourcurrentpricenextdomainis} {$next_price|price:$currency}
                        {/if} 
                        <a href="#" onclick="$('#mpricing').toggle();
                                return false">{$lang.viewpricing}</a>
                    {/if}
                </td>
            </tr>
        </table>
    {/if}

    <div class="wbox" style="margin-top:30px;">
        <div class="wbox_header">{$lang.billing_info}</div>
        <div class="wbox_content">
            <table cellspacing="0" cellpadding="0" class="checker table" width="100%">
                <tr >
                    <td style="border:none; text-align: right"><b>{$lang.status}</b></td>
                    <td style="border:none;">
                        <span class="{$service.status} label label-{$service.status}">{$lang[$service.status]}</span>
                        {if $upgrades && $upgrades!='-1'}
                            <small><a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&make=upgrades&upgradetarget=service" class="lmore">{$lang.UpgradeDowngrade}</a></small>
                            {/if}
                    </td>

                    {if $service.billingcycle!='Free' && $service.billingcycle!='Once' && $service.billingcycle!='One Time' && $service.next_due!='' && $service.next_due!='0000-00-00'}
                        <td style="border:none;text-align: right"><b>{$lang.nextdue}</b></td>
                        <td style="border:none;">{$service.next_due|dateformat:$date_format}</td>
                    </tr><tr>
                        <td style="border:none;text-align: right"><b>{if $metered_enable}{$lang.curbalance}{else}{$lang.reccuring_amount}{/if}</b></td>
                        <td style="border:none;">
                            {if $metered_enable}
                                {$user_domains_cnt} {$lang.domains} * {$curent_price|price:$currency}/{$lang.domain} = <b>{$summary.charge|price:$currency}</b>
                            {else}
                                {$service.total|price:$currency}
                            {/if}
                        </td>
                    {/if}
                    {if $service.status!='Terminated' && $service.status!='Cancelled'}
                        <td style="border:none;text-align: right">
                            <a href="{$ca_url}clientarea&action=services&service={$service.id}&cid={$service.category_id}&cancel" style="color:red">
                                <span class="cancel">{$lang.cancelrequest}</span>
                            </a>
                        </td>
                    {/if}
                </tr>
            </table>

            {if $service.custom}
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="table table-striped fullscreen" >
                    {foreach from=$service.custom item=cst}
                        <tr >
                            <td align="right" width="160"><strong>{$cst.name}</strong>  </td>
                            <td>{include file=$cst.configtemplates.clientarea} </td>
                        </tr>
                    {/foreach}
                </table>
            {/if}

            <div id="mpricing" style="display:none">
                <table border="0" cellspacing="0" cellpadding="0" width="100%" class="checker table table-striped " >
                    {foreach from=$pricebrackets item=bracket}
                        {foreach from =$bracket.prices item=p key=k name=bloop}
                            <tr {if $smarty.foreach.bloop.index%2==0}class="even"{/if}>
                                <td width="20"></td>
                                <td >{$lang.from} {$p.qty} {$bracket.unit_name}</td>
                                <td >{if $p.qty_max>0}{$lang.to} {$p.qty_max} {$bracket.unit_name}{else} {$lang.to} <b>{$lang.unlimited}</b>{/if}</td>
                                <td >{$p.price|price:$currency} / {$lang[$service.billingcycle]}</td>
                            </tr>
                        {/foreach}
                    {/foreach}
                </table>
            </div>
        </div>
    </div>

    {if $service.status=='Active'}
        {if $nameserv}
            <div class="wbox" style="margin-top:30px;">
                <div class="wbox_header">{$lang.updateyourdomainregistrarsnameserve}</div>
                <div class="wbox_content">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%" >
                        <tr>
                            <td width="50%" style="padding-right:10px;">
                                <ul style="" class="listi">
                                    <li>{$lang.dnsguideline1}</li>
                                    <li>{$lang.dnsguideline2}</li>
                                    <li>{$lang.dnsguideline3}</li>
                                    <li>{$lang.dnsguideline4}</li>
                                </ul>
                            </td>
                            <td valign="top">
                                <table cellspacing="0" cellpadding="0" class="checker table table-striped table-bordered" width="100%">
                                    <tr>
                                        <th style="text-align: left">{$lang.hostname}</th><th  style="text-align: left">{$lang.ipadd} </th>
                                    </tr>
                                    {foreach from=$nameserv item=ns name=namserver}
                                        {if $ns!=''}
                                            <tr {if $smarty.foreach.namserver.index%2==0}class="even"{/if}>
                                                <td>{$ns.name}</td>
                                                <td>{$ns.ip}</td>
                                            </tr>
                                        {/if}
                                    {/foreach}
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        {/if}
    {/if}
</form>