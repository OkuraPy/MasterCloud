<script type="text/javascript">
    {literal}
        function disb_ns(e) {
            if(e) {
                $('.todisable').attr('disabled','disabled').addClass('disabled');
                {/literal}{if !$singledomain}$('.nsrow').slideUp();{/if}{literal}
            } else {
                $('.todisable').removeClass('disabled').removeAttr('disabled');
                {/literal}{if !$singledomain}$('.nsrow').slideDown();{/if}{literal}
            }
        }

    {/literal}
</script>
<div class="wbox">
    <div class="wbox_header">{assign var=widg_name value="`$widget.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</div>
    <div  class="wbox_content">
       <form action="" method="post">
        <input type="hidden" name="widgetdo" value="updateNameServers"  />

            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="checker table table-striped">
                <tr class="even">
                    <td align="right"><strong>{$lang.generalsettings}</strong></td>
                    <td><input type="radio" name="whosns" value="ours" onclick="disb_ns(true)" id="who_ours" {if $whosns=='ours'}checked="checked"{/if} /> <label for="who_ours">{$lang.ourns}</label>
                        <input type="radio" onclick="disb_ns(false)"   name="whosns" value="clients" id="who_clients"  {if !$whosns || $whosns=='clients'}checked="checked"{/if} /> <label for="who_clients">{$lang.custom} </label>  </td>
                </tr>
            {if $singledomain}
            {foreach from=$details.nameservers item=nameserver key=number name=nsloop}
                <tr class="nsrow {if $smarty.foreach.nsloop.iteration%2==0}even{/if}"><td align="right">{$lang.nameserver} {$number+1}</td><td >
                        <input type="text" size="40" value="{$nameserver}" name="nameservers[ns{$number+1}]" class="styled todisable {if $whosns=='ours'}disabled{/if}" {if $whosns=='ours'}disabled="disabled"{/if}/>
                </td></tr>
                {if $details.nsips && $details.nsips|is_array}
                    <tr class="nsrow {if $smarty.foreach.nsloop.iteration%2==0}even{/if}" >
                        <td align="right">{$lang.nameserver} IP {$number+1}</td><td ><input type="text" size="40" value="{$details.nsips.$number}" name="nsips[nsip{$number+1}]" class="todisable  {if $whosns=='ours'}disabled{/if}"  {if $whosns=='ours'}disabled="disabled"{/if}/>
                        </td>
                    </tr>
                {/if}
            {/foreach}
            {else}
                <tr class="nsrow  even">
                    <td align="right">{$lang.nameserver} 1</td>
                    <td ><input type="text" class="styled" size="40" value="" name="nameservers[ns1]" class="styled todisable"/>
                </td></tr>
                <tr class="nsrow">
                    <td align="right">{$lang.nameserver} 2</td>
                    <td ><input type="text" class="styled" size="40" value="" name="nameservers[ns2]" class="styled todisable"/>
                </td></tr>
                <tr class="even nsrow">
                    <td align="right">{$lang.nameserver} 3</td>
                    <td ><input type="text" class="styled" size="40" value="" name="nameservers[ns3]" class="styled todisable"/>
                </td></tr>
                <tr  class="nsrow">
                    <td align="right">{$lang.nameserver} 4</td>
                    <td ><input type="text" class="styled" size="40" value="" name="nameservers[ns4]" class="styled todisable"/>
                </td></tr>
             {/if}


               <tr  class="even"><td colspan="2" align="center"> <input type="submit"  value="{$lang.savechanges}" style="font-weight:bold" class=" btn btn-primary"/>
     <span class="fs11">{$lang.or}</span> <a href="{$ca_url}clientarea/domains/{if $details}{$details.id}/{$details.name}/{/if}" class="fs11">{$lang.cancel}</a></td></tr>
            </table>




	{securitytoken}</form>
    </div>
</div>


