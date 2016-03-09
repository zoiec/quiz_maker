var answer_ready = function(event) {
  labels = $('.answer_choice .radio label');

  labels.children('input[checked]').closest('label').addClass('selected');

  labels.click(function(event) {
    labels.removeClass('selected');
    target = $(event.target);
    target.closest('label').addClass('selected');
    target.closest('form').submit();
  })

  labels.children('input[type="radio"]').focus(function(event) {
    $(event.target).closest('label').addClass('label-focus');
  }).blur(function(event) {
    $(event.target).closest('label').removeClass('label-focus');
  });
}

$(document).ready(answer_ready);
$(document).on('page:load', answer_ready);
