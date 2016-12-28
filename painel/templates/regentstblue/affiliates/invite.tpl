
    <div class="spacing">
        <h1>{$lang.affiliates|capitalize}</h1>
        <h3 class="no-mt">{$lang.ycm} {if $config.AffType=='Percent'}{$config.AffValue}%{else}{$config.AffValue|price:$currency}{/if} {$lang.persale}</h3>
        <p class="aff-invite">
            {$lang.notaffiliateyet}
            {if $config.AffBonus>0}
                <strong>{$lang.get} {$config.AffBonus|price:$currency} {$lang.justsign}</strong>
            {/if}
        </p>
        <br />

        <form action="" method="post">
            <input type="hidden" value="activateaffiliate" name="make" />
            <center>
                <button type="submit" class="btn btn-warning" style="font-weight:bold;font-size:16px;padding:15px;"><i class="icon icon-Book" style="font-weight: bold; font-size: 19px; line-height: 20px; background:none; display:inline"></i> &nbsp{$lang.becomeaffiliate}</button>
            </center>
            {securitytoken}
        </form>
    </div>
