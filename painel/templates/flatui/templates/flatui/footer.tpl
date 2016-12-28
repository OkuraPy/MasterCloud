            {if $cmd=='cart' || $cmd=="upgrade"}</div></div>{/if}
            </section>
            <!-- End of Main Container -->
        
        </div>
    </div>
    <footer>
        <div class="padding">
            <div class="separator"></div>

            <div class="pull-right">
                <span class="copyright">&copy; 2012 {$business_name}</span>
            </div>

            <ul class="nav nav-pills">
                <li><a href="{$ca_url}">{$lang.homepage}</a></li>
                <li><a href="{$ca_url}cart/">{$lang.order}</a></li>
                <li><a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}">{$lang.support}</a></li>
                <li><a href="{$ca_url}clientarea/">{$lang.clientarea}</a></li>
                    {if $enableFeatures.affiliates!='off'}
                    <li><a href="{$ca_url}affiliates/">{$lang.affiliates}</a></li>
                    {/if}
            </ul>
        </div>
    </footer>
    </div>
{userfooter}
</body>
</html>
