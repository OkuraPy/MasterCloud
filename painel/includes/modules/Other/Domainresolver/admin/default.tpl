<div class="blu">{if $do=='accounts'}
Pick server :
<form action="?cmd=module&module={$moduleid}&do=accounts" id="f1" method="post">
	
	<select name="server_id" onchange="$('#f1').submit();">
		<option value="0">Pick server</option>
		{foreach from=$servers item=server}
			<option value="{$server.id}" {if $server_id==$server.id}selected="selected"{/if} >{$server.name} {$server.ip} {$server.hostname}</option>
		{/foreach}
	</select>
	<input type="submit" value="Check" />
</form>
{if $accounts}

<table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike hover">
                <tbody>
                  <tr>
				   <th >Match</th>
                    <th>{$lang.accounthash}</th>
                    <th>{$lang.clientname}</th>
                    <th>{$lang.Domain}</th>
                    <th>{$lang.Service}</th>
                    <th>{$lang.billingcycle}</th>
                    <th>{$lang.Status}</th>
                    <th>{$lang.nextdue}</th>
                    <th width="20"></th>
                  </tr>
                </tbody>
                <tbody id="updater">
 {foreach from=$accounts item=account}
     <tr >
	 <td class="toloads" id="{$account.id}"><img src="{$template_dir}img/ajax-loading2.gif" alt="working"/></td>

          <td><a href="?cmd=accounts&action=edit&id={$account.id}&list={$currentlist}">{$account.id}</a></td>
          <td><a href="?cmd=clients&action=show&id={$account.client_id}">{$account.firstname} {$account.lastname}</a></td>
          <td>{$account.domain}</td>
          <td>{$account.name}</td>
         
          <td>{$lang[$account.billingcycle]}</td>
          <td><span class="{$account.status}">{$lang[$account.status]}</span></td>
                <td>{if $account.next_due == '0000-00-00'}-{else}{$account.next_due|dateformat:$date_format}{/if}</td>
          <td><a href="?cmd=accounts&action=edit&id={$account.id}&list={$currentlist}" class="editbtn">{$lang.Edit}</a></td>

        </tr>
    {/foreach}
                
                </tbody>

              </table>
			  <script type="text/javascript">{literal}
	function loadStatuses() {
	if ($('.toloads').length<1)
		return;
	var id=$('.toloads').eq(0).attr('id');
		$.post('?cmd=module&module=domainresolver&do=account',{account_id:id},function(data){
			 var resp = parse_response(data);
			 if(resp.length>1) {
			 	$('.toloads').eq(0).html(resp);
			 	$('.toloads').eq(0).removeClass('toloads');
				 loadStatuses();
			 }
			
		});
	}
	appendLoader('loadStatuses');
	{/literal}</script>
{else}
This server dont have accounts suitable to resolve.
{/if}
{else}
{if $servers}
Pick server :
<form action="?cmd=module&module={$moduleid}&do=accounts" id="f1" method="post">
	
	<select name="server_id" onchange="$('#f1').submit();">
		<option value="0" selected="selected">Pick server</option>
		{foreach from=$servers item=server}
			<option value="{$server.id}">{$server.name} {$server.ip} {$server.hostname}</option>
		{/foreach}
	</select>
	<input type="submit" value="Check" />
</form>
{else}
<strong>There are no servers added to HostBill yet, <a href="?cmd=servers">add some to start resolving.</strong>
{/if}
{/if}</div>