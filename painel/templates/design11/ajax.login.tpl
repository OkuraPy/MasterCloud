{if $loginwidget}

    <div id="login-widget" {if !$loginpage}style="display: none"{/if}>
        <form id="login-widget-form" name="" action="{$ca_url}{$cmd}/{$action}" method="post">

            <div class="row-fluid">
                <div class="span3" id="left_login">
                    {if !$loginpage}
                        <div id="login-widget-close">
                            <span class="entypo">&#10060;</span>
                        </div>
                    {/if}
                    <div class="vt-venter">
                        <div class="left_container">
                            <hgroup>
                                <h4>{$lang.welcometo}</h4>
                                <h1>{$business_name}</h1>
                            </hgroup>
                            <div class="login-divider"></div>
                            <div class="create_account">
                                <a href="{$ca_url}signup/" title="{$lang.createaccount}">
                                    <span class="entypo">&#59136;</span>
                                </a>
                                <div>
                                    <span>{$lang.signin}</span>
                                    <a href="{$ca_url}signup/">{$lang.createaccount}</a>
                                </div>
                            </div>
                        </div><!-- /left_container-->
                    </div>
                    <div class="login_footer">
                        <div class="login-divider"></div>
                        <h6>{footer}</h6>
                    </div><!-- /login_footer-->
                </div><!-- /span3-->
                <div class="span9 form-horizontal" id="right_login">
                    <div class="vt-venter">
                        <div class="right_container">
                            <h1>{$lang.login}</h1>
                            <div class="top_divider"></div>
                            <h4>{$lang.pleaseloginyouraccount}:</h4>
                            <div class="login-input row-fluid">
                                <span class="span2">{$lang.login}</span>
                                <div class="input-prepend span10">
                                    <span class="entypo add-on">&#128100;</span>
                                    <input id="login-widget-user" name="username" type="text" required>
                                </div>
                            </div>
                            {if $enableFeatures.logincaptcha =='on'}
                                <div class="login-input row-fluid">
                                    <span class="span2">{$lang.captcha}</span>

                                    <div class="input-prepend input-append captcha-input span10">

                                        <div class="captcha-bg add-on" id="logincaptcha-bg" style="background-image: url(?cmd=root&action=captcha#w{$timestamp})"></div>
                                        <input type="text" name="captcha" />
                                        <i class="add-on fa fa-refresh" onclick="$('#logincaptcha-bg').css('background-image', 'url(?cmd=root&action=captcha&t=' + (new Date()).getTime() + ')');"></i>
                                        <a href="#" onclick="" >{$lang.refresh}</a>
                                    </div>
                                </div>
                            {/if}
                            <div class="login-input row-fluid">
                                <span class="span2">{$lang.password}</span>
                                <div class="input-prepend span10">
                                    <span class="entypo add-on">&#128274;</span>
                                    <input type="password" autocomplete="off" name="password" id="login-widget-password" required />
                                </div>
                            </div>
                            <div id="login-widget-option"> 
                                <label class="checkbox">
                                    <input type="checkbox"><a href="#" class="link">Keep Me Signed in</a>
                                </label>
                                <a href="root&amp;action=passreminder" class="list_item pull-right">{$lang.forgotpassword}</a>
                            </div>
                            <button type="submit" class="btn progress-button" id="login-widget-submit" 
                                    data-horizontal="" data-style="fill">Login</button>      
                        </div><!-- /right_container-->
                    </div>
                    <div class="login_footer">
                        <div class="login-divider"></div>
                        <h6>All rights reserved &copy; Companyname 2015</h6>
                    </div><!-- /login_footer-->
                </div><!-- /span9-->
            </div><!-- /row-fluid-->

            <input type="hidden" name="action" value="login"/>
            {securitytoken}
        </form>
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
        $('#signup').live('click', function (e) {
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