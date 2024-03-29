<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name} </title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="{$template_dir}hbchat/media/jquery.js?v={$hb_version}"></script>
        <script type="text/javascript" src="{$template_dir}hbchat/media/mustache.js?v={$hb_version}"></script>
        <script type="text/javascript" src="{$template_dir}hbchat/media/popup.js?v={$hb_version}"></script>
        <script type="text/javascript" src="{$template_dir}hbchat/media/jquery.simplemodal.js?v={$hb_version}"></script>
        <script type="text/javascript" src="{$template_dir}hbchat/media/osx.js?v={$hb_version}"></script>
        <script type="text/javascript" src="{$template_dir}hbchat/media/soundmanager2-nodebug-jsmin.js?v={$hb_version}"></script>
        <script type="text/javascript" src="{$template_dir}hbchat/media/jquery.jgrowl_minimized.js?v={$hb_version}"></script>
        <link href="{$template_dir}_style.css?v={$hb_version}" rel="stylesheet" media="all" />
        <link href="{$template_dir}hbchat/media/popup.css?v={$hb_version}" rel="stylesheet" media="all" />
        <link href="{$template_dir}hbchat/media/osx.css?v={$hb_version}" rel="stylesheet" media="all" />
        <link href="{$template_dir}hbchat/media/jquery.jgrowl.css?v={$hb_version}" rel="stylesheet" media="all" />
         {include file="hbchat/jslanguage.tpl"}
        {literal}
        <script type="text/javascript">
        $(document).ready(function() {
            HBOperator.lang = lang;
            HBOperator.hostbill_url="{/literal}{$admin_url}{literal}/";
            soundManager.url ="templates/default/hbchat/media/swf/";
            soundManager.flashVersion =9;
            HBOperator.sound_visitorchange =  "templates/default/hbsoundManagerchat/media/visitor.mp3";
            HBOperator.sound_newchat =  "templates/default/hbchat/media/newchat.mp3";
            HBOperator.sound_newmsg =  "templates/default/hbchat/media/newmsg.mp3";
            HBOperator.init();
        });
        </script>
        {/literal}
    </head>
    <body class="hbpopup">

        <div id="hb_chat_tabs_container">
            <div class="chat_tab chat_tab_active" onclick="HBOperator.switch_tab('visitors', this);"><span class="tab_txt">Live traffic</span><span id="visitors_count" class="tab_counter">0</span></div>
          
            <div class="clear" id="clearer"></div>

        </div>
        <div id="hb_chat_body">
            <div id="hb_chat_tabs">
                <div class="hb_chat_tab" id="visitors">
                    <div id="hb_traffic_table">
                        Loading visitors data...

                    </div>
                </div>


               
            </div>

        </div>
        <div id="hb_chat_status_bar" style="position:fixed;bottom:29px; right:15px; width: 368px;">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td>Status: 
                        <input type="radio" name="current_status" value="Active" checked="checked" id="status_active" onclick="return HBOperator.change_status('Active');" />online
                        <input type="radio" name="current_status" value="Away" id="status_away"  onclick="return HBOperator.change_status('Away');" />away
                        <input type="radio" name="current_status" value="Offline" id="status_offline"  onclick="return HBOperator.change_status('Offline');" />offline
                    </td>
                    <td width="90">chats today: <br/> <span class="fs10"><span id="chats_today_cnt">0</span> accepted</span></td>
                </tr>
            </table>
        </div>



        {* BOF: SIMPLEMODAL.JS *}
        <div id="away_notice" style="display:none;">
            You appear as Away. In 30 minutes you will be automatically logged out. <br />
            <input type="button" onclick="return HBOperator.close_modal()" value="Go back online" style="font-weight:bold;" class="submitme"/>
        </div>
        <div id="away_notice_title" style="display:none;">Your current status: Away</div>

         <div id="visitorchange_notice" style="display:none;">
            You can change contact details provided by user here. <br />
            <table border="0" cellspacing="0" cellpadding="2" >
                <tr>
                    <td>User name:</td>
                    <td><input class="styled_text visitor_name" name="visitor_name" value="" /></td>
                </tr>
                  <tr>
                    <td>User email:</td>
                    <td><input class="styled_text visitor_email" name="visitor_email"  value="" /></td>
                </tr>
                <tr>
                    <td colspan="2"> <input type="button" onclick="return HBOperator.update_chat_details()" value="Update user details" style="font-weight:bold;" class="submitme"/></td>
                </tr>

            </table>
        </div>
        <div id="visitorchange_title" style="display:none;">Change chat contact details</div>

    

         <div id="offline_notice" style="display:none;">
            Please confirm going offline.<br />
            <input type="button" onclick="return HBOperator.change_status('Offline-Confirmed');" value="Logout" class="submitme" style="font-weight:bold;" />
            <input type="button" onclick="return HBOperator.close_modal()" value="Stay online"  class="submitme"/>
        </div>
        <div id="offline_notice_title" style="display:none;">Are you sure you want to disconnect?</div>
        <div id="osx-modal-content" style="display:none">
            <div id="osx-modal-title"></div>
            <div class="close simplemodal-close">x</div>
            <div id="osx-modal-data"></div>
        </div>
         {* BOF: SOUND.JS *}
        <div id="sound_visitorchange"></div><div id="sound_newchat"></div><div id="sound_newmsg"></div>
        {* BOF: jGROWL.JS *}
        <div id="jGrowl" class="jGrowl bottom-right" ></div>
        {* BOF: MUSTACHE.JS *}
        {literal}

        <div id="hb_chat_template" style="display:none">
            <textarea id="visitorban_title" >Confirm visitor ban {{visitor_name}}</textarea>
            <textarea id="visitorban_content" >
            Are you sure you wish to ban this visitor for <b>7 days</b>? Chat always appears as offline for banned visitors.<br/>
            <input type="button" onclick="return HBOperator.banVisitor('{{id}}');" value="Ban from chat" class="submitme" style="font-weight:bold;" />

            </textarea>
            <textarea id="hb_chat_tab_template">
                <div class="hb_chat_tab" id="{{type}}_{{id}}"  style="display:none">
                     <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td valign="top">
                            <div class="conversation_container">
                                <div class="conversation_content">
                                    <div class="messages">
                                        <div class="accept_call" style="display:none">
                                            <b>{{visitor_name}}</b> requests chat.
                                            <div class="clear"></div>
                                            <span onclick="return HBOperator.acceptChat('{{id}}')" class="new_control control_el"><span class="addsth">Join chat</span></span> <span class="orspace fs11">or</span><a href="javascript:void(0)" class="editbtn orspace" onclick="return  HBOperator.close_tab('chat_{{id}}');">decline</a>
                                        </div>

                                    </div>
                                </div>
                                <div class="c_content">
                                    <div class="bottom_tabs_content">
                                    <div class="c_inputbar">
                                        &lt;textarea name="content"&gt;&lt;/textarea&gt;
                                        <span class="sendbtn right"><span >Send</span></span>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="c_canned_content" style="display:none;">
                                        
                                    </div>
                                    </div>
                                    <div class="c_bottom_content">
                                        <div class="left">
                                            <div class="bottom_tabs_container">
                                                <div class="chat_tab_btm chat_btm_active tc_inputbar" onclick="HBOperator.switch_tab_bottom('{{id}}','c_inputbar');"><span class="tab_txt tab_msg">Send message</span></div>
                                                <div class="chat_tab_btm tc_canned_content" onclick="HBOperator.switch_tab_bottom('{{id}}','c_canned_content');"><span class="tab_txt tab_canned">Canned responses</span></div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="chat_control_content">
                                                <span class="printer_icon"  onclick="return HBOperator.printChat('{{id}}')"></span>
                                                <span class="chat_sound_icon sound_on" onclick="return HBOperator.toggleChatSound()"></span>
                                            </div>
                                        </div>

                                        <div class="clear"></div>
                                    </div>
                                </div>

                            </div>
                        </td>
                        <td valign="top" width="386">
                            <div class="visitor_table_container">
                                <div class="visitor_tabs">
                                <ul >
                                    <li class="current" onclick="HBOperator.switch_visitor_tab('chat_{{id}}', 'visitor', this);"><span>Visitor</span></li>
                                    <li class="break"></li>
                                    <li onclick="HBOperator.switch_visitor_tab('chat_{{id}}', 'footprints', this);"><span>Footprints</span><span class="tab_counter">{{visitor.footprints}}</span></li>
                                    <li class="break"></li>
                                    <li onclick="HBOperator.switch_visitor_tab('chat_{{id}}', 'transcripts', this);"><span>Transcripts</span><span class="tab_counter">{{visitor.chatsTotal}}</span></li>
                                    <li class="break"></li>
                                    <li onclick="HBOperator.open_tab('visitor', '{{visitor_id}}',false,true)"><span>More</span></li>
                                    <li class="break"></li>
                                </ul>
                                </div>
                                <div class="visitor_tabs_content">
                                    <div class="visitor_tab tab_visitor">
                                        <table class="bluetable" width="100%" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="first">Department</td>
                                                <td>{{deptname}}</td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="first">User name</td>
                                                <td>{{#visitor.client_id}}#{{visitor.client_id}} <a href="?cmd=clients&action=show&id={{visitor.client_id}}" target="_blank">{{visitor_name}}</a> {{/visitor.client_id}}{{^visitor.client_id}}{{visitor_name}}{{/visitor.client_id}}  <span class="alike right" onclick="HBOperator.user_change_prompt('{{id}}')">change</span></td>
                                            </tr>
                                            <tr >
                                                <td class="first">User email</td>
                                                <td>{{#visitor_email}}{{visitor_email}}{{/visitor_email}}{{^visitor_email}}<em>None</em>{{/visitor_email}} <span class="alike right" onclick="HBOperator.user_change_prompt('{{id}}')">change</span></td>
                                            </tr>
                                             <tr class="odd">
                                                <td class="first">Total chats</td>
                                                <td>{{visitor.chatsTotal}}</td>
                                            </tr>
                                            <tr >
                                                <td class="first">Current page</td>
                                                <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="{{visitor.page}}" target="_blank">{{visitor.page_title}}</a></div></div></div></td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="first">Referer</td>
                                                <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="{{visitor.ref}}" target="_blank">{{visitor.ref}}</a></div></div></div></td>
                                            </tr>
                                            <tr >
                                                <td class="first">IP</td>
                                                <td>{{visitor.ip}}</td>
                                            </tr>
                                             <tr class="odd">
                                                <td class="first">Hostname</td>
                                                <td>{{visitor.hostname}}</td>
                                            </tr>
                                              <tr>
                                                <td class="first">Country</td>
                                                <td><img src="templates/default/hbchat/media/countries/{{visitor.country}}.gif" alt="{{visitor.countryname}}"/> {{visitor.countryname}}</td>
                                            </tr>
                                              <tr  class="odd">
                                                <td class="first">City</td>
                                                <td>{{visitor.city}}</td>
                                            </tr>
                                            <tr >
                                                <td class="first">OS/Browser</td>
                                                <td><img src="templates/default/hbchat/media/client/{{visitor.os}}.png" alt="{{visitor.os}}"/> <img src="templates/default/hbchat/media/client/{{visitor.browser}}.png" alt="{{visitor.browser}}"/></td>
                                             </tr>
                                        </table>


                                        <div class="controls_content">
                                            <span class="control_el" onclick="return HBOperator.open_ticket('{{id}}')"><span class="ticket">Open Ticket</span></span>
                                            <span class="control_el" onclick="return HBOperator.banVisitorPrompt('{{visitor.visitor_name}}','{{visitor_id}}')"><span class="ban">Ban from chat</span></span>
                                        </div>
                                        
                                    </div>
                                    <div class="visitor_tab tab_footprints" style="display:none">
                                        <table border="0" cellspacing="0" cellpadding="0" width="100%" class="display" style="table-layout: fixed;">
                                            <thead>
                                                <tr>
                                                    <th class="fs11">Page</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {{#visitor.footprint_list}}
                                                <tr>

                                                    <td class="subjectline fs11"><div class="df1"><div class="df2"><div class="df3"><a  href="{{page}}" target="_blank">{{page_title}}</a></div></div></div></td>
                                                </tr>
                                                {{/visitor.footprint_list}}
                                                {{^visitor.footprint_list}}
                                                <tr><td class="fs11">No footprints found</td></tr>
                                                {{/visitor.footprint_list}}
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="visitor_tab tab_transcripts fs11" style="display:none"></div>
                                </div>
                            </div>
                        </td>

                    </tr>
                </table>
</div>
            </textarea>
            <textarea id="hb_chat_transcripts">
                        <table border="0" cellspacing="0" cellpadding="0" width="100%" class="display" style="table-layout: fixed;">
                                            <thead>
                                                <tr>
                                                    <th class="" width="120">Date</th>
                                                    <th class="">Subject</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {{#transcripts}}
                                                <tr>
                                                    <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="javascript:void(0)" onclick="return HBOperator.printChat('{{id}}')">{{date_start}}</a></div></div></div></td>
                                                   <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="javascript:void(0)" onclick="return HBOperator.printChat('{{id}}')">{{#subject}}{{subject}}{{/subject}}{{^subject}}No subject{{/subject}}</a></div></div></div></td>
                                                </tr>
                                                {{/transcripts}}
                                                {{^transcripts}}
                                                <tr><td class="" colspan="2">No transcripts found</td></tr>
                                                {{/transcripts}}
                                            </tbody>
                                        </table>
</table>
            </textarea>
             <textarea id="hb_chat_canned_fav">
             {/literal}
                {if $canned_fav}
                   {foreach from=$canned_fav item=r} <span class="tag" onclick="HBOperator.useCanned(this)" content="{$r.body|escape:'dquotes'}">{$r.title}</span>{/foreach}
                                           {else}
          No canned responses crated &amp; set as favourite yet
            {/if}
             {literal}
               
             </textarea>
             <textarea id="hb_chat_tab_element_template">
               <div class="chat_tab blinking t{{type}}"  id="{{type}}_tab_{{id}}"  onclick="HBOperator.switch_tab('{{type}}_{{id}}', this);" ><span class="tab_txt">{{name}}</span><span class="tab_close" onclick="return HBOperator.close_tab('{{type}}_{{id}}');"></span></div>
            </textarea>
            <textarea id="visitor_details_template">
             <div class="hb_chat_tab" id="visitor_{{id}}" style="display:none">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td valign="top" >
                            <div class="visitor_table_container">
                                <div class="visitor_tabs">
                                <ul >
                                    <li class="current" onclick="HBOperator.switch_visitor_tab('visitor_{{id}}', 'visitor', this);"><span>Visitor</span></li>
                                    <li class="break"></li>
                                    <li onclick="HBOperator.switch_visitor_tab('visitor_{{id}}', 'footprints', this);"><span>Footprints</span><span class="tab_counter">{{footprints}}</span></li>
                                    <li class="break"></li>
                                    <li onclick="HBOperator.switch_visitor_tab('visitor_{{id}}', 'transcripts', this);"><span>Transcripts</span><span class="tab_counter">{{chatsTotal}}</span></li>
                                    <li class="break"></li>
                                    <li onclick="HBOperator.switch_visitor_tab('visitor_{{id}}', 'geolocation', this);"><span>GeoLocation</span></li>
                                    <li class="break"></li>
                                    <li onclick="HBOperator.open_tab('visitor', '{{id}}', false, true, true); " class="refresh"><span class="refresh"></span></li>
                                    <li class="break"></li>
                                </ul>
                                </div>
                                <div class="visitor_tabs_content">
                                    <div class="visitor_tab tab_visitor">
                                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                            <tr>
                                                <td width="50%" valign="top" style="padding-right:10px">
                                                    <table class="bluetable biggerfont" width="100%" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="first">Is registered?</td>
                                                <td>{{^client_id}}No{{/client_id}}{{#client_id}}<a href="?cmd=clients&action=show&id={{client_id}}" target="_blank">Yes, #{{client_id}}</a>{{/client_id}}</td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="first">IP / Hostname</td>
                                                <td>{{ip}} / {{hostname}}</td>
                                            </tr>

                                               <tr>
                                                <td class="first">Country</td>
                                                <td><img src="templates/default/hbchat/media/countries/{{country}}.gif" alt="{{countryname}}"/> {{countryname}}</td>
                                            </tr>
                                              <tr class="odd">
                                                <td class="first">City</td>
                                                <td>{{city}}</td>
                                            </tr>
                                             <tr>
                                                <td class="first">Region</td>
                                                <td>{{region}}</td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="first">Chats</td>
                                                <td>{{chatsCA}}</td>
                                            </tr>
                                             <tr>
                                                <td class="first">Invites</td>
                                                <td>{{chatsAC}}</td>
                                            </tr>
                                        </table>
                                                </td>
                                                <td width="50%" valign="top" style="padding-left:10px">
                                                    <table class="bluetable biggerfont" width="100%" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="first">Current page</td>
                                                <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="{{page}}" target="_blank">{{page_title}}</a></div></div></div></td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="first">Referer</td>
                                                <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="{{ref}}" target="_blank">{{ref}}</a></div></div></div></td>
                                            </tr>
                                             <tr>
                                                <td class="first">Last visit</td>
                                                <td>{{last_visit}}</td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="first">Time tracked</td>
                                                <td>{{timeonline}}</td>
                                            </tr>
                                              <tr>
                                                <td class="first">OS / Browser</td>
                                                <td><img src="templates/default/hbchat/media/client/{{os}}.png" alt="{{os}}"/> <img src="templates/default/hbchat/media/client/{{browser}}.png" alt="{{browser}}"/></td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="first">Search query</td>
                                                <td><em>{{searchterm}}</em></td>
                                            </tr>
                                              <tr>
                                                <td class="first">Status</td>
                                                <td>{{status}}</td>
                                            </tr>
                                        </table>
                                                </td>
                                            </tr>

                                        </table>



                                        <div class="controls_content">
                                            <span class="control_el" onclick="$('#invitation_container_{{id}}').toggle();"><span class="invite">Invite to chat</span></span>
                                            <span class="control_el" onclick="return HBOperator.banVisitorPrompt('{{name}}','{{id}}')"><span class="ban">Ban from chat</span></span>
                                        </div>
                                        <div id="invitation_container_{{id}}" style="display:none" class="p6">
                                            <b>Initial message:</b>
                                            {/literal}{if $canned_fav}{literal}
                                            <select name="canned_response" class="canned_response styled_text" id="invitation_message_{{id}}" style="width:350px;">
                                                {/literal}
                   {foreach from=$canned_fav item=r} <option value="{$r.id}">{$r.title}</option>{/foreach}    </select>
                                           {else}  <input type="text" class="styled_text" id="invitation_message_{literal}{{id}}{/literal}" style="width:350px;"/>{/if}{literal}

                                           <b>Dept:</b>
                                            <select name="department_id" class="styled_text" id="department_id_{{id}}">
                                                {/literal}
                   {foreach from=$mydepts item=r} <option value="{$r.id}">{$r.name}</option>{/foreach}    </select>{literal}

        <input type="button" value="Invite to chat" class="submitme fs11" onclick="HBOperator.inviteVisitor('{{id}}')" style="font-weight:bold;font-size:11px !important"/>
                                        </div>

                                    </div>
                                    <div class="visitor_tab tab_footprints" style="display:none">
                                        <table border="0" cellspacing="0" cellpadding="0" width="100%" class="display" style="table-layout: fixed;">
                                            <thead>
                                                <tr>
                                                    <th>Page</th>
                                                    <th>Referer</th>
                                                    <th width="79">Time on page</th>
                                                    <th width="65">Views total</th>
                                                    <th width="140">Last visit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {{#footprint_list}}
                                                <tr>
                                                    
                                                    <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="{{page}}" target="_blank">{{page_title}}</a></div></div></div></td>
                                                    <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="{{ref}}" target="_blank">{{ref}}</a>{{#search}}<span class="serchterm"><strong>Search term:</strong> {{search}}</span>{{/search}}</div></div></div></td>
                                                    <td >{{td}}</td>
                                                    <td >{{count}}</td>
                                                    <td >{{date}}</td>
                                                </tr>
                                                {{/footprint_list}}
                                                {{^footprint_list}}
                                                <tr><td colspan="4">No footprints found</td></tr>
                                                {{/footprint_list}}
                                            </tbody>
                                        </table>


                                    </div>
                                    <div class="visitor_tab tab_transcripts" style="display:none"></div>
                                    <div class="visitor_tab tab_geolocation" style="display:none" latitude="{{latitude}}" longitude="{{longitude}}" loaded="0">Loading maps...</div>
                                </div>
                            </div>
                        </td>

                    </tr>
                </table>
                </div>



            </textarea>



            <textarea id="message_template">
                <div class="msg_wrapper msg_{{type}}">
                    <span class="msg_who {{type}}">{{submitter_name}}:</span>
                    <span class="msg">{{{message}}}</span>
            </div>
            </textarea>
            <textarea id="visitor_template">
                
            </textarea>
            <textarea id="hb_visitors_table_template">
                <table border="0" cellspacing="0" cellpadding="0" width="100%" class="display" style="table-layout: fixed;">
                    <thead>
                        <tr>
                            <th width="20"></th>
                            <th width="85">IP</th>
                            <th width="80">Time online</th>
                            <th width="65">Footprints</th>
                            <th width="33">Chats</th>
                            <th>Current page</th>
                            <th>Referer</th>
                            <th width="30"></th>
                        </tr>
                    </thead>
                    <tbody>
                        {{#visitors}}
                        <tr>
                            <td><img src="templates/default/hbchat/media/countries/{{country}}.gif" alt="{{country}}"/></td>
                            <td><span class="alike" title="{{hostname}}" onclick="return HBOperator.open_tab('visitor', '{{id}}', false, true);">{{ip}}</span></td>
                            <td>{{timeonline}}</td>
                            <td>{{footprints}}</td>
                            <td>{{chatsCA}}</td>
                            <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="{{page}}" target="_blank">{{page_title}}</a></div></div></div></td>
                            <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a  href="{{ref}}" target="_blank">{{ref}}</a>{{#searchterm}}<span class="serchterm"><strong>Search term:</strong> {{searchterm}}</span>{{/searchterm}}</div></div></div></td>
                            <td><span class="editbtn" onclick="return HBOperator.open_tab('visitor', '{{id}}', false, true);">details</span></td>
                        </tr>
                        {{/visitors}}
                        {{^visitors}}
                        <tr><td colspan="8">No visitors online</td></tr>
                        {{/visitors}}
                    </tbody>
                </table>

            </div>

        {/literal}
        {* EOF: MUSTACHE.JS *}

    </body>
</html>