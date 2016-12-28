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
    {assign value=true var=loginpage}
{/if}