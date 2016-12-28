$.pnotify.defaults.history = false;
$.pnotify.defaults.stack.firstpos1 = 60;

$(function() {
    
    //fold on click even if :hover
    var aside = $('#main-side'),
        asidelast = aside.children(':last'),
        logout = $('#page > #logout'),
        section = $('#main-section'),
        hovertime = 0;

    if (section.height() < aside.outerHeight())
        section.css('min-height', (aside.outerHeight() + 10) + 'px');


    function sidehover() {
        var status = aside.data('focusin') | aside.data('hovering');
        if (status) {
            aside.addClass('hover');
            logout.addClass('hover');
            clearTimeout(hovertime)
            var h = $('#page').height() - logout.outerHeight();
            aside.height(h)
            asidelast.height(h - asidelast.position().top)
        } else {
            aside.removeClass('hover');
            logout.removeClass('hover');
            hovertime = setTimeout(function() {
                aside.height('').children(':last');
                asidelast.height('');
            }, 200)
        }
    }

    aside.add(logout).mouseenter(function() {
        if (!$('#page').hasClass('unfold')) {
            aside.data('hovering', true)
            sidehover()
        }
    }).mouseleave(function() {
        aside.data('hovering', false)
        sidehover()
    })

    // active menu item
    aside.find('nav li').click(function() {
        $('#main-side nav li').removeClass('active');
        $(this).addClass('active');
    });

    aside.find('header').click(function() {
        if ($('#page').is('.force-fold'))
            return false;
        if ($('#page').hasClass('unfold')) {
            $('#page').removeClass('unfold');
        } else {
            $('#page').addClass('unfold');
        }
        aside.removeClass('hover');
        $.cookie('ui', !($.cookie('ui') == "true"), {path: '/'});
    })
    
    // right menu
    $('#main-section #right_menu_btn').click(function() {
        if($('#page').is('.force-fold'))
            return false;
        if($('#main-section').hasClass('unfold_rmenu')){
            $('#main-section').removeClass('unfold_rmenu');
        }else{
            $('#main-section').addClass('unfold_rmenu');
        }
    })
        // main section height
       $('#main-section').css({minHeight: $('#main-side nav').height()})
       // alert($('#main-side nav').height());
       // right_menu height
       if($('#page').hasClass('unfold')){
            $('#right_menu').css({minHeight: $('#main-side').height()+150})
       }else{
            $('#right_menu').css({minHeight: $('#main-side').height()+150})
       }
      
 

    var header_serach_subm = false;
    
    $('#main-search > a').click(function() {
        var that = $(this);
        that.next('.dropdown').children('a').attr('href', that.attr('href')).html(that.text() + ' <span class="caret"></span>');
        return false;
    });
    
    $('#main-search input').bind('keyup submit', function(e) {
        if ((e.type == 'keyup' && e.keyCode != 13) || header_serach_subm) {
            return false;
        }
        
        header_serach_subm = true;
        var form = $('#main-search form[action="' + $('#main-search a.dropdown-toggle').attr('href') + '"]');
        if (form.length) {
            form.find('.search-field').val($(this).val());
            form.submit();
        }
        return false;
    });
    

    $(".login-widget").click(function() {
        var widget = $('#login-widget');
        if (widget.length) {
            $('#page').hide();
            widget.fadeIn().unbind('click').click(function(e) {
                var target = $(e.target);
                if (target.is(this) || target.is('#login-widget-close') || target.parents('#login-widget-close').length) {
                    $(this).fadeOut();
                    $('#page').show();
                }
            });
            ;
            return false;
        }

    });

    $('#board-services .nav-tabs a').click(function(e) {
        e.preventDefault();
        var that = $(this);
         $('#board-services .nav-tabs li').removeClass('active');
        that.parent().addClass('active');
        tableSplitToPages('#board-services', 'tr.' + that.attr('href').replace(/.*?#/, '_'));
    }).each(function() {
        var self = $(this),
            selpr = self.parent();
        // if (selpr.prev().length && selpr.prev().offset().top < selpr.offset().top) {
        //     var elems = selpr.prev().nextAll().andSelf(),
        //         li = $('<li><div class="dropdown dropdown-nav"><a href="#" data-toggle="dropdown" data-contener="#board-services"><i class="icon-cloud icon-large"></i></a></div></li>')
        //         .insertBefore(selpr);
        //     $('<ul id="board-services-more" class="dropdown-menu"></ul>').append(elems.detach()).appendTo(li.find('.dropdown'));
        //     //li.children('a').dropdown();
        //     return false;
        // }
    });

    $('#board-tickets .ticket-view').css('min-height', $('#board-tickets .bottom-border-nav').height())
    $('#board-tickets').on('click', '.ticket-list a', function(e) {
        e.preventDefault();
        var url = $(this).attr('href'),
            list = $('#board-tickets .ticket-list'),
            view = $('#board-tickets .ticket-view'),
            active = list.find('a[href="' + url + '"]:visible');

        $.get(url, function(data) {
            data = parse_response(data);
            if (data.length) {
                view.stop().html(data).animate({opacity: 1}, 150);
                addScrollBars(view.find('.content-scroll'));
            }
        })
        if (active.length) {
            active = active.parent();
            var scrollpos = active.prevAll(':visible').length * active.height(),
                scroloffset = list.getNiceScroll()[0].newscrolly || 0;

            active.addClass('active').siblings('.active').removeClass('active');
            view.animate({opacity: 0.2}, 500);
            if (scrollpos >= scroloffset + list.height()) {
                list.getNiceScroll().doScrollPos(0, scrollpos - list.height() + active.height(), 300);
            } else if (scrollpos < scroloffset) {
                list.getNiceScroll().doScrollPos(0, scrollpos, 300);
            }
        }
        return false;
    });

    $('.progress-button').progressbutton({
        statusTime: 1500,
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
    if ($('.content-scroll').length)
        addScrollBars($('.content-scroll'));
    if ($('#board-services').length)
        tableSplitToPages('#board-services', 'tr');
    if ($('#board-invoices').length)
        tableSplitToPages('#board-invoices');
    if ($('#support-tickets').length)
        tableSplitToPages('#support-tickets');

    $('.slide-left, .slide-right', '#board-services').click(calback_slides);
    $('.slide-left, .slide-right', '#board-invoices').click(calback_slides);
    $('.slide-left, .slide-right', '#support-tickets').click(calback_slides);

    $(document).on('click.dropdown.data-api', '[data-toggle=dropdown][data-contener]', function(e) {
        var self = $(this),
            parent = self.parent(),
            target = $(e.target)

        if (target.is('.dropdown-clone') || target.parents('.dropdown-clone').length) {
            return false;
        }

        var clone = parent.clone(true).css({
            position: 'absolute',
            top: 0,
            left: 0
        }).addClass('not-cart dropdown-clone').data('dropdown-clone', parent).appendTo(self.data('contener'));

        clone.children().each(function(i) {
            var org = parent.children().eq(i),
                elm = $(this);
            elm.css('position', 'absolute').css(org.offset()).width(org.width()).height(org.height())
        });

        clone.on('click', 'a', function() {
            clone.data('dropdown-clone').css({visibility: 'visible'});
            clone.remove();
        })
        parent.css({visibility: 'hidden'})
    }).on('click.dropdown.data-api', function() {
        $('[data-toggle=dropdown][data-contener]').each(function() {
            var self = $(this).parent();
            if (self.data('dropdown-clone')) {
                self.data('dropdown-clone').css({visibility: 'visible'});
                self.remove();
            }

        })
    });

    //sorting & tabs
    $(document).on('click', '[data-sorter]', function(e) {
        e.preventDefault();
        var self = $(this),
            list = $('#currentlist'),
            url = list.attr('href'),
            sortkey = self.data('sorter'),
            sortval = self.attr('href'),
            valmatch = sortval.match(new RegExp('[&?]?' + sortkey.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&") + '(=[^&]*)?'));
        if (valmatch) {
            sortval = valmatch[1] || '';
            url = url.replace(new RegExp('[&?]?' + sortkey.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&") + '(=[^&]*)?'), '') + '&' + sortkey + '=' + sortval.replace(/.*?=/, '');
        } else {
            url = url.replace(new RegExp('[&?]?' + sortkey.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&") + '(=[^&]*)?'), '') + '&' + sortkey + '=' + sortval.replace(/.*?#/, '');
        }

        list.attr('href', url);
        $('#updater').addLoader();
        ajax_update(url, {}, '#updater');

        if (sortkey == 'orderby') {
            if (url.match(/\|ASC$/)) {
                self.addClass('desc').removeClass('asc').attr('href', url.replace(/\|ASC$/, '|DESC'));
            } else {
                self.addClass('asc').removeClass('desc').attr('href', url.replace(/\|DESC$/, '|ASC'));
            }
        }

        self.parent().siblings('.active').removeClass('active').end().addClass('active');
        return false;
    })
});

$(window).load(function() {
    $('#board-invoices').css({minHeight: $('#quick-links').height()});
    $('#support-tickets').css({minHeight: $('#quick-links').height()});
});

function tableSplitToPages(target, filter, number) {
    filter = filter || 'tbody tr';
    number = number || 3;
    var vclass = $('table', target).attr('class').replace(/ ?ui-slide-?.* ?/, ''),
        table = null,
        pages = 0;

    $('table', target).hide().removeClass('ui-slide').addClass('ui-slide-disabled')
        .find(filter).each(function(i) {
        if (i % number == 0) {
            table = $('<table class="' + vclass + '"></table>').addClass('ui-slide')
                .insertAfter($('table:last', target));
            if (i > 0)
                table.hide();
            pages++;
        }
        $(this).show().detach().appendTo(table);
    });
    $('table', target).each(function() {
        var that = $(this);
        if (that.find('th').length)
            that.show();
        if (!that.find('tr').length)
            that.remove();
    });
    $('.page-current', target).text(1);
    $('.page-total', target).text(pages)
    for (var i = 1; i <= pages; i++) {
        $('.table_bottom pull-left').append('<span>' + i + '<span>')
    };
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

    var vp = t1.parent(),
        page = t2.prevAll('.ui-slide').length + 1;
    vp.height(vp.height());
    vp.width(vp.width());

    t1.fadeOut(speed);

    t2 = t2.show().wrap(wrapper).parent();
    console.log(t1,t2);
    t2.css({top: t1.offset().top, width: t1.width(), minHeight: t1.height()})
        .show('slide', {direction: direction}, speed, function() {
            t2.children().unwrap()
        });

    $('.page-current', target).text(page);
    return false;
}

function addScrollBars(set) {
    $.each(set, function() {
        var that = $(this);
        if (that.getNiceScroll().length) {
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
