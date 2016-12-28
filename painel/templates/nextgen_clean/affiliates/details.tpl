<div class="bordered-section article">
    <h2 {if !$payout}class="bbottom"{/if}>{$lang.affiliate}</h2>


    {if $payout}


        <div class="ribbon form-horizontal">

            <div class="control-group">
                <label for="appendedPrependedInput" class="control-label left" style="width:auto">{$lang.withdrawinfo}</label>
                <div class="right">
                    <a href="{$ca_url}tickets/new/" class="btn btn-success btn-large"><i class="icon-ok-sign icon-white"></i> {$lang.payout}</a>
                </div>
            </div>

        </div>
        <div class="ribbon-shadow-l"></div>
        <div class="ribbon-shadow-r"></div>
    {/if}
    <div class="p19"><h3>{$lang.Statistics}</h3></div>

    <table width="100%" border=0 class="table table-striped fullscreen" cellspacing="0">

        <tbody>
            <tr>
                <td align="right" width="160">{$lang.Commissions}:</td>
                <td ><strong>{$stats.monthly_commision}</strong> / <strong>{$stats.total_commision}</strong> ({$lang.thismonth} / {$lang.total})</td>
            </tr>
            <tr class="even">
                <td align="right">{$lang.referred}</td>
                <td >{$stats.monthly_visits} / {$stats.total_visits} ({$lang.thismonth} / {$lang.total})</td>
            </tr>
            <tr >
                <td align="right">{$lang.singupreferred}</td>
                <td >{$stats.monthly_singups} / {$stats.total_singups} ({$lang.thismonth} / {$lang.total})</td>
            </tr>
            <tr class="even">
                <td align="right">{$lang.curbalance}</td>
                <td >{$affiliate.balance|price:$affiliate.currency_id}</td>
            </tr>
        </tbody>
    </table>
    <div class="p19"><h3>{$lang.options}</h3></div>
    <table width="100%" border=0 class="table table-striped fullscreen form-horizontal options" cellspacing="0">
        <tbody>
            <tr>
                <td align="right">{$lang.emailoncemonth}:</td>
                <td >
                    <input type="radio" value="1" name="sendreport" {if $affiliate.sendreport}checked="checked"{/if}/> {$lang.enable} &nbsp; &nbsp;
                    <input type="radio" value="0" name="sendreport" {if !$affiliate.sendreport}checked="checked"{/if}/> {$lang.disable}
                </td>
            </tr>
            {if $autopay}
                <tr >
                    <td align="right">{$lang.receivecommissionsauto}</td>
                    <td >
                        <select name="withdraw_method">
                            <option {if $affiliate.withdraw_method==0}selected="selected"{/if} value="0">{$lang.disable}</option>
                            {foreach from=$autopay item=value key=name}
                                <option {if $affiliate.withdraw_method==$value}selected="selected"{/if} value="{$value}">{$lang[$name]}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
            {/if}
            <tr>
                <td>{$lang.landingpage}<a href="#" class="vtip_description" title="{$lang.landurldescr}" ></a></td>
                <td><a href="{$landingpage}" data-toggle="modal" data-target="#landinglink" data-remote="false" style="font-weight:bold">{$landingpage}</a></td>
            </tr>
        </tbody>
    </table>
</div>
<!-- Modal -->
<form method="POST" action="{$ca_url}affiliates/" class="form-horizontal">
    <div id="landinglink" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="refModal" aria-hidden="true">

        <div class="modal-header">
            <h3 id="refModal">{$lang.landingpage}</h3>
        </div>
        <div class="modal-body">
            <label class="control-group">
                <p>{$lang.enternewlandingurl}</p>
                <input type="text" name="landingurl" placeholder="{$landingpage}" class="span5" id="lpi">
            </label>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">{$lang.close}</button>
            <button class="btn btn-primary" id="lpi_s">{$lang.savechanges}</button>
        </div>

        {literal}
            <script type="text/javascript">
                $('#lpi').bind('keyup change input', function () {
                    var t = $(this),
                        v = t.val(),
                        b = $('#lpi_s');
                    if (v.length && !v.match(new RegExp("^https?://" + window.location.hostname.replace(/\./g, '\\.') + "/", 'i'))) {
                        t.parent().addClass('error');
                        b.prop('disabled', true);
                    } else {
                        t.parent().removeClass('error');
                        b.prop('disabled', false);
                    }
                });
                $('.options').on('change', 'input, select, textarea', function () {
                    var self = $(this),
                        inp = self.parents('tr').eq(0).find('input, select, textarea');
                    inp.prop('disabled', true)
                    $.post(window.location.href, {
                        make: 'options',
                        name: self.attr('name'),
                        value: self.val()
                    }, function (data) {
                        parse_response(data);
                        inp.prop('disabled', false)
                    })
                })
            </script>
        {/literal}
    </div>
</form>
<div class="divider"></div>
{if $integration_code!=''}
    <div class="row">
        <div class="span6">
            <h3>{$lang.intcodes}</h3>
            <pre class="prettyprint linenums">{$integration_code|escape}</pre>
        </div>
        <div class="span6">


            <h3>{$lang.preview}</h3>
            {$integration_code}
        </div>
        <div class="clear"></div>
    </div>

{/if}