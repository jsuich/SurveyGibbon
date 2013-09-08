$(document).ready(function() {

  var n = 1

  $("#sortable").sortable({
    stop: function(ui, event){
      event.item.children(1).attr('name',"survey[prompts][" + n + "]");
      n++;
    }
  });

  $("#draggable, #draggable_2, #draggable_3").draggable({
    connectToSortable: "#sortable",
    helper: "clone",
    revert: "invalid",
  });
  
  $( "ul, li" ).disableSelection();

  // $('li#remove').click.find('ul.question_white').remove();   
});
