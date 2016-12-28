(function ($) {

  $.fn.rating = function (half) {

    var element;
    this.useHalf = half || false;
    this.max = 5;
    this.min = 1;
    var r = this;
    // A private function to highlight a star corresponding to a given value
    function _paintValue(ratingInput, value) {
        
      var selectedStar = $(ratingInput).find('[data-value=' + Math.floor(value) + ']'),
          classes = 'icon-star icon-star-empty icon-star-half-empty';
      
      selectedStar.removeClass(classes).addClass(r.useHalf && Math.floor(value) == value ? 'icon-star-half-empty' : 'icon-star');
      selectedStar.prevAll('[data-value]').removeClass(classes).addClass('icon-star');
      selectedStar.nextAll('[data-value]').removeClass(classes).addClass('icon-star-empty');
    }

    // A private function to remove the highlight for a selected rating
    function _clearValue(ratingInput) {
      var self = $(ratingInput);
      self.find('[data-value]').removeClass('icon-star icon-star-half-empty').addClass('icon-star-empty');
    }

    // A private function to change the actual value to the hidden field
    function _updateValue(input, val) {
      input.val(val).trigger('change');
      if (val === input.data('empty-value')) {
        input.siblings('.rating-clear').hide();
      }
      else {
        input.siblings('.rating-clear').show();
      }
    }
    
    function _mouseover(e){
        var self = $(this),
            value = self.data('value');
        if(r.useHalf && e.clientX - self.offset().left > self.width()/2){
            value += 0.5;
        }
        _paintValue(self.parent(), value);
    }
    
    function _mouseleave () {
        _clearValue(this);
    }
      
    function _mouseclick (e) {
        e.preventDefault();
        var self = $(this),
            value = self.data('value');
            
        if(r.useHalf && e.clientX - self.offset().left < self.width()/2){
            value -= 0.5;
        }
        
        var input = self.parent().find('input'),
            data = [];
        
        input.val(value).end()
        .off('mousemove mouseleave click');
        
        if(input.data('id'))
            data.push(input.data('id'));
        if(input.data('hash'))
            data.push(input.data('hash'));
        $.post('?cmd=tickets&action=rate', {rate: r.useHalf  ? 2*value : value, data:data}, function(data){
            parse_response(data)
        })
        return false;
    }

    // Iterate and transform all selected inputs
    for (element = this.length - 1; element >= 0; element--) {

      var el, i,
        originalInput = $(this[element]),
        max = originalInput.data('max') || this.max,
        min = originalInput.data('min') || this.min,
        readOnly = originalInput.prop('readonly') || false,
        stars = '';

      // HTML element construction
      for (i = min; i <= max; i++) {
        // Create <max> empty stars
        stars += ['<i class="icon icon-star-empty" data-value="', i, '"></i>'].join('');
      }

      // Clone with data and events the original input to preserve any additional data and event bindings.
      var newInput = originalInput.clone(true)
        .attr('type', 'hidden')
        .data('max', max)
        .data('min', min);

      // Rating widget is wrapped inside a div
      el = [
        '<div class="rating-input">',
        stars,
        '</div>'].join('');

      // Replace original inputs HTML with the new one
      var ratingInput = $(el).append(newInput).addClass(originalInput.attr('class'));
      if(!readOnly){
          ratingInput.on('mousemove', '[data-value]', _mouseover)
          // View current value while mouse is out
          .on('mouseleave', _mouseleave)
          // Set the selected value to the hidden field
          .on('click', '[data-value]', _mouseclick);
      }else{
          ratingInput.addClass('read-only');
        _paintValue(ratingInput,originalInput.val() * (r.useHalf ? 0.5 : 1) + (r.useHalf ? 0.5 : 0))
      }
      originalInput.replaceWith(ratingInput);

    }
  };

  // Auto apply conversion of number fields with class 'rating' into rating-fields
  $(function () {
    if ($('input.rating[type=number]').length > 0) {
      $('input.rating[type=number]').rating();
    }
  });

}(jQuery));
