function mark_all(swi){function saveDE(e){var onc="$('#transform').submit(); return false;";$("a.new_dsave").css("opacity",e?1:.3).attr("onclick",e?onc:"")}function procF(f,arg){row=arg[0].eq(0),arg[0]=arg[0].not(arg[0].eq(0)),row.length?(2==arg.length?f(row,arg[1]):f(row),proce=setTimeout(function(){procF(f,arg)},10)):(clearTimeout(proce),proce=!1,saveDE(!0))}var row=null,fdo=null,adar=null;switch(proce&&clearTimeout(proce),swi){case"edit":fdo=editTranslation,adar=[$("#updater tr:not(.editable) a:first-child")];break;case"del":fdo=delTranslation,adar=[$("#updater tr:not(.delete) a:first-child"),"clear"];break;case"undel":fdo=delTranslation,adar=[$("#updater tr.delete a:first-child"),"del"]}saveDE(!1),procF(fdo,adar)}function editTranslation(a){if($(a).parent().siblings(".valuebox:has(textarea)").length)return!1;var key=$(a).parent().siblings(".keybox").text().replace(/"/g,"&quot;"),htm=$(a).parent().siblings(".valuebox"),section="-1"==Globl.section?$(a).parent().siblings(".valuebox").attr("rel"):Globl.section;return htm.html('<textarea name="entrys['+section+"]["+key+']" >'+htm.html()+"</textarea>"),$(a).parent().siblings(".valuebox").find("textarea").elastic(),$(a).parents("tr").addClass("editable"),!1}function delTranslation(a,block){var key=$(a).parent().siblings(".keybox").text().replace(/"/g,"&quot;"),section="-1"==Globl.section?$(a).parent().siblings(".valuebox").attr("rel"):Globl.section;return $(a).parent().parent(".delete").length&&"clear"!=block?$(a).parent().parent(".delete").removeClass("delete").next('input[value="'+key+'"]').remove():"del"!=block&&$(a).parent().parent().not(".delete").addClass("delete").after('<input type="hidden" value="'+key+'" name="entrys[del]['+section+'][]" />'),!1}function addTranslation(){return"-1"==Globl.section?!1:($("table.translations tbody").prepend('<tr id="new'+Globl.newi+'" class="new"><td class="firstcell"><a class="menuitm" title="'+Globl.cancel+'" onclick="return cancelTranslation('+Globl.newi+')" ><span class="editsth"></span></a></td><td><input name="entrys[new]['+Globl.newi+'][key]" /></td><td {/literal}{if $language_det.parent_name}colspan="2"{/if}{literal}><textarea name="entrys[new]['+Globl.newi+'][val]"></textarea></td></tr>'),Globl.newi++,!1)}function cancelTranslation(id){return $("#new"+id).remove(),!1}function addSection(){$("table.translations tbody").html(""),$(".pagebuttons").html("");var select=$('<input id="sectionselect" />'),old=$("#sectionselect");select.insertAfter(old).data("old",old.detach()),$("#sectionselect").change(function(){$('input[name="section"]').val($(this).val())})}function saveTranslations(form){return $('#transform input[name="entrys[del][]"]').length>0&&!confirm(Globl.confirmline)?!1:(ajax_update("?cmd=langedit&action=getsectionpage",{formdata:$(form).serialize()+"&filtr="+Globl.filtr},function(a){$("table.translations #updater").html(a),bindEvents();var input=$("#sectionselect"),old=input.data("old");old&&(input.after(old),old.find('[value="'+input.val()+'"]').length||old.append('<option value="'+input.val()+'">'+input.val()+"</option>"),old.val(input.val()),input.remove()),Globl.section=$(form).find('input[name="section"]').val()}),!1)}function pagination_toggle(){if(clearTimeout(proce),"on"==Globl.pagination){if(!confirm(Globl.confirmline2))return!1;Globl.pagination="off",$(".pagination").hide()}else Globl.pagination="on",$(".pagination").show();return $(".pagebuttons a.menuitm.menul").toggleClass("activated").text("on"==Globl.pagination?Globl.off:Globl.on),$("table.translations tbody").addLoader(),ajax_update("?cmd=langedit",{action:"getsection",lang:Globl.lang,section:Globl.section,pagination:Globl.pagination,filtr:Globl.filtr},function(a){$("table.translations").replaceWith(a),bindEvents(),updateFiltr(!0),Globl.section=$('input[name="section"]').val()}),!1}function go2page(section,key){return clearTimeout(proce),$("table.translations tbody").addLoader(),ajax_update("?cmd=langedit",{action:"getsection",lang:Globl.lang,section:section,keyword:key,pagination:Globl.pagination},function(a){$("table.translations").replaceWith(a),bindEvents(),Globl.section=section,$("#sectionselect").val(section),"on"==Globl.pagination&&$("div.pagination").pagination.setPage($('input[name="page"]').val()),updateFiltr(!0),$(document).slideToElement("found")}),!1}function changeSection(name){return clearTimeout(proce),$("table.translations tbody").addLoader(),ajax_update("?cmd=langedit",{action:"getsection",lang:Globl.lang,section:name,pagination:Globl.pagination,filtr:Globl.filtr},function(a){$("table.translations").replaceWith(a),bindEvents(),updateFiltr(!0),Globl.section=name,"-1"==name?$(".new_add").addClass("disabled"):$(".new_add").removeClass("disabled")}),!1}function toggleFiltr(x){var prop=updateFiltr();Globl.filtr=Globl.filtr^x,"boolean"==typeof prop.filtr?$("#currentlist").attr("href",$("#currentlist").attr("href")+"&filtr="+x):$("#currentlist").attr("href",prop.url.join("&")+"&filtr="+Globl.filtr)}function updateFiltr(update){var filtr=!1,parts=$("#currentlist").attr("href").split("&");return $.each(parts,function(i){var param=this.split("=");"filtr"==param[0]&&(filtr=param,parts[i]="")}),$(".filter-opt").width()>$(".filter-opt").parent().width()?($(".filter-opt").parent().css("position","relative"),$(".filter-opt").css("right",0)):$(".filter-opt").css("right",""),void 0!=update&&1==update&&(Globl.filtr=parseInt(filtr[1]),$(".filter-opt li").each(function(){if(Globl.filtr&parseInt($(this).attr("rel")))var c="on";else var c="off";$(this).children().hide().filter("."+c).show()})),{url:parts,filtr:filtr}}function openFilters(that){$(that).toggleClass("activated").next().fadeToggle()}$(document).ready(function(){$("div.pagination").trigger("nextPage");var timeout=!1;$("#lang_search input").keyup(function(){timeout&&clearTimeout(timeout),timeout=setTimeout(function(){$("#search_prop").html('<li class="clear" style="text-align:left"><span>Searching for: "'+$("#lang_search input").val()+'"</span</li>').fadeIn("fast"),ajax_update("?cmd=langedit",{action:"lang_search",lang:Globl.lang,word:$("#lang_search input").val()},function(a){$("#search_prop").html(a)}),timeout=!1},300)}),$("#lang_search input").keypress(function(e){return"13"==e.which?($("#lang_search input").keyup(),!1):void 0}),$("#lang_search input").blur(function(){setTimeout(function(){$("#search_prop").fadeOut("fast")},300)}),$(".filter-opt li").click(function(){$(this).attr("rel").length&&($(this).children().toggle(),toggleFiltr(parseInt($(this).attr("rel"))),ajax_update($("#currentlist").attr("href"),{page:$('input[name="page"]').val(),pagination:$('input[name="pagination"]').val(),action:"getsection"},function(a){$("table.translations").replaceWith(a),bindEvents(),updateFiltr(!0),$("div.pagination").pagination.setPage($('input[name="page"]').val())}))})});var proce=!1;