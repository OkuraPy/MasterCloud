<div class="page-info-box">
	<div class="pull-right">
    	<div class="top-details">
        	<p>{$lang.curbalance|capitalize}:</p>
            <span>{if $acc_credit_balance < 0}- {/if}{if $currency.sign}{$currency.sign}{/if}{$acc_credit_balance|abs|price:$currency:false}{if $currency.code} {$currency.code}{/if}</span>
        </div>
    </div>
    <h1>{$lang.dashboard}</h1>
    <p>{$lang.welcomeback} <strong>{$login.firstname} {$login.lastname}</strong>, {$lang.everythinglooksgood}</p>
</div>