
{literal}
    <script type="text/javascript">
        $(function () {
            var type = $('#type').val();
            var ht;
            if (types[type] !== undefined) {
                for (var i = 0; i < types[type].length; i++) {
                    ht = types[type][i][0];
                    if (types[type][i][1] !== undefined)
                        ht += '<a class="vtip_description" title="' + types[type][i][1] + '"></a>';
                    $('input[name="content[' + i + ']"]').after(ht);
                }
            }

        });
    </script>
{/literal}
<form action="" method="POST">
    <input id="type" type="hidden" name="type" value="{$record.type}" />
    <input type="hidden" name="dom" value="{$domid}" />

    <div class="wbox">
        <div class="wbox_header"><strong>{$lang.editrecord}</strong></div>
        <div class="wbox_content">
            <div class="recordbox">
                <label>{$lang.name}:</label>
                <input type="text" name="name" value="{$record.name}" class="styled" />
            </div>
            <div class="recordbox">
                <label>TTL</label>
                <select class="styled" name="ttl" >
                    <option {if $record.ttl == '3600'}selected="selected"{/if} value="3600">1 {$lang.yhour}</option>
                    <option {if $record.ttl == '43200'}selected="selected"{/if}value="43200">12 {$lang.yhours}</option>
                    <option {if $record.ttl == '86400'}selected="selected"{/if} value="86400">24 {$lang.yhours}</option>
                    <option {if $record.ttl == '172800'}selected="selected"{/if} value="172800">48 {$lang.yhours}</option>
                </select> <a class="vtip_description" title="{$lang.ttlfeqdescription}"></a>
            </div>
            {if $record.type == 'MX'}
                <div class="recordbox">
                    <label>{$lang.priority}</label>
                    <input type="text" name="priority" value="{$record.priority}" class="styled" /> <a class="vtip_description" title="{$lang.prioritysettingdesc}"></a>
                </div>
            {/if}
            <div class="recordbox">
                <label>{$lang.content}</label>
                <div id="contentbox">
                    {foreach from=$record.content item=content key=ky}
                        <input type="text" name="content[{$ky}]" class="styled" value="{$content|escape}" /> <br>
                    {/foreach}
                </div>
            </div>
            <center>
                <input type="submit" class="btn btn-primary" name="submit" value="{$lang.submit}" style="padding:4px 3px;font-weight:bold;font-size:12px" /> &nbsp; &nbsp;
                <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/">{$lang.cancel}</a>
            </center>
        </div>
    </div> 
</form>