{if $enableFeatures.kb!='off' || $enableFeatures.downloads!='off'}
    <div class="spacing">
        <h3>
            {if $enableFeatures.kb!='off' && $enableFeatures.downloads!='off'}
                {$lang.knowledgebase} & {$lang.downloads}
            {elseif $enableFeatures.downloads!='off'}
                {$lang.downloads}
            {else}
                {$lang.knowledgebase}
            {/if}
        </h3>
        <p>
            {if $enableFeatures.kb!='off' && $enableFeatures.downloads!='off'}
                {$lang.knowledgebase_desc} {$lang.downloads_desc}
            {elseif $enableFeatures.downloads!='off'}
                {$lang.downloads_desc}
            {else}
                {$lang.kbwelcome}
            {/if}

        </p>

        <div class="bottom-border-nav">
            <ul class="nav nav-pills ">
                {if $enableFeatures.kb!='off'}
                    <li class="active"><a href="#tab1" data-toggle="tab">{$lang.knowledgebase}</a></li>
                    {/if}
                    {if $enableFeatures.downloads!='off'}
                    <li><a href="#tab2" data-toggle="tab">{$lang.downloads}</a></li>
                    {/if}
            </ul>
        </div>
        <div class="tab-content support-tab no-p ">
            {if $enableFeatures.kb!='off'}
                <!-- Tab #1 -->
                <div class="tab-pane active" id="tab1">
                    <div class="pull-right">
                        <a href="{$ca_url}knowledgebase/" class="btn btn-primary">{$lang.more} <i class="icon-chevron-right"></i></a>
                    </div>
                    <h5>{$lang.popularcategories}</h5>
                    <ul class="support-nav">
                        {foreach from=$topkb item=kb}
                            <li><a href="{$ca_url}knowledgebase/category/{$kb.id}/">{$kb.name}</a></li>
                            {foreachelse}
                            <li>{$lang.nothing}</li>
                            {/foreach}
                    </ul>
                </div>
                <!-- End of Tab #1 -->
            {/if}
            {if $enableFeatures.downloads!='off'}
                <!-- Tab #2 -->
                <div class="tab-pane" id="tab2">
                    <div class="pull-right support-nav-back">
                        <a href="{$ca_url}downloads/" class="btn btn-primary">{$lang.more} <i class="icon-chevron-right"></i></a>
                    </div>
                    <h5>{$lang.popular_down}</h5>

                    <ul class="support-nav">
                        {foreach from=$topdw item=kb}
                            <li>
                                <a href="{$ca_url}downloads/category/{$kb.id}/">
                                    {$kb.name} <span>{$kb.size}</span>
                                </a>
                            </li>
                        {foreachelse}
                            <li>
                                {$lang.nothing}
                            </li>
                        {/foreach}
                    </ul>
                </div>
                <!-- End of Tab #2 -->
            {/if}
        </div>
    </div>

{/if}

<!-- Support Tickets -->
<div class="spacing">
    <h3> {$lang.tickets} </h3>
    <p>{$lang.ticketsfromehere}</p>

    <div class="bottom-border-nav">
        <ul class="nav nav-pills ">
            <li class="active"><a href="#all">{$lang.all}</a></li>
            <li><a href="#open" >{$lang.Open}</a></li>
            <li><a href="#unanswered" >{$lang.unanswered}</a></li>
            <li><a href="{$ca_url}tickets/new/" class="color-sky-blue"> <i class="icon-pencil"></i> {$lang.createnew}</a></li>
        </ul>
        <a href="{$ca_url}tickets/" id="currentlist" style="display:none" updater="#updater"></a>
        <input type="hidden" id="currentpage" value="0" />
        <table class="table table-striped table-spacing tickets-table">
            <thead>
                <tr>
                    <th style="width: 12%"> {$lang.status}</th>
                    <th style="width: 45%">{$lang.subject}</th>
                    <th>{$lang.department}</a></th>
                    <th>{$lang.date}</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$openedtickets item=ticket name=foo}
                    <tr>
                        <td>
                            <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" class="roll-link">
                                <i class="icon-circle-blank ticket-icon ticket-icon-{$ticket.status}"></i>
                                <span data-title="{$ticket.subject|escape:'html':'utf-8'}">{$ticket.subject|escape:'html':'utf-8'}</span>
                            </a>
                        </td>
                        <td class="bold overflow-elipsis">
                            <span class="label label-{$ticket.status}">{$lang[$ticket.status]}</span>
                        </td>
                        <td>{$ticket.deptname}</td>
                        <td>{$ticket.date|dateformat:$date_format}</td>
                        <td>
                            <div class="td-rel">
                                <div class="right-row-side"></div>
                            </div>
                            <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" class="icon-link"><i class="icon-single-arrow"></i></a>
                        </td>
                    </tr>
                {foreachelse}
                    <tr>
                        <td colspan="3">{$lang.nothing}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

<!-- End of Support Tickets -->

{if $enableFeatures.netstat!='off'}
    <!-- Server Status -->
    {include file="netstat.tpl"}
    <script type="text/javascript">ajax_update('{$ca_url}netstat/', null, '#netstat_update');</script>
    <!-- End of Server Status -->
{/if}