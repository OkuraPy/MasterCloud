<div class="blu"> 
    <a href="?cmd=services" class="tload2"><strong>{$lang.orpages}</strong></a> 
    &raquo;  {$category.name}
</div>
<div class="newhorizontalnav" id="newshelfnav">
    <div class="list-1">
        <ul>
            <li class="{if $action=='default'}active{/if} picked">
                <a href="?cmd=services"><span class="ico money">{$lang.orpages}</span></a>
            </li>
            <li class="{if $action=='category' || $action=='editcategory'}active{/if} picked">
                <a href="?cmd=services"><span class="ico money">{$category.name}</span></a>
            </li>
            <li class="{if $action=='product'}active{/if} last">
                <a href="?cmd=services&action=product&id=new&cat_id={$category.id}"><span class="ico formn">{$lang.addnewproduct}</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2" style="min-height: 15px;">
        {if $action=='category' || $action=='editcategory'}
            <div class="subm1 haveitems">
                <ul>
                    <li>
                        <a href="?cmd=services&action=editcategory&id={$category.id}" onclick="return HBServices.editcat();">{$lang.editthisorpage}</a>
                    </li>

                    {if $category.visible==0}
                        <li>
                            <a href="?cmd=services&action=toggle&state=visible&id={$category.id}&security_token={$security_token}&redirect=cat" 
                               >Show Category</a>
                        </li>
                    {elseif $category.visible==-1}
                        <li>
                            <a href="?cmd=services&action=toggle&state=visible&id={$category.id}&security_token={$security_token}&redirect=cat" 
                               >Restore Category</a>
                        </li>
                    {else}
                        <li>
                            <a href="?cmd=services&action=toggle&state=hide&id={$category.id}&security_token={$security_token}&redirect=cat" 
                               >Hide Category</a>
                        </li>

                        <li>
                            <a href="?cmd=services&action=toggle&state=archive&id={$category.id}&security_token={$security_token}&redirect=cat" 
                               >Archive Category</a>
                        </li>
                    {/if}


                    <li>
                        <a href="#archived" onclick="return HBServices.showArcived(), false" >Show Archived Products</a>
                    </li>
                </ul>
            </div>
        {/if}
    </div>
</div>
<div class="nicerblu">


    <div id="cinfo1" {if $action!='editcategory'}style="display:none"{/if}>
        <form action="" name="" method="post" enctype="multipart/form-data">
            <input type="hidden" name="make" value="editcategory"/>
            <input type="hidden" name="cat_id" id="category_id" value="{$category.id}"/>

            <table border="0" cellpadding="6" cellspacing="0" width="100%">
                <tbody>
                    <tr>
                        <td width="160" align="right"><strong>{$lang.Name}:</strong></td>
                        <td width="400">
                            {hbinput value=$category.tag_name style="font-size: 16px !important; font-weight: bold;" class="inp" size="60" name="name" id="categoryname"}
                        </td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="hints">
                    <tr >
                        <td width="160" align="right" class="fs11">Order page url: </td>
                        <td class="fs11" colspan="2">
                            <a href="{$system_url}{$ca_url}cart/{$category.slug}/" target="_blank">{$system_url}{$ca_url}cart/<span class="changemeurl">{$category.slug}</span></a>
                            <input  name="slug" type="text" class="" value="{$category.slug}" id="category_slug_edit" style="display:none" />/ 
                            <a class="editbtn" onclick="return HBServices.editslug(this)" href="#">{$lang.Edit}</a>
                        </td>
                    </tr>
                </tbody>
                <tbody id="template_descriptions">
                    {include file="ajax.services.tpl" action='newpageextra'}
                </tbody>
                <tbody>
                    <tr>
                        <td width="160" align="right"><strong>{$lang.Description}:</strong></td>
                        <td colspan="2">
                            {if $category.description!=''}
                                {hbwysiwyg wrapper="div" value=$category.tag_description style="width:99%;" class="inp wysiw_editor" cols="100" rows="6" id="prod_desc" name="description"  featureset="simple"}
                            {else}
                                <a href="#" onclick="$(this).hide();
                                        $('#prod_desc_c').show();
                                        return false;"><strong>{$lang.adddescription}</strong></a>
                                <div id="prod_desc_c" style="display:none">{hbwysiwyg wrapper="div" value=$category.tag_description style="width:99%;" class="inp wysiw_editor" cols="100" rows="6" id="prod_desc" name="description" featureset="simple"}</div>
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <td width="160" align="right"><strong>{$lang.Advanced}:</strong></td>
                        <td colspan="2">
                            <a href="#" onclick="$('#advanced_scenarios').show();
                                    $(this).hide();
                                    return false;">{$lang.show_advanced}</a>
                            <div id="advanced_scenarios" style="display:none">
                                <strong>{$lang.order_scenario}:</strong> <a class="editbtn" href="?cmd=configuration&action=orderscenarios" target="_blank">[?]</a>
                                <select name="scenario" class="inp">
                                    {foreach from=$scenarios item=scenario name=scloop}
                                        <option value="{$scenario.id}" {if $category.scenario_id==$scenario.id}selected="selected"{/if}>{$scenario.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </td>
                    </tr>
                </tbody>


            </table>

            <p align="center">
                <input type="submit" value="{$lang.savechanges}" class="submitme" />
                <span class="orspace">{$lang.Or}</span> <a href="?cmd=services"  class="editbtn" onclick="$('#cinfo1').toggle();
                        $('#cinfo0').toggle();
                        return false;">{$lang.Cancel}</a>
            </p>
            {securitytoken}
        </form>
    </div>
</div>


{if $products}
    <form id="serializeit">
        <table width="100%" cellspacing="0" cellpadding="3" border="0" class="glike">
            <tbody>
                <tr>
                    <th width="20"></th>
                    <th >{$lang.Name}</th>

                    <th width="130">{$lang.Accounts}</th>
                    <th width="30"></th>
                    <th width="120"></th>
                    <th width="120">&nbsp;</th>
                </tr>
            </tbody>
        </table>
        <ul id="grab-sorter" style="width:100%">
            {include file='services/ajax.category.tpl'}
        </ul>
        <table width="100%" cellspacing="0" cellpadding="3" border="0" class="glike">
            <tbody>
                <tr>
                    <th width="30"></th>
                    <th width="100"><a class="editbtn" href="?cmd=services&action=product&id=new&cat_id={$category.id}">{$lang.addnewproduct}</a></th>
                    <th ><a class="editbtn" href="?cmd=services&action=updateprices&cat_id={$category.id}">Bulk price update</a></th>
                </tr>
            </tbody>
        </table>
        {securitytoken}
    </form>
{else}
    <div class="blank_state blank_services">
        <div class="blank_info">
            <h1>{$lang.orpage_blank2}</h1>

            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td><a class="new_add new_menu" href="?cmd=services&action=product&id=new&cat_id={$category.id}"  style="margin-top:5px"><span>{$lang.addnewproduct}</span></a>
                    </td>
                    <td></td>
                </tr>
            </table>

            <div class="clear"></div>

        </div>
    </div>

{/if}