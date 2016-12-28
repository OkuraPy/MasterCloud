{if $do=='createdisk'}
    <form method="post" action="">
        <input type="hidden" value="editdisk" name="make" />

        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
            <tr>
                <td>
                    <span class="slabel">{$lang.label}</span>
                </td>
                <td>
                   <input type="text" required="required" name="name" class="styled" value=""/>
                   <input type="hidden" name="is_detached" class="styled" value="{if $editdisk.is_detached}1{/if}"/>
                </td>
            </tr>
            {if $editdisk.storage_tags}
                <tr>
                    <td>
                        <span class="slabel">{$lang.storge_type}</span>
                    </td>
                    <td>
                        <select name="storage_flavor" id="virtual_machine_storage_flavor"  style="min-width:250px;" >
                            {foreach from=$editdisk.storage_tags item=tag}
                                <option value="{$tag.tag}">
                                    {$tag.name}
                                    {if $tag.price}{$tag.price|price:$currency:true:true:true:4} GB/hour{/if}
                                </option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
            {/if}
            <tr>
                <td>
                    <span class="slabel">{$lang.diskspace}</span>
                </td>
                <td>
                    <div class="input-with-slider">
                        
                        <input type="text" size="4" required="required" name="disk_size" class="styled" 
                               value="{if $editdisk.current}{$editdisk.current}{elseif $slider.initialval}{$slider.initialval}{else}1{/if}" 
                               id="disk_size"/>
                        GB
                        <div class="slider" 
                             max="{$editdisk.vmlimit}" 
                             min="{if $slider.min}{$slider.min}{else}0{/if}" fmin="{if $slider.minvalue}{$slider.minvalue}{else}1{/if}" 
                             step="{if $slider.step}{$slider.step}{else}1{/if}" 
                             target="#disk_size"></div>
                    </div>

                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" class="padded" style="font-weight: bold;" value="{$lang.savechanges}"/>
                    <input type="button" class="padded" value="{$lang.cancel}"  style="font-weight:normal" 
                           onclick="window.location = '?cmd=clientarea&action=services&service={$service.id}&vpsdo=disks&vpsid={$vpsid}'"/>
                </td></tr>
        </table>{securitytoken}
    </form><script type="text/javascript">
        {literal}
            $(document).ready(function() {
                init_sliders();
            });
        {/literal}
    </script>
{/if}