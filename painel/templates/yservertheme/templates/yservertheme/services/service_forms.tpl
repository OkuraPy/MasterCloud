{if $service.custom}
    <table class="table table-striped">
        {foreach from=$service.custom item=cst}
            <tr >
                <td class="w30 bold">{$cst.name}  </td>
                <td>{include file=$cst.configtemplates.clientarea} </td>
            </tr>
        {/foreach}
    </table>
{/if}