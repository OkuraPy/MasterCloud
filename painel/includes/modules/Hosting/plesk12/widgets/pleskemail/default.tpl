
<div >
    <div id="billing_info" class="wbox form-inline">
        <div class="wbox_header">{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</div>
        <div class="wbox_content">
            <form autocomplete="off" action="{$widget_url}&act={$act}" method="post">
                <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">
                    {counter start=1 skip=1 assign=even}
                    <thead>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if} >
                            <td align="right">{$lang.account}</td>
                            <td align="center">{$lang.usage}</td>
                            <td align="center">{$lang.managementfunctions}</a></td>
                        </tr>
                    </thead>
                    <tbody id="updater">
                        {if $listentrys}
                            {foreach from=$listentrys item=entry key=index} 
                                <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                    <td align="right">{$entry.email}</td>
                                    <td align="center">
                                        <div>{$entry.quota.usage}/{$entry.quota.limit} MB</div>
                                        <div style="width:80%; height:8px; border:solid 1px #aaa; text-align:left; overflow:hidden">
                                            <div style="height:100%; width:{$entry.quota.percent}%; background-color:{if $entry.quota.percent < 50}#8FFF00{elseif $entry.quota.percent < 80}yellow{else}#FF4F4F{/if}; border"></div>
                                        </div>
                                    </td>
                                    <td align="center" class="eml_management_links">
                                        <a href="{$widget_url}&act={$act}#chang">{$lang.changepass}</a> |
                                        <a href="{$widget_url}&act={$act}#chang">{$lang.changequota}</a> |
                                        <a href="{$widget_url}&act={$act}&deluser={$entry.id}&security_token={$security_token}" 
                                           onclick="return confirm('Do You really want to delete this Email account?')">{$lang.delete}</a> 
                                    </td>

                                </tr>
                                <tr {if $even % 2 !=0}class="even"{/if} style="display:none">
                                    <td align="right" ><input type="submit" name="savechange" value="{$lang.shortsave}" class="btn"></td>
                                    <td align="right" colspan="3" class="change_div">
                                        <input type="hidden" name="change[{$index}][user]" value="{$entry.login}">
                                        <input type="hidden" name="change[{$index}][domain]" value="{$entry.domain}">
                                        <input type="hidden" name="change[{$index}][oldquota]" value="{$entry.quota.limit}">
                                        {$lang.quota}:
                                        <select name="change[{$index}][quota]" class="email_quota">
                                            <option value="custom" >{$lang.custom}</option>
                                            {if ($entry.quota.limit != 20) && ($entry.quota.limit != 50) && ($entry.quota.limit != 100) && ($entry.quota.limit != 250) && ($entry.quota.limit != 'unlimited')}<option value="{$entry.quota.limit}" selected="selected">{$entry.quota.limit} MB</option>{/if}
                                            <option value="20" {if $entry.quota.limit == 20}selected="selected"{/if}>20 MB</option>
                                            <option value="50" {if $entry.quota.limit == 50}selected="selected"{/if}>50 MB</option>
                                            <option value="100" {if $entry.quota.limit == 100}selected="selected"{/if}>100 MB</option>
                                            <option value="250" {if $entry.quota.limit == 250}selected="selected"{/if}>250 MB</option>
                                        </select>
                                    </td>
                                    <td class="change_div" align="right" colspan="3">
                                        {$lang.password}:
                                        <input autocomplete="off" type="password" name="change[{$index}][passmain]" class="span2">&nbsp;&nbsp;&nbsp;
                                        {$lang.confirmpassword}:
                                        <input autocomplete="off" type="password" name="change[{$index}][passcheck]" class="span2">

                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                <td align="center" colspan="3">{$lang.nothing}</td>
                            </tr>
                        {/if}
                    </tbody>
                    <tfoot>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if}><td colspan="4">&nbsp;</td></tr>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if}><td colspan="4">{$lang.addemailaccount}</td></tr>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                            <td style="border:none" colspan="4" align="center">
                                <table style="float:left" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="text-align:right;border:none">{$lang.username}: </td>
                                        <td style="text-align:left; border:none"> <input class="span2" autocomplete="off" type="text" name="name" >@{if $listdomains|@count == 1}{$listdomains[0].domain}{elseif $listdomains|@count == 0}{$domain}{/if}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  style="text-align:right;border:none">{$lang.password}: </td>
                                        <td style="text-align:left;border:none"> <input class="span2" autocomplete="off" type="password" name="passmain" ></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right;border:none">{$lang.confirmpassword}: </td>
                                        <td style="text-align:left;border:none"> <input class="span2" autocomplete="off" type="password" name="passcheck" ></td>
                                    </tr>
                                </table>
                                <div style="float:left;padding:0 0 0 10px;vertical-align:middle">{$lang.quota}:<br> 
                                    <select name="quota" class="email_quota span2">
                                        <option value="custom" >{$lang.custom}</option>
                                        <option selected="selected" value="20" >20 MB</option>
                                        <option value="50" >50 MB</option>
                                        <option value="100" >100 MB</option>
                                        <option value="250" >250 MB</option>

                                    </select>
                                </div>
                                <div style="float:left; padding:15px 6px;vertical-align:middle"><input type="submit" name="save" value="{$lang.shortsave}" class="btn"> </div>
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
