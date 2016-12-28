<table class="whitetable" width="100%" cellspacing="0" cellpadding="3">
    <thead><tr>
            <th  >Hostname</th> 
            <th  >Size</th> 
            <th  >Hours</th> 
            <th >Total due</th>
        </tr></thead>
    <tbody>
       
             {foreach from=$service.flavor_usage key=da item=val name=usageloop}
            <tr class="{if $smarty.foreach.usageloop.iteration%2==0}even{else}odd{/if}">
                <td >{$val.hostname}</td>
                <td >{$val.name}</td>
                <td >{$val.hours}</td>
                <td >{$val.total|price:$currency}</td>
                
            </tr>
          {/foreach}
    </tbody>

</table>