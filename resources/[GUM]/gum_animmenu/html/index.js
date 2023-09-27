var isOver = false 
$(document).keydown(function(e){
	var close = 27;
	switch (e.keyCode) {
		case close:
			$.post('http://gum_animmenu/exit')
        break;
	}
});

$(function () {
    function animMenu(bool) {
        if (bool) {
            $("#animMenu").show();
            $("#animMenuCont").show();
            $("#animInput").show();

            $("#propMenu").show();
            $("#propMenuCont").show();
            $("#propInput").show();

            $("#bindMenu").show();
            $("#bindMenuCont").show();
        
            $("#radialFavorite").show();
        } else {
            $("#animMenu").hide();
            $("#animMenuCont").hide();
            $("#animInput").hide();

            $("#propMenu").hide();
            $("#propMenuCont").hide();
            $("#propInput").hide();

            $("#bindMenu").hide();
            $("#bindMenuCont").hide();
            $("#radialFavorite").hide();
        }
    }
    animMenu(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "animMenu") {
            loadAnims(item.anims, item.props, item.myAnims)
            animMenu(true)
            searchFunction()
        }
        if (item.type === "animClose") {
            animMenu(false)
        }
        if (item.type === "rewriteFavorite") {
            setFavorite(item.id, item.text)
        }
    })
})

function useFavorite(e, num) {
    if (e.which === 1 || e.button === 0)
    {
        $.post('http://gum_animmenu/useFavorite', JSON.stringify({ number: num }));
    }

    if (e.which === 3 || e.button === 2)
    {
        $.post('http://gum_animmenu/cleanFavorite', JSON.stringify({ number: num }));
        cleanFavorite(num, num)
    }
}

function setFavorite(id, text) {
    var modifiedText = text.replace(/ /g, "_");
    var imageUrl = "nui://gum_animmenu/html/icon/" + modifiedText + ".png";
    var image = new Image();
    
    image.onload = function() {
      var htmlContent = "<div id='textCenter'><img src='" + imageUrl + "' width='100%' height='100%'></div>";
      document.getElementById(id).innerHTML = htmlContent;
    };
    
    image.onerror = function() {
      var htmlContent = "<div id='textCenter'>" + text + "</div>";
      document.getElementById(id).innerHTML = htmlContent;
    };
    
    image.src = imageUrl;
}

  
function cleanFavorite(id, text) {
    document.getElementById("favorite"+id).innerHTML = "<div id='textCenter'>"+text+"</div>"
}

function loadAnims(anims, propAnims, myAnims) {
    const tablePropBody = document.getElementById('propMenuCont');
    let dataPropHtml = '';//
    for (var i in propAnims) {
        dataPropHtml += '<li class="item" onclick="createProp(\''+propAnims[i].name+'\')"><a href="#">'+propAnims[i].name+'</a><div id="favorite" onmouseout="dHov()" onmouseover="eHov()" onclick="makeFavorite(\''+ propAnims[i].name +'\')"></div></div>'
    }
    tablePropBody.innerHTML = dataPropHtml

    const tableAnimBody = document.getElementById('animMenuCont');
    let dataAnimHtml = '';//
    for (var i in anims) {
        dataAnimHtml += '<li class="item" onclick="playAnim(\''+anims[i].name+'\')"><a href="#">'+anims[i].name+'</a><div id="favorite" onmouseout="dHov()" onmouseover="eHov()" onclick="makeFavorite(\''+ anims[i].name +'\')"></div></div>'
    }
    tableAnimBody.innerHTML = dataAnimHtml

    const tableBody = document.getElementById('bindMenuCont');
    let dataBindHtml = '';//
    for (var i in myAnims) {
        dataBindHtml += '<li class="item" id="animButtonReact" onclick="playAnim(\''+myAnims[i].text+'\')" oncontextmenu="deleteMe(\''+myAnims[i].text+'\')"><a href="#">'+myAnims[i].text+' || /a '+myAnims[i].command+'</a></div>'
    }
    tableBody.innerHTML = dataBindHtml
}

function eHov(){
    isOver = true 
}
function dHov() {
   isOver = false 
}

function deleteMe(anim) {
    $.post('http://gum_animmenu/deleteAnim', JSON.stringify({ text: anim }));
}
function makeFavorite(anim) {
    $.post('http://gum_animmenu/makeFavorite', JSON.stringify({ text: anim }));
}
function playAnim(anim){
    if (isOver === false) {
        $.post('http://gum_animmenu/playAnim', JSON.stringify({ text: anim }));
    }
}
function useToFavorite(anim) {
    $.post('http://gum_animmenu/useToFavorite', JSON.stringify({ text: anim }));
}
function createProp(anim){
    if (isOver === false) {
        $.post('http://gum_animmenu/createProp', JSON.stringify({ text: anim }));
    }
}