{foreach from=$products item=prod name=prods}
    <li class="{if $prod.visible=='0'}hidden{/if} {if $prod.visible==-1}archived{/if} entry" id="entry{$prod.id}">
        <div>
            <table width="100%" cellspacing="0" cellpadding="3" border="0" class="glike">
                <tr  class="havecontrols">
                    <td width="20" class="name">
                        {if $priceup}
                            <input type="checkbox" name="product[{$prod.id}]" value="{$prod.id}" class="product_check"/>
                        {else}
                            <input type="hidden" name="sort[]" value="{$prod.id}" />
                            <div class="controls">
                                <a class="sorter-handle" >{$lang.move}</a>
                            </div>
                        {/if}
                    </td>
                    <td >
                        <a href="?cmd=services&action=product&id={$prod.id}">
                            {if $prod.visible==1}{$prod.name}
                            {else}<em class="hidden">{$prod.name} </em>
                            {/if}
                        </a> 
                        {if $prod.visible=='0'}
                            <em class="hidden fs11">{$lang.hidden}</em>
                        {elseif $prod.visible==-1}
                            <em class="hidden archived fs11">Archived</em>
                        {/if}
                    </td>
                    <td width="130" align="center">{if $prod.accounts}<a  href="?cmd=accounts&filter[product_id]={$prod.id}" target="_blank">{$prod.accounts}</a>{elseif $prod.domains}<a  href="?cmd=domains&filter[tld_id]={$prod.id}" target="_blank">{$prod.domains}</a>{else}0{/if}</td>
                    <td width="30">{if $prod.stock=='1'}{$lang.qty} {$prod.qty}{/if}</td>

                    <td style="width: 120px; text-align: right">
                        {if $prod.visible=='0'}
                            <a href="?cmd=services&action=toggle&state=visible&id={$prod.id}&cat={$category.id}&security_token={$security_token}" 
                               class="menuitm menu-auto ajax" style="min-width: 30px; text-align: center">{$lang.Show}</a>
                        {elseif $prod.visible=='-1'}
                            <a href="?cmd=services&action=toggle&state=visible&id={$prod.id}&cat={$category.id}&security_token={$security_token}" 
                               class="menuitm menu-auto ajax" style="min-width: 30px; text-align: center">Restore</a>
                        {else}
                            <a href="?cmd=services&action=toggle&state=archive&id={$prod.id}&cat={$category.id}&security_token={$security_token}" 
                               class="menuitm menu-auto ajax" >Archive</a>

                            <a href="?cmd=services&action=toggle&state=hide&id={$prod.id}&cat={$category.id}&security_token={$security_token}" 
                               class="menuitm menu-auto ajax" >{$lang.Hide}</a>
                        {/if}
                    </td>

                    <td style="width: 120px; text-align: right">
                        <a class="menuitm menu-auto" href="?cmd=services&action=product&id={$prod.id}" class="editbtn"><span style="color: red">{$lang.Edit}</span></a>
                        <a class="menuitm menu-auto" href="?cmd=services&amp;make=duplicate&id={$prod.id}&security_token={$security_token}">{$lang.Duplicate}</a>                           
                        <a class="menuitm menu-auto ajax" href="?cmd=services&make=deleteproduct&id={$prod.id}&cat_id={$category.id}&security_token={$security_token}" 
                           onclick="return confirm('{$lang.deleteproductconfirm}');"><span class="delsth"></span></a> 
                    </td>
                </tr>
            </table>
        </div>
    </li>
{/foreach}