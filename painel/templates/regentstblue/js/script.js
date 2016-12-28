$.pnotify.defaults.history = false;
$.pnotify.defaults.stack.firstpos1 = 60;

$(function() {

    //fold on click even if :hover
    $('#main-side').mouseenter(function(){
        $(this).addClass('hover');
    }).mouseleave(function(){
        $(this).removeClass('hover');
    })
    
    $('#main-side header').click(function() {
        if($('#page').is('.force-fold'))
            return false;
        if($.cookie('ui')=="true"){
            $('#page').removeClass('unfold');
        }else{
            $('#page').addClass('unfold');
        }
        $('#main-side').removeClass('hover');
        $.cookie('ui', !($.cookie('ui')=="true"), { path: '/' });
    })
    $('#main-section').css({minHeight:$('#main-side nav').height()+51})
    

    var header_serach_subm = false;
    $('#main-search .dropdown-menu a').click(function() {
        var that = $(this);
        that.parents('.dropdown').children('a').attr('href', that.attr('href')).html(that.text() + ' <span class="caret"></span>');
        return false;
    });
    
    $('#main-search input').bind('keyup submit', function(e) {
        if ((e.type == 'keyup' && e.keyCode != 13) || header_serach_subm) {
            return false;
        }
        header_serach_subm=true;
        var form = $('#main-search form[action="'+$('#main-search a.dropdown-toggle').attr('href')+'"]');
        if(form.length){
            form.find('.search-field').val($(this).val());
            form.submit();
        }
        return false;
    });
    
    $(".login-widget").click(function(){
        var widget = $('#login-widget');
        if(widget.length){
            widget.fadeIn().unbind('click').click(function(e){
                var target = $(e.target);
                if(target.is(this) || target.is('#login-widget-close') || target.parents('#login-widget-close').length){
                    $(this).fadeOut();
                }
            });;
            return false;
        }
        
    });
    
    $('#board-services .nav-tabs a').click(function(e) {
        e.preventDefault();
        var that = $(this);
        that.parent().addClass('active').siblings().removeClass('active');
        tableSplitToPages('#board-services', 'tr.' + that.attr('href').replace(/.*?#/, '_'));
    }).each(function(){
        var self = $(this),
            selpr = self.parent();
        if(selpr.prev().length &&selpr.prev().offset().top < selpr.offset().top){
            var elems = selpr.prev().nextAll().andSelf(),
                li = $('<li><div class="dropdown dropdown-nav"><a href="#" data-toggle="dropdown" data-contener="#board-services"><i class="icon-cloud icon-large"></i></a></div></li>')
                .insertBefore(selpr);
            $('<ul class="dropdown-menu color-sky-blue"></ul>').append(elems.detach()).appendTo(li.find('.dropdown'));
            //li.children('a').dropdown();
            return false;
        }
    });

    $('#main-search > a').toggle(
        function() {
            var that = $(this).parent(),
                cont = that.addClass('active').find('.search-content');
            setTimeout(function(){cont.css('overflow','visible')}, 300);
            that.find('input').focus();
            return false;
        },
        function() {
            $(this).parent().removeClass('active').find('.search-content').css('overflow','hidden');
            return false;
        }
    );

    $('#board-tickets .tabbable .nav a').click(function(e){
        e.preventDefault();
        var filter = $(this).attr('href') || '#all';
        $('#board-tickets .ticket-list .ticket').hide().filter('.'+filter.replace('#','_')).show();
        $('#board-tickets .content-scroll').getNiceScroll().resize();
    });
    
    $('#board-tickets').on('click','.ticket-list a, .ticket-controls .pull-left a' ,function(e){
        e.preventDefault();
        var url = $(this).attr('href'),
            list = $('#board-tickets .ticket-list'),
            view = $('#board-tickets .ticket-view'),
            active = list.find('a[href="'+url+'"]:visible:first');
            console.log(active, url)
        $.get(url, function(data){
            data = parse_response(data);
            if(data.length){
                view.stop().html(data).animate({opacity:1}, 150);
                addScrollBars(view.find('.content-scroll'));
            }
        })
        if(active.length){
            active = active.parent();
            var scrollpos = active.prevAll(':visible').length * active.height(),
            scroloffset = list.getNiceScroll()[0].newscrolly || 0;
        
            active.addClass('active').siblings('.active').removeClass('active');
            view.animate({opacity:0.2}, 500);
            if(scrollpos >= scroloffset + list.height()){
                list.getNiceScroll().doScrollPos(0, scrollpos - list.height() + active.height(),300);
            }else if(scrollpos < scroloffset){
                list.getNiceScroll().doScrollPos(0, scrollpos,300);
            }
        }
        return false;
    });
    
    $('.progress-button').progressbutton({
        
        statusTime:1500,
        progress: function(instance) {
            var progress = 0,
                    interval = setInterval(function() {
                progress = Math.min(progress + Math.random() * 0.9, 1);
                instance._setProgress(progress);
                if (progress === 1) {
                    instance._stop(1);
                    clearInterval(interval);
                }
            }, 200);
        }
    })

    addScrollBars($('.content-scroll'));

    tableSplitToPages('#board-services', 'tr');
    tableSplitToPages('#board-invoices');

    $('.slide-left, .slide-right', '#board-services').click(calback_slides);
    $('.slide-left, .slide-right', '#board-invoices').click(calback_slides);
    
    $(document).on('click.dropdown.data-api','[data-toggle=dropdown][data-contener]', function(e){
        var self = $(this),
            parent = self.parent(),
            target = $(e.target)
            
        if(target.is('.dropdown-clone') || target.parents('.dropdown-clone').length){
            return false;
        }

        var clone = parent.clone(true).css({
            position:'absolute',
            top:0,
            left:0
        }).addClass('not-cart dropdown-clone').data('dropdown-clone', parent).appendTo(self.data('contener'));
        
        clone.children().each(function(i){
            var org = parent.children().eq(i),
                elm = $(this);
            elm.css('position','absolute').css(org.offset()).width(org.width()).height(org.height())
        });
        
        clone.on('click', 'a', function(){
            clone.data('dropdown-clone').css({visibility:'visible'});
            clone.remove();
        })
        parent.css({visibility:'hidden'})
    }).on('click.dropdown.data-api', function(){
        $('[data-toggle=dropdown][data-contener]').each(function(){
            var self = $(this).parent();
            if(self.data('dropdown-clone')){
                self.data('dropdown-clone').css({visibility:'visible'});
                self.remove();
            }
                
        })
    });
    
    //sorting & tabs
    $(document).on('click','[data-sorter]', function(e){
        e.preventDefault();
        var self = $(this),
            list = $('#currentlist'),
            url = list.attr('href'),
            sortkey = self.data('sorter'),
            sortval = self.attr('href'),
            valmatch = sortval.match(new RegExp('[&?]?'+sortkey.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&")+'(=[^&]*)?'));
        if(valmatch){
            sortval = valmatch[1] || '';
            url = url.replace(new RegExp('[&?]?'+sortkey.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&")+'(=[^&]*)?'),'') + '&' + sortkey + '='+sortval.replace(/.*?=/,'');
        }else{
            url = url.replace(new RegExp('[&?]?'+sortkey.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&")+'(=[^&]*)?'),'') + '&' + sortkey + '='+sortval.replace(/.*?#/,'');
        }
        
        list.attr('href', url);
        $('#updater').addLoader();
        ajax_update(url,{},'#updater');
        
        if(sortkey == 'orderby'){
            if(url.match(/\|ASC$/)){
                self.addClass('desc').removeClass('asc').attr('href',url.replace(/\|ASC$/,'|DESC'));
            }else{
                self.addClass('asc').removeClass('desc').attr('href',url.replace(/\|DESC$/,'|ASC'));
            }
        }

        self.parent().siblings('.active').removeClass('active').end().addClass('active');
        return false;
    })
});

$(window).load(function() {
    $('#board-invoices').css({minHeight:$('#quick-links').height()});
});

function tableSplitToPages(target, filter) {
    filter = filter || 'tbody tr';
    var vclass = $('table', target).attr('class'),
            table = null;

    $('table', target).hide().removeClass('ui-slide').addClass('ui-slide-disabled').find(filter).each(function(i) {
        if (i % 3 == 0) {
            table = $('<table class="' + vclass + '"></table>').addClass('ui-slide').insertAfter($('table:last', target));
            if (i > 0)
                table.hide();
        }
        $(this).show().detach().appendTo(table);
    });
    $('table', target).each(function() {
        var that = $(this);
        if(that.find('th').length)
            that.show();
        if (!that.find('tr').length)
            that.remove();
    });
}

function calback_slides(e) {
    e.preventDefault();
    var that = $(this),
            wrapper = "<div class=\"ui-slide-wrapp\"></div>",
            target = that.attr('href') || 'body',
            speed = 400;
    if (that.is('.slide-left')) {
        var t1 = $('.ui-slide:visible', target),
                t2 = t1.prev('.ui-slide'),
                direction = 'left';
        if (!t2.length)
            t2 = $('.ui-slide:last', target)
    } else {
        var t1 = $('.ui-slide:visible', target),
                t2 = t1.next('.ui-slide'),
                direction = 'right';
        if (!t2.length)
            t2 = $('.ui-slide:first', target)
    }

    if (!t1.length || !t2.length || t1.is(t2))
        return false;

    var vp = t1.parent();
    vp.height(vp.height());
    vp.width(vp.width());

    t1.fadeOut(speed);

    t2 = t2.show().wrap(wrapper).parent();
    t2.css({top: t1.offset().top, width: t1.width(), minHeight: t1.height()}).show('slide', {direction: direction}, speed, function() {
        t2.children().unwrap()
    });
    return false;
}

function addScrollBars(set){
    $.each(set,function() {
        var that = $(this);
        if(that.getNiceScroll().length){
            that.getNiceScroll().resize();
            return true;
        }
        that.children().wrapAll('<div class="scrollable"></div>').end()
        .niceScroll($('.scrollable', this)[0], {
            autohidemode: true,
            cursoropacitymin: 0.25,
            cursoropacitymax: 0.8,
            hidecursordelay: 1000,
            cursorborder: '',
            cursorborderradius: '',
            background: '',
            cursorcolor: ''
        })
    });
}
