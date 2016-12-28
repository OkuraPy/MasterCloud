{if $action=='groups'}
    {if !$groups}
        <div id="blank_state" class="blank_state blank_news">
            <div class="blank_info">
                <h1>Organize your customers into groups</h1>
                Let your priority clients stand out with privileged discounts, automation settings and more - all possible from client groups.
                <br/>Note: All clients by default are assigned to "None" group
                <div class="clear"></div>
                <a class="new_add new_menu" href="?cmd=clients&action=addgroup" style="margin-top:10px">
                    <span>Add custom client group</span></a>
                <div class="clear"></div>
            </div>
        </div>
    {else}
        <div style="padding:15px;background:#F5F9FF;">
            <table width="100%" cellspacing="0" cellpadding="3" border="0" style="border:solid 1px #ddd;" class="whitetable">
                <tbody>
                    <tr>
                        <th align="left" colspan="4">Current client groups</th>
                    </tr>
                    {foreach from=$groups item=group}
                        <tr class="havecontrols  ">
                            <td style="padding-left:10px" width="150"><a href="?cmd=clients&action=editgroup&id={$group.id}" style="color:{$group.color};text-decoration:underline">{$group.name}</a></td>
                            <td>{$group.description}</td>
                            <td width="60"><a href="?cmd=clients&list={$group.id}" class="fs11" target="_blank">{$group.count} customers</a></td>
                            <td width="23" align="center"><a class="delbtn" href="?cmd=clients&action=groups&make=delete&id={$group.id}&security_token={$security_token}" onclick="return confirm('Are you sure? Clients from under this group will be re-assigned to default group (None)')">Delete</a></td>
                        </tr>
                    {/foreach}

                </tbody></table>
            <a style="margin-top:10px" href="?cmd=clients&amp;action=addgroup" class="new_add new_menu">
                <span>Add custom client group</span></a>
            <div class="clear"></div>
        </div>
    {/if}

{else}
    <link rel="stylesheet" media="screen" type="text/css" href="{$template_dir}js/colorpicker/css/colorpicker.css" />
    <script type="text/javascript" src="{$template_dir}js/colorpicker/colorpicker.js?v={$hb_version}"></script>
    {literal}
        <script>
            $(document).ready(function () {
                $('#newshelfnav').TabbedMenu({
                    elem: '.sectioncontent',
                    picker: '.list-1 li',
                    aclass: 'active'
                });
                var el = function () {
                    var d = $(this).parent().find('.contener');
                    if ($(this).is(':checked')) {
                        d.show();
                    } else {
                        d.hide();
                        d.find('input[value=off]').attr('checked', 'checked');
                    }
                };
                $('.toc').click(el).each(el);

                $('#colorSelector').ColorPicker({onSubmit: function (hsb, hex, rgb, el) {
                        $(el).val(hex);
                        $(el).ColorPickerHide();
                    }, onChange: function (hsb, hex, rgb) {
                        $('#colorSelector').css('backgroundColor', '#' + hex);
                        $('#colorSelector_i').val(hex);
                    },
                    livePreview: true, color: '{/literal}{$groupx.value}{literal}'});
            });
            function check_i(element) {
                var td = $(element).parent();
                if ($(element).is(':checked'))
                    $(td).find('.config_val').removeAttr('disabled');
                else
                    $(td).find('.config_val').attr('disabled', 'disabled');
            }
        </script>
    {/literal}
    <form action="" method="post" id="sme">
        <div id="newshelfnav" class="newhorizontalnav">
            <div class="list-1">
                <ul>
                    <li class="active picked">
                        <a href="#"><span class="ico money">General settings</span></a>
                    </li>
                    <li class="">
                        <a href="#"><span class="ico money">Ordering settings</span></a>
                    </li>
                    <li class="">
                        <a href="#"><span class="ico money">Billing settings</span></a>
                    </li>
                    <li class="">
                        <a href="#"><span class="ico money">Automation settings</span></a>
                    </li>
                    <li class="">
                        <a href="#"><span class="ico money">Discounts</span></a>
                    </li>
                </ul>
            </div>
        </div>

        <div style="padding:15px;background:#F5F9FF;">
            <div class="sectioncontent">
                <table width="100%" cellspacing="0" cellpadding="6">
                    <tbody >
                        <tr >
                            <td width="160" align="right"><strong>Name</strong></td>
                            <td class="editor-container">
                                <input style="font-size: 16px !important; font-weight: bold;" class="inp" size="50" name="name" value="{$groupx.name}"/>
                            </td>
                        </tr>

                        <tr >
                            <td width="160" align="right"><strong>Group color<a class="vtip_description" title="Group members will be listed using this color"></a></strong></td>
                            <td class="editor-container">
                                <input id="colorSelector_i" type="hidden" class="w250" size="7" name="color" value="{$groupx.color}" style="margin-bottom:5px"/>
                                <div id="colorSelector" style="border: 2px solid #ddd; cursor: pointer; float: left; height: 15px;margin: 6px 0 5px 8px;position:relative; width: 40px; background: {$groupx.color};" onclick="$('#colorSelector_i').click()">
                                    <div style="position:absolute; bottom:0; right: 0; color:white; background:url('{$template_dir}img/imdrop.gif') no-repeat 3px 4px #ddd; height:10px; width:10px"></div>
                                </div>
                            </td>
                        </tr>
                        <tr >
                            <td width="160" align="right"><strong>Ticket priority <a class="vtip_description" title="Select what default ticket priority clients from this group should have"></a></strong></td>
                            <td class="editor-container">
                                <select name="default_priority" class="inp">
                                    <option value="0" {if $groupx.default_priority=="0"}selected="selected"{/if}>Low</option>
                                    <option value="1" {if $groupx.default_priority=="1"}selected="selected"{/if}>Medium</option>
                                    <option value="2" {if $groupx.default_priority=="2"}selected="selected"{/if}>High</option>

                                </select>
                            </td>
                        </tr>
                        <tr >
                            <td width="160" align="right"><strong>Admin-only description</strong></td>
                            <td class="editor-container">
                                <textarea name="description" style="width:400px;height:50px">{$groupx.description}</textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="sectioncontent" style="display:none">
                <table width="100%" cellspacing="0" cellpadding="6">
                    <tbody >
                        <tr >
                            <td width="160" align="right"><strong>Order scenario<a class="vtip_description" title="You can choose whether customers from this group falls under default scenario, or are processed with custom one"></a></strong></td>
                            <td class="editor-container">
                                <select name="scenario_id" class="inp">
                                    <option value="0" {if $groupx.scenario_id=="0"}selected="selected"{/if}>Use default scenario</option>
                                    {foreach from=$scenarios item=scenario}
                                        <option value="{$scenario.id}" {if $groupx.scenario_id==$scenario.id}selected="selected"{/if}>{$scenario.name}</option>
                                    {/foreach}

                                </select>
                            </td>
                        </tr>


                        <tr >
                            <td width="160" align="right"><strong>Global Discount</strong></td>
                            <td class="editor-container">
                                <input style="" class="inp" size="4" name="discount" value="{$groupx.discount}"/> %
                            </td>
                        </tr>

                        <tr>
                            <td align="right">
                                <strong>Force ProRata billing</strong>
                                <a href="#" class="vtip_description" title="With this option enabled client will have all his services billed on certain day of month." ></a>
                            </td>
                            <td>
                                <label ><input type="radio" {if !$groupx.settings.EnableProRata}checked="checked"{/if} name="settings_enabled[EnableProRata]" value="" onclick="$('#prorated').hide();" /><strong>{$lang.no}</strong></label>
                                <label ><input type="radio" {if $groupx.settings.EnableProRata}checked="checked"{/if} name="settings_enabled[EnableProRata]" value="1" onclick="$('#prorated').ShowNicely();" /> <strong>{$lang.yes}</strong></label>

                            </td>
                        </tr>
                        <tr id="prorated" {if !$groupx.settings.EnableProRata}style="display:none"{/if}>
                            <td></td>
                            <td>
                                {$lang.new_ProRataDay} <input class="inp" size="2" name="settings[ProRataDay]" value="{$groupx.settings.ProRataDay}"/>
                                {$lang.new_ProRataMonth} <select class="inp" name="settings[ProRataMonth]">
                                    <option value="disabled" {if $groupx.settings.ProRataMonth == 'disabled'}selected="selected"{/if}>{$lang.new_ProRataMonth_disabled}</option>
                                    <option value="January" {if $groupx.settings.ProRataMonth == 'January'}selected="selected"{/if}>{$lang.January}</option>
                                    <option value="February" {if $groupx.settings.ProRataMonth == 'February'}selected="selected"{/if}>{$lang.February}</option>
                                    <option value="March" {if $groupx.settings.ProRataMonth == 'March'}selected="selected"{/if}>{$lang.March}</option>
                                    <option value="April" {if $groupx.settings.ProRataMonth == 'April'}selected="selected"{/if}>{$lang.April}</option>
                                    <option value="May" {if $groupx.settings.ProRataMonth == 'May'}selected="selected"{/if}>{$lang.May}</option>
                                    <option value="June" {if $groupx.settings.ProRataMonth == 'June'}selected="selected"{/if}>{$lang.June}</option>
                                    <option value="July" {if $groupx.settings.ProRataMonth == 'July'}selected="selected"{/if}>{$lang.July}</option>
                                    <option value="August" {if $groupx.settings.ProRataMonth == 'August'}selected="selected"{/if}>{$lang.August}</option>
                                    <option value="September" {if $groupx.settings.ProRataMonth == 'September'}selected="selected"{/if}>{$lang.September}</option>
                                    <option value="October" {if $groupx.settings.ProRataMonth == 'October'}selected="selected"{/if}>{$lang.October}</option>
                                    <option value="November" {if $groupx.settings.ProRataMonth == 'November'}selected="selected"{/if}>{$lang.November}</option>
                                    <option value="December" {if $groupx.settings.ProRataMonth == 'December'}selected="selected"{/if}>{$lang.December}</option>
                                </select>
                                <br />
                                <span>
                                    {$lang.new_ProRataNextMonth} 
                                    <a class="vtip_description" title="{$lang.promonthdesc}"></a> 
                                    <input type="checkbox" name="settings_enabled[ProRataNextMonth]" value="1" {if $groupx.settings.ProRataNextMonth>0}checked="checked"{/if} value="1"/> 
                                    <input type="text" name="settings[ProRataNextMonth]" value="{$groupx.settings.ProRataNextMonth}"  inp" size="3" />
                                </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="sectioncontent" style="display:none"><table>
                    <tr> 
                        <td align="right" valign="top" width="200"><strong>{$lang.CCChargeAuto}</strong></td>
                        <td >
                            <input type="checkbox" name="settings_enabled[CCChargeAuto]" class="toc" value="1" 
                                   {if $groupx.settings_enabled.CCChargeAuto}checked="checked"{/if} /> Override billing settings for this group
                            <div class="contener">
                                <input type="radio" name="settings[CCChargeAuto]" value="off" 
                                       {if $groupx.settings.CCChargeAuto=='off'}checked="checked"{/if} 
                                       onclick="$('.chargefew').hide();"/>
                                <strong>{$lang.no}, </strong> {$lang.CCChargeAuto_dscr1}
                                <br />

                                <input type="radio" name="settings[CCChargeAuto]" value="on" 
                                       {if $groupx.settings.CCChargeAuto=='on'}checked="checked"{/if} 
                                       onclick="$('.chargefew').show();"/> 
                                <strong>{$lang.yes}, </strong> {$lang.CCChargeAuto_dscr} 
                                <input type="text" size="3" value="{if $groupx.settings.CCChargeAuto!='on'}0{else}{$groupx.settings.CCDaysBeforeCharge}{/if}" name="settings[CCDaysBeforeCharge]"/> 
                                {$lang.CCChargeAuto2}

                                <div class="chargefew" {if $groupx.settings.CCChargeAuto!='on'}style="display:none"{/if}> <br />
                                    <input type="radio" name="settings[CCAttemptOnce]" value="on" {if $groupx.settings.CCAttemptOnce=='on'}checked="checked"{/if}/> {$lang.CCAttemptOnce}<br />
                                    <input type="radio" name="settings[CCAttemptOnce]" value="off" {if $groupx.settings.CCAttemptOnce=='off'}checked="checked"{/if}/> {$lang.CCAttemptOnce2}
                                    <input type="text" size="3" name="settings[CCRetryForDays]" value="{if $groupx.settings.CCRetryForDays}{$groupx.settings.CCRetryForDays}{else}3{/if}" /> 
                                    {$lang.days}
                                </div>

                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="sectioncontent" style="display:none">
                <table width="100%" cellspacing="0" cellpadding="6">
                    <tbody >

                        <tr class="odd"> <td align="right" valign="top" width="200"><strong>{$lang.auto_create}</strong></td>

                            <td >

                                <input type="checkbox" name="settings_enabled[EnableAutoCreation]" class="toc" value="1" {if $groupx.settings_enabled.EnableAutoCreation}checked="checked"{/if} /> Override package settings for this group

                                <div class="contener">
                                    <input type="radio" value="0" name="settings[EnableAutoCreations]" 
                                           {if !$groupx.settings.EnableAutoCreation}checked="checked"{/if} id="autooff" 
                                           onclick="$('#autosetup_opt').hide(); $('#autooff_').click();"/>
                                    <label for="autooff"><b>{$lang.no}</b></label>
                                    
                                    <input type="radio"  value="1" name="settings[EnableAutoCreations]" 
                                           {if $groupx.settings.EnableAutoCreation > 0}checked="checked"{/if} id="autoon" 
                                           onclick="$('#autosetup_opt').ShowNicely();"/>
                                    <label for="autoon"><b>{$lang.yes}</b></label>

                                    <div class="p5" id="autosetup_opt" style="{if $groupx.settings.EnableAutoCreation=='0' || !$groupx.settings_enabled.EnableAutoCreation}display:none;{/if}margin-top:10px;border:#ccc 1px solid;" >
                                        <input type="radio" style="display:none" {if $groupx.settings.EnableAutoCreation=='0'}checked="checked"{/if} value="0" name="settings[EnableAutoCreation]" id="autooff_"/>
                                        <input type="radio" {if $groupx.settings.EnableAutoCreation=='3'}checked="checked"{/if} value="3" name="settings[EnableAutoCreation]" id="autosetup3"/> <label for="autosetup3">{$lang.whenorderplaced}</label><br />
                                        <input type="radio" {if $groupx.settings.EnableAutoCreation=='2'}checked="checked"{/if} value="2" name="settings[EnableAutoCreation]" id="autoon_"/> <label for="autoon_">{$lang.whenpaymentreceived}</label><br />
                                        <input type="radio" {if $groupx.settings.EnableAutoCreation=='1'}checked="checked"{/if} value="1" name="settings[EnableAutoCreation]" id="autosetup1"/> <label for="autosetup1">{$lang.whenmanualaccept}</label><br />
                                        <input type="radio" {if $groupx.settings.EnableAutoCreation=='4'}checked="checked"{/if} value="4" name="settings[EnableAutoCreation]" id="autosetup4"/> <label for="autosetup4">{$lang.procesbycron}</label>
                                        <div class="clear"></div>
                                    </div>
                                </div>

                            </td>
                        </tr>

                        <tr >
                            <td width="200" valign="top" align="right"><strong>Account suspension</strong></td>
                            <td class="editor-container">
                                <input type="checkbox" name="settings_enabled[EnableAutoSuspension]" class="toc" value="1" {if $groupx.settings_enabled.EnableAutoSuspension}checked="checked"{/if} /> Override package settings for this group
                                <div class="contener">
                                    <input type="radio" {if $groupx.settings.EnableAutoSuspension == 'off'}checked="checked"{/if} 
                                           name="settings[EnableAutoSuspension]" value="off" onclick="$('#suspension_options').hide();" id="suspend_off"/>
                                    <label  for="suspend_off"><b>{$lang.no}</b></label>
                                    
                                    <input type="radio" {if $groupx.settings.EnableAutoSuspension == 'on'}checked="checked"{/if} 
                                           name="settings[EnableAutoSuspension]" value="on" onclick="$('#suspension_options').ShowNicely()" id="suspend_on"/>
                                    <label  for="suspend_on"><b>{$lang.yes}</b></label>
                                    
                                    <div class="p5" id="suspension_options" 
                                         style="{if $groupx.settings.EnableAutoSuspension != 'on'}display:none;{/if}margin-top:10px;border:#ccc 1px solid;" >
                                        {$lang.new_EnableAutoSuspension1} 
                                        <input type="text" size="3" value="{$groupx.settings.AutoSuspensionPeriod}"  
                                               name="settings[AutoSuspensionPeriod]" class="inp config_val" /> 
                                        {$lang.new_EnableAutoSuspension2}

                                    </div>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td width="200" valign="top" align="right"><strong>{$lang.new_EnableAutoTermination}</strong></td>
                            <td>
                                <input type="checkbox" name="settings_enabled[EnableAutoTermination]" class="toc" value="1" {if $groupx.settings_enabled.EnableAutoTermination}checked="checked"{/if} /> Override package settings for this group
                                <div class="contener">
                                    <input type="radio" {if $groupx.settings.EnableAutoTermination == 'off'}checked="checked"{/if} 
                                           name="settings[EnableAutoTermination]" value="off" onclick="$('#termination_options').hide();" 
                                           id="termination_off"/>
                                    <label  for="termination_off"><b>{$lang.no}</b></label>
                                    
                                    <input type="radio" {if $groupx.settings.EnableAutoTermination == 'on'}checked="checked"{/if} 
                                           name="settings[EnableAutoTermination]" value="on" onclick="$('#termination_options').ShowNicely();" 
                                           id="termination_on"/>
                                    <label  for="termination_on"><b>{$lang.yes}</b></label>

                                    <div class="p5" id="termination_options" 
                                         style="{if $groupx.settings.EnableAutoTermination != 'on'}display:none;{/if}margin-top:10px;border:#ccc 1px solid;" >
                                        {$lang.new_EnableAutoTermination1} <input type="text" size="3" 
                                               value="{$groupx.settings.AutoTerminationPeriod}" 
                                               name="settings[AutoTerminationPeriod]"  class="inp config_val" /> 
                                        {$lang.new_EnableAutoTermination2}
                                    </div>
                                </div>


                            </td>

                        </tr>

                        <tr >
                            <td width="200" valign="top" align="right"><strong>Auto-Renew domains</strong></td>
                            <td class="editor-container">
                                <input type="checkbox" name="settings_enabled[EnableAutoRenewDomain]" class="toc" value="1" 
                                       {if $groupx.settings_enabled.EnableAutoRenewDomain}checked="checked"{/if} /> Override package settings for this group
                                <div class="contener">
                                    <input type="radio" {if $groupx.settings.EnableAutoRenewDomain == 'off'}checked="checked"{/if} 
                                           name="settings[EnableAutoRenewDomain]" value="off" onclick="$('#renewal_options').hide();" 
                                           id="renew_off"/><label  for="renew_off"><b>{$lang.no}</b></label>
                                    
                                    <input type="radio" {if $groupx.settings.EnableAutoRenewDomain == 'on'}checked="checked"{/if} 
                                           name="settings[EnableAutoRenewDomain]" value="on" onclick="$('#renewal_options').ShowNicely();" 
                                           id="renew_on"/><label  for="renewa_on"><b>{$lang.yes}</b></label>

                                    <div class="p5" id="renewal_options" 
                                         style="{if $groupx.settings.EnableAutoRenewDomain != 'on'}display:none;{/if}margin-top:10px;border:#ccc 1px solid;" >
                                        <input type="radio" value="on" name="settings[RenewOnOrder]" 
                                               {if $groupx.settings.RenewOnOrder == 'on'} checked="checked"{/if}>
                                        When renwal order is placed
                                        <br>
                                        <input type="radio" value="" name="settings[RenewOnOrder]" 
                                               {if $groupx.settings.RenewOnOrder != 'on'} checked="checked"{/if}>
                                        After receiving payment
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="right"><strong>{$lang.InvoiceGeneration} </strong> </td>
                            <td>

                                <input type="checkbox" name="settings_enabled[InvoiceGeneration]" class="toc" value="1" {if $groupx.settings_enabled.InvoiceGeneration}checked="checked"{/if} /> Override package settings for this group
                                <div class="contener p5">
                                    <input type="text" size="3" value="{$groupx.settings.InvoiceGeneration}" name="settings[InvoiceGeneration]" class="inp"/> {$lang.InvoiceGeneration2}</div></td>

                        </tr>
                        <tr>
                            <td align="right"><strong>Advanced due date settings </strong>
                            </td>
                            <td>
                                <input type="checkbox" name="settings_enabled[AdvancedDueDate]" class="toc" value="1" {if $groupx.settings_enabled.AdvancedDueDate}checked="checked"{/if} /> Override package settings for this group
                                <div class="contener p5" >
                                    <input type="hidden"value="1" name="settings[AdvancedDueDate]" />
                                    {$lang.InvoiceExpectDays} <input type="text" size="3" class="inp" value="{$groupx.settings.InvoiceExpectDays}" name="settings[InvoiceExpectDays]"/> {$lang.InvoiceUnpaidReminder2}
                                    <br/><br/>

                                    {$lang.InitialDueDays} <input type="text" size="3" class="inp" value="{$groupx.settings.InitialDueDays}" name="settings[InitialDueDays]"/> {$lang.InitialDueDays2}
                                    <br/><br/>
                                </div>


                            </td>
                        </tr>






                        <tr>
                            <td width="200" align="right" valign="top"><strong>{$lang.new_SendPaymentReminderEmails}</strong></td>
                            <td>
                                <input type="checkbox" name="settings_enabled[SendPaymentReminderEmails]" class="toc" value="1" {if $groupx.settings_enabled.SendPaymentReminderEmails}checked="checked"{/if} /> Override package settings for this group
                                <div class="contener">
                                    <input type="radio" {if $groupx.settings.SendPaymentReminderEmails == 'off'}checked="checked"{/if}   name="settings[SendPaymentReminderEmails]" value="off"  onclick="$('#reminder_options').hide();" id="reminder_off"/><label  for="reminder_off"><b>{$lang.no}</b></label>
                                    <input type="radio" {if $groupx.settings.SendPaymentReminderEmails == 'on'}checked="checked"{/if}  name="settings[SendPaymentReminderEmails]" onclick="$('#reminder_options').ShowNicely();" id="reminder_on"/><label  for="reminder_on"><b>{$lang.yes}</b></label>

                                    <div class="p5" id="reminder_options" style="{if $groupx.settings.SendPaymentReminderEmails == 'off'}display:none;{/if}margin-top:10px;border:#ccc 1px solid;" >


                                        {$lang.InvoiceUnpaidReminder} <span><input type="checkbox" value="1" {if $groupx.settings.InvoiceUnpaidReminder>0}checked="checked"{/if} onclick="check_i(this)" />
                                            <input type="text" size="3" class="config_val  inp" {if $groupx.settings.InvoiceUnpaidReminder<=0} value="0" disabled="disabled"{else}value="{$groupx.settings.InvoiceUnpaidReminder}"{/if} name="settings[InvoiceUnpaidReminder]"/> </span> {$lang.InvoiceUnpaidReminder2}
                                        <br/><br/>

                                        {$lang.1OverdueReminder}
                                        <span>
                                            <input type="checkbox" value="1" {if $groupx.settings.1OverdueReminder>0}checked="checked"{/if} onclick="check_i(this)" /><input type="text" size="3" class="config_val  inp" {if $groupx.settings.1OverdueReminder<=0}value="0" disabled="disabled"{else}value="{$groupx.settings.1OverdueReminder}"{/if} name="settings[1OverdueReminder]"/>
                                        </span>
                                        <span>
                                            <input type="checkbox" value="1" {if $groupx.settings.2OverdueReminder>0}checked="checked"{/if} onclick="check_i(this)" /><input type="text" size="3" class="config_val inp" {if $groupx.settings.2OverdueReminder<=0}value="0" disabled="disabled"{else}value="{$groupx.settings.2OverdueReminder}"{/if} name="settings[2OverdueReminder]"/>
                                        </span>
                                        <span>
                                            <input type="checkbox" value="1" {if $groupx.settings.3OverdueReminder>0}checked="checked"{/if} onclick="check_i(this)" /><input type="text" size="3" class="config_val  inp" {if $groupx.settings.3OverdueReminder<=0}value="0" disabled="disabled"{else}value="{$groupx.settings.3OverdueReminder}"{/if} name="settings[3OverdueReminder]"/>
                                        </span>
                                        {$lang.1OverdueReminder2}


                                    </div></div>
                            </td>
                        </tr>

                        <tr>
                            <td width="200" align="right" valign="top">
                                <strong>{$lang.new_LateFeeType_on|capitalize}</strong>
                            </td>
                            <td>
                                <input type="checkbox" name="settings_enabled[LateFeeType]" class="toc" 
                                       value="1" {if $groupx.settings_enabled.LateFeeType}checked="checked"{/if} /> 
                                Override package settings for this group
                                <div class="contener">
                                    <input type="radio" {if $groupx.settings.LateFeeType == '0'}checked="checked"{/if} 
                                           name="settings[LateFeeType_sw]" value="0"  onclick="$('#latefee_options').hide();" 
                                           id="latefee_off"/>
                                    <label  for="latefee_off"><b>{$lang.no}</b></label>

                                    <input type="radio" {if $groupx.settings.LateFeeType != '0'}checked="checked"{/if} 
                                           name="settings[LateFeeType_sw]" value="1" onclick="$('#latefee_options').ShowNicely();" 
                                           id="latefee_on"/>
                                    <label  for="latefee_on"><b>{$lang.yes}</b></label>

                                    <div class="p5" id="latefee_options" style="{if $groupx.settings.LateFeeType == '0'}display:none;{/if}margin-top:10px;border:#ccc 1px solid;" >
                                        {$lang.new_LateFeeType_on1} <input size="1" class="inp config_val"  value="{$groupx.settings.LateFeeValue}" name="settings[LateFeeValue]"/>
                                        <select  class="inp config_val" name="settings[LateFeeType]">
                                            <option {if $groupx.settings.LateFeeType=='1'}selected="selected"{/if} value="1">%</option>
                                            <option {if $groupx.settings.LateFeeType=='2'}selected="selected"{/if}value="2">{if $currency.code}{$currency.code}{else}{$currency.iso}{/if}</option>
                                        </select> {$lang.new_LateFeeType_on2}
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="200" align="right" valign="top">
                                <strong>Late Fee Days</strong>
                            </td>
                            <td>
                                <input type="checkbox" name="settings_enabled[AddLateFeeAfter]" class="toc" 
                                       value="1" {if $groupx.settings_enabled.AddLateFeeAfter}checked="checked"{/if} /> 
                                Override package settings for this group
                                <div class="contener">
                                    <div class="p5" id="latefeedays_options" style="margin-top:10px;border:#ccc 1px solid;" >
                                        <input type="text" size="3" value="{$groupx.settings.AddLateFeeAfter}" 
                                               name="settings[AddLateFeeAfter]" class="config_val inp" />
                                        {$lang.LateFeeType2x} 
                                    </div>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>


            <div class="sectioncontent" style="display:none">
                {if $action=='addgroup'}Please save this group first to set orderpage-specific discounts{else}


                    <table width="100%" cellspacing="0" cellpadding="3" border="0" class="whitetable" style="border:solid 1px #ddd;" id="discounttable">

                        <tr>
                            <th colspan="3" align="left">Category / product specific discount</th>
                        </tr>

                        {foreach from=$groupx.discounts item=discount name=fl}
                            <tr id="discount_{$smarty.foreach.fl.index}">
                                <td style="padding-left:10px">{$discount.name}
                                    <input type="hidden" name="discounts[{$smarty.foreach.fl.index}][discount]" value="{$discount.discount}"/>
                                    <input type="hidden" name="discounts[{$smarty.foreach.fl.index}][type]" value="{$discount.type}"/>
                                    <input type="hidden" name="discounts[{$smarty.foreach.fl.index}][product_id]" value="{if $discount.rel=='Category'}cat_{else}prod_{/if}{$discount.rel_id}'"/>
                                </td>
                                <td width="140">{$discount.discount} {if $discount.type=='percent'}%{/if}</td>
                                <td width="40"><a href="#" class="editbtn editgray" onclick="removeDiscount('{$smarty.foreach.fl.index}');">Remove</a></td>
                            </tr>


                        {/foreach}

                    </table>

                    <br/>
                    <div class="p5">
                        <table border="0" cellpadding="3" cellspacing="0" >
                            <tbody><tr>
                                    <td width="100" class="fs11"><span class="left">New discount category / product</span></td>
                                    <td width="100" class="fs11"><span class="left">Discount</span></td>
                                    <td width="60" class="fs11"><span class="left">Type</span> </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td> <select class="inp" id="product_id" >
                                            {foreach from=$services item=category}
                                                {if $category.products}
                                                    <optgroup label="{$category.name}">
                                                        <option value="cat_{$category.id}" >{$category.name} - Entire category</option>
                                                        {foreach from=$category.products item=prod}
                                                            <option value="prod_{$prod.id}" >{$category.name} - {$prod.name}</option>
                                                        {/foreach}
                                                    </optgroup>
                                                {/if}
                                            {/foreach}
                                        </select></td>
                                    <td><input type="text" class="inp" value="0.00" size="5" id="discount_value"></td>
                                    <td><select class="inp" id="discount_type" >

                                            <option value="fixed" >Fixed</option>
                                            <option value="percent" >Percent</option>
                                        </select></td>
                                    <td>
                                        <a onclick="addDiscount();
                                                return false;" class="prices menuitm " href="#"><span class="addsth">Add</span></a>
                                    </td>
                                </tr>
                            </tbody></table>

                    </div>

                {/if}
            </div>

            <a class="new_dsave new_menu"  style="margin-top: 2em;" href="#" onclick="$('#sme').submit();
                    return false"  >
                <span>{$lang.savechanges}</span>
            </a>
            <div class="clear"></div>
        </div>

        <input type="hidden" name="make" value="s" />
        {securitytoken}
    </form>
{/if}


{literal}
    <script>

        var addDiscount = function () {
            var product_id = $('#product_id').val(),
                discount = $('#discount_value').val(),
                type = $('#discount_type').val(),
                typeunit = ($('#discount_type').val() == 'percent') ? '%' : '',
                name = $('#product_id option:selected').text(),
                id = $('#discounttable tr').length - 1;
            var html = '<tr id="discount_' + id + '">' +
                '<td style="padding-left:10px">' + name +
                '<input type="hidden" name="discounts[' + id + '][discount]" value="' + discount + '"/>' +
                '<input type="hidden" name="discounts[' + id + '][type]" value="' + type + '"/>' +
                '<input type="hidden" name="discounts[' + id + '][product_id]" value="' + product_id + '"/>' +
                '</td>' +
                '<td width="140">' + discount + ' ' + typeunit + '</td>' +
                '<td width="40"><a href="#" class="editbtn editgray" onclick="removeDiscount(' + id + ');">Remove</a></td>' +
                '</tr>';
            $('#discounttable').append(html);
            return false;
        },
            removeDiscount = function (id) {
                $('#discounttable tr#discount_' + id).remove();
                return false;
            };
    </script>
{/literal}
