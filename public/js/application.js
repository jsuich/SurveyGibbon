$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
   var n = 1
   // $('.formoption').on('drop', function(event){
   //    event.preventDefault();
   //    // $('<ul class="question_white"><input class="centerwrap" placeholder="Enter Question" type="text" name="survey[prompts][' + n + ']"' + '/></ul><hr>').appendTo("form#survey_form");
   //    $('').appendTo("form#survey_form");
   //    n++
   // });
  
    $("#sortable").sortable({
      revert: true
    });

    $("#draggable").draggable({
      connectToSortable: "#sortable",
      helper: "clone",
      revert: "invalid"
    });
    $("#draggable_2").draggable({
      connectToSortable: "#sortable",
      helper: "clone",
      revert: "invalid"
    });
    $("#draggable_3").draggable({
      connectToSortable: "#sortable",
      helper: "clone",
      revert: "invalid"
    });
    
    $( "ul, li" ).disableSelection();

    $('#build_survey').click(function(event) {
      $event.preventDefault();
      $('')
    });


  
  // $('li#remove').click.find('ul.question_white').remove();   
});
