<form action="" method="post">
    <div class="lighterblue" style="padding: 10px">
        <a href="" style="font-weight: bold" onclick="{literal}$(this).slideUp(500, function() {$('.howitworks').slideDown(1000);}); return false;{/literal}">How it works?</a>
        <div style="display: none" class="howitworks">
            <strong>1. Percent</strong> is added to the invoice, based on the total amount of the invoice (without <strong>amount</strong> param below)<br />
            <strong>2. Amount</strong> is added to the invoice<br/><br/>
            For ex. <br/>
            <em>Percent = 3%</em><br />
            <em>Amount = $ 0.40 USD</em><br />
            <em>Invoice total = $ 7.00 USD</em><br /><br/>
            <font style="text-decoration: underline">Final Invoice Total</font> = ( 7.00 * 3% ) + 0.40 = $ <strong>7.61</strong> USD
        </div>
        <div style="padding: 10px">
            <input style="font-weight: bold;" type="submit" name="savecharges" value="Save Changes" />
        </div>
    </div>
    <table cellspacing="0" cellpadding="3" border="0" class="glike hover" width="100%">
        <tbody>
            <tr>
                <th width="20"></th>
                <th width="100">Gateway ID</th>
                <th >Gateway</th>
                {foreach from=$curx item=ci}
                    <th width="90">Amount {$ci.code}</th>
                {/foreach}
                <th width="90">Percent</th>
                <th></th>
            </tr>
            {if !empty($gateways)}
                {foreach from=$gateways key=gid item=g}
                    <tr>
                        <td></td>
                        <td>#{$gid} <input type="hidden" value="{$g.modname}" name="gateways[{$gid}][gateway_name]" />
                            <input type="hidden" value="{$g.filename}" name="gateways[{$gid}][gateway_filename]" /></td>
                        <td><strong>{$g.modname}</strong></td>
                        {foreach from=$curx item=ci}
                            <td>{$ci.sign} <input size="5" style="text-align: right" value="{$g.amount[$ci.id]}" name="gateways[{$gid}][currencies][{$ci.id}]"/> </td>

                        {/foreach}

                        <td><input size="5" style="text-align: right" value="{$g.percent}" name="gateways[{$gid}][percent]"/> %</td>
                        <td></td>
                    </tr>
                {/foreach}
            {else}
                <tr><td colspan="6" style="text-align: center; padding: 5px;"><strong>Nothing to display</strong></td></tr>
            {/if}

        </tbody>
    </table>
    <div class="lighterblue" style="padding: 10px">
        <div style="padding: 10px">
            <input style="font-weight: bold;" type="submit" name="savecharges" value="Save Changes" />
        </div>
    </div>
</form>