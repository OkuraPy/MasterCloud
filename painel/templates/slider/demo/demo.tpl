<!DOCTYPE html>
<html xml:lang="en" lang="en">
<head>
<meta charset="utf-8" />
<script src="templates/slider/jquery.js"></script>
<script src="templates/slider/hbslider.min.js"></script>
<script src="templates/slider/effects/{$settings.effect}/{$settings.effect}.js"></script>

<link rel="stylesheet" href="templates/slider/styles/{$settings.style}/{$settings.style}.css">
<link rel="stylesheet" href="templates/slider/defaults.css">
{if $effectcss}<link rel="stylesheet" href="templates/slider/effects/{$settings.effect}/{$settings.effect}.css">{/if}
<script src="templates/slider/styles/{$settings.style}/{$settings.style}.js"></script>{literal}
<style>#hbs-demo #demo_container {
    width:960px;
    height:408px;
}
#hbs-demo #demo_container {
    margin:40px auto;
}
#hbs-demo {
    background: url('templates/slider/demo/tiles1.png');
}</style>{/literal}

<title>HB Slider Preview</title>

</head>

<body id="hbs-demo">
    <div id="demo_container">

{if $slider.slides_code}
{$slider.slides_code}    {else}
<div id="hb-slider"> 
       <div >
            <img src="{$system_url}templates/slider/demo/slide_1.jpg">
            <div class="hbs-caption">
                <h2>Create beautiful Content Sliders</h2>
                <p>Using this tool you can build custom jQuery sliders FAST, no programming skills required.</p>
                <ul>
                    <li>Upload images directly into slider builder</li>
                    <li>Provide captions, choose effects, set animation details</li>
                    <li>Provide captions, choose effects, set animation details</li>
                </ul>
                <p>Just think of possibilities!</p>
                <ul>
                    <li>Create beautiful feature pages for your products</li>
                    <li>Use slider as order page to attract more customers</li>
                    <li>Slide anything! Images, html content - you name it!</li>
                </ul>

            </div>
        </div>
        <div >
            <img src="{$system_url}templates/slider/demo/slide_2.jpg">
            <div class="hbs-caption">
                <h2>Easy to use, multipurpose</h2>
                <h4>No HTML knowledge required!</h4>
                <p>Just fill in a form and get code ready to be pasted on your website</p>
                <h4>No FTP uploads required!</h4>
                <p>Code & images will be hosted in your HostBill. You want to load them from your website locally? Not a problem, get a zip file with your slider, ready to be used on your website</p>
            </div>
        </div>
         <div >
            <img src="{$system_url}templates/slider/demo/slide_3.jpg">
            <div class="hbs-caption">
                <h2>Created with passion</h2>
                <p>We've spent hours creating easy to use custom effects and styles, so you don't have to! <br/> <b>HBSlider</b> is:</p>
                <ul>
                    <li>Easy to use</li>
                    <li>Easy to extend with new transition effects</li>
                    <li>Easy to customize with own css/js styles</li>
                </ul>
            </div>
        </div>
    </div>

    {/if}
</div>
    <script>
        {literal}
        $(document).ready(function(){
            $('#hb-slider').hbslider({
        {/literal}
        {foreach from=$settings item=s key=k name=f}{$k}: {if $s=='true' || $s=='false' || is_numeric($s)}{$s}{else}"{$s}"{/if} {if !$smarty.foreach.f.last},{/if}

        {/foreach}
             

        {literal}
            });
        });

        {/literal}
    </script>
</body>
</html>