{*

Change password of profile contact

*}
<div class="spacing">
    <div class="shared-hosting-example">
        {include file='clientarea/leftnavigation.tpl'}
        <div class="sh-container">
            <h4>
                {$lang.changepass}
            </h4>
            <form class="m20" action='' method='post'>
                <input type="hidden" name="make" value="changepassword" />
                <fieldset>
                    <label for="oldpassword">{$lang.oldpass}:</label>
                    <input class="span4" type="password" autocomplete="off" id="oldpassword" name="oldpassword">

                    <label for="password">{$lang.newpassword}:</label>
                    <input class="span4" type="password" autocomplete="off" id="password" name="password">

                    <label for="password2">{$lang.confirmpassword}:</label>
                    <input class="span4" type="password" autocomplete="off" id="password2" name="password2">

                </fieldset>
                <div class="pull-right m15">
                    <button type="submit" class="btn c-green-btn"> {$lang.savechanges}</button>
                </div>
                {securitytoken}
            </form>
        </div>
    </div>
</div>     

