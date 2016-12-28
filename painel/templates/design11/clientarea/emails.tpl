{*

Browse email history

*}
<div class="spacing">

    {if $email}

        <h3>{$email.subject}</h3>
        <p class="pull-up"><i class="icon-time"></i> {$email.date|dateformat:$date_format}</p>
        <div class="spacing">{$email.message|httptohref}</div>

    {else}
        <div class="account-info-container">
            <div class="pull-right">
                <div class="content-search input-append">
                    <input type="text" placeholder="{$lang.searchemails}">
                    <button type="submit" class="btn btn-primary">{$lang.Go}</button>
                </div>
            </div>
            <h4>{$lang.emhistory}</h4>
            <div class="h-description">{$lang.email_info}</div>

            <div class="table-box m20 overflow-h">
                <div class="table-header">
                </div>
                <a href="{$ca_url}clientarea&amp;action=emails" id="currentlist" style="display:none" updater="#updater"></a>
                <input type="hidden" id="currentpage" value="0" />
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="w80"><a href="{$ca_url}clientarea&amp;action=emails&amp;orderby=subject|ASC" class="sortorder"><i class="icon-sort"></i>{$lang.subject}</a></th>
                            <th><a href="{$ca_url}clientarea&amp;action=emails&amp;orderby=date|ASC"  class="sortorder"><i class="icon-sort"></i>{$lang.date_sent}</a></th>
                        </tr>
                    </thead>
                    <tbody id="updater">
                        {include file='ajax/ajax.emails.tpl'}
                    </tbody>
                </table>
            </div> 
        </div> 
        {if $totalpages > 1}
            <div class="pagination clearfix">
                <ul rel="{$totalpages}">
                    <li class="pull-left"><a href="#{$lang.previous}">{$lang.previous}</a></li>
                    <li class="pull-right"><a href="#{$lang.next}">{$lang.next}</a></li>
                </ul>
            </div>
        {/if}
    {/if}
</div>
