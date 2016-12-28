{if $cmd == 'clientarea' && $action == 'default'}
	{include file="pageinfo/dashboard.tpl"}
{elseif $cmd == 'clientarea' && $action == 'domains'}
	{include file="pageinfo/domains.tpl"}
{/if}
