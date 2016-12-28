<div class="wbox">
    <div class="wbox_header">{assign var=widg_name value="`$widget.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</div>
    <div id="cartSummary" class="wbox_content">

             {$lang.idprotection_desc}
<table  cellspacing="0" cellpadding="0" class="checker table table-striped" width="100%">
         <tr class="even">
             <td align="right" width="50%" style="border:none"><b> {$lang.privacyprotection}:  </b></td>
            <td style="border:none">
               <form action="" method="post" >
                  <input type="hidden" name="widgetdo"  value="updateIDProtection" />
                <select  name="idprotection" class="inp styled span2" id="renewconfirm">
                    <option value="0" {if $details && $details.idprotection==0}selected="selected"{/if}>{$lang.Off}</option>
                    <option value="1" {if $details &&  $details.idprotection==1}selected="selected"{/if}>{$lang.On}</option>

                </select> <input type="submit" value="{$lang.savechanges}" class="padded btn btn-primary" style="font-weight:bold" />
                {securitytoken}    </form>

                </td>
        </tr>
        </table>
     


    </div>
</div>
