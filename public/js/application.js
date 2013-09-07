$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
   var n = 1
   $('#new_q').on('click', function(event){
      event.preventDefault();
      $('<ul class="question_white"><input class="centerwrap" placeholder="Enter Question" type="text" name="survey[prompts][' + n + ']"' + '/></ul><hr>').appendTo("form#survey_form");
      n++
   });

  // $('li#remove').click.find('ul.question_white').remove();   
});
