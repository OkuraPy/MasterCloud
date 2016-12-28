<table class="data-table backups-list"  width="100%" cellspacing=0>
    <thead>
        <tr>
            <td>{$lang.backupevery}</td>
            <td>{$lang.timezone}</td>
            <td>{$lang.nextbackup}</td>
            <td>{$lang.maxsnapshots}</td>
            <td width="120"></td>
        </tr>
    </thead>
    {foreach item=schedule from=$schedules key=id}
        <tr>
            <td align="right">{$schedule.duration}
                {if $schedule.interval=='WEEKLY'}
                    {$lang.yweek|capitalize}
                {elseif $schedule.interval=='DAILY'}
                    {$lang.yday|capitalize}
                {elseif $schedule.interval=='MONTHLY'}
                    {$lang.ymonth|capitalize}
                {elseif $schedule.interval=='HOURLY'}
                    {$lang.yhour}
                {/if}
            </td>
            <td>
                {$schedule.timezone}
            </td>
            <td>
                {$schedule.start_at|dateformat:$date_format}
            </td>
            <td>
                {$schedule.max}
            </td>
            <td>
                <a title="{$lang.delete}" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vmsnapshotschedule&vpsid={$vpsid}&schedule_id={$schedule.id}&make=deleteschedule&security_token={$security_token}" 
                   onclick="return confirm('{$lang.suretodeleteschedule}');" class="small_control small_delete fs11" >
                    {$lang.delete}
                </a>
            </td>
        </tr>
    {foreachelse}
        <tr>
            <td colspan="5">{$lang.nothing}</td>
        </tr>
    {/foreach}
</table>
<div class="btn-group-cloud">
    <input type="button" value="{$lang.newschedule}" onclick="$('#addschedule').show();
            return false" class="blue">

</div>
<div id='addschedule' style="display:none;">
    <form action="" method="post" id>
        <input type="hidden" name="make" value="addschedule"/>

        <br/><h3 class="summarize"> {$lang.addschedule} </h3>
        <table class="data-table backups-list"  cellspacing="0" style="width: 100%">

            <thead>
                <tr>
                    <th colspan="6">
                        <b>{$lang.backupevery}</b>
                    </th>
                </tr>
            </thead>
            <tr>
                <td class="nowrap">
                    <b>{$lang.time}</b><br />
                    <select id="hour" name="hour" class="styled period monthly weekly daily span1"></select>
                    <select id="min" name="min" class="styled span1"></select>
                </td>
                <td>
                    <span class="period monthly weekly">
                        <b>
                            <span class="period monthly">{$lang.daymonth}</span>
                            <span class="period weekly">{$lang.dayweek}</span>
                        </b><br />
                        <select id="day" name="day" class="styled period monthly weekly span1" ></select>
                    </span>
                </td>
                <td><br />
                    <select name="period" id="period" class="styled span2">
                        <option value="HOURLY" >{$lang.yhour}</option>
                        <option value="DAILY">{$lang.yday|capitalize}</option>
                        <option value="WEEKLY">{$lang.yweek|capitalize}</option>
                        <option value="MONTHLY" >{$lang.ymonth|capitalize}</option>
                    </select>
                </td>
                <td>
                    <b>{$lang.timezone}</b><br />
                    <select name="timezone" class="styled span3">
                        {foreach from=$timezones item=name key=zone}
                            <option value="{$zone}" {if $timezone==$zone}selected="selected"{/if}>{$name}</option>
                        {/foreach}
                    </select>
                </td>
                <td>
                    <b>{$lang.snapshotkeep}</b><br />
                    <select id="maxsnap" name="maxsnapshots" class="styled span1" ></select>

                </td>
                <td align="center" valign="bottom">
                    <input type="submit" value="{$lang.submit}" class="blue" />
                </td>
            </tr>
        </table>
        {securitytoken}
    </form>
</div>
<div class="clear"></div>
{literal}
    <script type="text/javascript">
        String.prototype.lpad = function(padString, length) {
            var str = this;
            while (str.length < length)
                str = padString + str;
            return str;
        }
        function _insertOptions(el, from, to, by, nopad) {
            by = by | 1
            el.children().remove();
            while (from <= to) {

                var pv = from;
                if (!nopad)
                    pv = pv.toString().lpad('0', 2);
                el.append('<option value="' + pv + '">' + pv + '</option>');
                from += by;
            }
        }
        _insertOptions($('#hour'), 0, 24);
        _insertOptions($('#min'), 0, 58, 15);
    {/literal}
    {if $maxsnapshots}
        _insertOptions($('#maxsnap'), 1, {$maxsnapshots}, 1, true);
    {else}
        $('#maxsnap').prevAll().remove().end().remove();
    {/if}
    {literal}
        $('#period').change(function() {
            var that = $(this),
                val = that.val();
            $('.period').hide().prop('disabled', true).attr('disabled', 'disabled').filter('.' + val.toLowerCase()).show().prop('disabled', false).removeAttr('disabled');
            if (val == 'WEEKLY')
                _insertOptions($('#day'), 1, 7);
            if (val == 'MONTHLY')
                _insertOptions($('#day'), 1, 31);
        }).change();
    </script>
{/literal}