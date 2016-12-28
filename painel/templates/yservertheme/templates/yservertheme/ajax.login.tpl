{if $loginwidget}
    <div id="login-widget" style="display: none">
        
        <form id="login-widget-form" name="" action="{$ca_url}{$cmd}/{$action}" method="post">
            <div id="login-widget-block">
                <h2>{$lang.signin}</h2>
                <div class="separator-horizontal"></div>
                <span class="icon-stack pull-right" id="login-widget-close">
                    <i class="icon-circle icon-stack-base"></i>
                    <i class="icon-remove icon-light"></i>
                </span>
                <div class="input-prepend">
                    <i class="add-on icon-user"></i>
                    <input id="login-widget-user" name="username" type="text" 
                           placeholder="Username" required>
                </div>
                {if $enableFeatures.logincaptcha =='on'}
                    <div class="input-prepend input-append captcha-input">
                        <i class="add-on icon-refresh" onclick="$('#logincaptcha-bg').css('background-image', 'url(?cmd=root&action=captcha&t=' + (new Date()).getTime()+')');"></i>
                        
                        <input type="text" name="captcha" placeholder="{$lang.captcha}" />
                        <div class="captcha-bg" id="logincaptcha-bg" style="background-image: url(?cmd=root&action=captcha#w{$timestamp})"></div>
                        {*}<img class="capcha" src="?cmd=root&action=captcha#{$timestamp}" id="logincaptcha" alt="Login Image"/> {*}
                        <a href="#" onclick="" >{$lang.refresh}</a>
                    </div>
                {/if}
                <div class="input-prepend input-append">
                    <i class="add-on icon-lock"></i>
                    <input type="password" autocomplete="off" name="password" id="login-widget-password" 
                           placeholder="{$lang.password}" required />
                </div>
                <div class="separator-horizontal"></div>
                <button type="submit" class="btn progress-button" id="login-widget-submit" 
                    data-horizontal="" data-style="fill">{$lang.signin}</button>
            </div>
            <input type="hidden" name="action" value="login"/>
            {securitytoken}
        </form>
        <div id="login-widget-option"> 
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
                    <input name="password" type="password" autocomplete="off"  class="styled"/>
                </td>

                {if $enableFeatures.logincaptcha =='on'}
                    <td align="left">
                        <img class="capcha" style="width: 120px; height: 60px;" src="?cmd=root&action=captcha#{$stamp}" id="logincaptcha"/> 
                        <span style="display: inline-block; width: 65%; white-space: normal;float:right">
                            <a href="#" onclick="return singup_image_reload2();" >{$lang.refresh}</a>
                        </span>
                    </td>
                    <td align="left">

                        <label for="captcha" class="styled">{$lang.captcha}</label>
                        <input name="captcha" class="styled" />

                    </td>

                {/if}

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


        function singup_image_reload2() {
            var d = new Date();
            $('#logincaptcha').attr('src', '?cmd=root&action=captcha#' + d.getTime());
            return false;
        }
        </script>

    {/literal}
{/if}