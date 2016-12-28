{if $action=='passreminder'}


    <div class="text-block clear clearfix">
        <h5>{$lang.didyouforget}</h5>  
        <div class="overflow-fix">
            <div class="table-box">
                <div class="table-header">
                    <div class="right-btns">
                        <a href="{$ca_url}clientarea/" class="clearstyle green-custom-btn btn"><i class="icon-white-add"></i> {$lang.login}</a>
                    </div>
                    <p class="small-txt">{$lang.forgetintro}</p>
                </div>
                <form name="" action="" method="post">
                    <table class="table table-striped tb-details">
                        <tr>
                            <td class="w25 grey-c">{$lang.forgetenter}</td>
                            <td><input type="text" name="email_remind"  value="{$sub_email}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><button type="submit" class="green-custom-btn btn pull-right l-btn">{$lang.sendmepass}</button></td>
                        </tr>
                    </table>
                    {securitytoken}
                </form>
            </div>
        </div>


    {else}

        <div class="text-block clear clearfix">
            <h5>{$lang.restricted}</h5>  
            <div class="overflow-fix">
                <div class="table-box">
                    <div class="table-header">
                        <p class="small-txt">{$lang.restrictedarea}</p>
                    </div>
                    <form name="" action="" method="post">
                        <table class="table table-striped tb-details">
                            <tr>
                                <td class="w25 grey-c">{$lang.email}</td>
                                <td><input type="text" name="username" value="{$submit.username}"></td>
                            </tr>
                            <tr>
                                <td class="w25 grey-c">{$lang.password}</td>
                                <td><input name="password" type="password" autocomplete="off"></td>
                            </tr>
                            {if $enableFeatures.logincaptcha =='on'}
                                <tr>   
                                    <td class="w25 grey-c" style="vertical-align: top"> {$lang.captcha} </td>
                                    <td>
                                        <span style="display: inline-block; width: 55%; white-space: normal;float:right">
                                                <small>{$lang.typethecharacters}<br /></small>
                                                <a href="#" onclick="return singup_image_reload();" >{$lang.refresh}</a>
                                            </span>
                                        <input name="captcha" type="text" />
                                        <div style="white-space: nowrap;">
                                            <img class="capcha" style="width: 120px; height: 60px;" src="?cmd=root&action=captcha#{$timestamp}" alt="Image" /> 
                                            
                                        </div>
                                        {literal}
                                            <script>
                                                function singup_image_reload() {
                                                    var d = new Date();
                                                    $('.capcha:first').attr('src', '?cmd=root&action=captcha#' + d.getTime());
                                                    return false;
                                                }
                                            </script>
                                        {/literal}
                                    </td>
                                </tr>
                            {/if}
                            <tr>
                                <td>
                                    <input type="hidden" name="action" value="login"/>
                                    <div>
                                        <a href="{$ca_url}root&amp;action=passreminder">{$lang.passreminder}</a><br />
                                        <a href="{$ca_url}signup/">{$lang.createaccount}</a>
                                    </div>
                                </td>
                                <td><button type="submit" class="green-custom-btn btn pull-right l-btn">{$lang.login}</button></td>
                            </tr>
                        </table>
                        {securitytoken}
                    </form>
                </div>
            </div>

        {/if}

    </div>
