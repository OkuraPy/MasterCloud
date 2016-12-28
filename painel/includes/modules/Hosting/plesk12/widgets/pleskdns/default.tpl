{foreach from=$widgets item=wig}
    {if $widget.name == $wig.name}
        {assign value=$wig.location var=widgeturl}
    {/if}
{/foreach}
{literal}
    <script type="text/javascript">
        $(document).ready(function() {
            $('.management_links div').each(function(i) {
                $(this).children().eq(0).click(function() {
                    $(this).parents('tr').hide().next().show().find('input, select').prop('disabled', false).removeAttr('disabled');
                    return false;
                });
            });
            
        });
    </script>
{/literal}
<div >
    <div id="billing_info" class="wbox form-inline">
        <div class="wbox_header">{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</div>
        <div class="wbox_content">
            <form autocomplete="off" action="{$widget_url}&act={$act}" method="post">
                <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0" style="table-layout: fixed">
                    {counter start=1 skip=1 assign=even}
                    <thead>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if} >
                            <td align="right"  width="30%">{$lang.name|capitalize}</td>
                            <td align="center" width="5%"> {$lang.class|capitalize}</td>
                            <td align="center" width="5%"> {$lang.priority|capitalize}</td>
                            <td align="center" width="9%"> {$lang.type|capitalize}</td>
                            <td align="center" width="40"> {$lang.record|capitalize}</td>
                            <td width="5%"></td>
                        </tr>
                    </thead>
                    <tbody id="updater">
                        {foreach from=$listentrys item=entry key=index} 
                            <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                <td align="right" style="text-overflow:ellipsis; overflow: hidden" title="{$entry.host}">{$entry.host}</td>
                                <td align="left">{$entry.class}</td>
                                <td align="left">{$entry.opt}</td>
                                <td align="left">{$entry.type}</td>
                                <td align="left" style="text-overflow:ellipsis; overflow: hidden" title="{$entry.value}">{$entry.value}</td>
                                <td class="management_links">
                                    <div class="btn-group" style="width: 50px">
                                        <a class="btn btn-mini"><img width="11" src="{$widgeturl}pencil.png"></a>
                                        <a class="btn btn-mini" href="{$widget_url}&act={$act}&del={$entry.id}&security_token={$security_token}" 
                                           onclick="return confirm('Do You really want to delete this entry?')">
                                            <img width="11" src="{$widgeturl}cross.png">
                                        </a> 
                                    </div>
                                </td>
                            </tr>
                            <tr class="disab" style="display:none" {counter}{if $even % 2 !=0}class="even"{/if}>
                                <td><input class="span2" name="records[{$entry.id}][name]" value="{$entry.host}" /></td>
                                <td><input class="span1" name="records[{$entry.id}][opt]" value="{$entry.opt}" /></td>
                                <td>{$entry.class}</td>
                                <td>
                                    <select class="span1" name="records[{$entry.id}][type]">
                                        <option {if $entry.type == 'A'}selected="selected"{/if}>A</option>
                                        <option {if $entry.type == 'AAAA'}selected="selected"{/if}>AAAA</option>
                                        <option {if $entry.type == 'NS'}selected="selected"{/if}>NS</option>
                                        <option {if $entry.type == 'MX'}selected="selected"{/if}>MX</option>
                                        <option {if $entry.type == 'CNAME'}selected="selected"{/if}>CNAME</option>
                                        <option {if $entry.type == 'TXT'}selected="selected"{/if}>TXT</option>
                                        <option {if $entry.type == 'PTR'}selected="selected"{/if}>PTR</option>
                                        <option {if $entry.type == 'SRV'}selected="selected"{/if}>SRV</option>
                                    </select>
                                </td>
                                <td><input class="span2" name="records[{$entry.id}][record]" value="{$entry.value}" /></td>
                                <td>
                                    <input type="submit" class="btn" name="save" value="{$lang.shortsave}" /> 
                                </td>
                            </tr>
                        {foreachelse}
                            <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                <td align="center" colspan="6" style="text-overflow:ellipsis; overflow: hidden" >{$lang.nothing}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                    <tfoot>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if}><td colspan="6">&nbsp;</td></tr>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if}><td colspan="6">{$lang.addrecord}</td></tr>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                            <td style="border:none" colspan="6" align="center" class="form-inline">
                                <table style="float:left" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="text-align:right;border:none">Name: </td>
                                        <td style="text-align:left; border:none"> <input class="span2" autocomplete="off" type="text" name="name" >.{*}
                                            {*}{if $listdomains|@count == 1}{$listdomains[0].domain}{elseif $listdomains|@count == 0}{$domain}{/if}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right;border:none">Priority: </td>
                                        <td style="text-align:left; border:none"> <input class="span2" autocomplete="off" type="text" name="opt" ></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right;border:none">Type: </td>
                                        <td style="text-align:left; border:none"> 
                                            <select class="span2" name="type" >
                                                <option>A</option>
                                                <option>CNAME</option>
                                                <option>NS</option>
                                                <option>MX</option>
                                                <option>TXT</option>
                                                <option>PTR</option>
                                                <option>AXFR</option>
                                                <option>SRV</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right;border:none">Record: </td>
                                        <td style="text-align:left; border:none"> <input class="span2" autocomplete="off" type="text" name="record" ></td>
                                    </tr>
                                </table>
                                <div style="float:left; padding:15px 6px;vertical-align:middle"><input class="btn" type="submit" name="save" value="{$lang.shortsave}"> </div>
                            </td></tr>
                    </tfoot>
                </table>
            {securitytoken}
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="{$widgetdir_url}../widget.js"></script>
<link rel="stylesheet" type="text/css" href="{$widgetdir_url}../widget.css"  media="all">