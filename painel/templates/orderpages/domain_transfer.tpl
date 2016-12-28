{*
@@author:: HostBill team
@@name:: Single domain transfer
@@description:: Use this template with TLDs you wish to offer transfer for.  You can also assign this orderpage to product you wish to offer domain with.
@@thumb:: images/domain_transfer_thumb.png
@@img:: images/domain_transfer_preview.png
*}
<div class="container-step1 container-transfer">
    <div class="transfer">
        <div class="kol-1" style="background: none">
            <h1 class="title06">{$lang.transfer_your_domains} {$lowestprice.price|price:$currency:true:false:false}/{if $lowestprice.period > 1}{$lowestprice.period} {$lang.peryear3}{else}{$lang.peryear2}{/if}!</h1>
            <div class="domain-in">
                <form action="" method="post" onsubmit='return check_domain(this, "#updater");'>
                    <input type="hidden" name="transfer" />
                    <input type="hidden" name="singlecheck" value="1"/>
                    <input type="hidden" name="action" value="checkdomain"/>
                    <input type="hidden" name="domain_cat" value="{$domain_cat}"/>
                    <span class="domain-in-01">www.</span>
                    <div class="domain-in-02">
                        <input type="text" name="sld" value="{if $check}{$check.sld}{else}{$lang.yourdomain}{/if}" onblur="if (this.value == '')
                                    this.value = '{$lang.yourdomain}';" onfocus="if (this.value == '{$lang.yourdomain}')
                                                this.value = '';" />
                    </div>
                    <div class="domain-in-03">
                        {foreach from=$tld item=tldname name=foo}{if (!$check.tld && $smarty.foreach.foo.first) || $check.tld==$tldname}
                                <input name="tld"  type="hidden" size="7" value="{$tldname}" />
                                <div class="mainTld">{$tldname}</div>
                        {/if}{/foreach}

                        <div class="dropbg">
                            <ul class="tldDropDown">
                                {foreach from=$tld item=tldname}
                                    <li title="{$tldname}">{$tldname}</li>
                                    {/foreach}
                            </ul>
                        </div>
                    </div>
                    <div class="button01">
                        <div>
                            <input type="submit" value="Go" />
                        </div>
                    </div>
                </form>
                {literal}
                    <script type="text/javascript">
                        (function() {
                            var show = $('.mainTld'),
                                list = $('.tldDropDown'),
                                ow = show.outerWidth(true) - show.width(),
                                width = 0;
                            list.children().each(function() {
                                var w = show.text($(this).text()).width();

                                if (w > width)
                                    width = w;
                            })
                            window.console.log(width, ow);
                            show.text(list.children().eq(0).text()).width(width);
                            list.width(width + ow - 2);
                        })()
                    </script>
                {/literal}
            </div>
            <div class="cleart"></div>
            <div class="domain-after">
            </div>
            <!--<div class="kol-1"></div>-->
            <form action="{$ca_url}cart&amp;step=1&amp;cat_id=register" method="post">
                <input type="hidden" name="tld_cat" value="{$category.id}" /> 
                <input type="hidden" name="ref"  value="1"/>
                <div id="updater">{include file='ajax.checkdomainnew.tpl'}</div>
            </form>
        </div>
        <div class="linia1"></div>
        <div class="transfer-after">
            <div class="kol-1">
                <h3 class="title08">{$lang.startingat}</h3>
                <div class="cost01" style="padding-bottom: 10px">{$lowestprice.price|price:$currency:true:false:false}<span>{$lang.peryear1} {if $lowestprice.period > 1}{$lowestprice.period} {$lang.peryear3}{else}{$lang.peryear2}{/if}!</span></div>

                </div>
                <div class="kol-2">
                    <h3 class="title08">{$lang.supportedtlds}:</h3>
                    <ul class="list-domain">
                        {foreach from=$tld item=t name=fooc}
                            <li>{$t}</li>
                            {/foreach}
                    </ul>
                    <div class="cleart"></div>
                </div>

            </div>

            {include file="domainpricing.tpl"}
        </div>

    </div>