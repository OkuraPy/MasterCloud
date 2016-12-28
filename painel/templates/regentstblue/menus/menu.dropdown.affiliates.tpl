
<ul class="dropdown-menu">
    <li><a{if $action=="affiliates"} class="active"{/if}  href="{$ca_url}affiliates/" >{$lang.summary} </a></li>
    <li><a{if $action=="commissions"} class="active"{/if}  href="{$ca_url}affiliates/commissions/">{$lang.mycommissions} </a></li>
    <li><a{if $action=="payouts"} class="active"{/if}  href="{$ca_url}affiliates/payouts/" >{$lang.payouts} </a></li>
    <li ><a{if $action=="vouchers"} class="active"{/if}  href="{$ca_url}affiliates/vouchers/">{$lang.managevouchers} </a></li>
    <li ><a{if $action=="addvoucher"} class="active"{/if}  href="{$ca_url}affiliates/addvoucher/" >{$lang.createnewvoucher} </a></li>
</ul>

