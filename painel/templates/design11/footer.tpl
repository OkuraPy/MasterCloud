    {if $cmd=='cart' || $cmd=="upgrade" || !in_array('design11',$tpl_path)}</div></div>{/if}
                        </div> <!-- /row -->
                    </div> <!-- /row -->
                </div><!-- /container-fluid -->
            </section><!-- /#main-section -->
            <div id="section-border">
                <footer id="main-footer">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="copyrights">
                                <span>{footer}</span>
                                <span class="copyright">&copy; {$business_name} 2015 </span>
                            </div>
                            <ul class="footer_nav pull-right">
                                <li><a href="{$ca_url}">{$lang.homepage}</a></li>
                                <li><a href="{$ca_url}cart/">{$lang.order}</a></li>
                                <li><a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}">{$lang.support}</a></li>
                                <li><a href="{$ca_url}clientarea/">{$lang.clientarea}</a></li>
                                    {if $enableFeatures.affiliates!='off'}
                                    <li><a href="{$ca_url}affiliates/">{$lang.affiliates}</a></li>
                                    {/if}
                            </ul>
                        </div>  
                    </div>
                </footer>
            </div>
        </div>
        {if $logged!='1'}
            {include file="ajax.login.tpl" loginwidget=true}
        {/if}
        {userfooter}
    </body>
</html>
