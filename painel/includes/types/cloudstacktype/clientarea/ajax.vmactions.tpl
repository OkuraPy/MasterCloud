<div id="lock" {if $VMDetails.locked!='false'}style="display:block"{/if}>
    <img src="includes/types/cloudstacktype/images/ajax-loader.gif" alt=""> {$lang.server_performing_task} <a href="{$service_url}&vpsdo=vmdetails&vpsid={$vpsid}"><b>{$lang.refresh}</b></a>
</div>
<ul id="vm-menu" class="right">
    {if $VMDetails.power=='true'}
        <li>
            <a href="{$service_url}&vpsdo=console&vpsid={$vpsid}&popup=true" class="console_popup">
                <img alt="Console" src="includes/types/cloudstacktype/images/icons/24_terminal.png"><br>{$lang.console}
            </a>
        </li>
        <li>
            <a href="{$service_url}&vpsdo=reboot&vpsid={$vpsid}&security_token={$security_token}" onclick="return confirm('{$lang.sure_to_reboot}?');">
                <img alt="Reboot" src="includes/types/cloudstacktype/images/icons/24_arrow-circle.png"><br>{$lang.reboot}
            </a>
        </li>
    {/if}

    <li>
        <a href="{$service_url}&vpsid={$vpsid}&vpsdo={if $upgrade_poweroff}poweroff&redirect={$upgrade_act}&security_token={$security_token}{else}{$upgrade_act}{/if}" 
           {if $upgrade_poweroff}onclick="return confirm('{$lang.switchoffvmbeforescale} {$lang.sure_to_shutdown}?')"{/if}>
            <img alt="Scale" src="includes/types/cloudstacktype/images/icons/24_equalizer.png"><br>
            {if $upgrade_act=='editvm' && !$VMDetails.flavor_id}{$lang.scale}
            {else}{$lang.upgrade1}
            {/if}
        </a>
    </li>
    <li>
        <a href="{$service_url}&vpsid={$vpsid}&vpsdo=reinstall&security_token={$security_token}" {if $VMDetails.power=='true'}onclick="return confirm('VM has to be switched off before you can rebuild it. {$lang.sure_to_shutdown}?')"{/if}><img alt="Rebuild" src="includes/types/cloudstacktype/images/icons/24_blueprint.png"><br>{$lang.rebuild}</a>
    </li>
    {if $feature.vmsnapshot}
        <li>
            <a href="{$service_url}&vpsid={$vpsid}&vpsdo=vmsnapshot&do=new&security_token={$security_token}" >
                <img alt="Snapshot" src="includes/types/cloudstacktype/images/icons/24_camera.png"><br>{$lang.snapshot}
            </a>
        </li>
    {/if}
    {foreach from=$widgets item=widg}
        <li>
            <a  href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&vpsid={$vpsid}&vpsdo=vmdetails&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}"><img src="{$system_url}{$widg.config.bigimg}" alt=""><br/>{if $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>
        </li>
    {/foreach}
    <li>
        <a {if $provisioning_type=='single'}href="{$ca_url}clientarea&action=services&service={$service.id}&cid={$service.category_id}&cancel"{else} href="{$service_url}&vpsdo=destroy&vpsid={$vpsid}&security_token={$security_token}" onclick="return  confirm('{$lang.sure_to_destroy}?')" {/if}>
            <img alt="Delete" src="includes/types/cloudstacktype/images/icons/24_cross.png"><br>{if $provisioning_type=='single'}{$lang.cancelvps}{else}{$lang.delete}{/if}
        </a>
    </li>
</ul>
<div class="clear"></div>
<div id="new-vm-state" style="display: none;">
    {include file="`$cloudstackdir`ajax.vmstatus.tpl" vm=$VMDetails}
</div>
<script type="text/javascript">
    {if $VMDetails.rootpassword && $VMDetails.rootpassword != '_pending_reset_'}
        {literal}
            if ($('#rootpss').length) {
                $('#rootpss').text('{/literal}{$VMDetails.rootpassword}{literal}');
            } else {
                $('#rootpsstd').html(['<a href="#" onclick="$(this).hide();$(\'#rootpss\').show();return false;" class="highlight-danger">{/literal}{$lang.show}{literal}</a>',
                    '<span id="rootpss" style="display:none">{/literal}{$VMDetails.rootpassword}{literal}</span>'].join(''));
            }
        {/literal}
    {/if}
    {if $VMDetails.locked!='false'}
        {literal}
            var wx = setTimeout(function () {
                $.post('{/literal}{$service_url}&vpsid={$vpsid}{literal}', {vpsdo: 'vmactions'}, function (data) {
                            var r = parse_response(data);
                            if (r)
                                $('#lockable-vm-menu').html(r);
                        });
                    }, 4000);
        {/literal}
    {/if}
    {literal}
        
            (function () {
                var status = $('#vm-power .iphone_switch');

                if (status.data('tooltip'))
                    status.data('tooltip').hide();
                status.replaceWith($('#new-vm-state .iphone_switch'));
            })()

            $(function () {
                $('a.console_popup').click(function (event) {
                    var width = window.screen.availWidth < 1044 ? window.screen.availWidth : 1044,
                        height = window.screen.availHeight < 810 ? window.screen.availHeight : 810;
                    console.log(width, height);
                    window.open($(this).attr('href'), 'popup', 'width='+width+',height='+height+',scrollbars=0,resizable=1,toolbar=0,directories=0,location=0,menubar=0,status=0,left=50,top=50');
                    return false;
                });
            })
    {/literal}
</script>

