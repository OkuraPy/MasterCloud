<div class="spacing">
    <div class="shared-hosting-example">
        {include file="clientarea/leftnavigation.tpl"}

        <div class="sh-container span9">
            <h4>{$lang.addfunds}</h4>
            <div class="h-description">{$lang.addfunds_d}</div>
            <div class="spacing">
                <form class="form-style" method="post" action="">
                    <input type="hidden" name="make" value="addfunds" />
                    <fieldset>
                        <label>{$lang.trans_amount}</label>
                        <input class="span2" type="text" name="funds" value="{$mindeposit}">

                        <label>{$lang.trans_gtw}</label>
                        <select name="gateway" class="span2">
                            {foreach from=$gateways key=gatewayid item=paymethod}
                                <option value="{$gatewayid}">{$paymethod}</option>
                            {/foreach}
                        </select>
                    </fieldset>

                    <div class="well well-funds">
                        <div class="pull-right">
                            <button type="submit" class="btn btn-primary"><i class="icon-plus-sign"></i> {$lang.addfunds}</button>
                        </div>
                        <div class="well-info">
                            <p>{$lang.MinDeposit}: <strong>{$mindeposit|price:$currency}</strong></p>
                            <p>{$lang.MaxDeposit}:<strong> {$maxdeposit|price:$currency}</strong></p>
                        </div>
                    </div>
                    {securitytoken}
                </form>
            </div>
        </div>
    </div>
</div>

