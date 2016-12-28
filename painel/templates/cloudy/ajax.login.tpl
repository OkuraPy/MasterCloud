{if $loginwidget}
    <div id="login-widget" style="display: none">
        <form id="login-widget-form" name="" action="{$ca_url}{$cmd}/{$action}" method="post">
            
            <div id="login-widget-block">
                <span class="icon-stack pull-right" id="login-widget-close">
                    <i class="icon-circle icon-stack-base color-green"></i>
                    <i class="icon-remove icon-light"></i>
                </span>
                <div class="input-prepend">
                    <i class="add-on icon-user"></i>
                    <input id="login-widget-user" name="username" type="text" placeholder="Username" required>
                </div>
                <div class="input-prepend input-append">
                    <i class="add-on icon-lock"></i>
                    <input type="password" name="password" id="login-widget-password" placeholder="Password" required />
                    <button type="submit" class="btn progress-button" id="login-widget-submit" data-horizontal="" data-style="fill">&#xf061;</button>
                </div>
            </div>
            <input type="hidden" name="action" value="login"/>
            {securitytoken}
        </form>
        <div id="login-widget-option"> 
            <p>{$lang.signin}</p> 
            <a href="{$ca_url}signup/" class="list_item">{$lang.createaccount}</a>
            <a href="{$ca_url}root&amp;action=passreminder" class="list_item">{$lang.passreminder}</a>
        </div>
    </div>
{else}

    <center>
        <table border="0" cellpadding="0" cellspacing="6" id="cart-login">
            <tr>
                <td align="left">
                    <label for="username" class="styled">{$lang.email}</label>
                    <input type="text" name="username" value="{$submit.username}" class="styled"/>
                </td>
                <td align="left">
                    <label for="password" class="styled">{$lang.password}</label>
                    <input name="password" type="password"  class="styled"/>
                </td>
                <td align="left">
                    <label for="loginbtn" class="btnfix styled">&nbsp;</label>
                    <input name="loginbtn" class="btn padded" type="submit" style="font-weight:bold;" value="{$lang.login}">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <a href="index.php?/root&action=passreminder" class="list_item" style="display: block;" target="_blank">{$lang.passreminder}</a>
                    <a href="index.php?/signup/" id="signup" class="list_item" style="display: block;">{$lang.createaccount}</a>
                </td>
            </tr>
        </table>

        <input type="hidden" name="action" value="login"/>
    </center>

    {literal}<script type="text/javascript">
        $('#signup').live('click', function(e) {
            e.preventDefault();
            $('#orderform').find('li.t1').click();
        });
        </script>
    {/literal}
{/if}