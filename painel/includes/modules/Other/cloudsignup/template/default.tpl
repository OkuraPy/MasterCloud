<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="{$system_url}" />
    <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <script type="text/javascript" src="templates/nextgen_clean/js/jquery.js"></script>
    <script type="text/javascript" src="{$moduleurl}js/jquery.pnotify.min.js"></script>
    <link rel="stylesheet" type="text/css" href="{$moduleurl}css/jquery.pnotify.default.css" media="screen" />
    
    <!-- Forms stylesheet -->
    <link rel="stylesheet" type="text/css" href="{$moduleurl}css/slick_lf.css" media="screen" />

    <!-- / Forms stylesheet -->
    <link rel="stylesheet" type="text/css" href="{$moduleurl}demo/demo.css" media="screen" />

    {literal}<style>
        #slick p.small {
            color: #bbb;
            font-size: 10px;
        }
    #page-2 {
        margin-top:100px;
    }
    </style> {/literal}
    <script type="text/javascript">
        var infos = [], errors=[];
        {if $error}
            {foreach from=$error item=blad}errors.push('{$blad|escape:'javascript'}');
            {/foreach}
        {/if}                
        {if $info}
            {foreach from=$info item=infos}infos.push('{$infos|escape:'javascript'}');
            {/foreach}
        {/if}
        {literal}
        $(function(){
            pnotify(infos,'info');
            pnotify(errors,'error');
        });
        function pnotify(list, type){
            for(var i in list)
                $.pnotify({
                    text: list[i],
                    type: type,
                    hide: false,
                    sticker: false,
                    icon: false
                });
        }

        {/literal}
    </script>
    {userheader}
</head>
<body>
<div id="page-2">



    <section id="slick">
        <!-- Social buttons -->
        <div class="sb">
            <a href="{$system_url}" class="tw entypo-back"><span class="slick-tip right">{$business_name}</span></a>
        </div>
        <!-- Login form -->
        <div class="login-form">
            <!-- Title -->
            <div class="title">Create your {$business_name} account</div>
            <!-- Intro text -->
            <p class="intro"></p>
            <!-- Form fields -->
            
            {if $errors}
            {/if}
            
            <form action="" name="login" id="login" method="post">
                <!-- Username input -->
                <div class="field">
                    <input name="username" placeholder="{$lang.email}" type="email" id="username" required />
                    <span class="entypo-mail icon"></span>
                    <span class="slick-tip left">{$lang.email}</span>
                </div>
                <!-- Password input -->
                <div class="field">
                    <input name="password" placeholder="{$lang.password}" type="password" id="password" required />
                    <span class="entypo-lock icon"></span>
                    <span class="slick-tip left">{$lang.password}</span>
                </div>
                <div class="clrfx mt-10"></div>
                <!-- Signed in button -->
                <div class="w-47 mt-10">

                    {if $tos}
                        <p class="small"><span class="entypo-checkmark"></span> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a></p>
                    {/if}
                </div>
                <!-- Send button -->
                <input type="submit" value="{$lang.signup}" class="send" form="login" name="send" />
                {securitytoken}
                <input type="hidden" name="make" value="submit" />

                <p class="intro" style="margin:0px;"><a href="?cmd=login"><b>{$lang.returningcustomerq}</b></a></p>
            </form>
            <!-- / Form fields -->
        </div>
        <!-- / Login form -->
    </section>


</div>
</body>
</html>