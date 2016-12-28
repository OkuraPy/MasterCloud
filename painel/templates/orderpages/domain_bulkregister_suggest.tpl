{*
@@author:: HostBill team
@@name:: Bulk domain registration + Domain name suggestions
@@description:: Use this template with TLDs you wish to offer registration for. You can also assign this orderpage to product you wish to offer domain with.
	<br> For domain name suggestions to work you will need to activate a 'Domain suggestion' plugin. 
	<br><br><strong>How-to Videos:</strong><br>
	<a class="external" target="_blank" href="http://cdn.hostbillapp.com/videos/orderpages/domain_suggestion_plugin.swf">Activating domain suggestions</a>
@@thumb:: images/bulk_domain_thumb.png
@@img:: images/bulk_domain_preview.png
*}
<script type="text/javascript">
{literal}
function check_domain2(form,updater) {
    // clear errors
        $(updater).addLoader();
        $.post('index.php?cmd=checkdomain&'+$(form).serialize(),{layer:'ajax',justparse:'1',bulk:true,action:'checkdomain'},function(data) {
            $(updater).html('');
             var resp = parse_response(data);
                 if(resp) {
                    $(updater).html(resp);
                    if(typeof($().slideToElement)=='function') {
                        $('body').slideToElement('searchresults');
                    }
                }
        });
         return false;
}
    function runBulkSearch() {
        var domaincat = 0;
        if($("#domain_cat").length)
            domaincat = $('#domain_cat').val();
        if($('.status-row').length<1)
            return;
		var count = {/literal}'{$opconfig.suggestions}'{literal};
         $('.status-row').each(function(n){
            var tld= $(this).find('input[name=tlx]').val();
            var sld= $(this).find('input[name=slx]').val();
                ajax_update('index.php?cmd=checkdomain',{layer:'ajax','singlecheck':true,action:'checkdomain',domain_cat:domaincat,tld:tld,sld:sld, suggestions: Math.max(Math.floor(count/$('.status-row').length),1)},'.status-row:eq('+n+')');

        });
                
    }
	function addSuggestions(list){
		if(list.length > 0){
		var style = $('#suggestions tr:last:not(#sgtpl)').length? !$('#suggestions tr:last:not(#sgtpl)').hasClass('status-row-white'): !$('#sgtpl').hasClass('status-row-white');
		for(var i=0; i<list.length;i++){
			var html = $('#sgtpl').html().replace(new RegExp('\\$t_sld','g'),list[i].sld).replace(new RegExp('\\$t_tld','g'),list[i].tld);
			var tr = $('#sgtpl').clone().attr('id','').html(html);
			var sel = tr.find('select').html();
			tr.find('select').html('');

			for(var s=0; s<list[i].price.length; s++){
			tr.find('select').append(sel
				.replace(new RegExp('\\$t_period','g'),list[i].price[s].period).replace(new RegExp('\\$t_price','g'),list[i].price[s].register));
			}
			tr.attr('class','');
			if(style)
				tr.addClass('status-row-white');
			style = !style;
			tr.appendTo( '#suggestions' ).addClass('status-row').show();
		}
		$('#suggestions').fadeIn();
		}
	}
{/literal}
</script>
<div class="container-step1 container-transfer" style="width:815px;">
    <div class="step1">
        <h1 class="title06">{if $category}{$category.name}{else}{$lang.bulksearch}{/if}</h1>
        <span class="name-enter">{$lang.enterdomainsdesc} </span>
        <div class="cleart"></div>
        <form action="" method="post" onsubmit='return check_domain2(this,"#updater");'>
            <input type="hidden" name="domain_cat" value="{$domain_cat}" id="domain_cat"/>
            <div class="part1">
                <div class="textarea-top"></div>
                <textarea name="sld" rows="5" cols="50" id="bulksearch" class="orig">{if $check}{$bulkcheck}{else}{$lang.enterfewdomains}{/if}</textarea>
                <div class="textarea-bottom"></div>
            </div>
            <div class="part2">
                <ul>
                                {foreach from=$tld item=tldname name=ttld}
                    <li><label><input type="checkbox" name="tld[]" value="{$tldname}" {if $smarty.foreach.ttld.first || $bulkchecktld[$tldname]}checked="checked"{/if} class="tld_register" /><span>{$tldname}</span></label></li>
                                      
                                {/foreach}
                </ul>
                <div class="cleart"></div>
                <div class="button-container">
                    <div class="button04"><div><input type="submit" onclick="window.location='{$ca_url}checkdomain/'; return false;" value="{$lang.singlesearch} &raquo;" /></div></div>
                    <div class="button05"><div><input type="submit" value="{$lang.checkbtn}" /></div></div>
                </div>
            </div>
        </form>
        <div class="cleart"></div>



        <form action="{$ca_url}cart&amp;step=1&amp;cat_id=register" method="post">
            <input type="hidden" name="tld_cat" value="{$category.id}" /> 
            <input type="hidden" name="ref"  value="1"/>
             <a name="searchresults"></a><div id="updater" style="padding: 0; width: 710px; margin:20px 0">{include file='ajax.checkdomainnew.tpl'}</div>
        </form>

        <div class="line2"></div>
 {include file="domainpricing.tpl"}
    </div>
</div>