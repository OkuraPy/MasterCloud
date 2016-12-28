
<form action="" method="post" id="formaddrule">
    <input type="hidden" name="do" value="addrule"/>
    {if $ip_id}
        <input type="hidden" name="ipid" value="{$ip_id}"/>
    {/if}
    <br/><h3> {$lang.addrule}: </h3>
    <table id="addrule" class="data-table backups-list form-horizontal"  width="100%" cellspacing="0" >
        <tr>
            <td>
                <b>IP</b><br/>
                {if !$ip_id}
                    <select name="ip" class="width-auto">
                        {foreach from=$ips item=ip}
                            <option {if $submit.ip == $ip.id}selected="selected"{/if} value="{$ip.id}" data-networkid="{$ip.associatednetworkid}">{$ip.address}</option>
                        {foreachelse}
                            <option value="">{$lang.none}</option>
                        {/foreach}
                    </select>
                {else}
                    {foreach from=$ips item=ip}
                        {if $ip_id == $ip.id}
                            <input type="hidden" name="ip" value="{$ip.id}" />
                            {$ip.address}
                        {/if}
                    {/foreach}
                {/if}
            </td>
            <td >
                <b>{$lang.name}:</b><br/>
                <input name="name" value="{$submit.name}" size="12" required class="width-auto"/> 
            </td>
            <td >
                <b>{$lang.publicport}:</b><br/>
                <input name="publicport" value="{$submit.publicport}" size="4" required class="width-auto"/> 
            </td>
            <td >
                <b>{$lang.privateport}:</b><br/>
                <input name="privateport" value="{$submit.privateport}" size="4" required class="width-auto"/>
            </td>
            <td >
                <b>{$lang.algorithm}:</b><br/>
                <select class="width-auto" name="algorithm">
                    <option {if $submit.algorithm == "roundrobin"}selected="selected"{/if} value="roundrobin">{$lang.roundrobin}</option>, 
                    <option {if $submit.algorithm == "leastconn"}selected="selected"{/if} value="leastconn">{$lang.leastconnections}</option>, 
                    <option {if $submit.algorithm == "source"}selected="selected"{/if} value="source">{$lang.source}</option>
                </select>
            </td>
            <td >
                <b>{$lang.stickiness}</b><br/>
                <button class="btn btn-mini btn-default" data-type="stickiness" >{$lang.configure}</button>
            </td>
            <td >
                <b>{$lang.helthcheck}</b><br/>
                <button class="btn btn-mini btn-default" data-type="healthcheck" >{$lang.configure}</button>
            </td>
            <td >
                <b>{$lang.vmassigment}:</b><br/>
                <button class="btn btn-mini btn-success" data-type="instances" >{$lang.Add}</button><br><br>
                <input type="submit" value="{$lang.submit}" class="blue" />
            </td>
        </tr>
    </table>
    {securitytoken}
</form>