{literal}
    <script type="text/javascript">
    function remove_domain(domain) {
        $('.domain-row-'+domain).addClass('shownice');
        if(confirm("{/literal}{$lang.itemremoveconfirm}{literal}")) {
             $('.domain-row-'+domain).remove();
            $('#cartSummary').addLoader();
            ajax_update('?cmd=cart&step=2&do=removeitem&target=domain',{target_id:domain},'#cartSummary');
                if($('.domain-row').length<1) {
                    window.location='?cmd=cart';
                }
        }

        $('.domain-row-'+domain).removeClass('shownice');
	return false;
   }
       function bulk_periods(s) {
            $('.dom-period').each(function(){
                $(this).val($(s).val());
            });
            $('.dom-period').eq(0).change();
                
        }
       function change_period(domain) {
           var newperiod=1;
               newperiod = $('#domain-period-'+domain).val();
             $('#cartSummary').addLoader();
            ajax_update('?cmd=cart&step=2&do=changedomainperiod',{key:domain,period:newperiod},'#cartSummary');
            return false;
        }
        function insert_singupform(el){
            $.get('?cmd=signup&contact&private',function(resp){
                resp = parse_response(resp);
                var pref = $(el).attr('name');
                //$(el).removeAttr('name').attr('rel', pref);
                $(resp).find('input, select, textarea').each(function(){
                    $(this).attr('name', pref+'['+$(this).attr('name')+']');                       
                }).end().appendTo($(el).siblings('.sing-up'));
            });
        }
    </script>
    <style>
        .lh28{
            line-height: 30px    
        }
    </style>
{/literal}
<form action="" method="post" id="cart3">
<input type="hidden" name="make" value="domainconfig" />
    <div class="wbox">
        <div class="wbox_header">
	<strong>{$lang.productconfig2}</strong>
        </div>
        <div class="wbox_content">


            <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="checker">

                <tbody>
                    <tr>
                        <th width="75%" align="left">{$lang.domain}</th>
                        <th width="30%">{$lang.period}</th>
                        <th width="5%">&nbsp; </th>
                    </tr>
             

                {foreach from=$domain item=doms key=kk name=domainsloop}
                     <tr class="domain-row-{$kk} domain-row {if $smarty.foreach.domainsloop.index%2==0}even{/if}">
                         <td style="border:none;">
                             <strong>{$doms.name}</strong><input type="hidden" value="{$kk}" name="domkey[]" />
                        </td>
                        <td style="border:none;" align="center">
                            <select name="period[{$kk}]" id="domain-period-{$kk}" class="dom-period" onchange="if(typeof (simulateCart)=='function') simulateCart('#cart3')" >
                                {foreach from=$doms.product.periods item=period key=p}
                                <option value="{$p}" {if $p==$doms.period}selected="selected"{/if}>{$p} {$lang.years}</option>
                                {/foreach}
                            </select>
                        </td>
                        <td style="border:none;"  align="center"><a href="#" onclick="return remove_domain('{$kk}')" ><img src="{$orderpage_dir}images/cross-small.png" alt="" /></a></td>
                    </tr>
                    
                    {if !$renewalorder && $doms.custom}
                            {foreach from=$doms.custom item=cf}
                            {if $cf.items}
                            <tr  class="domain-row-{$kk}  domain-row  {if $smarty.foreach.domainsloop.index%2==0}even{/if}">
                                <td colspan="3" class="configtd" >

                                            <label for="custom[{$cf.id}]" class="styled">{$cf.name} {if $cf.options & 1}*{/if}</label>
                                            {if $cf.description!=''}<div class="fs11 descr" style="">{$cf.description}</div>{/if}

                                             {include file=$cf.configtemplates.cart}

                                    </td>
                            </tr>
                            {/if}
                            {/foreach}

                    {/if}
                        {if $doms.action=='transfer'}
                        {if $doms.product.epp=='1'}
                            <tr  class="domain-row-{$kk}  domain-row  {if $smarty.foreach.domainsloop.index%2==0}even{/if}" >
                                <td colspan="3"  style="border:none" class="configtd">
                                <label for="epp{$kk}" class="styled"> {$lang.eppcode}*</label>
                                           <input name="epp[{$kk}]"  id="epp{$kk}" value="{$doms.epp}" class="styled" />

                                    </td>
                            </tr>

                        {else}
                                    <input name="epp[{$kk}]"  type="hidden" value="not-required"/>
                        {/if}
                        {/if}
                    {if !$smarty.foreach.domainsloop.last}<tr  class="domain-row-{$kk}  domain-row  {if $smarty.foreach.domainsloop.index%2==0}even{/if}">
                        <td colspan="3" style="height:8px;padding:0px;line-height:8px;">&nbsp; </td>
                    </tr>
                    {/if}
                {/foreach}
                </tbody>
            </table>


        </div></div>
{if !$renewalorder}
<input type="hidden" name="usens" value="{if $usens=='1'}1{else}0{/if}" id="usens" />
<div class="wbox" {if $usens && $product && !$periods}style="display:none"{/if}>
        <div class="wbox_header">
            <strong>{$lang.edit_config}</strong>
        </div>
        <div class="wbox_content">
            <table cellspacing="0" cellpadding="0" border="0" class="styled">
                <colgroup class="firstcol"></colgroup>
                <colgroup class="alternatecol"></colgroup>

                <tr id="setnservers" {if $usens=='1'}style="display:none"{/if}>
                    <td width="180"><b>{$lang.cart2_desc4}</b> <span title="{$lang.cart2_desc3} " class="vtip_description"></span></td>
                    <td><a href="#" onclick="$(this).parents('tr').eq(0).hide();$('#usens').val(1);$('#nameservers').slideDown();return false">{$lang.iwantminens}</a></td>
                </tr>

                {if $periods}
                 <tr >
                    <td width="180"><b>{$lang.cart2_desc5}</b> <span title="{$lang.cart2_desc2}" class="vtip_description"></span></td>
                    <td><select onchange="bulk_periods(this)">
                        {foreach from=$periods item=period key=p}
                            <option value="{$p}">{$p} {$lang.years}</option>
                            {/foreach}
                        </select></td>
                </tr>

                {/if}

               {if !$product}
                <tr>
                     <td><b>{$lang.nohosting}</b> <span title="{$lang.cart2_desc1}" class="vtip_description"></span></td>
                     <td><a href="{$ca_url}cart&step=0&addhosting=1">{$lang.clickhere1}</a></td>
                </tr>
            {/if}
            </table>
</div></div>
     <div class="wbox" id="nameservers" {if !$usens}style="display:none"{/if}>
        <div class="wbox_header">
            <strong>{$lang.nameservers}</strong>
        </div>
        <div class="wbox_content">
            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
                    <colgroup class="firstcol"></colgroup>
                    <colgroup class="alternatecol"></colgroup>
                    <tr><td width="20%"><strong>{$lang.nameserver} 1</strong></td><td><input name="ns1" style="width:60%" value="{$domain[0].ns1}" class="styled"/></td></tr>
{if $domain[0].nsips}<tr><td width="20%"><strong>{$lang.nameserver} IP 1</strong></td><td><input name="nsip1" style="width:60%" value="{$domain[0].nsip1}" class="styled"/></td></tr>{/if}
                    <tr><td><strong>{$lang.nameserver} 2</strong></td><td> <input name="ns2" style="width:60%" value="{$domain[0].ns2}"  class="styled"/></td></tr>
{if $domain[0].nsips}<tr><td width="20%"><strong>{$lang.nameserver} IP 2</strong></td><td><input name="nsip2" style="width:60%" value="{$domain[0].nsip2}" class="styled"/></td></tr>{/if}
                    <tr><td><strong>{$lang.nameserver} 3</strong></td><td><input name="ns3" style="width:60%" value="{$domain[0].ns3}"  class="styled"/></td></tr>
{if $domain[0].nsips}<tr><td width="20%"><strong>{$lang.nameserver} IP 3</strong></td><td><input name="nsip3" style="width:60%" value="{$domain[0].nsip3}" class="styled"/></td></tr>{/if}
                    <tr><td><strong>{$lang.nameserver} 4</strong></td><td><input name="ns4" style="width:60%" value="{$domain[0].ns4}" class="styled" /></td></tr>
{if $domain[0].nsips}<tr><td width="20%"><strong>{$lang.nameserver} IP 4</strong></td><td><input name="nsip4" style="width:60%" value="{$domain[0].nsip4}" class="styled"/></td></tr>{/if}
                </table>

            <a href="#" onclick="$('#nameservers').slideUp();$('#setnservers').show();$('#usens').val(0);return false">{$lang.useourdefaultns}</a>
            
</div></div>

<input type="hidden" name="contactsenebled" value="1"  />
<div class="wbox" >
    <div class="wbox_header">
        <strong>{$lang.domcontacts}</strong>
    </div>
    <div class="wbox_content contacts">
        {include file="common/contacts.tpl"}
    </div>
</div>
{/if}
    <div class="orderbox"><div class="orderboxpadding"><center><input type="submit" value="{$lang.continue}" style="font-size:12px;font-weight:bold"  class="padded btn  btn-primary"/></center></div></div>
</form>
