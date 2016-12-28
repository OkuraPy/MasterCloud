{if $cmd!='cart' && ($cmd!='tickets' || $action!='view') && ($cmd!='clientarea' || $action!='services' || !$service || $custom_template || in_array('types',$tpl_path) ) && ($action!='domains' || !$edit) }</div>{/if}

	{if $cmd=='cart'}</div>{/if}
        </article>
        <script type="text/javascript">var w = 0, a= $('.services-content, .services-box').each(function(){literal}{var x = $(this).height(); w = w > x ? w : x;}{/literal}).height(w);</script>
    </section>
    <!-- End of Section -->
    <!-- Footer -->
    <footer class="clear clearfix">
        <ul class="nav-footer">
            <li><a href="{$ca_url}">{$lang.homepage}</a></li>
            <li><a href="{$ca_url}cart/">{$lang.order}</a></li>
            <li><a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}">{$lang.support}</a></li>
            <li><a href="{$ca_url}clientarea/">{$lang.clientarea}</a></li>
            {if $enableFeatures.affiliates!='off'}
            <li><a href="{$ca_url}affiliates/">{$lang.affiliates}</a></li>
            {/if}
        </ul>
        <p>&copy; 2012 {$business_name}</p>
    </footer>
    <!-- End of Footer -->
    
    </div> <!-- End of #Page -->
</div>
{userfooter}
</body>
</html>
