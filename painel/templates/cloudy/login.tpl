{if $action=='passreminder'}
    <div id="loginbox_container">
        <div class="wbox">
            <div class="wbox_header">{$lang.didyouforget} <a href="{$ca_url}clientarea/" class="right btn btn-mini"><i class="icon-chevron-left"></i> {$lang.login}</a><div class="clear"></div></div>
            <div  class="wbox_content">
                <div class="alert alert-info">{$lang.forgetintro}</div>
                {if !$thanks}
                    <form name="" action="" method="post" >
                        <table border="0" cellpadding="3" cellspacing="0" width="100%">
                            <tr>
                                <td >
                                    <label for="email_remind" class="styled">{$lang.forgetenter}</label>
                                    <input type="text" name="email_remind"  value="{$sub_email}" class="styled"  style="width:96%"/>
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <div class="form-actions">
                                        <div class="right">
                                            <input type="submit" value="{$lang.sendmepass}" class="btn btn-warning" />
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>{securitytoken}
                    </form>
                {/if}
            </div>
        </div>
    </div>
{else}
    <div id="loginbox_container">
        <div class="wbox">
            <div class="wbox_header">{$lang.restricted}</div>
            <div  class="wbox_content">
                <div class="alert alert-info">{$lang.restrictedarea}</div>

                <form name="" action="" method="post">
                    <table border="0" cellpadding="0" cellspacing="6" width="100%">
                        <tr>
                            <td align="left" colspan="2"><label for="username" class="styled">{$lang.email}</label><input type="text" name="username" value="{$submit.username}" class="styled" style="width:96%"/></td>
                        </tr>
                        <tr>
                            <td align="left" colspan="2"><label for="password"  class="styled">{$lang.password}</label><input type="password" name="password" type="password" class="styled"  style="width:96%"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="form-actions log-in-form">
                                    <div class="left"  >
                                        <a href="{$ca_url}root&amp;action=passreminder" class="list_item">{$lang.passreminder}</a><br />
                                        <a href="{$ca_url}signup/" class="list_item">{$lang.createaccount}</a>
                                    </div>
                                    <div class="right">
                                        <input type="hidden" name="action" value="login"/>
                                        <button type="submit" data-horizontal="" data-style="shrink" class="progress-button btn btn-primary btn-large"><i class="icon-user"></i> {$lang.submit}</button>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    {securitytoken}
                </form>
            </div>
        </div>
    </div>

{/if}