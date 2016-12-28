{if (($cmd == 'clientarea' &&  ($action == 'details' ||$action == 'password' || $action == 'ipaccess' || $action == 'addfunds' || $action == 'invoices' || $action == 'ccard' || $action == 'emails' || $action == 'history')) || $cmd == 'profiles') 
|| ($cmd == 'affiliates' && $affiliate)
|| ($cmd == 'clientarea' && $action == 'services' && !$custom_template && !$widget.replacetpl && $service)
|| ($cmd == 'clientarea' && $action == 'domains' && $details)
|| ($cmd == 'knowledgebase' )
|| ($cmd == 'downloads' )
|| ($cmd == 'tickets' && $action=='new' && !$ticketcreated)}
<div class="knowledgebase">

    <ul class="nav top-btns nav-pills">
        <li><a href="{$ca_url}"><i class="icon-dl-cross"></i></a></li>
    </ul>
    <div class="shared-hosting-menu">
        {if ($cmd == 'clientarea' &&  ($action == 'details' ||$action == 'password' || $action == 'ipaccess' || $action == 'addfunds' || $action == 'invoices' || $action == 'ccard' || $action == 'emails' || $action == 'history')) || $cmd == 'profiles'}
            {include file="submenu/account.submenu.tpl"}
        {/if}
        {if $cmd == 'affiliates' && $affiliate}
            {include file="submenu/affiliates.submenu.tpl"}
        {/if}
        {if $cmd == 'clientarea' && $action == 'services' && !$custom_template && !$widget.replacetpl && $service}
            {include file="submenu/services.submenu.tpl"}
        {/if}
        {if $cmd == 'clientarea' && $action == 'domains' && $details}
            {include file="submenu/domains.submenu.tpl"}
        {/if}
        {if $cmd == 'knowledgebase'}
            {listknowledgebase}
            {include file="submenu/knowledgebase.submenu.tpl"}
        {/if}
        {if $cmd == 'downloads'}
            {listdownloads}
            {include file="submenu/downloads.submenu.tpl"}
        {/if}
        {if $cmd == 'tickets' && $action=='new' && !$ticketcreated}
            <p class="current-categories">{$lang.knowledgebase}</p>
            <ul id="hintarea">
            {include file="ajax.tickets.tpl" action='kbhint'}
            </ul>
        {/if}
    </div>
</div>
{/if}
