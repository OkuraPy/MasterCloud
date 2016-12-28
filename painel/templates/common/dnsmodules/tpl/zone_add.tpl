
{literal}
    <script type="text/javascript">

        function sh_option(val) {
            $('.sh_option').hide();
            $('#option_' + val).show();
        }

    </script>
{/literal}
<form action="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&act=add_domain" method="POST">
    <div class="wbox"><div class="wbox_header"><strong>{$lang.addzone}</strong></div>
        <div class="wbox_content">
            <table width="98%" cellspacing="0" border="0" class="checker">
                <tr>
                    <td width="145"><b>{$lang.domain}:</b></td>
                    <td><input type="text" name="domain" value="" class="styled" style="font-size:16px"/></td>
                    <td style="color:#808080">{$lang.enter_domain_name} 'example.com'</td>
                </tr>
                {if $require_ip}
                    <tr>
                        <td width="145"><b>{$lang.ipadd}</b></td>
                        <td><input type="text" name="ipaddress" value="" class="styled" style="font-size:16px"/></td>
                        <td style="color:#808080"></td>
                    </tr>
                {/if}
                {if $user_domains || $dns_templates}
                    <tr>
                        <td>{$lang.zonecontents}</td>
                        <td colspan="2">
                            <input type="radio" checked="checked" name="postaction" value="none" onclick="sh_option(0)" id="val1" />
                            <label for="val1"> {$lang.iwillentriesmanually}
                                <a title="{$lang.afteraddingzone}"></a>
                            </label> 
                            <br/>
                            {if $user_domains} 
                                <input type="radio" name="postaction" value="clone"  onclick="sh_option(1)" id="val11" /> 
                                <label for="val11">{$lang.cloneentriesfromotherdomain}  
                                    <a title="{$lang.newdomainzoneclone}" class="vtip_description"></a>
                                </label>
                                <br/> 
                            {/if}
                            <input type="radio" name="postaction" value="premade"  onclick="sh_option(2)"  id="val111" /> 
                            <label for="val111">{$lang.usepremadetemplate}  
                                <a title="{$lang.usepremadednstemplatetooltip}" class="vtip_description"></a>
                            </label> 
                            <br/>
                        </td>
                    </tr>
                {/if}
                {if $user_domains}  <tr id="option_1" style="display:none" class="sh_option">
                        <td>{$lang.clone_zone} </td>
                        <td colspan="2">
                            <select name="clone" style="width: 180px;">
                                {foreach from=$user_domains item=domain}
                                    <option value="{$domain.$domain_indent}">{$domain.domain}</option>
                                {/foreach}

                            </select> 
                            <input type="checkbox" name="clonenames"  id="clonenames" value="1" checked="checked" /> 
                            <label for="clonenames">{$lang.replacerecordcontent}  
                                <a class="vtip_description" title="{$lang.clonedzonecontdescr}" class="vtip_description"></a>
                            </label>
                        </td>
                    </tr>
                {/if}
                {if $dns_templates} 
                    <tr id="option_2" style="display:none" class="sh_option">
                        <td>{$lang.dnstemplate}</td>
                        <td colspan="2"><select name="dns_template" style="width: 180px;" id="dns_tpl" onchange="$('.dns_id').hide();
                                $('#dns_id_' + $(this).val()).show();">
                                {foreach from=$dns_templates item=template key=name}
                                    <option value="{$template[0].id}">{$template[0].template}</option>
                                {/foreach}

                            </select> <a href="#" onclick="$('#dns_preview').show();
                                    $('#dns_id_' + $('#dns_tpl').val()).show();
                                    $(this).hide();
                                    return false">{$lang.preview}</a>
                        </td>
                    </tr>
                    <tr id="dns_preview" style="display:none">
                        <td></td>
                        <td colspan="3">
                            {foreach from=$dns_templates item=template key=tid name=floop}
                                <div class="dns_id" id="dns_id_{$template[0].id}" style="display:none;">
                                    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled table table-striped table-condensed">
                                        <thead >
                                            <tr>
                                                <th>{$lang.name}</th>
                                                <th>TTL</th>
                                                <th>{$lang.priority}</th>
                                                <th>{$lang.type}</th>
                                                <th>{$lang.content}</th>
                                            </tr>
                                        </thead>

                                        <tbody >
                                            {foreach from=$template item=record}
                                                <tr>
                                                    <td>{$record.name}</td>
                                                    <td>{$record.ttl}</td>
                                                    <td>{$record.priority}</td>
                                                    <td>{$record.type}</td>
                                                    <td>{$record.content}</td>
                                                </tr>
                                            {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            {/foreach}
                        </td>
                    </tr>
                {/if}
                <tr>
                    <td align="center" colspan="3" style="border-bottom:none">
                        <input type="submit" name="submit" class="btn btn-primary"  value="{$lang.submit}" style="padding:4px 3px;font-weight:bold;font-size:12px"/> 
                        &nbsp; {$lang.or} &nbsp; <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/" class="editbtn">{$lang.cancel}
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</form>