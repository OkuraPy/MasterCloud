{*
@@author:: HostBill team
@@name:: Dark Bootstrap Full-screen, One-step
@@description:: Dark themed cart template that uses slider for customization in the same fashion as Bootstrap sliders order page. A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: onestep_darkboot/thumb.png
@@img:: onestep_darkboot/preview.png
*}
<!DOCTYPE html>
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html lang="en"><!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <base href="{$system_url}" />
        <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/bootstrap.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/main.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_darkboot/css/style.css">
        <link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_darkboot/css/jquery-ui-1.8.21.custom.css">
        <!--[if lt IE 9]>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/ie8.css" />
        <script type="text/javascript" src="{$template_dir}js/ie8.js"></script>
        <![endif]-->
        <script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
        <script type="text/javascript" src="{$template_dir}js/bootstrap.js"></script>
        <script type="text/javascript" src="{$orderpage_dir}onestep_darkboot/js/script.js"></script>     
        <script type="text/javascript" src='{$orderpage_dir}onestep_darkboot/js/selects.js'></script>
        <script type="text/javascript" src="{$template_dir}js/common.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery-ui-1.8.2.custom.min.js"></script>
        <script type="text/javascript" src="{$system_url}?cmd=hbchat&amp;action=embed"></script>
        
        {userheader}
    </head>
    <body class="{$language|capitalize} tpl_nextgen" >

        <header class="right">
            <div class="top-header"></div>
            <div class="top-header-border"></div>
            <div class="return-bg-box">
                <div class="return-bg-left left"></div>
                <div class="return-bg-middle left">
                    <a href="{$system_url}">{$lang.returnhome}</a>
                </div>
                <div class="return-bg-right left"></div>
            </div>
        </header>
        <div id="page" class="center">
            <div class="hosting-types clearfix">
                <h2 class="left">{$business_name}</h2>
                {if count($products) > 1}
                <div class="left">
                    <ul>
                        {foreach from=$products item=i name=loop}
                            {if $i.id == $product.id}
                                <li class="active-service">{$i.name}</li>
                            {else}
                                <li><a href="{$ca_url}cart/&id={$i.id}">{$i.name}</a></li>
                            {/if}
                        {/foreach}
                    </ul>
                </div>
                {/if}
            </div>
            
            <div id="errors" {if $error}style="display:block"{/if}>
                <div class="alert alert-error">
                    <a class="close" >&times;</a>
                    {if $error}
                    {foreach from=$error item=blad}{$blad}<br/>{/foreach}
                    {/if}                
                </div>
            </div>

            <div id="infos"  {if $info}style="display:block"{/if}>
                <div class="alert alert-info">
                    <a class="close" >&times;</a>
                    {if $info}
                    {foreach from=$info item=infos}{$infos}<br/>{/foreach}
                    {/if}
                </div>
            </div>   

            <h1 class="text-center line1">{if $opconfig.footer1}{$opconfig.footer1}{else}Best servers on the net{/if}</h1>
            <p class="text-center line2">{if $opconfig.footer2}{$opconfig.footer2}{else}Fast. One-click. Cheap. For you!{/if}</p>
            
            <div id="update">
                {include file="ajax.onestep_darkboot.tpl"}
            </div>
            <script type="text/javascript">set_cart_step(location.hash, true);</script>
            <!-- Footer -->
            <footer>
                {if $hb}<p class="text-center">Powered by <a href="#">HostBill</a></p>{/if}
                <div class="footer-line-up"></div>
                <div class="footer-line-down"></div>
                <p class="inline">© {$business_name}</p>

                <ul class="portal-links right">
                    <li><a href="#">{$lang.homepage}</a></li>
                    <li><a href="#">{$lang.order}</a></li>
                    <li><a href="#">{$lang.support}</a></li>
                    <li><a href="#">{$lang.clientarea}</a></li>
                </ul>
            </footer>
        </div>
    </body>
</html>