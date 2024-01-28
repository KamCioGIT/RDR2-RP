$(document).keydown(function(e){
	var close = 27, close2 = 8;
	switch (e.keyCode) {
		case close:
			$.post('http://gum_new_newspapers/exit')
            document.getElementById("ListButton").innerHTML = ""
		break;

		case close2:
            document.getElementById("ListButton").innerHTML = ""
            $.post('http://gum_new_newspapers/exit')
		break;
	}
});


$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }


    display(false)


    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "folder") {
            if (item.status == true) {
                display(true)
                var img = document.createElement("img");
                img.src = "/images/"+item.newspaper+"";
            
                var div = document.getElementById("x");
                div.appendChild(img);
            } else {
                display(false)
            }
        }
        if (item.type === "website") {
            if (item.status == true) {
                display(true)
                var img = document.createElement("img");
                img.src = item.newspaper;

                img.style.left = "-28px";
                img.style.top = "27px";
                img.style.width= "95%";
                var div = document.getElementById("ListButton");
                div.appendChild(img);
            } else {
                display(false)
            }
        }
    })

    $("#close").click(function () {
        $.post('http://gum_new_newspapers/exit', JSON.stringify({}));
        return
    })
})


