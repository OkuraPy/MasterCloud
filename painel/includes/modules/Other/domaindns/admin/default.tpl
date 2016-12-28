
<form action="" method="post" id="serverform">
    <div class="lighterblue" style="padding: 10px;">
        <h3>Domains</h3>

        Create DNS Zone - <strong>On domain registration / transfer</strong>
        <div>
            <ul class="treeview eventtree left" style="padding-left:3px;">
                <li style="padding-top:1px">
                    <label>
                        <input type="radio" name="onregister" {if $submit.onregister == '1'}checked="checked"{/if} value="1" />
                        Yes, before domain registration / transfer
                    </label>
                </li>
                <li style="padding-top:1px">
                    <label>
                        <input type="radio" name="onregister" {if $submit.onregister == '2'}checked="checked"{/if} value="2" />
                        Yes, after successful domain registration / transfer
                    </label>
                </li>
                <li class="last" style="padding-top:1px">
                    <label>
                        <input type="radio" name="onregister" value="0" {if !$submit.onregister}checked="checked"{/if} /> 
                        No, do not create zones automatically
                    </label>
                </li>
            </ul>    

        </div>
        <div class="clear"></div>
        <br />
        Create DNS Zone  - <strong>On name server change</strong>
        <div>
            <ul class="treeview left" style="padding-left:3px; }">
                <li style="padding-top:1px">
                    <label>
                        <input type="radio" name="onmatch" {if $submit.onmatch == '1'}checked="checked"{/if} value="1" /> 
                        Yes, create zones for client that use our name servers
                    </label>
                </li>
                <li class="last" style="padding-top:1px">
                    <label>
                        <input type="radio" name="onmatch" {if $submit.onmatch == '0'}checked="checked"{/if} value="2" /> 
                        No, do not create zones automatically
                    </label>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
        <br />
        Remove DNS Zone  - <strong>On name server change</strong>
        <div >
            <ul class="treeview left" style="padding-left:3px; }">
                <li style="padding-top:1px">
                    <label>
                        <input type="radio" name="onmismatch" {if $submit.onmatch == '1'}checked="checked"{/if} value="1" /> 
                        Yes, remove  zone when domain name servers change
                    </label>
                </li>
                <li class="last" style="padding-top:1px">
                    <label>
                        <input type="radio" name="onmismatch" {if $submit.onmatch == '0'}checked="checked"{/if} value="2" /> 
                        No, keep zone details 
                    </label>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
        <br />
        
        <h3>Hosting</h3>
        Create DNS Zone  - <strong>On account creation</strong>
        <div >
            <ul class="treeview left" style="padding-left:3px; }">
                <li style="padding-top:1px">
                    <label>
                        <input type="checkbox" name="owndomain" value="1" {if $submit.owndomain == 1}checked="checked"{/if} /> 
                        Create zone for clients who choose hosting with their own domain
                    </label>
                </li>
                <li class="last" style="padding-top:1px">
                    <label>
                        <input type="checkbox" name="subdomain" value="1" {if $submit.subdomain == 1}checked="checked"{/if} /> 
                        Create zone for clients who choose hosting with  free subdomain
                    </label>
                </li>
            </ul>
        </div>

        <div class="clear"></div>
        <br />

        <h3>DNS Service package</h3>
        <div >
            Create zones automatically under package<br />
            <select name="package">
                {if $pacakages}
                    {foreach from=$pacakages item=package}
                        <option {if $submit.package == $package.id}selected="selected"{/if} value="{$package.id}">&nbsp;{$package.name}&nbsp;</option>
                    {/foreach}
                {else}
                    <option>No DNS management packages available</option>
                {/if}
            </select>

        </div>
    </div>
    <div class="blu">
        <input type="submit" name="save" value="{$lang.savechanges}" style="font-weight: bold" />
    </div>
</form>
<script type="text/javascript">
    {literal}
        function testConfiguration() {
            $('#testing_result').html('<img style="height: 16px" src="ajax-loading.gif" />');
            ajax_update('?cmd=module&module={/literal}{$module_id}{literal}&act=test&' + $('#serverform').serialize(), {}, '#testing_result');
        }
    {/literal}
</script>
