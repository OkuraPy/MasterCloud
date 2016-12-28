{include file="clientarea/leftnavigation.tpl"}
		<div class="sh-container">
            <h4>
                {if $clientdata.contact_id}
                    {$lang.changemainpass}
                {else}
                    {$lang.changepass}
                {/if}
            </h4>

            <form class="form-horizontal mt-20 form-style" action='' method='post' >
                <input type="hidden" name="make" value="changepassword" />
                <fieldset class="mb-15">
                    <label >{$lang.oldpass}:</label>
                    <input class="span4" type="password" autocomplete="off" name="oldpassword">
                </fieldset>
                <fieldset class="mb-15">
                    <label >{$lang.newpassword}:</label>
                    <input class="span4" type="password" autocomplete="off" name="password">
                </fieldset>
                <fieldset class="mb-15">
                    <label >{$lang.confirmpassword}:</label>
                    <input class="span4" type="password" autocomplete="off" name="password2">
                </fieldset>
                <div class="separator"></div>
                <div class="mt-25">
                    <button type="submit" class="btn btn-flat-primary">{$lang.savechanges}</button>
                </div>
                {securitytoken}
            </form>

    </div>
</div>
