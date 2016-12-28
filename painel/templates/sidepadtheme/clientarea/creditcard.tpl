{*

Manage credit card on file, submit new credit card details

*}



<div class="text-block clear clearfix">
    <h5>{$lang.account}</h5>
   
    <div class="clear clearfix">
        <div class="account-box">
        
            {include file='clientarea/leftnavigation.tpl'}
            
            <div class="account-content">
            <div class="content-padding">
            {if $ccard.cardnum}
                <h6>{$lang.creditcardfile}</h6>
            {/if}
            <div class="pt15 clearfix ">
            
            {if $ccard.cardnum}
            <table width="100%" border="0"  cellspacing="0" class="table table-bordered">
                <tr><td align="right" width="160"><b>{$lang.cctype}</b></td><td>{$ccard.cardtype}</td></tr>
                <tr class="even"><td align="right"><b>{$lang.ccnum}</b></td><td>{$ccard.cardnum}</td></tr>
                <tr><td align="right"><b>{$lang.ccexpiry}</b></td><td>{$ccard.expdate}</td></tr>     
            </table>
            
            <form action="" method="post" style="margin-bottom:0px;">
                {if $allow_storage}
                    <a href="#newccdetails" data-toggle="modal" class="custom-large-btn green-custom-btn btn" >{$lang.changecc}</a>&nbsp;
                {/if}
                {if $allowremove} 
                <button class="custom-large-btn red-custom-btn btn bold" style="font-size:12px;" 
                        type="submit" name="removecard" onclick="return confirm('{$lang.removecc_confirm}')"  class="btn btn-danger">
                {$lang.removecc}
                 </button>
                {/if}
                {securitytoken}
             </form>
            
            
            </div>
            {else}
                <div class="center-wrapper">
                    <div class="center-box">
                        <p>{$lang.noccyet}</p>
                        <a href="#newccdetails"  data-toggle="modal" class="custom-large-btn green-custom-btn btn"> + {$lang.newcc} </a>
                    </div> 
                </div>
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
                        <button type="submit" name="addcard"  class="custom-large-btn green-custom-btn btn">
                        {$lang.savechanges}
                        </button>
                    </div>
        
                {securitytoken}
            </form>
                    
            </div>                       
            </div>

        </div>
        
        
    </div>
 </div>
 
 
</div>