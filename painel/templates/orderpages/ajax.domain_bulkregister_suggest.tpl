{if $justparse && $check}
	<input type='hidden' name='domain' value='illregister'/>
	<table width="100%" cellpadding="0" cellspacing="0" class="table-status">
		<colgroup>
			<col width="5%" />
			<col width="31%" />
			<col width="31%" />
			<col width="33%" />
		</colgroup>
		<thead>
			<tr class="status-head">
				<td align="center">&nbsp;</td>
				<td align="center">{$lang.domain}</td>
				<td align="center">{$lang.status}</td>
				<td align="center">{$lang.period}</td>
			</tr>
		</thead>
		<tbody>
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
		</tbody>
		<tbody id="suggestions" style="display:none" >
			<tr class="status-head"><td/><td align="center">{$lang.rnames}</td><td colspan="2"/></tr>
			<tr id="sgtpl" style="display:none" class=" {if $smarty.foreach.foo.index%2 == 1}status-row-white{/if}">
				<td align="center"><input type="checkbox" name="tld[$t_sld$t_tld]" value="$t_tld" />
					<input type="hidden" name="sld[$t_sld$t_tld]" value="$t_sld" /></td>
				<td align="center"><strong>$t_sld$t_tld</strong></td>
				<td align="center"><b style="color:#6D9D2C">{$lang.availorder}</b></td>
				<td align="right">
					<div class="select-status">
						<div>
							<select  style="padding: 0;" name="period[$t_sld$t_tld]">
								<option value="$t_period">$t_period {$lang.years} @ $t_price</option>
							</select>
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="button06" style="float:none; margin: 20px  0px 20px 270px; width: 130px;"><div><input type="submit" value="{$lang.registerselected}" /></div></div>
	<script type="text/javascript">runBulkSearch();</script>
{elseif $check}
	{counter start=0 print=false assign=suggested}
	{foreach from=$check item=name key=key}
		{if $name.status == 'ok'}
			<td align="center"><input type="checkbox" name="tld[{$name.sld}{$name.tld}]" value="{$name.tld}" checked="checked" />
				<input type="hidden" name="sld[{$name.sld}{$name.tld}]" value="{$name.sld}" /></td>
			<td align="center"><strong>{$name.sld}{$name.tld}</strong></td>
			<td align="center"><b style="color:#6D9D2C">{$lang.availorder}</b></td>
			<td align="right">
				<div class="select-status"><div>
						<select  style="padding: 0;" name="period[{$name.sld}{$name.tld}]">
							{foreach from=$name.prices item=price}
								{if $price.register>=0}
									<option value="{$price.period}">{$price.period} {$lang.years} @ {$price.register|price:$currency}</option>
								{/if}

							{/foreach}
						</select>
					</div>
				</div>
			</td>
		{elseif $name.status ==""}
			<td align="center"><input type="checkbox" disabled="disabled" /></td>
			<td align="center"><strong>{$name.sld}{$name.tld}</strong></td>
			<td align="center">
				{$lang.unavail}
			</td>
			<td align="right">
				<div class="select-status" style="line-height: 35px;"><div><a href="http://www.{$name.sld}{$name.tld}" target="_blank">WWW</a>&nbsp;<a href="{$ca_url}checkdomain&action=whois&amp;sld={$name.sld}&amp;tld={$name.tld}" onclick="window.open(this.href,'{$name.sld}{$name.tld}','width=500, height=500, scrollbars=1'); return false">WHOIS</a>
					</div></div>
			</td>
		{elseif $name.status =="suggested"}
			{counter}
		{/if}
	{/foreach}
	{if $suggested > 0}
	<script type="text/javascript">
		addSuggestions([
{foreach from=$check item=name name=sugg}
 {if $name.status =="suggested"}
  {literal}{{/literal}sld:'{$name.sld}', tld:'{$name.tld}'
  , price:[
   {foreach from=$name.prices item=price name=pricel}
    {if $price.register>=0}
    {literal}{{/literal}period: '{$price.period}',register: '{$price.register|price:$currency}'{literal}}{/literal}{if !$smarty.foreach.pricel.last},{/if}
    {/if}
   {/foreach}]
  {literal}}{/literal}{if !$smarty.foreach.sugg.last},{/if}
 {/if}
{/foreach}]);
	</script>
	{/if}
{/if}