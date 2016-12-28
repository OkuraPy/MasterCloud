
<ul class="dropdown-menu">
    <li><a{if $action=="details"} class="active"{/if}  href="{$ca_url}clientarea/details/" >{$lang.details} </a></li>
    <li><a{if $action=="password"} class="active"{/if}  href="{$ca_url}clientarea/password/" >{$lang.changepass} </a></li>
    <li><a{if $cmd=="profiles"} class="active"{/if}  href="{$ca_url}profiles/" >{$lang.managecontacts} </a></li>
    {if $enableFeatures.security=='on'}<li ><a{if $action=="ipaccess"} class="active"{/if}  href="{$ca_url}clientarea/ipaccess/" >{$lang.security} </a></li>{/if}
    {if $enableFeatures.deposit!='off' }<li><a{if $action=="addfunds"} class="active"{/if}  href="{$ca_url}clientarea/addfunds/">{$lang.addfunds} </a></li>{/if}
    <li ><a{if $action=="invoices"} class="active"{/if}  href="{$ca_url}clientarea/invoices/">{$lang.invoices} </a></li>
    {if $enableCCards}<li ><a{if $action=="ccard"} class="active"{/if}  href="{$ca_url}clientarea/ccard/">{$lang.ccard} </a></li>{/if}
    <li ><a{if $action=="emails"} class="active"{/if}  href="{$ca_url}clientarea/emails/">{$lang.emails} </a></li>
    <li ><a{if $action=="history"} class="active"{/if}  href="{$ca_url}clientarea/history/">{$lang.logs} </a></li>
</ul>

