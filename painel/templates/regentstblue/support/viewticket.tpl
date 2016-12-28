<!--BOF: FILEUPLOAD -->
<script src="{$template_dir}js/fileupload/vendor/jquery.ui.widget.js"></script>
<script src="{$template_dir}js/fileupload/vendor/tmpl.min.js"></script>
<script src="{$template_dir}js/fileupload/jquery.iframe-transport.js"></script>
<script src="{$template_dir}js/fileupload/jquery.fileupload.js"></script>
<script src="{$template_dir}js/fileupload/jquery.fileupload-ui.js"></script>
<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}js/fileupload/styles.css" />
<!--EOF: FILEUPLOAD -->
<div class="support-content">
    <div class="span3 support-left-content">
        <div class="sidebar-block">
            <div class="header-title">
                <span>{$lang.Ticket}</span>
                <h4>#{$ticket.ticket_number}</h4>
            </div>
        </div>
        <div class="sidebar-block">
            <p><i class="icon icon-Tag"></i> {$lang.status} <b>{$lang[$ticket.status]}</b></p>
            <p><i class="icon icon-Folder"></i> {$lang.department} <b>{$ticket.deptname}</b></p>
            <p><i class="icon icon-Time"></i> {$lang.added} <b>{$ticket.date|dateformat:$date_format}</b></p>
        </div>
        <div class="sidebar-block">
            {if $ticket.status!='Closed'}
                <p>{$lang.resolvedticket}</p>

                <form  action="" method="post">
                    <input type="hidden" value="closeticket" name="make" />
                    <button class="btn btn-info btn-small" ><i class="icon icon-PowerOff"></i> {$lang.resolved}</button>

                    {securitytoken}
                </form>
            {else}
                <p>{$lang.notresolvedticket}</p>

                <form  action="" method="post">
                    <input type="hidden" value="reopen" name="make" />

                    <button class="btn btn-info btn-small" ><i class="icon icon-Restart"></i> {$lang.reopen}</button>
                    {securitytoken}</form>
                {/if}
        </div>

    </div>
    <div class="right-content ">
        <div class="header-title">
            {$lang.subject}
            <h2>{$ticket.subject|wordwrap:40:"\n":true}</h2>
        </div>

        <div class="p19">
            <a class="right btn btn-default btn-small" href="{$ca_url}tickets/"><i class="icon-chevron-left icon-white"></i> {$lang.alltickets}</a>
            <div class="clear"></div>
        </div>
        {if $ticket.status!='Closed'}
            <div class="brcrm">
                <form enctype="multipart/form-data" action="" method="post" id="replyform">
                    <h3>{$lang.reply}</h3>

                    <input type="hidden" value="addreply" name="make" />
                    <input name="client_name" type="hidden" value="{$ticket.name}"/>

                    <input name="client_email" value="{$ticket.email}" type="hidden"/>
                    <table width="100%" cellspacing="0" cellpadding="0" class="frame">
                        <tbody>
                            <tr>
                                <td>
                                    <table width="100%" cellspacing="10" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td colspan="2"><textarea style="width: 98%;" cols="60" rows="6"  name="body" id="ticketmessage">{$submit.body}</textarea>
                                                    <ul id="hintarea" style="display:none" class="well"></ul></td>
                                            </tr>
                                            <tr>
                                                <td width="100" valign="top">
                                                    <button type="submit" class="btn btn-success btn-large progress-button" data-horizontal="" data-style="shrink" id="submitbutton">{$lang.submit} <i class="icon icon-MessageRight"></i></button>
                                                </td>
                                                <td align="right" id="fileupload" data-url="?cmd=tickets&action=handleupload">
                                                    <div id="dropzonecontainer">
                                                        <div id="dropzone"><h2>{$lang.droptoattach}</h2></div>
                                                        <div class="fileupload-buttonbar">
                                                            <div class="span5 fileupload-progress fade"  style="float:left">
                                                                <!-- The global progress bar -->
                                                                <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                                                    <div class="bar" style="width:0%;float:left"></div>
                                                                </div>
                                                                <!-- The extended global progress information -->
                                                                <div class="progress-extended">&nbsp;</div>
                                                            </div>
                                                            <div  style="float:right">
                                                                <!-- The fileinput-button span is used to style the file input field as button -->
                                                                <span class="btn btn-small btn-default  fileinput-button">
                                                                    <i class="icon-plus icon-white" ></i>
                                                                    <span>{$lang.attachfile}</span>
                                                                    <input type="file" name="attachments[]" multiple  />
                                                                </span>
                                                                <div class="fs11">{$extensions|string_format:$lang.allowedext}</div>

                                                            </div>
                                                            <!-- The global progress information -->

                                                            <div class="clear"></div>
                                                        </div>
                                                        <!-- The table listing the files available for upload/download -->
                                                        <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
                                                        <!--EOF: FILEUPLOAD -->

                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    {securitytoken}
                </form>
            </div>
        {/if}


        <div class="spacing">
            {foreach from=$replies_rev item=reply}
                <div class="ticket-reply {if $reply.type!='Admin'}ticket-client{else}ticket-admin{/if}">
                    <div class="ticket-timeline">&nbsp;</div>
                    <div class="ticket-reply-msg">
                        <div class="reply-bubble">
                            <div class="reply-bubble-inner">
                                <div class="time">
                                    <span class="icon icon-Time"></span>
                                    <a href="#quote" class="pull-right" title="Quote" onclick="return quoteTicket('r{$reply.id}');"><i class="icon-share"></i></a>
                                    {if $reply.type=='Admin'}
                                            {if $department.supportrating}<div class="right rating-box">
                                                <input type="number" data-id="{$reply.id}" {if $ticket.client_id==0}data-hash="{$ticket.acc_hash}"{/if} {if $reply.rate_date}readonly="readonly"{/if} value="{$reply.rating}"/>
                                            </div>
                                            {if !$reply.rate_date}<span class="right byline" >{$lang.ratemyresponse}</span>
                                        {/if}{/if}
                                    {/if}
                                    <span>{$reply.date|regex_replace:"/ \d\d:\d\d:\d\d/":""|dateformat:$date_format}</span>
                                    <span>{$reply.date|regex_replace:"/.* (\d\d:\d\d).*/":"\\1"} </span>
                                </div>
                                <p><strong>{$reply.name}</strong></p>
                                <p id="r{$reply.id}">{$reply.body|httptohref|nl2br}</p>
                                {if !empty($attachments[$reply.id])}
                                    {foreach from=$attachments[$reply.id] item=attachment}
                                        <a href="?action=download&amp;id={$attachment.id}" >
                                            <strong><i class="icon-paper-clip "></i> {$attachment.org_filename}</strong>
                                        </a><br />
                                    {/foreach}
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
            <div class="ticket-reply {if $ticket.type!='Admin'}ticket-client{else}ticket-admin{/if}">
                <div class="ticket-timeline">&nbsp;</div>
                <div class="ticket-reply-msg">
                    <div class="reply-bubble">
                        <div class="reply-bubble-inner">
                            <div class="time">
                                <span class="icon icon-Time"></span>
                                <a href="#quote" class="pull-right" title="Quote" onclick="return quoteTicket('r{$ticket.id}');"><i class="icon-share"></i></a>
                                <span>{$ticket.date|regex_replace:"/ \d\d:\d\d:\d\d/":""|dateformat:$date_format}</span>
                                <span>{$ticket.date|regex_replace:"/.* (\d\d:\d\d).*/":"\\1"} </span>
                            </div>
                            <p>
                                <strong>{$ticket.name}</strong>
                            </p>
                            <p id="r{$ticket.id}">{$ticket.body|httptohref|nl2br}</p>
                            {if !empty($attachments[0])}
                                {foreach from=$attachments[0] item=attachment}
                                    <a href="?action=download&amp;id={$attachment.id}" >
                                        <strong><i class="icon-paper-clip "></i> {$attachment.org_filename}</strong>
                                    </a><br />
                                {/foreach}
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="{$template_dir}js/bootstrap-rating-input.js"></script>
        <script type="text/javascript">
            $(".rating-box input").rating({if $ratingscale > 5}true{/if});
        </script>
    </div>
</div>

<script type="text/javascript" src="{$template_dir}js/jquery.elastic.min.js"></script>
{literal}
    <script>

        function quoteTicket(target) {
            var resp = $('#' + target).text();
            var reply = $('#ticketmessage').val();
            $('#ticketmessage').val(reply + "\r\n>" + resp.replace(/\n/g, "\n>") + "\r\n").change().focus();
            return false;
        }
        $(document).ready(function() {
            $('a[rel=tooltip], div[rel=tooltip]').tooltip();
            if (!$('#ticketmessage').length) {
                $('.quoter').hide();
            } else {
                $('#ticketmessage').elastic();
            }
        });
    </script>{/literal}
    <!--BOF: FILEUPLOAD -->{literal}
    <script type="text/javascript">
        $(function() {

            function enablesubmit() {
                $('#submitbutton').addClass('btn-success').removeClass('disabled').removeClass('btn-inverse').removeAttr('disabled');
            }
            function disablesubmit() {
                $('#submitbutton').removeClass('btn-success').addClass('disabled').addClass('btn-inverse').attr('disabled', 'disabled');
            }
            function showdropzone(e) {
                var dropZone = $('#dropzone').not('.hidden');
                dropZone.show();
                setTimeout(function() {
                    hidedropzone()
                }, 6000);
            }
            function hidedropzone() {
                $('#dropzone').hide().addClass('hidden');
            }
            $('#fileupload').fileupload();
            $('#fileupload').bind('fileuploadsend', disablesubmit)
                .bind('fileuploadalways', enablesubmit)
                .bind('fileuploaddragover', showdropzone)
                .bind('fileuploaddrop', hidedropzone);

        });

    </script>
    <script id="template-upload" type="text/x-tmpl">
        {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-upload fade">
        <td class="name" width="40%"><span>{%=file.name%}</span></td>
        <td class="size" width="90"><span>{%=o.formatFileSize(file.size)%}</span></td>
        {% if (file.error) { %}
        <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else if (o.files.valid && !i) { %}
        <td>
        </td>
        <td class="start" width="90">{% if (!o.options.autoUpload) { %}
        <button class="btn btn-primary btn-mini">
        <i class="icon-upload icon-white"></i>
        <span>Start</span>
        </button>
        {% } %}</td>
        {% } else { %}
        <td colspan="2"></td>
        {% } %}
        <td class="cancel" width="90" align="right">{% if (!i) { %}
        <button class="btn btn-warning  btn-mini">
        <i class="icon-ban-circle icon-white"></i>
        <span>{/literal}{$lang.cancel}{literal}</span>
        </button>
        {% } %}</td>
        </tr>
        {% } %}
    </script><!-- The template to display files available for download -->
    <script id="template-download" type="text/x-tmpl">
        {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-download fade">
        {% if (file.error) { %}
        <td class="name" width="40%"><span>{%=file.name%}</span></td>
        <td class="size" width="90"><span>{%=o.formatFileSize(file.size)%}</span></td>
        <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else { %}
        <td class="name" width="40%">{%=file.name%} <input type="hidden" name="asyncattachment[]" value="{%=file.hash%}" /></td>
        <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
        <td colspan="2"></td>
        {% } %}
        <td class="delete" width="90"  align="right">
        <button class="btn btn-danger btn-mini" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}">
        <i class="icon-trash icon-white"></i>
        <span>{/literal}{$lang.delete}{literal}</span>
        </button>
        </td>
        </tr>
        {% } %}
    </script>
{/literal}
<!--EOF: FILEUPLOAD -->