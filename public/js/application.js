$(document).ready(function() {

    var n = 1

    $("#sortable").sortable({
        revert: true,
        items: "li:not(.donotsortme)",
        stop: function(ui, event) {
            event.item.children(1).attr('name', "survey[prompts][" + n + "]");
            event.item.children('input.ad', 'input.ad1').attr('placeholder', "Enter Question...")
            event.item.children('input.ad1').attr('placeholder', "Enter Question...")
            event.item.children(1).css('margin', '0');
            event.item.children('input.ad').css('width', '100%');
            event.item.children('input.ad1').css('width', '86%');
            event.item.children('a#gen_radio').css({
                "display": "inline-block",
                "width": "10%",
                "background": "rgba(5, 130, 85, 1)",
                "border": "1px solid rgba(21, 21, 21, 0.9)"
            });
            event.item.css('border', '1px solid rgba(5,130,85,0.7)');
            event.item.css('margin-bottom', '30px');
            event.item.children(1).css('background', 'rgba(251,251,251,1)');
            event.item.css('width', '100%');
            n++;
        }
    });

    $("#draggable, #draggable_3, #draggable_2").draggable({
        connectToSortable: "#sortable",
        helper: "clone",
        revert: "invalid",
    });

    $("#draggable_2").draggable({
        stop: function(ui, event) {
            event.item.append('<a id="gen_radio" href="#">Add Choice</a>');
        }
    });

    $("ul, li").disableSelection();

    // $('li#remove').click.find('ul.question_white').remove();   
});