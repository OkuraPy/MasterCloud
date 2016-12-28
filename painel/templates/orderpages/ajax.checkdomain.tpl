{if $whois}
	{$whois}
{/if}

{if $check}
	{if $transfer}
		<input type='hidden' name='domain' value='illtransfer'/>
	{else}
		<input type='hidden' name='domain' value='illregister'/>
	{/if}
	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled" style="margin-bottom:20px;">
		<colgroup class="firstcol"></colgroup>
		<colgroup class="alternatecol"></colgroup>

		<colgroup class="firstcol"></colgroup>
		<colgroup class="alternatecol"></colgroup>
		<tr>
			<th colspan="2" class="th1 first">{$lang.domain}</th>
            <th class="th2">{$lang.status}</th>
            <th class="th3">{foreach from=$check item=ccme}{if $ccme.status == "ok"}{$lang.period}{break}{/if}{/foreach}</th>
            <th class="th4 last"></th>
		</tr>
		{counter start=0 print=false assign=suggested}
		{foreach from=$check item=ccme}
			{if $ccme.status == "ok"}

				<tr>
                    <td class="first td1">
                        <input type="checkbox" name="tld[{$ccme.sld}{$ccme.tld}]" value="{$ccme.tld}" checked="checked"/>
						<input type="hidden" name="sld[{$ccme.sld}{$ccme.tld}]" value="{$ccme.sld}" />
                    </td>
					<td class="td2"><strong>{$ccme.sld}{$ccme.tld}</strong></td>
					<td align="center" class="td3 available">{$lang.availorder}</td>
					<td align="center" class="td4 last">
						<select name="period[{$ccme.sld}{$ccme.tld}]">
							{foreach from=$ccme.prices item=price}
								{if $transfer && $price.transfer>=0}
									<option value="{$price.period}">{$price.period} {$lang.years} @ {$price.transfer|price:$currency}</option>
								{elseif !$transfer && $price.register>=0}
									<option value="{$price.period}">{$price.period} {$lang.years} @ {$price.register|price:$currency}</option>
								{/if}

							{/foreach}
						</select></td>

				</tr>
			{elseif $ccme.status == ""}

				<tr>
					<td class="first td1"><input type="checkbox" disabled="disabled" /></td>
					<td class="td2"><strong>{$ccme.sld}{$ccme.tld}</strong></td>
					<td align="center" class="td3 unavailable">
						{if $transfer}
							{$lang.trans_unavail}  <br />
							<a href="{$ca_url}cart&amp;step=1&amp;domain=illregister&amp;sld={$ccme.sld}&amp;tld={$ccme.tld}&amp;period=1&amp;ref=1&amp;cat_id=register">{$lang.trans_reg}</a>
						{else}
							{$lang.unavail}
						{/if}


					</td>
					<td align="center" class="td4 last"><a href="http://www.{$ccme.sld}{$ccme.tld}" target="_blank">WWW</a>&nbsp;<a href="{$ca_url}checkdomain&action=whois&amp;sld={$ccme.sld}&amp;tld={$ccme.tld}" onclick="window.open(this.href,'{$ccme.sld}{$ccme.tld}','width=500, height=500, scrollbars=1'); return false">WHOIS</a><br /></td>
				</tr>
			{elseif $ccme.status =="suggested"}
				{counter}
			{/if}
		{/foreach}
		{if $suggested > 0}
			<tr><td colspan="4"></td></tr>
			<tr>
				<th colspan="2">{$lang.rnames}</th><th colspan="2"></th>
			</tr>
				{foreach from=$check item=ccme}
					{if $ccme.status =="suggested"}
					<tr>
						<td><input type="checkbox" name="tld[{$ccme.sld}{$ccme.tld}]" value="{$ccme.tld}" />
						<input type="hidden" name="sld[{$ccme.sld}{$ccme.tld}]" value="{$ccme.sld}" /></td>

						<td><strong>{$ccme.sld}{$ccme.tld}</strong></td>
						<td align="center">{$lang.availorder}</td>
						<td align="center">
						<select name="period[{$ccme.sld}{$ccme.tld}]">
							{foreach from=$ccme.prices item=price}
								{if $transfer && $price.transfer>=0}
									<option value="{$price.period}">{$price.period} {$lang.years} @ {$price.transfer|price:$currency}</option>
								{elseif !$transfer && $price.register>=0}
									<option value="{$price.period}">{$price.period} {$lang.years} @ {$price.register|price:$currency}</option>
								{/if}

							{/foreach}
						</select>
						</td>
					</tr>
					{/if}
				{/foreach}
			{/if}
{foreach from=$check item=ccme}{if $ccme.status == "ok"}<tr><td colspan="4" align="center"><input type="submit" value="{$lang.ordernow}" class="padded btn" style="font-weight:bold;"/></td></tr>{break}{/if}{/foreach}
</table>

{/if}