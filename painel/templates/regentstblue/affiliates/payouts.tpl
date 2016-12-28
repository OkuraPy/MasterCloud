<div class="spacing">
    <h3>{$lang.affiliate}</h3>
    <p>{$lang.affiliate_description}</p>
    


	<div class="flat-ui-tab">
    {include file='menus/affiliates.sub.tpl'}
        <div class="tab-content p-10">
          <div class="tab-pane active">
            
          	<h4 class="mt-10">{$lang.withdrawallogs}</h3>
            <p>{$lang.voucherinfo}</p>
            
            
            <table class="table table-header-fix table-striped p-td" style="width: 100%">
                <tr>
                    <th>{$lang.date}</th>
                    <th>{$lang.withdrawn}</th>
                    <th>{$lang.note}</th>
                </tr>
                {foreach from=$logs item=log name=logs}
                    <tr>
                        <td>{$log.date|dateformat:$date_format}</td>
                        <td>{$log.amount|price:$affiliate.currency_id}</td>
                        <td>{$log.note}</td>
                    </tr>
                {/foreach}
            </table>
            {if !$logs}
                <div class="table-content">
                    <p class="text-center">{$lang.nothing}</p>
                </div>
            {/if}
            
          </div>
        </div>
    </div>
</div>
