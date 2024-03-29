{if $action=='viewtranscript'}
        <link href="{$template_dir}hbchat/media/popup.css?v={$hb_version}" rel="stylesheet" media="all" />
<div class="blu">
    <strong>Chat transcript #{$details.id}</strong> <a href="?cmd=hbchat&action=history">&laquo; Back</a>

    </div>
        <div style="padding:10px">
        <div class="cwrapper">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tbody><tr>
                    <td width="50%" valign="top" >
                        <table cellspacing="0" cellpadding="0" width="100%" class="bluetable">
                            <tbody><tr>
                                    <td class="first">Subject</td>
                                    <td>{if $details.subject}{$details.subject}{else}<em>No subject</em>{/if}</td>
                                </tr>
                                <tr class="odd">
                                    <td class="first">User name</td>
                                    <td>{$details.visitor_name} {if $details.client_id}<a href="?cmd=clients&action=show&id={$details.client_id}" target="_blank">Registered client</a>{/if}</td>
                                </tr>
                                <tr>
                                    <td class="first">User email</td>
                                    <td>{if $details.visitor_email}{$details.visitor_email}{else}<em>None provided</em>{/if}</td>
                                </tr>
                                <tr class="odd">
                                    <td class="first">Date</td>
                                    <td>{$details.date_start|dateformat:$date_format}</td>
                                </tr>
                                <tr>
                                    <td class="first">Staff</td>
                                    <td>{$details.firstname} {$details.lastname}</td>
                                </tr>
                                <tr class="odd">
                                    <td class="first">Chat type</td>
                                    <td>{if $details.type=='AC'}Staff invitation{else}User request{/if}</td>
                                </tr>
                            </tbody></table>
                    </td>
                    <td width="50%" valign="top" >
                        <table cellspacing="0" cellpadding="0" width="100%" class="bluetable">
                            <tbody>
                                <tr>
                                    <td class="first">Department</td>
                                    <td >{$details.deptname}</td>
                                </tr>
                                <tr class="odd">
                                    <td class="first">Status</td>
                                    <td >{$details.status}</td>
                                </tr>
                                <tr>
                                    <td class="first">Duration</td>
                                    <td>{$details.duration}</td>
                                </tr>
                                <tr class="odd">
                                    <td class="first">Round robin hits</td>
                                    <td>{$details.robin_count}</td>
                                </tr>
                                <tr>
                                    <td class="first">Chat ID</td>
                                    <td># {$details.id}</td>
                                </tr>
                                <tr class="odd">
                                    <td class="first">Geodata</td>
                                    <td>{$details.countryname}, {$details.city}</td>
                                </tr>

                            </tbody></table>
                    </td>
                </tr>
            </tbody></table>
            </div>


        <div style="padding:10px;">
            {foreach from=$details.messages item=m}
             <div class="msg_wrapper msg_{$m.type}">
                    <span class="msg_who {$m.type}">{$m.submitter_name}:</span>
                    <span class="msg_date">{$m.date|dateformat:$date_format}</span>
                    <div class="clear"></div>
                    <span class="msg">{$m.message}</span>
                    <div class="clear"></div>
            </div>
            {/foreach}
        </div>
</div>
{else}
<form action="" method="post" id="testform" ><input type="hidden" value="{$totalpages}" name="totalpages2" id="totalpages"/>
    <div class="blu">
        <div class="right"><div class="pagination"></div></div>
        <div class="clear"></div>
    </div>

    <a href="?cmd=hbchat&action=history" id="currentlist" style="display:none"></a>
    <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike hover">
        <tbody>
            <tr>
                <th width="60"><a href="?cmd=hbchat&action=history&orderby=id|ASC"  class="sortorder">Chat ID</a></th>
                <th  width="160"><a href="?cmd=hbchat&action=history&orderby=date_start|ASC"  class="sortorder">{$lang.Date}</a></th>
                <th width="160"><a href="?cmd=hbchat&action=history&orderby=visitor_name|ASC"  class="sortorder">User name</a></th>
                <th><a href="?cmd=hbchat&action=history&orderby=subject|ASC"  class="sortorder">Subject</a></th>
                <th width="20">&nbsp;</th>
                <th width="20">&nbsp;</th>
            </tr>
        </tbody>
        <tbody id="updater">

            {include file='hbchat/ajax.history.tpl'}
        </tbody>
        <tbody id="psummary">
            <tr>
                <th colspan="10">
                    {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                </th>
            </tr>
        </tbody>
    </table>


    {securitytoken}</form>
{/if}