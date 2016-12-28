{include file="`$cloudstackdir`header.cloud.tpl"}

{if $vpsdo=='vmdetails'}
    {include file="`$cloudstackdir`details.tpl"}
{else}
    {include file="`$cloudstackdir2``$vpsdo`.tpl"}

{/if}
{include file="`$cloudstackdir`footer.cloud.tpl"}