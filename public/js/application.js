$(document).ready(function() {

    var n = 1
    var mc = 1
    $("#sortable").sortable({
        revert: true,
        items: "li:not(.donotsortme)",
        stop: function(event, ui) {
            ui.item.children('input.ad').attr('name', "survey[prompts][" + n + "]");
            ui.item.children('input.ad1').attr('name', "radios[prompts][" + n + "]");
            // console.log(ui.item)
            // console.log(ui.item.children(".one_radio"))

            ui.item.children(".one_radio").each(function(){
                $(this).attr('name', "radios[prompts][" + n + "][" + mc + "]");
                mc++;
            });
            
            // ui.item.children('input.ad1').children('input.one_radio').attr('name', "radio[prompts][" + r + "][" + mc + "]");         
            ui.item.children('input.ad').attr('placeholder', "Enter Question...")
            ui.item.css('width', '100%');
            ui.item.children('input.ad1').attr('placeholder', "Enter Question...")
            ui.item.children(1).css('margin', '0');
            ui.item.children('input.ad').css({
                'width': '99.8%',
                'background' : 'rgba(251,251,251,1)'
            });
            ui.item.children('input.ad1').css({
                'width': '99.8%',
                'background' : 'rgba(251,251,251,1)'
                });
            ui.item.children('a#gen_radio').css({
                "display": "inline-block",
                "width": "10%",
                "background": "rgba(5, 130, 85, 1)",
                "border": "1px solid rgba(21, 21, 21, 0.9)"
            });
            ui.item.children('input.one_radio').css({
                "display" : "inline-block",
                "margin" : "10px",
                "background" : "rgba(21, 21, 21, 0.5)"
            });
            ui.item.children('input.one_radio').css({
               "margin" : "10px",
               "width" : "40%" 
            })    
            ui.item.css('border', '1px solid rgba(5,130,85,0.7)');
            ui.item.css('margin-bottom', '30px');

            n++;
            // if (ui.item.children(1))
        }
    });

    $("#draggable, #draggable_3, #draggable_2").draggable({
        connectToSortable: "#sortable",
        helper: "clone",
        revert: "invalid",
    });



    $("ul, li").disableSelection();

    $('#gen_radio').on('click', function(ui){
        $()
    });

    // $('li#remove').click.find('ul.question_white').remove();   
});
