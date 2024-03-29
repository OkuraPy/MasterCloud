

<h3>{$lang.servicedetails}</h3> 
<p>
    {if $upgrades && $upgrades!='-1'}
        <small>
            <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&make=upgrades&upgradetarget=service" class="lmore">		
                {$lang.UpgradeDowngrade}
            </a>
        </small>
    {/if}
</p>

<table class="table table-striped table-aff-center p-top">
    {if $service.domain!=''}
        <tr>
            <td class="w30 bold">{$lang.domain}</td>
            <td class="bold">
                <a href="http://{$service.domain}" target="_blank"  class="roll-link">
                    <span data-title="{$service.domain}">{$service.domain}</span>
                </a>
            </td>
        </tr>
    {/if} 
{if $service.label!=''}
        <tr>
            <td class="w30 bold">{$lang.label}</td>
            <td class="bold">
                <span class="label label-{$service.status}">{$service.label}</span>
            </td>
        </tr>
    {/if}

    <tr>
        <td class="w30 bold">{$lang.status}</td>
        <td ><span class="label flat-ui-label {$service.status}-label">{$lang[$service.status]}</span></td>
    </tr>

    {if $service.showbilling}
        <tr>
            <td class="w30 bold">{$lang.registrationdate}</td>
            <td >{$service.date_created|dateformat:$date_format}</td>
        </tr>
        {if $service.firstpayment!=0 }
            <tr>
                <td class="w30 bold">{$lang.firstpayment_amount}</td>
                <td >{$service.firstpayment|price:$currency}</td>
            </tr>
        {/if}

        {if $service.billingcycle!='Free' && $service.billingcycle!='Once' && $service.billingcycle!='One Time' && $service.total>0}
            <tr>
                <td class="w30 bold">{if $service.billingcycle=='Hourly'}{$lang.curbalance}{else}{$lang.reccuring_amount}{/if}</td>
                <td >{$service.total|price:$currency} {if $service.billingcycle=='Hourly'}({$lang.updatedhourly}){/if}</td>
            </tr>
        {/if}

        {if $service.billingcycle!='Free' && $service.billingcycle!='Once' && $service.billingcycle!='One Time' && $service.next_due!='' && $service.next_due!='0000-00-00'}
            <tr>
                <td class="w30 bold">{$lang.nextdue}</td>
                <td >{$service.next_due|dateformat:$date_format}</td>
            </tr>
        {/if}
        <tr>
            <td class="w30 bold">{$lang.bcycle}</td>
            <td >{$lang[$service.billingcycle]}</td>
        </tr>
    {/if}
</table>
