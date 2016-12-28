{if $justparse && $check}
 <input type='hidden' name='domain' value='illtransfer'/>
 <table width="100%" cellpadding="0" cellspacing="0" class="table-status">
				<colgroup>
					<col width="5%" />
					<col width="31%" />
					<col width="31%" />
					<col width="33%" />
				</colgroup>
				<tr class="status-head">
					<td align="center">&nbsp;</td>
					<td align="center">{$lang.domain}</td>
					<td align="center">{$lang.status}</td>
					<td align="center">{$lang.period}</td>
				</tr>


                                {foreach from=$check item=ccme name=foo}


                                    <tr class="status-row {if $smarty.foreach.foo.index%2 == 1}status-row-white{/if}">
					<td align="center">
                                            <img src="{$template_dir}img/ajax-loading2.gif" alt="" />
                                            <input type="hidden" name="tlx" value="{$ccme.tld}" />
                                            <input type="hidden" name="slx" value="{$ccme.sld}" />
                                            </td>
					<td align="center"><strong>{$ccme.sld}{$ccme.tld}</strong></td>
					<td align="center">{$lang.checkingstatus}</td>
					<td align="right">

					</td>
				</tr>

                                 {/foreach}
			</table>
			<div class="button06" style="float:none; margin: 20px  0px 20px 270px; width: 130px;"><div><input type="submit" value="{$lang.transferselected}" /></div></div>
                        <script type="text/javascript">runBulkSearch();</script>
 {elseif $check}
    {if $check.status == 'ok'}
                        <td align="center"><input type="checkbox" name="tld[{$check.sld}{$check.tld}]" value="{$check.tld}" checked="checked" />
                            <input type="hidden" name="sld[{$check.sld}{$check.tld}]" value="{$check.sld}" /></td>
                        <td align="center"><strong>{$check.sld}{$check.tld}</strong></td>
                        <td align="center"><b style="color:#6D9D2C">{$lang.availorder}</b></td>
                        <td align="right">
                            <div class="select-status"><div>
                                    <select  style="padding: 0;" name="period[{$check.sld}{$check.tld}]">
                                                        {foreach from=$check.prices item=price}
                                                                {if $price.transfer>=0}
                                       <option value="{$price.period}">{$price.period} {$lang.years} @ {$price.transfer|price:$currency}</option>
                                                                {/if}

                                                        {/foreach}
                                    </select>
                                </div></div>
                        </td>

    {else}

                        <td align="center"><input type="checkbox" disabled="disabled" /></td>
                        <td align="center"><strong>{$check.sld}{$check.tld}</strong></td>
                        <td align="center" colspan="2" style="font:normal 14px/22px Arial ;">

							{$lang.trans_unavail}  <br />
	<a href="{$ca_url}cart&amp;step=1&amp;domain=illregister&amp;sld={$check.sld}&amp;tld={$check.tld}&amp;period=1&amp;ref=1&amp;cat_id=register">{$lang.trans_reg}</a>
                        </td>
                       
    {/if}
{/if}