//Global variabels 
var postname;

function loadInbox(list){
    $('#inboxList').empty();
    if(list.length > 0) {
        list.forEach(function(letter){
            var sentTime = new Date(letter.sentTime); // Convertir la date en objet Date
            sentTime.setHours(sentTime.getHours() + 1); // Ajuster le décalage horaire de +2 heures
            var isoDate = sentTime.toISOString().slice(0, -8);

            isoDatestr = isoDate.replace("2023","1885");
            isoDatenew = isoDatestr.replace("2024","1886");
            isoDategood = isoDatenew.replace("T"," / ");
            if(letter.status == 1){
                $("#inboxList").append(`<li class="inbox_row" data-id="`+letter.id+`"><div class="inbox_subject"><i class="fa fa-envelope-open"></i><p> `+letter.subject+`</p></div><div class="inbox_sender">`+letter.sender+`</div><div class="inbox_date">`+isoDategood+`</div></li>`);
            }else{
                $("#inboxList").append(`<li class="inbox_row" data-id="`+letter.id+`"><div class="inbox_subject"><i class="fa fa-envelope"></i> <p><b>`+letter.subject+`</b></p></div><div class="inbox_sender">`+letter.sender+`</div><div class="inbox_date">`+isoDategood+`</div></li>`);
            }
        });
    }
}
//Close view Or compose
$(".close_view").on("click", function () {
    $(".view").fadeOut().hide();
    $('.view').css('display', 'none')
    $.post('http://dust_telegram/NUIFocusOff', JSON.stringify({}));
});
//Compose button
$(".composetelegram").on("click",function(){
    $(".compose").fadeIn().show();
    $(".inbox").fadeOut().hide();
});
//Close post office
$(".closePostoffice").on("click",function(){
    $.post('http://dust_telegram/NUIFocusOff', JSON.stringify({}));
});
//Form 
$("#composeForm").submit(function(e){
    e.preventDefault(); // Prevent form from submitting
    //Send 
    var sender = $("#sender").val();
    var recipientlastname = $("#recipientlastname").val();
    var recipientfirstname = $("#recipientfirstname").val();
    var subject =  $("#subject").val();
    var message = $("#message").val();
    
    $.post('http://dust_telegram/sendTelegram', JSON.stringify({sender:sender,recipientlastname:recipientlastname,recipientfirstname:recipientfirstname,subject:subject,message:message,postoffice:postname}));
    //Reset form
    $("#sender").val('');
    $("#recipientlastname").val('');
    $("#recipientfirstname").val('');
    $("#subject").val('');
    $("#message").val('');
    //Close form 
    $(".compose").fadeOut().hide();
    //Show inbox
    $(".inbox").fadeIn().show();

});

$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.type === "openGeneral") {
            postname = event.data.postname;
            $('.inbox').css('display', 'block');
            $('#postname').text(postname)
        
            var isoDate = new Date().toISOString().split('T')[0];
            isoDatestr = isoDate.replace("2023","1885");
            isoDatenew = isoDatestr.replace("2024","1886");
            $('#today').text(isoDatenew);
        
        }
        if(event.data.type === "view"){
            $('.view').css('display', 'block')
            var isoDate = new Date(event.data.telegram.sentTime).toISOString().slice(0, -8);
            isoDatestr = isoDate.replace("2023","1885");
            isoDatenew = isoDatestr.replace("2024","1886");
            isoDategood = isoDatenew.replace("T","  / ");
            $("#view_recipient").text(event.data.telegram.recipient)
            $("#view_sender").text(event.data.telegram.sender)
            $("#view_date").text(isoDategood)
            $("#view_subject").text(event.data.telegram.subject)
            $("#view_message").text(event.data.telegram.message)
            $("#view_id").text(event.data.telegram.postoffice)
        }
        if(event.data.type === "inboxlist"){
            loadInbox(event.data.response.list);
            $('#firstname').text(event.data.response.firstname);
            $("#postbox").text(event.data.response.box)
        }
        if (event.data.type === "closeAll") {
            $('.inbox').css('display', 'none')
            $('.compose').css('display', 'none')
            $('.view').css('display', 'none')
        }
    });
//View
});

$(document).ready(function(){
    $("#inboxList").on("click",'li',function(event){
        itemToDel = $(this).data('id');
        $.post('http://dust_telegram/getview', JSON.stringify({id: $(this).data('id')}));
        $('.inbox').css('display', 'none')
        $('.compose').css('display', 'none')
        $('.view').css('display', 'none')
    });
});

$(".telegram_delete_button").click(function(event){
    $.post('http://dust_telegram/delete', JSON.stringify({id: itemToDel}));
    $(".inbox").fadeIn().show();
    $(".view").fadeOut().hide();
});

document.keyup = function (data) {
    if (data.which == 27) {
        $.post('http://dust_telegram/NUIFocusOff', JSON.stringify({}));
    }
}