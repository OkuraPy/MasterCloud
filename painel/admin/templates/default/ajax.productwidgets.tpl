{if ($cmd=='services' && $action=='product') }
    <script type="text/javascript" src="{$template_dir}js/hbwidget.js?v={$hb_version}"></script>
    <script type="text/javascript">
        HBWidget.product_id = "{$product_id}";
    </script>
{elseif $action=='getaddwidget' || $action=='editwidget'}
    {literal}
        <style type="text/css">
            #facebox .body, #formcontainer {
                padding:0px;
                border-radius: 6px 6px 6px 6px;
                background:none;
            }
            .conv_content .tabb {
                max-height:500px;
                overflow:auto;
            }
            .conv_content {
                padding:5px 5px 25px 5px;
                background:#FFFFFF;

                border-radius: 0px 5px 0px 0px;
            }
            .conv_content h3 {
                margin-top:0px;
            }
            #s_menu {
                background:#6b6b6b;
                padding:40px 0px;
                vertical-align:top;
                color:#fff;
                border-radius: 5px 0px 0px 0px;
            }
            #s_menu #initial-desc, #s_menu .description {
                padding:0px 5px;}
            #s_menu .descr_image {
                width:170px;
                height:62px;
                margin:60px 5px 0px;
            }
            fieldset {
                border: 1px solid #BBBBBB;
                border-radius: 5px 5px 5px 5px;
                margin-bottom: 10px;
                padding: 10px;
            }
            fieldset legend {
                padding: 0 10px;
                font-weight:bold;
            }
            fieldset label {
                cursor:pointer;
            }
            .fselect {
                float:left;
                padding:3px;
                border:solid 1px #fff;
                border-radius:3px;}
            .fselect.selected {
                border:1px solid #E3E3E3;
                background:#f3f3f3;
            }
            .spinner {
                display:none;
                background: none repeat scroll 0 0 #888;
                border: 1px solid #191919;
                box-shadow: 0 1px 0 rgba(255, 255, 255, 0.3);
                border-radius: 3px;
                padding:1px;
                margin-top:-3px;
            }
            #facebox select, #facebox textarea, #facebox input[type="text"],
            #facebox input[type="password"], #facebox input[type="email"], #facebox input[type="url"],
            #facebox input[type="date"], #facebox input[type="number"], #facebox input[type="time"],
            #facebox  input[type="date"], #facebox  input.date {
                border: 1px solid #CCCCCC;
                border-radius: 3px 3px 3px 3px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset;
                font: 13px/16px Arial,sans-serif !important;
                padding: 4px 6px;
            }
            #facebox .pw-form small {
                color: #666666;
                font-size: 11px;
            }
            #facebox .pw-form label small {
                color: #666666;
                display: block;
                font-size: 11px;
                font-weight: normal;
                line-height: 11px;
                text-align: right;
                width: 160px;
            }
            #facebox .pw-form label {
                clear: left;
                display: block;
                float: left;
                font-size: 12px;
                font-weight: bold;
                margin: 0;
                text-align: right;
                width: 160px;
            }
            #facebox .pw-form label.nodescr {
                padding-top:7px !important;
            }
            #facebox .pw-form .w250 {
                width: 250px;
            }
            #facebox .pw-form input, .pw-form textarea, .pw-form select, .pw-form .winput {
                clear: right;
                float: left;
                margin: 2px 0 20px 10px;
            }
            .pricingtable input {
                float:none !important;
                margin:0px !important;
            }
        </style>

    {/literal}
{/if}
{if ($cmd=='services' && $action=='product') || ($cmd=='productwidgets' && $loadproduct)}
    <div >
        {if $widgets}
            <div id="listform2">
                <div id="serializeit2">
                    <ul id="grab-sorter2" class="grab-sorter">
                        {foreach from=$widgets item=widget key=k}
                            <li class="product-widget {if $widget.unique}unique{/if} {if $widget.assigned}active{else}disabled{/if} w{$widget.widget_id}" id="widget-{$widget.id}">
                                <table border="0" width="100%" cellspacing="0" cellpadding="5">
                                    <tr>
                                        <td valign="top" width="60">
                                            <input type="hidden" name="sort[]" value="{$widget.id}" class="ser"/>
                                            <a name="f{$widget.id}"></a>
                                            {if $widget.assigned}
                                                <a href="#"  class="sorter-ha menuitm menuf" onclick="return false"><span class="movesth" title="{$lang.move}"></span></a><!--
                                                --><a href="#"  class="menuitm menul" title="{$lang.Edit}" onclick="return HBWidget.editWidgetForm({$widget.id});" style="width:14px;"><span class="editsth"></span></a>
                                                {/if}
                                        </td>
                                        <td width="190">
                                            {$widget.name}
                                        </td>
                                        <td valign="middle">
                                            {if $widget.assigned}
                                                <a onclick="HBWidget.disableWidget({$widget.id}, {$widget.widget_id});
                                                        return false;" class="new_control" href="#"><span class="delsth">Disable</span></a>
                                            {else}
                                                <a onclick="HBWidget.enableWidget({$widget.id}, {$widget.widget_id});
                                                        return false;" class="new_control" href="#"><span class="addsth">Enable</span></a>
                                            {/if}
                                        </td>
                                    </tr>
                                </table>

                            </li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        {else}
            <div class="blank_state_smaller blank_forms">
                <div class="blank_info">
                    <h3>{$lang.widgetsbs}</h3>
                    <div class="clear"></div>
                    <br/>
                    <a  href="#" class="new_control"  onclick="return HBWidget.addCustomWidgetForm();" ><span class="addsth" ><strong>{$lang.assign_custom_widg}</strong></span></a>
                    <div class="clear"></div>

                </div>
            </div>

        {/if}
    </div>
    {literal}
        <script type="text/javascript">
            //appendLoader('latebindme3');
            appendLoader('HBWidget.init');
        </script>
    {/literal}
{elseif $action=='editwidget'}
    <div id="formloader">
        <form id="saveform" method="post" action="?cmd=productwidgets" enctype="multipart/form-data">
            <input type="hidden" name="wid" value="{$widget.id}" id="widget_id"/>
            <input type="hidden" name="make" value="{$action}"/>
            <input type="hidden" name="action" value="{$action}"/>
            <input type="hidden" name="product_id" value="{$product_id}"/>

            <table border="0" cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr>
                    <td width="140" id="s_menu" style="" valign="top">
                        <div id="lefthandmenu">
                            <a class="tchoice" href="#">Appearance</a>
                            {foreach from=$widget.info.templates item=tp key=tpname}
                                <a class="tchoice" href="#">{$tpname}</a>
                            {/foreach}

                        </div>
                        {if $widget.info.description}<div class="description" style="margin-top:80px">{$widget.info.description}</div>{/if}
                    </td>
                    <td class="conv_content pw-form"  valign="top">
                        <div class="tabb">
                            <h3 style="margin-bottom:0px;"><img src="../{$widget.config.smallimg}" alt="" style="margin-right:5px" class="left"  />  Function &raquo; {$widget.info.fullname} &raquo; Appearance</h3>
                            <div class="clear"></div>

                            <div class="clear"></div><label class="nodescr">Display as</label>
                            <input type="text" class="w250" name="name" value="{$widget.name|escape}" />
                            <div class="clear"></div>

                            <label class="nodescr">Display in</label>
                            <select class="winput w250" name="group">
                                <option value="sidemenu" {if $widget.group=='sidemenu'}selected="selected"{/if}>Service sidemenu</option>
                                <option value="apps" {if $widget.group=='apps'}selected="selected"{/if}>Service "apps" menu</option>
                            </select>
                            <div class="clear"></div>

                            <label>Small icon <small>Use 16x16px png image</small></label>
                            <div class="winput">

                                <input type="text" class="w250" name="config[smallimg]" value="{$widget.config.smallimg}" style="margin:0px 5px 5px 0px;" />
                                <div class="clear"></div>
                                <div class="left fs11" style="padding:5px 5px 5px 0px;">Upload new</div><input type="file" name="smallimgnew" style="margin:0px 5px 5px 0px;" />
                            </div>
                            <div class="left">
                                <img src="../{$widget.config.smallimg}" alt="" style="margin:5px 10px;"   />
                            </div>

                            <div class="clear"></div>

                            <label>Large icon <small>Use 48x48px png image</small></label>
                            <div class="winput">
                                <input type="text" class="w250" name="config[bigimg]" value="{$widget.config.bigimg}" style="margin:0px 5px 5px 0px;"  />
                                <div class="clear"></div>
                                <div class="left fs11" style="padding:5px 5px 5px 0px;">Upload new</div><input type="file" name="bigimgnew" style="margin:0px 5px 5px 0px;" />
                            </div>

                            <div class="left">
                                <img src="../{$widget.config.bigimg}" alt="" style="margin:5px 10px;"   />
                            </div>
                            <div class="clear"></div>


                        </div>



                        {foreach from=$widget.info.templates item=tp key=tpname}
                            <div class="tabb" style="display:none">
                                <h3><img src="../{$widget.config.smallimg}" alt="" style="margin-right:5px" class="left"  />  Function &raquo; {$widget.info.fullname} &raquo; {$tpname}</h3>
                                    {include file=$tp}
                            </div>
                        {/foreach}

                    </td>
                </tr>
            </table>
            {securitytoken}
        </form> 
    </div>
    {literal}
        <script type="text/javascript">
            $('#picked_tab').clone().appendTo('#saveform');
            $('#lefthandmenu').TabbedMenu({elem:'.tabb', picker_id:'picked_subtab'{/literal}{if $picked_tab}, picked:{$picked_tab}{/if}{literal}});
        </script>
    {/literal}
    <div class="dark_shelf dbottom">
        <div class="left spinner"><img src="ajax-loading2.gif"></div>
        <div class="right">
            <span class="bcontainer " >
                <a class="new_control greenbtn" href="#" onclick="$('.spinner').show();
                        $('#saveform').submit();
                        return false;"><span>{$lang.savechanges}</span></a>
            </span>
            <span >{$lang.Or}</span>
            <span class="bcontainer">
                <a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');
                        return false;"><span>{$lang.Close}</span>
                </a>
            </span>
        </div>
        <div class="clear"></div>
    </div>

{/if}