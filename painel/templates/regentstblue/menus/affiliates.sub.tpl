{if $cmd=='affiliates' && $affiliate}
    <div class="bottom-border-nav">
        <ul id="invoice-tab" class="nav nav-pills ">
            <li {if $action == 'default' || $action == '_default'} class="active" {/if}>
                <a href="{$ca_url}{$cmd}/">{$lang.affiliatecenter}</a>
            </li>

            <li {if $action == 'commissions'} class="active" {/if}>
                <a href="{$ca_url}{$cmd}/commissions/">{$lang.mycommisions}</a>
            </li>

            <li {if $action=='payouts'} class="active" {/if}>
                <a href="{$ca_url}{$cmd}/payouts/">{$lang.payouts}</a>
            </li>

            <li {if $action=='vouchers' || $action=='addvoucher'} class="active" {/if}>
                <a href="{$ca_url}{$cmd}/vouchers/">{$lang.myvouchers}</a>
            </li>
            <li class="highlighted-tab">
                <a href="{$ca_url}{$cmd}/addvoucher/" >{$lang.newvoucher}</a>
            </li>
        </ul>
    </div>
{/if}


