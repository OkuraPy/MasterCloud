{if $_placeholder}
    {if $enableFeatures.profiles=='on'}
        <div class="slide">Loading</div>
    {/if}
    <div class="slide">Loading</div> <div class="slide">Loading</div>
    <div class="slide">Loading</div> <div class="slide">Loading</div>
    <div class="slide">Loading</div> <div class="slide">Loading</div>  
    <div class="slide">Loading</div> <div class="slide">Loading</div>
    <div class="slide">Loading</div> <div class="slide">Loading</div>
{else}

    {if !$_client}
        {if $client.id}{assign value=$client var=_client}
        {elseif $invoice.client.client_id}{assign value=$invoice.client var=_client}
        {elseif $estimate.client.client_id}{assign value=$estimate.client var=_client}
        {elseif $affiliate.client_id}{assign value=$affiliate var=_client}
        {elseif $details.client_id}{assign value=$details var=_client}
        {/if}
    {/if}
    {if $_client.parent_id}{assign value=$_client.parent_id var=_client_link}
    {elseif $_client.client_id}{assign value=$_client.client_id var=_client_link}
    {else}{assign value=$_client.id var=_client_link}
    {/if}
    <div class="left">
        <span class="left" style="padding-top:5px;padding-left:5px;">
            {if $_client.companyname}
                <strong>{$_client.companyname}</strong>
                {if $_client.firstname || $_client.lastname}
                    ({$_client.firstname} {$_client.lastname})
                {/if}
            {else}
                <strong> {$_client.firstname} {$_client.lastname}</strong>
            {/if}

            &nbsp;&nbsp;
        </span>

        {if $enableFeatures.profiles=='on'}
            <a class="nav_el  left"  href="?cmd=clients&action=clientcontacts&id={$_client_link}" onclick="return false" >{$lang.Contacts}</a>
        {/if}
        <a class="nav_el  left"  href="?cmd=orders&action=clientorders&id={$_client_link}" onclick="return false">{$lang.Orders}</a>
        <a class="nav_el  left"  href="?cmd=accounts&action=clientaccounts&id={$_client_link}" onclick="return false">{$lang.Services}</a>
        <a class="nav_el  left" href="?cmd=domains&action=clientdomains&id={$_client_link}" onclick="return false">{$lang.Domains}</a>
        <a class="nav_el  left" href="?cmd=invoices&action=clientinvoices&id={$_client_link}" onclick="return false">{$lang.Invoices}</a>
        <a class="nav_el  left" href="?cmd=invoices&action=clientinvoices&id={$_client_link}&currentlist=recurring" onclick="return false">{$lang.Recurringinvoices}</a>

        {if $enableFeatures.estimates=='on'}
            <a class="nav_el  left" href="?cmd=estimates&action=clientestimates&id={$_client_link}" onclick="return false">{$lang.Estimates}</a>
        {/if}

        <a class="nav_el  left" href="?cmd=transactions&action=clienttransactions&id={$_client_link}" onclick="return false">{$lang.Transactions}</a>
        <a class="nav_el  left" href="?cmd=tickets&action=clienttickets&id={$_client_link}" onclick="return false">{$lang.Tickets}</a>
        <a class="nav_el  left" href="?cmd=emails&action=clientemails&id={$_client_link}" onclick="return false">{$lang.Emails}</a>
        {if $enableFeatures.chat=='on'}
            <a class="nav_el  left" href="?cmd=hbchat&action=clienthistory&id={if $_client.client_id}{$_client.client_id}{else}{$_client.id}{/if}" onclick="return false">Chat History</a>
        {/if}
        <a class="nav_el direct left" href="?cmd=clients&action=show&id={if $_client.client_id}{$_client.client_id}{else}{$_client.id}{/if}">{$lang.Profile}</a>
    </div>
{/if}