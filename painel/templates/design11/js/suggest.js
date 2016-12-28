if ($('#slides .pull-left').length > 2) {
    //divide slides to groups of 3
    var i = 0;
        divideby = 4;
    for (i = 0; i < $('#slides .pull-left').length / divideby; i++) {
        $('#slides .pull-left').slice(i * divideby, (i * divideby) + divideby).wrapAll('<div class="slide"></div>').parent().append('<div class="clear"></div>');
    }
    $('#slides').slides({
        generatePagination: true,
        generateNextPrev: false,
        container: 'suggested-products',
        paginationClass: 'slides_pagination',
        start: 1
    });
}