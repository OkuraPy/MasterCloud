<!DOCTYPE html>
<html>
    <head data-gwd-animation-mode="quickMode">
        <!--[if !IE]><!-->{literal}<script>if (!!window.MSStream) {
                document.documentElement.className += ' ie10';
            }</script>{/literal}<!--<![endif]-->
        <base href="{$system_url}" />
        <meta charset="utf-8">
        {ieforce}
        <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/main.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/bootstrap.min.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/bootstrap-responsive.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/font-awesome.min.css">
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/clientarea.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/jquery.pnotify.default.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/progress-buttons.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/ca11_main.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/font-awesome.css">
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/entypo.css">
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/gap-icons.css">
        
        <!--[if lt IE 7]>
        <link media="all" type="text/css" href="{$template_dir}css/font-awesome-ie7.min.css" rel="stylesheet">
        <![endif]-->

        <!--[if lt IE 9]>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/ie8.css" />
        <script type="text/javascript" src="{$template_dir}js/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
        <script type="text/javascript" src="{$template_dir}js/bootstrap.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/common.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery.cookie.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery-ui-1.8.2.custom.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery.nicescroll.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery.pnotify.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/progress-button.js"></script>
        <script type="text/javascript" src="{$template_dir}js/script.js"></script>
        <script type="text/javascript" src="{$system_url}?cmd=hbchat&amp;action=embed"></script>
        {userheader}

    </head>

    <body>
        
        <div id="page" class="{if $cmd!=cart}{unfold}{else}force-fold{/if}">
            {include file="mainmenu.tpl"}
            {include file="notifications.tpl"}
            
            <section id="main-section" class="{if $cmd!='cart'}not-cart{/if} cmd-{$cmd}" >
                <div class="container-fluid dashboard" id="ca11">
                    {include file="submenu.tpl"}
                    <div {if $cmd!='cart'}class="row-fluid"{/if} style="overflow:hidden;" id="main_row">
                        <div class="span10" id="left_content">
                            
                            {footer}
                            {if $cmd=='cart' || $cmd=="upgrade"}<div id="cart" class="cart-wrapper">{include file="../orderpages/cart.sidemenu.tpl"}<div id="cont">
                            {elseif !in_array('design11',$tpl_path)}     
                                <div class="content-wrapper" ><div  class="spacing">
                            {/if}
