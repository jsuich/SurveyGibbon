$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
   $('#new_q').on('click', function(event){
      event.preventDefault();
      $('<div class="question_white"><input class="centerwrap" placeholder="Enter Question" type="text" name="survey[:prompt]" /></div><hr>').appendTo("form#survey_form");
   });
});
