<div class="wbox" id="contactinfoeditor">
    <div class="wbox_header">{$lang.contactinfo}:</div>
    <div  class="wbox_content">
        <form action="" method="post">
            <input type="hidden" name="submit" value="1" />
            <input type="hidden" name="widgetdo" value="updateContactInfo" />

            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="checker table table-striped">

                <tr  class="even">
                     <td align="right" width="160"><strong>{$lang.registrantinfo}</strong></td>
                     <td >
                        <input type="radio" {if !$ContactInfo.registrant.action}checked="checked"{/if}  name="updateContactInfo[registrant][action]" value="custom" id="registrant_action_custom" onclick="sh_contacts('registrant',true);"/> <label for="registrant_action_custom">{$lang.custom}</label>
                        <input type="radio" {if $ContactInfo.registrant.action=='premade'}checked="checked"{/if} name="updateContactInfo[registrant][action]" value="premade" id="registrant_action_premade"  onclick="sh_contacts('registrant',false,true);" /> <label for="registrant_action_premade">{$lang.usefollowingcontact}</label>
                            <select name="updateContactInfo[registrant][contactid]" onchange="contact_change(this)" id="registrant_contactid">
                                {foreach from=$premadecontact item=p}
                                    <option value="{$p.id}" {if $ContactInfo.registrant.contactid==$p.id}selected="selected"{/if}>{if $p.maincontact}{$lang.maincontact}{/if} {$p.firstname} {$p.lastname}</option>
                                {/foreach}
                                <option value="new" style="font-weight:bold;">{$lang.createnewcontact}</option>
                            </select>
                     </td>
                </tr>
                <tbody id="registrant_preview" style="display:none;background:#f9f9f9">
                    <tr><td></td><td class="fs11" style="color:#505050"></td></tr>
                </tbody>
                <tbody id="registrant_contact" {if $ContactInfo.registrant.action}style="display:none"{/if}>
                    <tr>
                        <td align="right" width="160">{$lang.firstname}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.firstname}" name="updateContactInfo[registrant][firstname]" {if $ContactInfo.registrant.firstname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.lastname}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.lastname}" name="updateContactInfo[registrant][lastname]" {if $ContactInfo.registrant.lastname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.organisation}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.companyname}" name="updateContactInfo[registrant][companyname]" {if $ContactInfo.registrant.companyname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.email}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.email}" name="updateContactInfo[registrant][email]" {if $ContactInfo.registrant.email == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.address}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.address1}" name="updateContactInfo[registrant][address1]" {if $ContactInfo.registrant.address1 == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.address2}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.address2}" name="updateContactInfo[registrant][address2]" {if $ContactInfo.registrant.address2 == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.city}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.city}" name="updateContactInfo[registrant][city]" {if $ContactInfo.registrant.city == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.state}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.state}" name="updateContactInfo[registrant][state]" {if $ContactInfo.registrant.state == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.postcode}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.postcode}" name="updateContactInfo[registrant][postcode]" {if $ContactInfo.postcode == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr  class="even">
                        <td align="right" width="160">{$lang.country}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.country}" name="updateContactInfo[registrant][country]" {if $ContactInfo.registrant.country == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.phone}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.registrant.phonenumber}" name="updateContactInfo[registrant][phonenumber]" {if $ContactInfo.registrant.phonenumber == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>


                        {if $ContactInfo.extended}

                    <tr  class="even"><td colspan="2" align="center"><strong>{$lang.extendedinfo}:</strong></td></tr>
                            {foreach from=$ContactInfo.registrant.extended item=attribute name=fextended}
                    <tr {if $smarty.foreach.fextended.iteration%2==0}class="even"{/if}><td>{$attribute.description}:</td>
                                {if $attribute.input}
                        <td><input type="text" class="styled"name="updateContactInfo[registrant][extended][{$attribute.name}]" size="20" value="{$attribute.default}"/></td>
                                {else}
                        <td><select name="updateContactInfo[extended][{$attribute.name}]">
                                    {foreach from=$attribute.option item=value}
                                <option value="{$value.value}" {if $value.value == $attribute.default} selected="selected"{/if} >{$value.title}</option>
                                    {/foreach}
                            </select></td>
                                {/if}

                    </tr>
                            {/foreach}

                        {/if}
                 </tbody>
                  <tr  class="even">
                     <td align="right" width="160"><strong>{$lang.admincontact}</strong></td>
                     <td >
                        <input type="radio" {if !$ContactInfo.admin.action}checked="checked"{/if} name="updateContactInfo[admin][action]" value="custom" id="admin_action_custom" onclick="sh_contacts('admin',true);"/> <label for="admin_action_custom">{$lang.custom}</label>
                        <input {if $ContactInfo.admin.action=='registrant'}checked="checked"{/if} type="radio" name="updateContactInfo[admin][action]" value="registrant" id="admin_action_registrant" onclick="sh_contacts('admin',false);"/> <label for="admin_action_registrant">{$lang.sameasreg}</label>
                        <input type="radio" {if $ContactInfo.admin.action=='premade'}checked="checked"{/if} name="updateContactInfo[admin][action]" value="premade" id="admin_action_premade"  onclick="sh_contacts('admin',false,true);" /> <label for="admin_action_premade">{$lang.usefollowingcontact}</label>
                            <select name="updateContactInfo[admin][contactid]" onchange="contact_change(this)" id="admin_contactid">
                                {foreach from=$premadecontact item=p}
                                    <option value="{$p.id}"  {if $ContactInfo.admin.contactid==$p.id}selected="selected"{/if}>{if $p.maincontact}{$lang.maincontact}{/if} {$p.firstname} {$p.lastname}</option>
                                {/foreach}
                                <option value="new" style="font-weight:bold;">{$lang.createnewcontact}</option>
                            </select>
                     </td>
                </tr>
                 <tbody id="admin_preview" style="display:none;background:#f9f9f9">
                    <tr><td></td><td class="fs11" style="color:#505050"></td></tr>
                </tbody>
                 <tbody id="admin_contact"  {if $ContactInfo.admin.action}style="display:none"{/if}>
                    <tr>
                        <td align="right" width="160">{$lang.firstname}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.firstname}" name="updateContactInfo[admin][firstname]" {if $ContactInfo.admin.firstname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.lastname}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.lastname}" name="updateContactInfo[admin][lastname]" {if $ContactInfo.admin.lastname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.organisation}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.companyname}" name="updateContactInfo[admin][companyname]" {if $ContactInfo.admin.companyname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.email}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.email}" name="updateContactInfo[admin][email]" {if $ContactInfo.admin.email == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.address}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.address1}" name="updateContactInfo[admin][address1]" {if $ContactInfo.admin.address1 == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.address2}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.address2}" name="updateContactInfo[admin][address2]" {if $ContactInfo.admin.address2 == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.city}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.city}" name="updateContactInfo[admin][city]" {if $ContactInfo.admin.city == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.state}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.state}" name="updateContactInfo[admin][state]" {if $ContactInfo.admin.state == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.postcode}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.postcode}" name="updateContactInfo[admin][postcode]" {if $ContactInfo.postcode == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr  class="even">
                        <td align="right" width="160">{$lang.country}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.country}" name="updateContactInfo[admin][country]" {if $ContactInfo.admin.country == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.phone}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.admin.phonenumber}" name="updateContactInfo[admin][phonenumber]" {if $ContactInfo.admin.phonenumber == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
					</tbody>
                <tr  class="even">
                     <td align="right" width="160"><strong>{$lang.techinfo}</strong></td>
                     <td >
                        <input {if !$ContactInfo.tech.action}checked="checked"{/if} type="radio" name="updateContactInfo[tech][action]" value="custom" id="tech_action_custom" onclick="sh_contacts('tech',true);"/> <label for="tech_action_custom">{$lang.custom}</label>
                        <input {if $ContactInfo.tech.action=='registrant'}checked="checked"{/if} type="radio" name="updateContactInfo[tech][action]" value="registrant" id="tech_action_registrant" onclick="sh_contacts('tech',false);"/> <label for="tech_action_registrant">{$lang.sameasreg}</label>
                        <input type="radio" {if $ContactInfo.tech.action=='premade'}checked="checked"{/if} name="updateContactInfo[tech][action]" value="premade" id="tech_action_premade"  onclick="sh_contacts('tech',false,true);" /> <label for="tech_action_premade">{$lang.usefollowingcontact}</label>
                            <select name="updateContactInfo[tech][contactid]" onchange="contact_change(this)" id="tech_contactid">
                                {foreach from=$premadecontact item=p}
                                    <option value="{$p.id}"  {if $ContactInfo.tech.contactid==$p.id}selected="selected"{/if}>{if $p.maincontact}{$lang.maincontact}{/if} {$p.firstname} {$p.lastname}</option>
                                {/foreach}
                                <option value="new" style="font-weight:bold;">{$lang.createnewcontact}</option>
                            </select>
                     </td>
                </tr>
                 <tbody id="tech_preview" style="display:none;background:#f9f9f9">
                    <tr><td></td><td class="fs11" style="color:#505050"></td></tr>
                </tbody>
                 <tbody id="tech_contact"  {if $ContactInfo.tech.action}style="display:none"{/if}>
                    <tr>
                        <td align="right" width="160">{$lang.firstname}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.firstname}" name="updateContactInfo[tech][firstname]" {if $ContactInfo.tech.firstname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.lastname}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.lastname}" name="updateContactInfo[tech][lastname]" {if $ContactInfo.tech.lastname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.organisation}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.companyname}" name="updateContactInfo[tech][companyname]" {if $ContactInfo.tech.companyname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.email}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.email}" name="updateContactInfo[tech][email]" {if $ContactInfo.tech.email == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.address}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.address1}" name="updateContactInfo[tech][address1]" {if $ContactInfo.tech.address1 == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.address2}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.address2}" name="updateContactInfo[tech][address2]" {if $ContactInfo.tech.address2 == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.city}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.city}" name="updateContactInfo[tech][city]" {if $ContactInfo.tech.city == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.state}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.state}" name="updateContactInfo[tech][state]" {if $ContactInfo.tech.state == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.postcode}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.postcode}" name="updateContactInfo[tech][postcode]" {if $ContactInfo.postcode == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr  class="even">
                        <td align="right" width="160">{$lang.country}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.country}" name="updateContactInfo[tech][country]" {if $ContactInfo.tech.country == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.phone}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.tech.phonenumber}" name="updateContactInfo[tech][phonenumber]" {if $ContactInfo.tech.phonenumber == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
					</tbody>
                <tr  class="even">
                     <td align="right" width="160"><strong>{$lang.billinginfo}</strong></td>
                     <td >
                        <input {if !$ContactInfo.billing.action}checked="checked"{/if} type="radio" name="updateContactInfo[billing][action]" value="custom" id="billing_action_custom" onclick="sh_contacts('billing',true);"/> <label for="billing_action_custom">{$lang.custom}</label>
                        <input {if $ContactInfo.billing.action=='registrant'}checked="checked"{/if} type="radio" name="updateContactInfo[billing][action]" value="registrant" id="billing_action_registrant" onclick="sh_contacts('billing',false);"/> <label for="billing_action_registrant">{$lang.sameasreg}</label>
                        <input type="radio" {if $ContactInfo.billing.action=='premade'}checked="checked"{/if} name="updateContactInfo[billing][action]" value="premade" id="billing_action_premade"  onclick="sh_contacts('billing',false,true);" /> <label for="billing_action_premade">{$lang.usefollowingcontact}</label>
                            <select name="updateContactInfo[billing][contactid]" onchange="contact_change(this)" id="billing_contactid">
                                {foreach from=$premadecontact item=p}
                                    <option value="{$p.id}"  {if $ContactInfo.billing.contactid==$p.id}selected="selected"{/if}>{if $p.maincontact}{$lang.maincontact}{/if} {$p.firstname} {$p.lastname}</option>
                                {/foreach}
                                <option value="new" style="font-weight:bold;">{$lang.createnewcontact}</option>
                            </select>
                     </td>
                </tr>
                 <tbody id="billing_preview" style="display:none;background:#f9f9f9">
                    <tr><td></td><td class="fs11" style="color:#505050"></td></tr>
                </tbody>
                <tbody id="billing_contact"  {if $ContactInfo.billing.action}style="display:none"{/if}>
                    <tr>
                        <td align="right" width="160">{$lang.firstname}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.firstname}" name="updateContactInfo[billing][firstname]" {if $ContactInfo.billing.firstname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.lastname}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.lastname}" name="updateContactInfo[billing][lastname]" {if $ContactInfo.billing.lastname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.organisation}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.companyname}" name="updateContactInfo[billing][companyname]" {if $ContactInfo.billing.companyname == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.email}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.email}" name="updateContactInfo[billing][email]" {if $ContactInfo.billing.email == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.address}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.address1}" name="updateContactInfo[billing][address1]" {if $ContactInfo.billing.address1 == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.address2}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.address2}" name="updateContactInfo[billing][address2]" {if $ContactInfo.billing.address2 == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.city}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.city}" name="updateContactInfo[billing][city]" {if $ContactInfo.billing.city == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr class="even">
                        <td align="right" width="160">{$lang.state}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.state}" name="updateContactInfo[billing][state]" {if $ContactInfo.billing.state == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.postcode}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.postcode}" name="updateContactInfo[billing][postcode]" {if $ContactInfo.postcode == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr  class="even">
                        <td align="right" width="160">{$lang.country}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.country}" name="updateContactInfo[billing][country]" {if $ContactInfo.billing.country == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
                    <tr>
                        <td align="right" width="160">{$lang.phone}</td>
                        <td><input type="text" class="styled" size="30" value="{$ContactInfo.billing.phonenumber}" name="updateContactInfo[billing][phonenumber]" {if $ContactInfo.billing.phonenumber == "disabled"}disabled="disabled" {/if}/></td>
                    </tr>
					</tbody>

                <tr  class="even"><td colspan="2" align="center"> <input type="submit" class=" btn btn-primary" value="{$lang.savechanges}" style="font-weight:bold"/>
                        <span class="fs11">{$lang.or}</span> <a href="{$ca_url}clientarea/domains/{if $details}{$details.id}/{$details.name}/{/if}" class="fs11">{$lang.cancel}</a></td></tr>
               </table>


        </form>
    </div>
</div>
<script type="text/javascript">
    {literal}
            function sh_contacts(c,a,t) {
                 $('#'+c+'_preview').hide();
                if(a) {
                    $('#'+c+'_contact').show();
                 } else {
                    $('#'+c+'_contact').hide();
                        if(t) {
                            //load preview
                                $('#'+c+'_preview td').html('');
                                    ajax_update('?cmd=profiles&action=preview',{id:$('#'+c+'_contactid').val()},'#'+c+'_preview td.fs11');
                                $('#'+c+'_preview').show();
                        }

                }
            }
                function contact_change(el) {
                    if($(el).val()=='new') {
                        window.location='?cmd=profiles&action=add';
                    } else {
                        var i =$(el).attr('id').split("_");
                        var c = i[0];
                            if(!c)
                                return false;
                                    if(!$('#'+c+'_action_premade').is(':checked'))
                                        return false;
                         $('#'+c+'_preview td').html('');
                                    ajax_update('?cmd=profiles&action=preview',{id:$('#'+c+'_contactid').val()},'#'+c+'_preview td.fs11');
                          $('#'+c+'_preview').show();
                    }
                }

                 
                       $('#contactinfoeditor input[type=radio]:checked').click();
        {/literal}
</script>