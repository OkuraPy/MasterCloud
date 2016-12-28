
{if $enableFeatures.netstat!='off'}
    <!-- Server Status -->
    <div class="spacing">
        <h3><i class="icon-s-status"></i> {$lang.netstat|capitalize}</h3>
        <p>{$lang.showscurrentstatusyourservers}</p>

        <div class="server-status">
            <div class="padding" id="netstat_update">
                {include file="ajax.netstat.tpl"}
            </div>
        </div>
    </div>
{/if}