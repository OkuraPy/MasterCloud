
$(document).ready(function(e) {
	
	
	var leftMenu;
	
	if($.cookie('hidden_menu')){
		$('.left-menu').addClass('active');
		$('.left-menu').css('width', 60);
		$('.wrapper').css('width', 1158);
		leftMenu = 1;
	}else{
		$('.left-menu').removeClass('active');
		$('.left-menu').css('width', 203);
		$('.wrapper').css('width', 1015);
		leftMenu = 0;
	} 
	

	
	
	$('.left-menu .icon-reorder').click(function(){
		if(leftMenu == 1){
			$('.wrapper').animate({'width': 1015}, 150, 'linear');
			$('.left-menu').animate({'width': 203}, 150, 'linear');
			$('.left-menu').removeClass('active');
			leftMenu = 0;
			$.removeCookie('hidden_menu');
		}else{
			$('.wrapper').animate({'width': 1158}, 150, 'linear');
			$('.left-menu').animate({'width': 60}, 150, 'linear');
			$('.left-menu').addClass('active');
			$('.left-menu nav .flat-ui-dropdown').hide();
			leftMenu = 1;
			$.cookie('hidden_menu', '1', { expires: 30, path: '/' });
		}
		
	});
	
	
	
	
	$('.left-menu nav > li').hover(function(){
			if(leftMenu)
				$(this).find('.hidden-submenu').show().children('.flat-ui-dropdown').show();
		}, function(){
			if(leftMenu)
				$(this).find('.hidden-submenu').hide().children('.flat-ui-dropdown').hide();
	});
	
	
	
	$('.left-menu nav > li').click(function(){
		$(this).find('.hidden-submenu').show().children('.flat-ui-dropdown').slideToggle(500);
		
		return false;
	});
	
	
	
	
	
	
	$('.left-menu nav > li ul a, .left-menu nav > li a').click(function(e){
		
		if(!$(this).next().is('div')) 
			e.stopPropagation();
		
	})
	
	
	
	
	$('.left-menu > .nav > .nav-header').click(function(){
		$('.left-menu nav > li .flat-ui-dropdown').slideToggle(500);
	});
	
	
	
	$('a[data-toggle="tooltip"]').tooltip();
	
	
	
	
	
	
	
	
	
	
	var leftMenuHeight =  $('.left-menu').height();
	
	if(leftMenuHeight > $('.main-container').height())
		$('.main-container').css('min-height', leftMenuHeight);
	
	
	
	
    var sorterlist = $('#currentlist');
    $('.nav-tabs').each(function() {
        var filter = $(this).attr('data-filter'),
                sort = $('.sortorder');
        if (filter) {
            var target = sorterlist.attr('updater'),
                    url = sorterlist.attr('href');
            if (url && target) {
                $(this).find('li a[data-filter]').each(function() {
                    var value = $(this).attr('data-filter');
                    $(this).click(function() {
                        $(target).addLoader();
                        var uurl = value.length ? url + '&filter[' + filter + ']=' + value : url;
                        sorterlist.attr('href', uurl);
                        sort.each(function() {
                            $(this).attr('href', uurl + '&' + $(this).attr('href').replace(/^.*orderby/, 'orderby'));
                        });
                        ajax_update(uurl, {}, target);
                    });
                });
            }
        } else {
            var tabletr = $(this).siblings('.tab-content').find('table tr').filter(function() {
                return !$(this).has('th').length
            });
            $(this).find('li a').each(function() {
                var filtr = $(this).attr('href');
                $(this).click(function() {
                    if (filtr.length > 0) {
                        var hash = filtr.substr(0, 1),
                                value = filtr.substr(1);
                        if (hash == "#" && value.length) {
                            tabletr.hide().has('.' + value + '-row').each(function() {
                                $(this).show();
                                if ($(this).next('tr').is('.empty-row'))
                                    $(this).next('tr').show();
                            });
                        } else if (hash == "#") {
                            tabletr.show();
                        }
                    }
                })
            });
        }
        $('.styled-table').each(function(){
            var table = $(this),
                checker = table.find('input[type=checkbox]:first:not([name])');
            if(checker.length){
                var other = table.find('input[type=checkbox]').not(checker).not(':disabled');
                other.change(function(){
                    if($(this).is(':checked') && other.filter(':checked').length == other.length){
                        checker.prop('checked',true);
                    }else{
                        checker.prop('checked',false);
                    }
                });
                checker.change(function(){
                    if($(this).is(':checked') ){
                        other.prop('checked',true);
                    }else{
                        other.prop('checked',false);
                    }
                    if(other.eq(0).attr('onclick'))
                        eval('function x(){'+other.eq(0).attr('onclick')+'}; x.call(other.eq(0)[0])');
                });
            }
        });
        
    })
	
	
	var header_search = $('header .search-bg'),
            header_serach_subm = false;
    header_search.find('.search-block input').bind('keyup submit', function(e) {
        if ((e.type == 'keyup' && e.keyCode != 13) || header_serach_subm) {
            return false;
        }
        header_serach_subm = true;
        var query = $(this).val(),
                pos = header_search.attr('rel') || 0;
        header_search.find('.dropdown-menu li').eq(pos).find('.search-field').val(query).end().find('form').submit();
        return false;
    });
    header_search.find('.dropdown-menu li a').click(function() {
        header_search.attr('rel', $(this).parent().index()).find('.dropdown-toggle').html($(this).text()+ '<span class="caret"></span> ');
        return false;
    });
	
	
});



function delete_vouchers()
{
	$('.voucher-table td input[type=checkbox]:checked').each(function(index, element) {
		var that = $(this);
        var url = $(this).parents('tr').find('a').attr('href');
		$.get(url, function() {
			that.parents('tr').next('.empty-row').remove();
			that.parents('tr').remove();
		});
    });
}


function c_all(el) {
    if($(el).is(':checked')) {
        $('.idchecker').not(':disabled').attr('checked','checked');
        $.getJSON('?cmd=clientarea&action=domains&make=widgetsget&'+$('.idchecker').serialize(),{},function(data){
            $('.icons li').addClass('disabled');
            $('.icons li.widget_domainrenewal').removeClass('disabled');
            $.each(data.resp, function(index, i) {
                $('.icons li.widget_'+i.widget).removeClass('disabled');
            });

        });
    }

}
	