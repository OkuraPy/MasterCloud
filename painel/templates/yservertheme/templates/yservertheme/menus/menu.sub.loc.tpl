<!-- Breadcrumbs -->
{if $inside || !(($action == 'services' && $service) || ($action == 'domains' && $details) || ($cmd=='clientarea' && $action=='default')) }
<ul class="container-breadcrumb {$action} {if $inside}inside-breadcrumb{/if}">
    <li>
        <i class="icon-home"></i><span class="divider">/</span>
    </li>
    {if $logged=='1' && !($cmd == 'clientarea' && $action == 'default')}
        <li>
            <a href="{$ca_url}">{$lang.dashboard}</a><span class="divider">/</span>
        </li>
    {/if}
    {if $cmd == 'clientarea' && $action == 'default'}
        <li class="active">
            {$lang.dashboard}
        </li>
    {elseif $cmd == 'cart'}
        {if $step!=5 && $step>0}
            <li>
                <a href="{$ca_url}cart/">{$lang.order}</a>
                <span class="divider">/</span>
            </li>
            {if $step>2 && (!$cart_contents[2] || $cart_contents[2][0].action == 'hostname')}
                {assign var='pclass' value='asw3'}
            {elseif $step==1 || ($cart_contents[2] && $cart_contents[2][0].action!='own')} 
                {assign var='pclass' value='asw5'}
            {elseif $step>1 && $cart_contents[2][0].action=='own'} 
                {assign var='pclass' value='asw4'}
            {/if}

            {if $pclass!='asw3'}		
                <li {if $step<2}class="active"{/if}>			
                    {if $step<=1}{$lang.mydomains}
                    {else}<a href="{$ca_url}cart/&step=1">{$lang.mydomains}</a>
                    {/if}
                    <span class="divider">/</span>
                </li>
            {elseif $pclass=='asw3'}
                <li {if $step<2}class="active"{/if}>		
                    {if $step<=3}{$lang.productconfig}
                    {else}<a href="{$ca_url}cart/&step=3">{$lang.productconfig}</a>
                    {/if}
                    <span class="divider">/</span>
                </li>
            {/if}

            {if $pclass=='asw5'}	
                <li {if $step==2}class="active"{/if}>				
                    {if $step<=2}{$lang.productconfig2}
                    {else}<a href="{$ca_url}cart/&step=2">{$lang.productconfig2}</a>
                    {/if}
                    <span class="divider">/</span>
                </li>
            {elseif $pclass=='asw4'}			
                <li {if $step==3}class="active"{/if}>				
                    {if $step<=3}{$lang.productconfig}
                    {else}<a href="{$ca_url}cart/&step=3">{$lang.productconfig}</a>
                    {/if}
                    <span class="divider">/</span>
                </li>						
            {/if}

            {if $pclass=='asw5'}	
                <li {if $step==3}class="active"{/if}>				
                    {if $step<=3}{$lang.productconfig}
                    {else}<a href="{$ca_url}cart/&step=3">{$lang.productconfig}</a>
                    {/if}
                    <span class="divider">/</span>
                </li>						
            {/if}
            <li {if $step==4}class="active"{/if}>
                {if $step<=4}{$lang.ordersummary}
                {else}<a href="{$ca_url}cart/&step=4">{$lang.ordersummary}</a>
                {/if}
                <span class="divider">/</span>
            </li>
            <li>
                {$lang.checkout}
            </li>
        {else}
            <li class="active">
                {$lang.order}
            </li>
        {/if}

    {elseif $cmd == 'clientarea' && ( $action == 'service' || $action == 'services' || $action == 'domains')}
        <li>
            <a href="{$ca_url}clientarea/">{$lang.clientarea}</a>
            <span class="divider">/</span>
        </li>
    {elseif $cmd == 'clientarea' && !( $action == 'service' || $action == 'services' || $action == 'domains' || $action == 'cancel') && $action != 'default'}
        <li>
            <a href="{$ca_url}clientarea/">{$lang.account}</a>
            <span class="divider">/</span>
        </li>
    {elseif $cmd == 'support' || $cmd == 'tickets' || $cmd == 'downloads' || $cmd == 'knowledgebase'} 
        <li {if $cmd == 'support'}class="active"{/if}>
            {if $cmd != 'support'}
                <a href="{$ca_url}support/">{$lang.support}</a>
                <span class="divider">/</span>
            {else}
                {$lang.support}
            {/if}
        </li>
    {elseif $cmd == 'netstat'}
        <li>
            <a href="{$ca_url}support/">{$lang.support}</a>
        </li>
        <li class="active">
            {$lang.netstat}
        </li>
    {elseif $cmd == 'profiles'}
        <li>
            <a href="{$ca_url}clientarea/">{$lang.account}</a>
            <span class="divider">/</span>
        </li>
        <li {if $action!='add' && $action!='edit'}class="active"{/if}>
            {if $action!='add' && $action!='edit'}
                {$lang.profiles}
            {else}
                <a href="{$ca_url}{$cmd}/">{$lang.profiles}</a>
            {/if}
        </li>
    {elseif $cmd == 'affiliates'}
        <li{if $action == 'default'} class="active"{/if}>
            {if $action != 'default'}
                <a href="{$ca_url}affiliates/">{$lang.affiliates}</a>
                <span class="divider">/</span>
            {else}
                {$lang.affiliates}
            {/if}
        </li>
    {else}
        <li class="active">
            {if $pagetitle}{$pagetitle}
            {elseif $lang.$cmd}{$lang.$cmd}
            {else}{$cmd}
            {/if}
        </li>
    {/if}

    {if $cmd == 'clientarea' && ( $action == 'service' || $action == 'services' || $action == 'domains')}
        {if $action == 'service' || $action == 'services'}
            {foreach from=$offer item=o}
                {if $cid==$o.id || $service.category_id==$o.id}
                    <li {if !$service}class="active"{/if}>
                        {if $service}
                            <a href="{$ca_url}clientarea/services/{$o.slug}/"  >{$o.name}</a>
                            <span class="divider">/</span>
                        {else}{$o.name}
                        {/if}
                    </li>
                    {break}
                {/if}
            {/foreach}
            {if $service}
                <li {if !$widget && !$domain.domain}class="active"{/if}>
                    {if $widget || $domain.domain}
                        <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}"  >{$service.name}</a>
                        <span class="divider">/</span>
                    {else}{$service.name}
                    {/if}
                </li>
            {/if}
            {if $domain.domain}
                <li class="active">
                    {$domain.domain}
                </li>
            {/if}
        {else}
            <li {if !$details && !$widget}class="active"{/if}>
                {if $details || $widget}
                    <a href="{$ca_url}clientarea/domains/"  >{$lang.domains}</a>
                    <span class="divider">/</span>
                {else}{$lang.domains}
                {/if}
            </li>
            {if $details}
                <li {if !$widget}class="active"{/if}>
                    {if $widget}
                        <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}"  >{$details.name}</a>
                        <span class="divider">/</span>
                    {else}{$details.name}
                    {/if}
                </li>
            {/if}
        {/if}

        {if $widget}
            <li class="active">
                {if $lang[$widget.name]}{$lang[$widget.name]}
                {elseif $widget.fullname}{$widget.fullname}
                {else}{$widget.name}
                {/if}
            </li>
        {/if}
    {elseif $cmd == 'clientarea' && !( $action == 'service' || $action == 'services' || $action == 'domains' || $action == 'cancel') && $action != 'default'}
        {if $action=='emails' && $email}
            <li>
                <a href="{$ca_url}clientarea/{$lang.$action}/">{$lang.$action}</a>
            </li>
            <li class="active">
                {$email.subject|strip|truncate}
            </li>
        {elseif $action=='history' }
            <li class="active">
                {$lang.myhistory}
            </li>
        {elseif $action=='profilepassword' }
            <li class="active">
                {$lang.changepass}
            </li>
        {elseif $action!='default' && $lang.$action}
            <li class="active">
                {$lang.$action}
            </li>
        {else}
            <li class="active">
                {$lang.page}
            </li>
        {/if}
    {elseif $cmd == 'tickets' || $cmd == 'downloads' || $cmd == 'knowledgebase'} 
        {if $lang.$cmd}
            <li {if $action=='default' }class="active"{/if}>
                {if $action!='default'}
                    <a href="{$ca_url}{$cmd}/" >{$lang.$cmd}</a>
                    <span class="divider">/</span>
                {else}{$lang.$cmd}
                {/if}
            </li>
        {/if}

        {if $cmd == 'knowledgebase'}
            {if $action!='default' && $lang.$action && !$path}
                <li class="active">
                    {$lang.$action}
                </li>
            {/if}

            {foreach from=$path item=p name=kbloc}
                <li {if $smarty.foreach.kbloc.last && !$article}class="active"{/if}>
                    {if !$smarty.foreach.kbloc.last || $article}
                        <a href="{$ca_url}knowledgebase/category/{$p.id}/{$p.slug}/">{$p.name}</a> 
                        <span class="divider">/</span>
                    {else}
                        {$p.name}
                    {/if}
                </li>
            {/foreach}

            {if $article}
                <li class="active">
                    {$article.title|truncate:30}
                </li>
            {/if}
        {elseif $cmd == 'downloads'}
            {if $category}
                <li class="active">
                    {$category.name}
                </li>
            {/if}
        {else}
            {if $action =='new'}
                <li class="active">
                    {$lang.openticket}
                </li>
            {elseif $action=='view'}
                <li class="active">
                    {$ticket.subject}
                </li>
            {elseif $action!='default' && $lang.$action}
                <li class="active">
                    {$lang.$action}
                </li>
            {/if}
        {/if}

    {elseif $cmd == 'affiliates'}
        {if $action=='commissions'}
            <li class="active">
                {$lang.mycommissions}
            </li>
        {elseif $action!='default' && $lang.$action}
            <li class="active">
                {$lang.$action}
            </li>
        {/if}
    {elseif $cmd == 'profiles'}
        {if $action=='add'}
            <li class="active">
                {$lang.addnewprofile}
            </li>
        {elseif $action=='edit'}
            <li class="active">
                {$lang.editcontact}
            </li>
        {/if}
    {/if}

</ul>
{/if}
<!-- End of Breadcrumbs -->