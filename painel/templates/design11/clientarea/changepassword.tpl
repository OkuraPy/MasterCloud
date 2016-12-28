<div class="spacing">
    <div class="shared-hosting-example">
        {include file="clientarea/leftnavigation.tpl"}
        <div class="sh-container span9">
            <h4>
                {if $clientdata.contact_id}
                    {$lang.changemainpass}
                {else}
                    {$lang.changepass}
                {/if}
            </h4>
            <div class="spacing">
                <form class="form-horizontal mt-20 form-style" action='' method='post' >
                    <input type="hidden" name="make" value="changepassword" />
                    <table width="100%" class="table table-striped">
                        <tr><td >{$lang.oldpass}</td><td ><input name="oldpassword" type="password" autocomplete="off"  class="styled" style="width: 60%" /></td></tr>
                        <tr ><td  >{$lang.newpassword}</td><td ><input name="password" type="password" autocomplete="off"  class="styled" style="width: 60%" /></td></tr>
                        <tr><td >{$lang.confirmpassword}</td><td ><input name="password2" type="password" autocomplete="off"  class="styled" style="width: 60%" /></td></tr>
                    </table>
                    <div class="divider"></div>
                    <div class="mt-25">
                        <button type="submit" class="btn btn-primary">{$lang.savechanges}</button>
                    </div>
                    {securitytoken}
                </form>
            </div>
        </div>
    </div>
</div>
