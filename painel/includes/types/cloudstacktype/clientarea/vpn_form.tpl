<form action="" method="post" id="formadd">
    <input type="hidden" name="do" value="add"/>
    <br/><h3 class="summarize"> {$lang.adduser} </h3>
    <table id="addrule" class="data-table backups-list form-horizontal"  width="100%" cellspacing="0" >
        <tr>

            <td >
                <b>{$lang.username}:</b><br/>
                <input name="username" value="{$submit.username}" size="15" required class="width-auto"/> 
            </td>
            <td >
                <b>{$lang.password}:</b><br/>
                <input name="password" value="{$submit.password}" size="15" type="password" required class="width-auto"/> 
            </td>
            <td >
                <b>{$lang.password2}:</b><br/>
                <input name="password2" value="{$submit.password2}" size="15" type="password" required class="width-auto"/>
            </td>

            <td >
                <br>
                <input type="submit" value="{$lang.submit}" class="blue" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        {literal}
            $('#formadd').submit(function() {
                var self = $(this),
                    errors = [];
                if (!self.find('[name=password]').val().length) {
                    errors.push('{/literal}{$lang.passwordempty_error|escape:'javascript'}{literal}');
                }
                if (self.find('[name=password]').val() != self.find('[name=password2]').val()) {
                    errors.push('{/literal}{$lang.passwordmatch_error|escape:'javascript'}{literal}');
                }
                if (errors.length) {
                    parse_response('<!-- {"ERROR":["'+errors.join('","')+'"],"INFO":[],"STACK":0} -->');
                    return false;
                }
            });
            $('#gotoip').click();
        {/literal}
    </script>
    {securitytoken}
</form>