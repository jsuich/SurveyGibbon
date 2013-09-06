$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
   $('#new_q').on('click' function(event){
      $('form#survey_form').append("<input type="text" name="survey[:prompt]">");
   });
});
