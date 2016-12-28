<div class="page-info-box">
	{if $details}
    	<h1>{$lang.domdetails|capitalize}</h1>
        <p>{$details.name}</p>
    {else}
        <h1>{$lang.domains|capitalize}</h1>
    	<p>{$lang.listallyoursdomain}</p>
    {/if}
</div>