{if 'config:ShopingCartMode'|checkcondition}
    {if $logged=='1' || $shoppingcart}
    <li>
    <a href="{$ca_url}cart/" {if $shoppingcart}data-placement="bottom" data-toggle="popover"  id="cartpop" class="cart-popover"{/if}>
        <i class="icon-shopping-cart"></i> 
        {if $shoppingcart}
            {clientstats type="cart" tpl="<span>%d<span>"}
        {/if}
    </a>
    {if $shoppingcart}   
        <div style="display: none">
            <h4>{$lang.itemsyourcart}</h4>
            <ul>
                {foreach from=$shoppingcart item=order key=k}
                    {if $order.product}
                        <li>

                            <span class="pull-right">{$order.total.total|price:$currency}</span>
                            <span class="pre-roll">
                                <a class="roll-link" href="{$ca_url}cart&cart=edit&order={$k}">
                                    <span data-title="{$order.product.category_name} - {$order.product.name}
                                          {if $order.product.domain}({$order.product.domain})
                                          {/if}">

                                        {$order.product.category_name} - {$order.product.name}
                                        {if $order.product.domain}({$order.product.domain})
                                        {/if}
                                    </span>
                                </a> 
                            </span>
                        </li>           
                    {elseif $order.domains }
                        {foreach from=$order.domains item=domenka key=kk}
                            <li>
                                <span class="pull-right">{$domenka.price|price:$currency}</span>
                                <span class="pre-roll">
                                    <a class="roll-link" href="{$ca_url}cart&cart=edit&order={$k}">
                                        <span data-title="
                                              {if $domenka.action=='register'}{$lang.domainregister}
                                              {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                                              {elseif $domenka.action=='renew'}{$lang.domainrenewal}
                                              {/if}
                                              - {$domenka.name} - {$domenka.period} {$lang.years}">

                                            {if $domenka.action=='register'}{$lang.domainregister}
                                            {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                                            {elseif $domenka.action=='renew'}{$lang.domainrenewal}
                                            {/if}
                                            - {$domenka.name} - {$domenka.period} {$lang.years}
                                        </span>
                                    </a> 
                                </span>
                            </li>           
                        {/foreach}
                    {/if}
                {/foreach}

            </ul>
        </div>
    {/if}
    {literal}
        <script type="text/javascript">
            $(function(){
                $('#cartpop').popover({
                    html: true, 
                    rigger: 'manual',
                    content: function() {
                        var data = $(this).next(),
                        list = data.find('li'),
                        margin =0;
                
                        list.children('span:first-child').each(function(){
                            var w = $('<span></span>').text($(this).text()).css({position:'absolute',visibility:'hidden', top:0}).appendTo('body'),
                                width = w.width() + 10;
                            w.remove();
                            margin = margin > width ? margin : width;
                        })
                        list.children('span:last-child').css('margin-right', margin);
                        return data.html();
                    },
                }).bind('shown',function(){
                    var tip = $(this).data('popover').tip(),
                        actualWidth = tip.outerWidth(),
                        contener = $('section'),
                        offset = tip.offset();
                
                    if((contener.offset().left + contener.width()) - 20 < offset.left+actualWidth){
                        var left = (contener.offset().left + contener.width()) -20 - actualWidth;
                        tip.find(".arrow").css('left', (actualWidth/2) + offset.left-left) 
                        offset.left = left;
                        tip.offset(offset)
                    }
                }).bind('mouseleave mouseenter', function(e){
                    var tip = $(this).data('popover').tip(),
                        timeout = false,
                        that = $(this),
                        hide = function(){
                            clearTimeout(timeout);
                            timeout = setTimeout(function(){
                                that.popover('hide');
                            },200)
                        },show= function(){
                            clearTimeout(timeout);
                            timeout = false;
                            if(!tip.is(':visible')){
                                that.popover('show');
                            }
                        }
                    that.data('popover').tip().bind('mouseleave mouseenter',function(e){
                        if(e.type == 'mouseleave') hide(); else show();
                    });
                    if(e.type == 'mouseleave') hide(); else show();
                });
 
            });
        </script>
    {/literal}
</li>
{/if}
{/if}