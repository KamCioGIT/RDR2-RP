$('#creatormenu').fadeOut(0);


window.addEventListener('message', function(event) {

    if (event.data.EnableCustom == "true") {
        $('#button-customization').removeClass("disabled");
    } else {
        $('#button-customization').addClass("disabled");
    }
    
});

function confirm(){
    $.post('http://LRP_Stable/CloseStable')

    $('#button-customization').addClass("disabled");
    $("#creatormenu").fadeOut(500);
}

var currentPage = 'page_myhorses';

$('.menu-selectb').on('click', function() {
    $(`#${currentPage}`).hide();

    currentPage = $(this).data('target');
    $(`#${currentPage}`).show();

    $('.menu-selectb.active').removeClass('active');
    $(this).addClass('active');
});

$(".button-right").on('click', function() {
    var inputElement = $(this).parent().find('input');
    var component = $(inputElement).attr('id');

    var value = Number($(inputElement).attr('value'));
    // value = Number(String.split(value, '/')[0]);
    var nValue = value + 1;

    var min = $(inputElement).attr('min');
    var max = $(inputElement).attr('max');

    if (nValue > max) {
        nValue = min;
    }

    $(inputElement).attr('value', nValue);

    var titleElement = $(this).parent().parent().find('.grey-text');
    var text = titleElement.text();
  //  var component = text.split(' ')[0];
    titleElement.text(component + ' ' + nValue + '/' + max);
    $.post('http://LRP_Stable/'+component, JSON.stringify({ id: nValue }));
});

$(".button-left").on('click', function() {
    var inputElement = $(this).parent().find('input');
    var component = $(inputElement).attr('id');

    var value = Number($(inputElement).attr('value'));
    // value = Number(String.split(value, '/')[0]);

    var nValue = value - 1;

    var min = $(inputElement).attr('min');
    var max = $(inputElement).attr('max');

    if (nValue < min) {
        nValue = max;
    }

    $(inputElement).attr('value', nValue);

    var titleElement = $(this).parent().parent().find('.grey-text');
    var text = titleElement.text();
  //  var component = text.split(' ')[0];
    titleElement.text(component + ' ' + nValue + '/' + max);
    $.post('http://LRP_Stable/'+component, JSON.stringify({ id: nValue }));
});

$(".input-number").on("change paste keyup", function() {

    var min = Number($(this).attr('min'));
    var max = Number($(this).attr('max'));

    var value = $(this).val();

    if (value == '' || value < min) {
        value = min;
        $(this).val(value);
    }

    if (value > max) {
        value = max;
        $(this).val(value);
    }

    var titleElement = $(this).parent().parent().find('.grey-text');
    var text = titleElement.text();    
    var component = text.split(' ')[0];
    
    titleElement.text(component + ' ' + value + '/' + max);

});
