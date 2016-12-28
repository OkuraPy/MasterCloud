{*

Manage credit card on file, submit new credit card details

*}
<div class="spacing">
    <div class="shared-hosting-example">
        {include file="clientarea/leftnavigation.tpl"}

        <div class="sh-container">
            <h4>{$lang.ccard}</h4>
            {if $ccard.cardnum}
                <div class="table-box">
                    <table width="100%" class="table table-striped table-config">
                        <tr><td align="right" width="160"><b>{$lang.cctype}</b></td><td>{$ccard.cardtype}</td></tr>
                        <tr class="even"><td align="right"><b>{$lang.ccnum}</b></td><td>{$ccard.cardnum}</td></tr>
                        <tr><td align="right"><b>{$lang.ccexpiry}</b></td><td>{$ccard.expdate}</td></tr>     
                    </table>
                </div>
                <form action="" method="post" style="margin-bottom:0px;">
                    {if $allow_storage}<a href="#newccdetails" data-toggle="modal" class="btn btn-primary" >{$lang.changecc}</a>&nbsp;
                    {/if}
                    {if $allowremove} 
                        <button class="btn btn-danger" type="submit" name="removecard" onclick="return confirm('{$lang.removecc_confirm}')" >
                            {$lang.removecc}
                        </button>
                    {/if}
                    {securitytoken}
                </form>
            </div>
        {else}
            <div class="clearfix">
                <div class="well mt-15">
                    <div class="well-info">
                        <span>
                            {$lang.noccyet}
                        </span>
                    </div>
                </div>
            </div>
            <a href="#newccdetails" class="btn btn-primary" data-toggle="modal"><i class="icon-add"></i> {$lang.newcc}</a>
        {/if}  
        <div id="newccdetails" style="display:none" class="modal">
            <form action="" method="post" style="margin-bottom:0px;">

                <div class="modal-header">
                    <a href="#" class="close-modal" data-dismiss="modal">×</a>
                    <h3>{$lang.changeccdesc}</h3>
                </div>
                <div class="modal-body">
                    <table width="100%" cellpadding="2">
                        <tr><td width="150" >{$lang.cctype}</td><td>
                                <select name="cardtype">
                                    {foreach from=$supportedcc item=cc}
                                        <option>{$cc}</option>
                                    {/foreach}
                                </select>
                            </td></tr>
                        <tr><td >{$lang.ccnum}</td><td><input type="text" name="cardnum" size="25" /></td></tr>
                        <tr><td >{$lang.ccexpiry}</td>
                            <td><input type="text" name="expirymonth" size="2" maxlength="2"  class="styled" style="width:30px;" /> /
                                <input type="text" name="expiryyear" size="2" maxlength="2"  class="styled" style="width:30px;"  /> (MM/YY)</td></tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn" data-dismiss="modal">{$lang.close}</a>
                    <button type="submit" name="addcard"  class="btn btn-primary">
                        {$lang.savechanges}
                    </button>
                </div>

                {securitytoken}
            </form>
        </div>   
    </div>
</div>
