
<div class="spacing">
    <h3>{$lang.affiliate}</h3>
    <p>{$lang.affiliate_description}</p>
    
    
    <div class="flat-ui-tab">
    {include file='menus/affiliates.sub.tpl'}
        <div class="tab-content p-10">
          <div class="tab-pane active">
          
          	<div class="table-details pull-right">
                <div class="pull-right">
                    <a href="#" onclick="delete_vouchers(); return false" class="btn btn-danger">{$lang.deleteselected}</a>
                </div>
                <div class="detailed-info pull-right bold">
                    <span class="txt-success">4</span>
                    <p>{$lang.total}</p>
                </div>
                <div class="detailed-info pull-right bold">
                    <span class="txt-important">2</span>
                    <p>{$lang.used}</p>
                </div>
            </div>
            
          	<h4 class="mt-10">{$lang.promocodes}</h3>
            <p>{$lang.voucherinfo}</p>
            
            
            <table class="table styled-table voucher-table">
            	<thead>
                  <tr>
                      <th class="w5"><input type="checkbox"></th>
                      <th><a href="#"><i class="icon-sort"></i></a>{$lang.vouchercode}</th>
                      <th><a href="#"><i class="icon-sort"></i></a>{$lang.discount}</th>
                      <th><a href="#"><i class="icon-sort"></i></a>{$lang.margin}</th>
                      <th><a href="#"><i class="icon-sort"></i></a>{$lang.used}</th>
                              {if 'config:AffVAudience:1'|checkcondition}
                          <th><a href="#"><i class="icon-sort"></i></a>{$lang.audience}</th>
                              {/if}
                      <th><a href="#"><i class="icon-sort"></i></a>{$lang.expires}</th>
                      <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr class="empty-row">
                      </tr>
                  {foreach from=$vouchers item=voucher name=vouchers}
                      <tr>
                          <td>
                              <input type="checkbox">
                          </td>
                          <td>{$voucher.code}</td>
                          <td>
                              {if $voucher.type=='Percent'}{$voucher.value}%
                              {else}{$voucher.value|price:$affiliate.currency_id}
                              {/if}
                          </td>
                          <td>
                              {if $voucher.type=='Percent'}{$voucher.margin}%
                              {else}{$voucher.margin|price:$affiliate.currency_id}
                              {/if}
                          </td>
                          <td>
                              {$voucher.num_usage}
                          </td>
                          {if 'config:AffVAudience:1'|checkcondition}
                              <td>
                                  {if $voucher.clients=='new'}
                                      {$lang.newcustommers}
                                  {elseif $voucher.clients=='existing'}
                                      {$lang.existingcustommers}
                                  {else}
                                      {$lang.allcustommers}
                                  {/if}
                              </td>
                          {/if}
                          <td>
                              {if $voucher.expires|dateformat:$date_format}{$voucher.expires|dateformat:$date_format}
                              {else}-
                              {/if}
                          </td>

                          <td>
                              <a href="{$ca_url}{$cmd}/{$action}/&make=delete&id={$voucher.id}&security_token={$security_token}" class="btn btn-mini">
                                  <i class="icon-trash"></i>
                              </a>
                          </td>
                      </tr>
                  {/foreach}
                  </tbody>
              </table>
              {if !$vouchers}
                  <div class="table-content">
                      <p class="text-center">{$lang.nothing}</p>
                  </div>
              {/if}
            
          </div>
        </div>
    </div>
</div>