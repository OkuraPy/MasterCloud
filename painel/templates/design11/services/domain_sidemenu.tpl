
<div class="span3" >
    <div>{$lang.menu}</div>
    <ul>
        {if $details.status=='Active'}
            <li {if !$widget}class="active"{/if}>
                <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/">
                    <i class="icon-sh-details"></i>
                    <span>{$lang.domdetails}</span>
                </a>
            </li>
            {foreach from=$widgets item=widg name=cst}
                {if $widg.name!='reglock' && $widg.name!='nameservers'  && $widg.name!='autorenew' }
                    {if $widg.name=='idprotection' && $details.offerprotection && !$details.offerprotection.purchased}
                        {continue}
                    {/if}

                    <li {if $widget.name==$widg.name}class="active"{/if}>
                        <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}#{$widg.name}">
                            <img src="{$system_url}{$widg.location}/small.png" alt="" />
                            <span>
                                {assign var=widg_name value="`$widg.name`_widget"}
                                {if $lang[$widg_name]}
                                    {$lang[$widg_name]}
                                {elseif $lang[$widg.name]}
                                    {$lang[$widg.name]}
                                {elseif $widg.fullname}
                                    {$widg.fullname}
                                {else}
                                    {$widg.name}
                                {/if}
                            </span>
                        </a>
                    </li>
                {/if}
            {/foreach}
            {if $custom}
                {foreach from=$custom item=btn name=cst}
                    <li>
                        <a href="#" onclick="$('#cbtn_{$btn}').click();
                                return false;">
                            <span>{$lang.$btn}</span>
                        </a> 
                    </li>
                {/foreach}
            {/if}
        {/if}
    </ul>
    {if $details.status!='Active'}
        <div class="sidebar-block">
            {if $details.status=='Pending' ||  $details.status=='Pending Registration'}
                {$lang.domainpendinginfo}
            {elseif $details.status=='Pending Transfer'}
                {$lang.domainpendingtransferinfo}
            {elseif $details.status=='Expired'}
                {$lang.domainexpiredinfo}
            {elseif $details.status=='Cancelled' ||  $details.status=='Fraud'}
                {$lang.domaincanceledinfo}
            {/if}
        </div>
    {/if}
</div><!-- /span3-->