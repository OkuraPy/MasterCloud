<ul class="accor">
				<li><a href="#">{$lang.vpsdetails}</a>
				<div class="sor">

				<table cellspacing="2" cellpadding="3" border="0" width="100%" >
      <tbody>


		<tr >
          <td width="150">VEID</td>
          <td >
<input name="veid" value="{$details.veid}" size="5"  class="{if $details.status!='Pending' && $details.status!='Terminated'}manumode{/if}"
{if $details.manual!='1' && $details.status!='Pending' && $details.status!='Terminated'}style="display:none"{/if}/>

		   <span class="{if $details.status!='Pending' && $details.status!='Terminated'}livemode{/if}" {if $details.manual=='1' || $details.status=='Pending' || $details.status=='Terminated'}style="display:none"{/if}><strong>{$details.veid}</strong></span></td>

		  </tr>

		  <tr>
          <td width="150">{$lang.Node}</td>
          <td >
		  <div id="node_">
		  <input name="node" value="{$details.node}" size="5"  class="{if $details.status!='Pending' && $details.status!='Terminated'}manumode{/if}"  {if $details.manual!='1' && $details.status!='Pending' && $details.status!='Terminated'}style="display:none"{/if}/>

		   {if $custom.GetNodes}
			<input type="button" name="customfn" value="{$lang.getnodes}" onclick="ajax_update('?cmd=accounts&action=customfn&val=GetNodes&id={$details.id}',{literal}{}{/literal},'#node_',true);return false;" class="{if $details.status!='Pending' && $details.status!='Terminated'}manumode{/if}"  {if $details.manual!='1' && $details.status!='Pending' && $details.status!='Terminated'}style="display:none"{/if}/>
                        {/if}
                   </div>
		   <span class="{if $details.status!='Pending' && $details.status!='Terminated'}livemode{/if}" {if $details.manual=='1' || $details.status=='Pending' || $details.status=='Terminated'}style="display:none"{/if}>{$details.node}</span></td>

		  </tr>
		
		  <tr>
		       <td>{$lang.virttype}</td>
			  <td><strong>{$details.type}</strong></td>
		  </tr>
		  


		  <tr>
		  	<td>{$lang.ostemplate}</td>
			<td>
			<div id="ost_">

			<input value="{$details.os}" name="os"  class="{if $details.status!='Pending' && $details.status!='Terminated'}manumode{/if}"  {if $details.manual!='1' && $details.status!='Pending' && $details.status!='Terminated'}style="display:none"{/if}/>

			{if $custom.GetOsTemplates}
			<input type="button" name="customfn" value="{$lang.getostemplates}" onclick="ajax_update('?cmd=accounts&action=customfn&val=GetOsTemplates&id={$details.id}',{literal}{}{/literal},'#ost_',true);return false;" class="{if $details.status!='Pending' && $details.status!='Terminated'}manumode{/if}"  {if $details.manual!='1' && $details.status!='Pending' && $details.status!='Terminated'}style="display:none"{/if}/>{/if}
			</div>

		   <span class="{if $details.status!='Pending' && $details.status!='Terminated'}livemode{/if}" {if $details.manual=='1' || $details.status=='Pending' || $details.status=='Terminated'}style="display:none"{/if}>{$details.os}</span></td>
		</tr>

		  <tr>
		  	<td>{$lang.mainip}</td>
			<td><input value="{$details.ip}" name="ip" /></td>
		</tr>

			

		  <tr>
		  	<td>{$lang.disklimit}</td>
			<td><input value="{$details.disk_limit}" name="disk_limit"  size="5" /></td>
		</tr>
		<tr {if $details.ptype=='Server'}style="display:none"{/if}>
		  	<td>{$lang.bwlimit}</td>
			<td><input value="{$details.bw_limit}" name="bw_limit"  size="5"/></td>
		</tr>
		<tr>
		  	<td>{$lang.guaranteed_ram}</td>
			<td><input value="{$details.guaranteed_ram}" name="guaranteed_ram"  size="5"/></td>
		</tr>
		<tr {if $details.type=='Xen'}style="display:none"{/if}>
		  	<td>{$lang.burstable_ram}</td>
			<td><input value="{$details.burstable_ram}" name="burstable_ram"  size="5"/></td>
		</tr>

		{if $details.extra}
                            {foreach from=$details.extra item=ip key=ex}
                                    {if is_array($ip) && isset($ip.type)}
                                        {if $ip.type == 'check'}
                                        <tr>
                                            <td>{if $lang.$ex}{$lang.$ex}{else}{$ex}{/if}</td>
                                            <td><input type="hidden" name="extra[{$ex}][type]" value="check" /><input value="1" {if $ip.value == 1}checked="checked"{/if} name="extra[{$ex}][value]" type="checkbox" class="{if $details.status!='Pending' && $details.status!='Terminated'}manumode{/if}"  {if $details.manual!='1' && $details.status!='Pending' && $details.status!='Terminated'}style="display:none"{/if}/>
                                           <span class="{if $details.status!='Pending' && $details.status!='Terminated'}livemode{/if}" {if $details.manual=='1' || $details.status=='Pending' || $details.status=='Terminated'}style="display:none"{/if}>{if $ip.value == 1}{$lang.Yes}{else}{$lang.No}{/if}</span></td>
                                        </tr>
                                        {elseif $ip.type == 'hidden'}
                                            <input type="hidden" name="extra[{$ex}][type]" value="hidden" />
                                            <input type="hidden" name="extra[{$ex}][value]" value="{$ip.value}" />
                                        {/if}
                                    {else}
                                    <tr>
                                        <td>{if $lang.$ex}{$lang.$ex}{else}{$ex}{/if}</td>
                                        <td><input value="{$ip}" name="extra[{$ex}]" class="{if $details.status!='Pending' && $details.status!='Terminated'}manumode{/if}"  {if $details.manual!='1' && $details.status!='Pending' && $details.status!='Terminated'}style="display:none"{/if}/>
                                       <span class="{if $details.status!='Pending' && $details.status!='Terminated'}livemode{/if}" {if $details.manual=='1' || $details.status=='Pending' || $details.status=='Terminated'}style="display:none"{/if}>{$ip}</span></td>
                                    </tr>
                                    {/if}
                            {/foreach}

			{/if}


		  </tbody></table>


				</div>

				</li>

</ul>