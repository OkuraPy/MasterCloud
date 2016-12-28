if ($('#slides .pull-left').length > 4) {
    //divide slides to groups of 4
    var i = 0;
    for (i = 0; i < $('#slides .pull-left').length / 4; i++) {
        $('#slides .pull-left').slice(i * 4, (i * 4) + 4).wrapAll('<div class="slide"></div>').parent().append('<div class="clear"></div>');
    }
    $('#slides').slides({
        generatePagination: true,
        generateNextPrev: false,
        container: 'suggested-products',
        paginationClass: 'slides_pagination',
        start: 1
    });
}