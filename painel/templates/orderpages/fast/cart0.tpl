<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}fast/style.css" />
{foreach from=$categories item=i name=categories name=cats}
{if $i.id == $current_cat} <strong>{$i.name}</strong> {if !$smarty.foreach.cats.last}|{/if}
{else} <a href="{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a> {if !$smarty.foreach.cats.last}|{/if}
{/if}
{/foreach}
{if $logged=='1'} | {if $current_cat=='addons'}<strong>{else}<a href="{$ca_url}cart&amp;step={$step}&amp;cat_id=addons">{/if}{$lang.prodaddons}{if $current_cat=='addons'}</strong>{else}</a>{/if}{/if}
{foreach from=$categories item=i name=categories name=cats}
    {if $i.id == $current_cat && $i.description!=''}
        {$i.description}
    {/if}
{/foreach}

{if $products}
    {if count($currencies)>1}
        <form action="" method="post" id="currform">
            <p align="right">
                <input name="action" type="hidden" value="changecurr">
                {$lang.Currency} <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                    {foreach from=$currencies item=crx}
                        <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                    {/foreach}
                </select>
            </p>
        </form>
    {/if}
    
    {foreach from=$products item=i}
        <div class="product-container">
            <form name="" action="" method="post">
                <input name="action" type="hidden" value="add">
                <input name="id" type="hidden" value="{$i.id}">
                <div  class="left">
                    <h3>{$i.name}</h3>
                    {price product=$i}
                        {if $i.paytype=='Free'}<h3>{$lang.Free}</h3>
                        {elseif $i.paytype=='Once'}@@priceline @@setupline<<'+ '@
                        {else}
                            {$lang.pickcycle}<br />
                            <select name="cycle" style="margin:4px 0px;">
                                <option value="@@cycle">@@price>>' /'@ @@cyclename @@setupline<<'+ '@ @@freetld=' {$lang.freedomain}'@</option>
                            </select>
                        {/if}
                    {/price}
                    
                </div>
                <div class="left product-description">
                    <center>
                        <div style="display:inline-block">
                    {if $i.description!=''}
                        {$i.description}
                    {/if}
                        </div>
                    </center>
                </div>
                <div class="right product-actions">
                    <div class="product-price">
                    {price product=$i}
                        {if $i.paytype=='Free'}<input type="hidden" name="cycle" value="Free" /> {$lang.Free}
                        {elseif $i.paytype=='Once'}<input type="hidden" name="cycle" value="Once" />
                        {else}
                            <span @@displayhide>@@price>>' /'@ @@cyclename @@setupline<<'+ '@</span> 
                        {/if}
                    {/price}
                    </div>
                    <input type="submit" value="{$lang.ordernow}" class="padded btn btn-primary"/>
                </div>
                <div class="clear"></div>
            </form>
        </div>
    {/foreach}
{else}
    <div class="product-container">{$lang.nothing}</div>
{/if}
<script type="text/javascript" >
{literal}
    var mwidth = 0;
    $('.product-description center > div').each(function(){
        var width = $(this).width();
        if(width > mwidth){
            mwidth = width;
        }
    });
    $('.product-description center > div').width(mwidth);
    $(function(){
        $('select[name="cycle"]').change(function(){
            $('.product-price span', $(this).parents('.product-container')).hide().eq(this.selectedIndex).show();
        });
    })
{/literal}
</script>
{if $opconfig.footer}
<div class="custom-footer"> 
    <div class="right product-actions">
        <a class="btn go-to-ticket right" href="?cmd=tickets&action=new">{$lang.getintouch}!</a>
    </div>
   
    {$opconfig.footer}
    
    <div class="clear"></div>
</div>
{/if}
<div>
    
</div>
