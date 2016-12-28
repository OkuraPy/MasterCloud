{*

Browse email history

*}
<article class="affiliates-container">

        {if $email}
            <div class="pull-right">
                <p>{$lang.sent} {$email.date|dateformat:$date_format}</p>
            </div>
            <h2>{$email.subject}</h2>
            <div class="p19">
                <p >{$email.message|httptohref}</p>
            </div>

        {else}
            <div class="account-info-container">
                <div class="pull-right">
                    <div class="content-search">
                        <input type="text" placeholder="{$lang.searchemails}">
                        <button type="submit" class="btn btn-flat-primary btn-small">{$lang.Go}</button>
                    </div>
                </div>
                <h4>{$lang.emhistory}</h4>
                <p>{$lang.email_info}</p>

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
                <div class="bottom-options clearfix">
                    <div class="pagination flat-ui-pagination clearfix">
                        <ul rel="{$totalpages}">
                            <li class="pull-left"><a href="#{$lang.previous}">{$lang.previous}</a></li>
                            <li class="pull-right"><a href="#{$lang.next}">{$lang.next}</a></li>
                        </ul>
                    </div>
                </div>
            {/if}
        {/if}
    </div>
</article>