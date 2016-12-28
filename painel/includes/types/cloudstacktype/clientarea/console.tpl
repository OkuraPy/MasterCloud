{if $popup}
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <base href="{$system_url}" />
            <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
            <script type="text/javascript" src="templates/default/js/jquery.js"></script>
            {literal}
                <style>
                    html {
                        height: 100%;
                    }
                    body {
                        height: 100%;
                        margin: 0;
                        background-repeat: no-repeat;
                        background-attachment: fixed;
                        background-color: #171717;
                        background-image: linear-gradient(#272727, #171717);
                        color: #333;
                        font-family: "HelveticaNeue-Light","Helvetica Neue Light","Helvetica Neue",Helvetica,Arial,"Lucida Grande",sans-serif;
                        font-size: 75%;
                        line-height: 1.5;
                    }
                    div.flash{
                        background-color: #d3b75e;
                        background-image: linear-gradient(#e8d070, #bc9f3f);
                        box-shadow: 0 0 1px 0 rgba(0, 0, 0, 0.1), 0 1px 0 #9f8c4e inset;
                        color: #fff;
                        text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
                    }
                    div.flash.error, div.flash.alert, div.flash.error-message {
                        background-color: #c93841;
                        background-image: linear-gradient(#dc3f4b, #b73137);
                        border-bottom: 1px solid #8a252a;
                        box-shadow: 0 0 1px 0 rgba(0, 0, 0, 0.1), 0 1px 0 #e44950 inset;
                    }
                    div.flash {
                        display: block;
                        font-weight: bold;
                        line-height: 21px;
                        padding: 10px 30px 10px 10px;
                        position: relative;
                    }
                    body, h1, h2, h3, h4, h5, h6, article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, blockquote, q, th, td, caption, table, div, span, object, iframe, p, pre, a, abbr, acronym, address, code, del, dfn, em, img, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, caption, tbody, tfoot, thead, tr {
                        border: 0 none;
                        font-family: inherit;
                        font-size: 100%;
                        font-style: inherit;
                        font-weight: inherit;
                        margin: 0;
                        padding: 0;
                        vertical-align: baseline;
                    }
                    body::before{
                        content: "";
                        display: block;
                        height: 30px;
                        width: 100%;
                        position: absolute;
                        top: 0px;
                        left: 0px;
                        background: #39759C;
                        z-index: -1;
                        border-bottom: 1px solid #93C0CE;
                        background-image: linear-gradient(to bottom, #a9bfd6 0px, #b0c8d8 2px, #7fa6bf 2px, #5488aa 11px, #39759c 16px, #044875 16px, #14537d 24px, #4a90aa);
                    }
                </style>
            {/literal}
            {userheader}
        </head>

        <body class="{$language|capitalize}">
            {if $consoleurl}
                <iframe src="{$consoleurl}" style="border: 0; width: 100%; height: 100%" frameborder="0"></iframe></div>
                {else}
                <div class="flash error">
                    {$lang.consoleunavailable}
                </div>
            {/if}

        </body>
    </html>
{else}
    <div class="header-bar">
        <h3 class="{$vpsdo} hasicon">{$lang.Console}</h3>
        <div class="clear"></div>
    </div>
    <div class="content-bar">
        {if $newconsole}
            {*}window.open('', 'console', 'width=700,height=500'){*}
            <center> 
                {$newconsole} 
            </center>
        {else}
            <center>
                <br /><br /><br />
                <b>{$lang.consoleunavailable}</b>
                <br /><br /><br /><br />
            </center>

        {/if}
    </div>
{/if}