{literal}
    <script type="text/javascript">
        $(function () {

        });
    </script>
{/literal}
<form action="" method="POST" class="form-horizontal">
    <div class="wbox">
        <div class="wbox_header"><strong>{$lang.clone_zone}</strong></div>
        <div class="wbox_content">
            <label>{$lang.from}</label><select name="clone">
                <option>---</option>
                {if $user_domains}
                    {foreach from=$user_domains item=domain}
                        <option value="{$domain.$domain_indent}">{$domain.domain}</option>
                    {/foreach}
                {/if}
            </select>
            <input type="checkbox" name="clonenames"  id="clonenames" value="1" checked="checked" /> 
            <label for="clonenames">
                {$lang.replacerecordcontent}  
                <a title="{$lang.clonedzonecontdescr}" class="vtip_description"></a>
            </label>
            <center>
                <input type="submit" name="submit" class="btn btn-primary"  value="{$lang.submit}" style="padding:4px 3px;font-weight:bold;font-size:12px" /> &nbsp; &nbsp;
                <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/">{$lang.cancel}</a>
            </center>
        </div>
    </div>
    <div class="wbox">
        <div class="wbox_header">{$lang.bulkdomains}</div>
        <div class="wbox_content">
            {foreach from=$sected_domains item=domain name=row}
                <div {if  $smarty.foreach.row.index == 0}class="first"{/if}><input type="checkbox" value="{$domain.$domain_indent}" name="dom[]" checked="checked"/> 
                    {$domain.domain}
                </div>
            {/foreach}
            <center>
                <input type="submit" name="submit" class="btn btn-primary"  value="{$lang.shortsave}" /> &nbsp; &nbsp; 
                <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/">{$lang.cancel}</a>
            </center>
        </div> 
    </div>
</form>