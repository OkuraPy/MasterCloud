<div class="spacing">
    <h3>
        {$lang.createaccount}
    </h3>

    <form method="post" action="" id="singupform" name="signupform" data-parsley-validate data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], [disabled], :hidden">
        {include file='ajax.signup.tpl'}

        <div class="form-actions">
            <center>
                <button type="submit" class="btn btn-success btn-large progress-button" data-horizontal="" data-style="shrink" >
                    <i class="icon-signin"></i> {$lang.submit}
                </button>
            </center>
        </div>

        {securitytoken}
    </form>
</div>
