{*

Manage contacts

*}
<div class="spacing">
    <div class="shared-hosting-example">
        {include file="clientarea/leftnavigation.tpl"}

        <div class="sh-container span9">
            <h4>{$lang.profiles}</h4>
            <p>{$lang.profileinfo}</p>

            <div class="spacing">
                <!-- Table -->
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>{$lang.firstname}</th>
                        <th>{$lang.lastname}</th>
                        <th>{$lang.email}</th>
                        <th>{$lang.lastlogin}</th>
                        <th class="w10"></th>

                    </tr>
                    {foreach from=$profiles item=p name=ff}

                        <tr class="no-border">
                            <td>{$p.firstname}</td>
                            <td>{$p.lastname}</td>
                            <td>{$p.email}</td>
                            <td>
                                {if !$p.lastlogin|dateformat:$date_format} -
                                {else}{$p.lastlogin|dateformat:$date_format}
                                {/if}
                            </td>
                            <td class="align-r">
                                <div class="btn-group flat-ui-dropdown-button">
                                    <a class="btn btn-small btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                                        <i class="icon-cog"></i>
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu flat-ui-dropdown dropdown-left">
                                        <li><a href="{$ca_url}profiles/edit/{$p.id}/">{$lang.editcontact}</a></li>
                                        <li><a href="{$ca_url}profiles/loginascontact/{$p.id}/">{$lang.loginascontact}</a></li>
                                        <li><a href="{$ca_url}profiles/&do=delete&id={$p.id}&security_token={$security_token}" 
                                               onclick="return confirm('{$lang.areyousuredelete}');" >{$lang.delete}</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    {foreachelse}
                        <tr>
                            <td colspan="20">
                                {$lang.nothing}
                            </td>
                        </tr>
                    {/foreach}
                </table>
                <!-- End of Table -->
                <div class="m20">
                    <a href="{$ca_url}profiles/add/" class="btn btn-primary"><i class="icon-plus-sign"></i> {$lang.addnewprofile}</a>
                </div>
            </div>
        </div>
    </div>
</div>     

