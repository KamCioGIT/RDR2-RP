var elem = document.getElementById("myButton1");
var displayed = false
btn = document.createElement("img");

$(document).keydown(function(e){
	var close = 27, close2 = 8;
	switch (e.keyCode) {
		case close:
            $("#containerForData").fadeOut(600);
            $("#textLink").fadeOut(600);
			$.post('http://gum_posters/exit')
            $("#positionForImage").hide();
            $("#previewImage").hide();
            displayed = false
            break;

	}
});


$(function () {
    function display(bool) {
        if (bool) {
            $("#containerForData").animate({ opacity: 1 }, 5);
            $("#containerForData").fadeIn(600);
            $("#textLink").fadeIn(600);
        } else {
            $("#containerForData").fadeOut(450);
            $("#textLink").fadeOut(450);
            $("#positionForImage").hide();
        }
    }

    $("#positionForImage").hide();
    display(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.display == true) {
                document.getElementById("previewImage").style.backgroundImage = "url('images/placeholder.png')";
                display(true)
                loadTableData(item.icName, item.table, item.job, item.placeJob, item.configJob)
                displayed = true
            } else {
                display(false)
                displayed = false
            }
        }

    })
    $("#textLink").keyup(function(event) {
        if (event.keyCode === 13) {
            pinMeOnBoard()
            $("#containerForData").animate({ opacity: 1.00 }, 250);
        }
    });

})

function pinMeOnBoard() {
    if (document.getElementById('textLink').value !== "") {
        var text = document.getElementById('textLink').value;
        let position = text.search("http");
        if (position !== -1) {
            const d = new Date();
            let time = d.getTime();
            $.post('http://gum_posters/pinMeOnBoard', JSON.stringify({
                link: document.getElementById('textLink').value,
                time: time
            }))
            document.getElementById('textLink').value = ""
        }
    }
}
function loadTableData(icName, table, job, placeJob, configJob){
    if (configJob == true) {
        if (placeJob == true) {
            $("#textLink").show();
        } else {
            $("#textLink").hide();
        }
    }

    const tableBody = document.getElementById('containerForData');
    let dataHtml = '';

    for(var i in table){
        if (icName == true) {
            dataHtml += '<div id="posterSpecific" onmousedown="openImage(\''+table[i].poster_link+'\')"><img src="'+table[i].poster_link+'" width="100%" height="100%"><div id="name"><center><b>'+table[i].icName+'</b></center></div></div>'
        } else {
            dataHtml += '<div id="posterSpecific" onmousedown="openImage(\''+table[i].poster_link+'\')" ><img src="'+table[i].poster_link+'" width="100%" height="100%"></div>'
        }
    }

    tableBody.innerHTML = dataHtml
}

function changeMe() {
    if (displayed) {
        $("#previewImage").show();
        $("#containerForData").animate({ opacity: 0.45 }, 250);
        document.getElementById("previewImage").style.backgroundImage = "url('"+document.getElementById('textLink').value+"')";
    }
}

function openImage(link){
    if (window.event.which == 1) {
        $("#positionForImage").fadeIn(250);
        document.getElementById("positionForImage").style.backgroundImage = "url('"+link+"')";
        $("#containerForData").animate({ opacity: 0.45 }, 250);
    } else if (window.event.which == 3) {
        $.post('http://gum_posters/removePoster', JSON.stringify({
            link: link
        }))
    }
}

function hideMe() {
    $("#containerForData").animate({ opacity: 1 }, 250);
    $("#positionForImage").fadeOut(250);
}