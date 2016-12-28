{*

Security/IP access settings

*}
<div class="spacing">
    <div class="shared-hosting-example">
        {include file="clientarea/leftnavigation.tpl"}

        <div class="sh-container">
            <p>{$lang.currentipadd} {$yourip}</p>
            <h4>{$lang.ipaccess}</h4>
            <div class="account-info-container mt-15">
                <div class="clearfix">
                    <form method="post" action="">
                        <input type="hidden" name="make" value="addrule" />
                        <div class="well">
                            <div class="pull-right mt-20">
                                <button type="submit" class="btn btn-primary"><i class="icon icon-Shield"></i> {$lang.addipsubnet}</button>
                            </div>
                            <div class="well-info">
                                <span class="row">
                                    {$lang.ipsubnet}
                                    <input  name="rule" type="text" class="span4" placeholder="eg.  {$yourip}">
                                </span>
                            </div>
                        </div>
                        {securitytoken}
                    </form>
                </div>

                <!-- Table -->
                <div class="table-box">
                    <div class="table-header">
                        <p>{$lang.ipsubnet}</p>
                    </div>
                    <table class="table">
                        {foreach from=$rules item=rule name=rules}
                            <tr><td>
                                    {if $rule.rule == 'all'}
                                        {$lang.allaccess} - 
                                    {else}
                                        {$rule.rule} - 
                                    {/if}
                                    <a class="deleteico" href="{$ca_url}{$cmd}/{$action}/&make=delrule&id={$rule.id}">{$lang.delete}</a>
                                </td></tr>
                            {foreachelse}
                            <tr><td>{$lang.norules} - {$lang.allaccess}</td></tr>
                        {/foreach}
                    </table>
                </div>
                <!-- End of Table -->

                <div class="separator-line"></div>

                <ul class="rules-list">
                    <li class="header-list"><strong>{$lang.ruleformat}:</strong></li>
                    <li><strong>all</strong> - {$lang.keywordmatchingall}</li>
                    <li><strong>xxx.xxx.xxx.xxx</strong> - {$lang.singleiprule}</li>
                    <li><strong>xxx.xxx.xxx.xxx/M</strong> - {$lang.ipmaskrule}</li>
                    <li><strong>xxx.xxx.xxx.xxx/mmm.mmm.mmm.mmm</strong></li>
                    <li>{$lang.ipmaskruledoted}</li>
                </ul>

                <ul class="rules-list rules-m">
                    <li class="header-list"><strong>{$lang.examplerules}:</strong></li>
                    <li>{$lang.ruleexample1}</li>
                    <li>{$lang.ruleexample2}</li>
                </ul>
            </div>
        </div>
    </div>   
</div>

