var table = {}
var number = -1

$(document).keydown(function(e) {
    var close = 27, close2 = 8;
    switch (e.keyCode) {
        case close:
            number = -1
            document.getElementById("notepad_text").value = ""
            $.post('http://dust_notepad/exit')
        break;
    }
});

$(function() {
    function display2(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }
    display2(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "notepad") {
            if (item.status == true) {
                table = item.table
                display2(true)
            } else {
                number = -1
                document.getElementById("notepad_text").value = ""
                display2(false)
            }
        }
 
    })
})
function left() {
    console.log(number)
    for(key in table) {
        maxval = key
    }
    if (number >= 0 ) {
        number = number-1
    }
    change_me(number)
}
function right() {
    console.log(number)
    for(key in table) {
        maxval = key
    }
    if (number < maxval) {
        number = number+1
    }
    change_me(number)
}

function change_me(k) {
    if (k === -1){
        document.getElementById("notepad_text").value = ""
    } else if (k >= 0) {
        document.getElementById("notepad_text").value = table[k].notepad
    }
}
function save() {
    if (number === -1) {
        var value = document.getElementById("notepad_text").value
        $.post('http://dust_notepad/save_new', JSON.stringify({ value:value}));
    } else if (number !== -1) {
        var value = document.getElementById("notepad_text").value
        $.post('http://dust_notepad/save', JSON.stringify({ name: Number(table[number].id), value:value}));
    }
}
function delet() {
    if (number !== -1) {
        $.post('http://dust_notepad/delete', JSON.stringify({ name: Number(table[number].id)}));
    }
}
function send() {
    if (number !== -1) {
        var value = document.getElementById("notepad_text").value
        $.post('http://dust_notepad/send', JSON.stringify({ value:value}));
    }
}
