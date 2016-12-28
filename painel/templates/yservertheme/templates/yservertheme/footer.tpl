{if $cmd=='cart' || $cmd=="upgrade" || !in_array('yservertheme',$tpl_path)}</div></div>{/if}
            </section>
            <div id="section-border">
            {footer}
            </div>
        </div>
        <footer id="main-footer">
            <div></div>
            <div class="pull-right">
                <span class="copyright">&copy; 2014 {$business_name}</span>
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
        </footer>
        {if $logged!='1'}
            {include file="ajax.login.tpl" loginwidget=true}
        {/if}
        {userfooter}
    </body>
</html>
