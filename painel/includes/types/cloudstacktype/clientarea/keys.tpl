{include file="`$cloudstackdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">
        SSH Keys
    </h3>
    <div class="clear"></div>
</div>
<div class="content-bar">
    {if $key}
        <div class="cloud-notice">
            <p><strong>Generated key:</strong> {$key.name}</p>
            <p>
                Save this private key into a file on your machine
            </p>
        </div>
        <pre>{$key.privatekey}</pre>
        <div class="btn-group-cloud-alt">
            <a href="{$service_url}&vpsdo=keys{if $vpsid}&vpsid={$vpsid}{/if}" class="btn btn-default"><i class="icon icon-chevron-left"></i> Go Back</a>
        </div>
    {else}
        <table cellspacing="0" width="100%" class="data-table backups-list">
            <thead>
                <tr>
                    <td>Key name</td>
                    <td>Fingerprint</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                {foreach from=$keys item=key}
                    <tr>
                        <td>{$key.name|escape}</td>
                        <td>{$key.fingerprint}</td>   
                        <td>
                            <a href="{$service_url}&vpsdo=keys{if $vpsid}&vpsid={$vpsid}{/if}&do=delete&name={$key.name|escape:'url'}&security_token={$security_token}" 
                               onclick="return confirm('Are you sure you want to remove this key?')" class="small_control small_delete fs11">{$lang.delete}</a>
                        </td>
                    </tr>
                {foreachelse}
                    <tr>
                        <td colspan="3">{$lang.nothing}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        <div class="btn-group-cloud">
            <a class="btn btn-info" href="{$service_url}&vpsdo=keys{if $vpsid}&vpsid={$vpsid}{/if}&do=register" id="regKeys">Register existing key</a>
            <a class="btn btn-info" href="{$service_url}&vpsdo=keys{if $vpsid}&vpsid={$vpsid}{/if}&do=generate" id="genKeys">Generate new keys</a>
        </div>
        <div class="clear"></div>
    {/if}
</div>
{include file="`$cloudstackdir`footer.cloud.tpl"}
<div class="modal hide fade" id="regKeysModal">
    <form action="{$service_url}&vpsdo=keys{if $vpsid}&vpsid={$vpsid}{/if}&do=register" method="POST" style="margin: 0">
        <div class="modal-header">
            <button type="button" class="close hide-modal" aria-hidden="true">×</button>
            <h2 id="myModalLabel">Register existing public key</h2>
        </div>

        <div class="modal-body">
            <p class="description fs11" id="descDomainFwder">
                You must have the private SSH key of the key pair (and passphrase, if it has one).
            </p>
            <div class="control-group">
                <label><strong>Key name</strong></label>
                <input type="text" name="name"/>
            </div>
            <div class="control-group">
                <label><strong>Public Key</strong></label>
                <textarea name="pubkey" style="width: 100%; height: 200px; box-sizing: border-box;"></textarea>
            </div>
        </div> 
        <div class="modal-footer">
            <span class="pull-right">
                <button type="submit" class="default btn btn-flat-primary btn-primary">Add key</button>
                <button type="button" class="default btn hide-modal">Cancel</button>
            </span>
        </div>
        {securitytoken}
    </form>
</div>
<div class="modal hide fade" id="genKeysModal">
    <form action="{$service_url}&vpsdo=keys{if $vpsid}&vpsid={$vpsid}{/if}&do=generate" method="POST" style="margin: 0">
        <div class="modal-header">
            <button type="button" class="close hide-modal" aria-hidden="true">×</button>
            <h2 id="myModalLabel">Generate new SSH Key pair</h2>
        </div>

        <div class="modal-body">
            <p class="description fs11" id="descDomainFwder">
                Provide your name below, generated key will be provided on another page.
            </p>
            <div class="control-group">
                <label><strong>Key name</strong></label>
                <input type="text" name="name"/>
            </div>
        </div> 
        <div class="modal-footer">
            <span class="pull-right">
                <button type="submit" class="default btn btn-flat-primary btn-primary">Add key</button>
                <button type="button" class="default btn hide-modal">Cancel</button>
            </span>
        </div>
        {securitytoken}
    </form>
</div>
<script type="text/javascript">
    {literal}
        $(function() {
            $('#regKeys, #genKeys').click(function(e) {
                e.preventDefault();
                var self = $(this),
                    edit = $('#' + self.attr('id') + 'Modal').clone(true);

                edit.find('.hide-modal').click(function() {
                    edit.modal('hide');
                });
                edit.on('hidden', function() {
                    edit.remove();
                });
                edit.find(".vtip_description").data('tooltip', '');

                edit.on('shown', function() {
                    edit.find(".vtip_description").tooltip();
                });
                edit.modal({
                    show: true,
                })
            })

        })
    {/literal}
</script>
