<div class="blu"> 
    <a href="?cmd=services" class="tload2"><strong>{$lang.orpages}</strong></a> 
    {if $action == 'addcategory'} &raquo; {$lang.addneworpage}{/if}
</div>
<div class="newhorizontalnav" id="newshelfnav">
    <div class="list-1">
        <ul>
            <li class="{if $action=='default'}active{/if} picked">
                <a href="?cmd=services"><span class="ico money">{$lang.orpages}</span></a>
            </li>
            <li class="{if $action=='addcategory'}active{/if} last">
                <a href="?cmd=services&action=addcategory"><span class="ico formn">{$lang.addneworpage}</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2" style="min-height: 15px;">
        {if $action=='default'}
            <div class="subm1 haveitems">
                <ul>
                    <li>
                        <a href="#archived" onclick="return HBServices.showArcived(), false" >Show Archived Categories</a>
                    </li>
                </ul>
            </div>
        {/if}
    </div>
</div>

<div  id="addcategory" style="{if $action!='addcategory'}display:none{/if}">
    <div class="nicerblu">
        <form action="" name="" method="post" enctype="multipart/form-data">
            <input type="hidden" name="make" value="addcategory" id="addcategory"/>

            <table border="0" cellpadding="6" cellspacing="0" width="100%">
                <tbody>
                    <tr class="step0">
                        <td width="160" align="right"><strong>{$lang.Name}:</strong></td>
                        <td width="400">{hbinput value=$category.tag_name style="font-size: 16px !important; font-weight: bold;" class="inp" size="60" name="name" id="categoryname"}</td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="hints" style="display:none">
                    <tr >
                        <td width="160" align="right" class="fs11">{$lang.orderpageurl} </td>
                        <td class="fs11" colspan="2">{$system_url}{$ca_url}cart/<span class="changemeurl">{$category.slug}</span><input  name="slug" type="text" class="" value="{$category.slug}" id="category_slug_edit" style="display:none" />/ 
                            <a class="editbtn" onclick="return HBServices.editslug(this)" href="#">{$lang.Edit}</a></td>
                    </tr>
                </tbody>
                <tbody id="template_descriptions" class="step1">
                    <tr>
                        <td width="160" align="right" valign="top" style="padding-top:12px;">
                            <strong>{$lang.ordertype}</strong>
                        </td>
                        <td>
                            <div id="template_wizard">
                                <select name="ptype"  class="inp template " onchange="HBServices.sl(this)"  
                                        style="font-weight:bold;font-size:14px !important;" id="ptypechange">
                                    <option value="0" selected="selected">{$lang.selectone}</option>
                                    {foreach from=$ptypes item=ptype name=lop}
                                        <option value="{$ptype.id}">
                                            {assign var="descr" value="_hosting"}{assign var="bescr" value=$ptype.lptype}{assign var="baz" value="$bescr$descr"}
                                            {if $lang.$baz}{$lang.$baz}
                                            {else}{$ptype.type}
                                            {/if}
                                        </option>
                                    {/foreach}
                                </select> {if $countinactive}<div class="fs11 tabb" >Note: There are <b>{$countinactive}</b> inactive order types, you can enable them by activating related <a href="?cmd=managemodules&action=hosting" target="_blank">hosting modules</a> </div>{/if}
                            </div>
                            <div id="wiz_options"></div>
                        </td>
                        <td valign="top"></td>
                    </tr>
                </tbody>
                <tbody>
                    <tr class="step1">
                        <td width="160" align="right"><strong>{$lang.Description}:</strong></td>
                        <td colspan="2">
                            <a href="#" onclick="$(this).hide();
                                    $('#prod_desc_c').show();
                                    return false;"><strong>{$lang.adddescription}</strong></a>
                            <div id="prod_desc_c" style="display:none">{hbwysiwyg wrapper="div" value=$category.tag_description style="width:99%;" class="inp wysiw_editor" cols="100" rows="6" id="prod_desc" name="description" featureset="simple"}</div>
                        </td>
                    </tr>
                    <tr class="step1">
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
                <input type="submit" value="{$lang.addneworpage}" class="submitme" disabled="disabled" id="submitbtn"/>
                <span class="orspace">{$lang.Or}</span> <a href="?cmd=services"  class="editbtn">{$lang.Cancel}</a>

            </p>

            {securitytoken}
        </form>
    </div>
</div>
<div id="listproducts" {if $action!='default'}style="display:none"{/if}>
    {if $categories}
        <form id="serializeit" method="post">

            <table width="100%" cellspacing="0" cellpadding="3" border="0" class="glike">
                <tbody>
                    <tr>
                        <th width="20"></th>
                        <th width="20%">{$lang.Name}</th>
                        <th width="120" >{$lang.numofprod}</th>
                        <th >{$lang.ordertype}</th>
                        <th width="160">&nbsp;</th>
                    </tr>
                </tbody>
            </table>
            <ul id="grab-sorter" style="width:100%">
                {include file="services/ajax.categories.tpl"}
            </ul>
            <table width="100%" cellspacing="0" cellpadding="3" border="0" class="glike">
                <tbody>
                    <tr>
                        <th width="20"></th>
                        <th ><a class="editbtn" href="?cmd=services&action=addcategory">{$lang.addneworpage}</a></th>

                    </tr>
                </tbody>
            </table>
            {securitytoken}
        </form>
    {else}
        <div class="blank_state blank_services">
            <div class="blank_info">
                <h1>{$lang.orpage_blank1}</h1>
                <div class="clear">{$lang.orpage_blank1_desc}</div>

                <a class="new_add new_menu" href="?cmd=services&action=addcategory"  style="margin-top:10px">
                    <span>{$lang.addneworpage}</span></a>
                <div class="clear"></div>

            </div>
        </div>
    {/if}
</div>