

<ul class="nav nav-list sh-menu pull-left span3">
    <li><h5>{$lang.menu}</h5></li>
    <li class="no-border {if $action=='details'} active {/if}">
        <a href="{$ca_url}clientarea/details/">
            <span class="entypo">&#128100;</span>
            <p class="sh-text">{$lang.mydetails}</p>
        </a>
    </li>
    <li {if $action=='password'} class="active" {/if}>
        <a href="{$ca_url}clientarea/password/">
            <span class="entypo">&#128274;</span>
            <p class="sh-text">        
                {if $clientdata.contact_id}
                    {$lang.changemainpass}
                {else}
                    {$lang.changepass}
                {/if}
            </p>
        </a>
    </li>
    {if $enableFeatures.deposit!='off' }
        <li {if $action=='addfunds'} class="active" {/if}>
            <a href="{$ca_url}clientarea/addfunds/">
                <span class="entypo">&#8862;</span>
                <p class="sh-text">{$lang.addfunds}</p>
            </a>
        </li>
    {/if}
    {if $enableCCards}
        <li {if $action=='ccard'} class="active" {/if}>
            <a href="{$ca_url}clientarea/ccard/">
                <span class="entypo">&#128179;</span>
                <p class="sh-text">{$lang.ccard}</p>
            </a>
        </li>
    {/if}
    <li {if $cmd=='profiles'} class="active" {/if}>
        <a href="{$ca_url}profiles/">
            <span class="entypo">&#59170;</span>
            <p class="sh-text">{$lang.profiles}</p>
        </a>
    </li>
    {if $enableFeatures.security=='on'}
        <li {if $action=='ipaccess'} class="active" {/if}>
            <a href="{$ca_url}clientarea/ipaccess/">
                <span class="entypo">&#127758;</span>
                <p class="sh-text">{$lang.ipaccess}</p>
            </a>
        </li>
    {/if}
</ul>

