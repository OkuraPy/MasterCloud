
<table class="data-table backups-list"  width="100%" cellspacing=0>

    <thead>
        <tr>
            {if $advanced}
                <td>{if $vpsdo!='egressfirewall'}IP{/if}</td>
                <td>{$lang.protocol}</td>
                <td>{$lang.startport}</td>
                <td>{$lang.endport}</td>
                <td>CIDR</td>
                <td>&nbsp;</td>
            {else}
                <td>{$lang.type}</td>
                <td>{$lang.protocol}</td>
                <td>{$lang.startport}</td>
                <td>{$lang.endport}</td>
                <td>CIDR</td>
                <td>&nbsp;</td>
            {/if}
        </tr>
    </thead>
    {foreach item=rule from=$firewall.advanced name=ruleloop}

        <tr>
            <td>{$rule.ipaddress}</td>
            <td>{$rule.protocol|upper}</td>
            <td>{if $rule.protocol=='ICMP'}{$lang.type}: {$rule.icmptype}{else}{if $rule.startport}{$rule.startport}{else}-{/if}{/if}</td>
            <td>{if $rule.protocol=='ICMP'}{$lang.code}: {$rule.icmpcode}{else}{if $rule.endport}{$rule.endport}{else}-{/if}{/if}</td>
            <td>{$rule.cidrlist}</td>
            <td  class="text-right">
                <a class="small_control small_delete fs11" onclick="return confirm('{$lang.areyousureremoverule}')" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo={$vpsdo}{if $vpsid}&vpsid={$vpsid}{/if}&rule={$rule.id}&do=ruledrop&security_token={$security_token}{if $ip_id}&ipid={$ip_id}{/if}">{$lang.remove}</a>
            </td>
        </tr>

    {/foreach}

    {foreach item=rule from=$firewall.ingress name=ruleloop}

        <tr>
            <td>{$lang.ingress}</td>
            <td>{$rule.protocol|upper}</td>
            <td>{if $rule.protocol=='ICMP'}{$lang.type}: {$rule.icmptype}{else}{$rule.startport}{/if}</td>
            <td>{if $rule.protocol=='ICMP'}{$lang.code}: {$rule.icmpcode}{else}{$rule.endport}{/if}</td>
            <td>{$rule.cidr}</td>
            <td  class="text-right">
                <a class="small_control small_delete fs11" onclick="return confirm('{$lang.areyousureremoverule}')" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=firewall{if $vpsid}&vpsid={$vpsid}{/if}&rule={$rule.ruleid}&do=ruledrop&security_token={$security_token}&ruletype=ingress">{$lang.remove}</a>
            </td>
        </tr>
    {/foreach}
    {foreach item=rule from=$firewall.engress name=ruleloop}
        <tr>
            <td>{$lang.engress}</td>
            <td>{$rule.protocol|upper}</td>
            <td>{if $rule.protocol=='ICMP'}{$lang.type}: {$rule.icmptype}{else}{$rule.startport}{/if}</td>
            <td>{if $rule.protocol=='ICMP'}{$lang.code}: {$rule.icmpcode}{else}{$rule.endport}{/if}</td>
            <td>{$rule.cidr}</td>
            <td  class="text-right">
                <a class="small_control small_delete fs11" onclick="return  confirm('{$lang.areyousureremoverule}')" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=firewall{if $vpsid}&vpsid={$vpsid}{/if}&rule={$rule.ruleid}&do=ruledrop&security_token={$security_token}&ruletype=engress">{$lang.remove}</a>
            </td>
        </tr>
    {/foreach}
    {if !$firewall.ingress && !$firewall.engress && !$firewall.advanced}
        <tr><td colspan="6">{$lang.nothing}</td></tr>
        {/if}
</table>


<div class="clear"></div>
{if !$advanced || ($vpsdo=='egressfirewall' && $networkids) || ($vpsdo=='firewall' && $ips)}
    {include file="`$cloudstackdir`firewall_form.tpl"}
    {if $feature.firewallpreset && $vpsdo=='firewall' && $ips}
        <div>
            <h3 class="summarize">{$lang.presets}</h3>
            <div id="widget-presets" class="spacing-medium">
                {$lang.loadingpresets} <img src="includes/types/cloudstacktype/images/ajax-loader.gif" alt="..."/> 
            </div>
            <form action="" method="post" id="presetform">
                <input type="hidden" name="widget" value="{$fwidgets.firewallpreset.name}" />
                <input type="hidden" name="wid" value="{$fwidgets.firewallpreset.id}" />
                <input type="hidden" name="networkid" value="" />
                <input type="hidden" name="ip" value="" />
                <input type="hidden" name="use" value="" />
                {securitytoken}
            </form>
        </div>
        {literal}
            <script type="text/javascript">
                (function() {
                    var box = $('#widget-presets'),
                        ip = $('#formaddrule [name=ip]'),
                        network = $('#formaddrule [name=networkid]'),
                        form = $('#presetform');

                    $.get('{/literal}?cmd=clientarea&action=services&service={$service.id}&vpsdo=firewall{if $vpsid}&vpsid={$vpsid}{/if}&widget={$fwidgets.firewallpreset.name}&wid={$fwidgets.firewallpreset.id}{literal}', function(resp) {
                        box.html('');
                        if (resp && resp.presets && resp.presets.length) {
                            for (var i = 0; i < resp.presets.length; i++) {
                                box.append('<a href="#' + resp.presets[i] + '" class="widget-label" >' + resp.presets[i] + '</a> ');
                            }
                        } else {
                            box.html('{/literal}{$lang.nothing}{literal}');
                        }
                    })
                    box.on('click', 'a', function() {
                        if (network.length)
                            form.find('[name=networkid]').val(network.val());
                        if (ip.length)
                            form.find('[name=ip]').val(ip.val());
                        form.find('[name=use]').val($(this).text());
                        form.submit();
                        return false;
                    })
                })()
            </script>
        {/literal}
    {/if}
    {literal}
        <script type="text/javascript">
            $(function() {
                $('select[name=protocol]').change();
            })
        </script>
    {/literal}
{/if}