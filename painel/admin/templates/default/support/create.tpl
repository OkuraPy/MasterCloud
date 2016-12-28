<form action="?cmd=tickets&action=new" method="post" id="newticketform" enctype="multipart/form-data">
        <input type="hidden" name="make" value="createticket" />
        <input type="hidden" value="new" id="ticket_number" />
        <input type="hidden" name="useclientname" value="1" />
        <div class="lighterblue" style="padding:5px">
            <table width="100%" cellspacing="2" cellpadding="3" border="0" class="">
                <tbody>
                    <tr>
                        <td width="120px">{$lang.Client}</td>
                        <td>
                            <select name="client" id="client_picker" class="inp" load="clients" default="{if $submit.client}{$submit.client}{elseif $client_id}{$client_id}{else}0{/if}" style="width:340px">
                                <option value="-1"  {if $submit.client=='-1' && !$client_id}selected="selected"{/if}>{$lang.nonregistered}</option>
                                <option value="0" {if ($submit.client=='0' && !$client_id) || !isset($submit.client)}selected="selected"{/if}>{$lang.chooseone}</option>
                                {foreach from=$clients item=client}
                                    {if $submit.client==$client.id || $client_id==$client.id}
                                        <option value="{$client.id}" selected="selected">#{$client.id} {if $client.companyname!=''}{$client.companyname}{else}{$client.firstname} {$client.lastname}{/if}</option>
                                    {/if}
                                {/foreach}
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr id="emailrow2" {if !isset($submit.client) || $submit.client>'0'  || $client_id }style="display:none"{/if}>
                        <td>{$lang.Name}</td>
                        <td colspan="2"><input type="text" value="{$submit.name}" size="50" name="name"  class="inp"/></td>
                    </tr>

                    <tr id="emailrow" {if !isset($submit.client) || $submit.client>'0' || $client_id }style="display:none"{/if}>
                        <td>{$lang.email}</td>
                        <td colspan="2"><input type="text" value="{$submit.email}" size="50" name="email"  class="inp"/></td>
                    </tr>

                    <tr>
                        <td>{$lang.Subject}</td>
                        <td colspan="2">
                            <input type="text" value="{$submit.subject|escape}" size="75" name="subject" required="required"  class="inp"/>
                        </td>
                    </tr>

                    <tr>
                        <td>{$lang.department}</td>
                        <td colspan="2">
                            <select name="dept_id" class="inp">
                                {foreach from=$departments item=dept}
                                    <option value="{$dept.id}" {if $submit.dept_id==$dept.id}selected="selected"{/if}>{$dept.name}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>{$lang.status}</td>
                        <td colspan="2">
                            <select name="status" class="inp">
                                {foreach from=$statuses item=status}
                                    <option value="{$status}" {if $submit.status==$status}selected="selected"{/if}>{$status}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Assigned to</td>
                        <td>
                            <select name="owner_id" class="inp">
                                <option value="0">{$lang.none}</option>
                                {foreach from=$staff_members item=stfmbr}
                                    <option {if $stfmbr.id==$submit.owner_id}selected="selected"{/if} value="{$stfmbr.id}">{$stfmbr.firstname} {$stfmbr.lastname}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>CC</td>
                        <td colspan="2">
                            <a href="#" onclick="$(this).hide();
                                    $('#addcc').show();
                                    return false;" {if $submit.cc}style="display:none"{/if} class="editbtn">{$lang.addcc}</a>
                            <div {if !$submit.cc}style="display:none"{/if} id="addcc">
                                <input type="text" value="{$submit.cc}" size="75" name="cc" class="inp"/> <small>{$lang.addmanycoma}</small>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top"><textarea rows="14" id="replyarea" name="body">{$submit.body}</textarea>
                            <div id="draftinfo"><span class="draftdate" {if $submit.date}style="display:inline"{/if}>{$lang.draftsavedat}{$submit.date|dateformat:$date_format}</span> <span class="controls" style="display:inline"><a href="#" onclick="return savedraft()">{$lang.savedraft}</a> <a href="#" onclick="return removedraft()">{$lang.removedraft}</a></span></div>
                            <script type="text/javascript">
                                {literal}
                                    function savedraft() {
                                        ajax_update('?cmd=tickets', {make: 'savedraft', action: 'menubutton', id: $('#ticket_number').val(), body: $('#replyarea').val()}, '#draftinfo .draftdate');
                                        $('#draftinfo .draftdate').show();
                                        return false;
                                    }
                                    function removedraft() {
                                        ajax_update('?cmd=tickets', {make: 'removedraft', action: 'menubutton', id: 'new'});
                                        $('#draftinfo .draftdate').html('').hide();
                                        $('#draftinfo .controls').hide();
                                        $('#replyarea').val("");
                                        return false;
                                    }
                                {/literal}
                            </script>
                        </td>
                        <td valign="top" style="padding-right:4px; background: #FFF" width="230">

                            <div class="gbar" id="rswitcher">
                                <a href="?cmd=predefinied&action=gettop" class="active d1">{$lang.myreplies}</a>
                                <a href="?cmd=predefinied&action=browser" class="d2">{$lang.replybrowse}</a>
                                <a href="?cmd=knowledgebase&action=browser" class="d3">{$lang.kbarticles}</a>
                                <div class="clear"></div>
                            </div>
                            <div id="suggestion">
                                <div class="d1">Loading...</div>
                                <div class="d2">Loading...</div>
                                <div class="d3">Loading...</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <a href="#" onclick="$(this).hide().next().show();
                                    return false;" {if $submit.notes}style="display:none"{/if} class="editbtn">Add note</a>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" {if !$submit.notes}style="display:none"{/if} >
                                <tbody>
                                    <tr class="odd">
                                        <td style="vertical-align: baseline; white-space: nowrap; padding: 5px; ">
                                            <strong style="">Note</strong><br>
                                            ({if $admindata.lastname!='' && $admindata.firstname!=''}{$admindata.firstname} {$admindata.lastname}{else}{$admindata.username}{/if})
                                        </td>
                                        <td style="padding-top:5px" width="100%" >
                                            <textarea class="notes_field notes_changed" id="ticketnotesarea"  style="width:40%; height:auto" name="notes" >{$submit.notes}</textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <a  class="attach editbtn" href="#" >{$lang.addattachment}</a> &nbsp;&nbsp;({$lang.allowedextensions} {$extensions})<br />
                            <div id="attachments"> </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="blu">
            <input type="submit" value="{$lang.createticket}" style="font-weight:bold" id="ticketsubmitter"/>
        </div>
        {securitytoken}
    </form>
    {if $ajax}
        {literal}
            <script type="text/javascript">bindEvents();
                bindTicketEvents();</script>
        {/literal}
    {/if}
    <script type="text/javascript">
        $(document).trigger('HostBill.newticketform');

    </script>