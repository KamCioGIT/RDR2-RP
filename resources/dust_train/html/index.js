var _hour = 0
var _minute = 0
var show = false
var table_road = {}
var table_road_table = {}
$(document).keydown(function(e){
	var close = 27;
	switch (e.keyCode) {
		case close:
			$.post('http://gum_train/hide')
        break;
	}
});
$(function() {
    function display2(bool) {
        if (bool) {
            $("#container").show();
            $("#timetable").show();
            $("#show_route").hide();
        } else {
            $("#container").hide();
            $("#timetable").hide();
            $("#show_route").hide();
        }
    }

    function display3(bool) {
        if (bool) {
            $("#show_route").show();
            $("#long").show();
            $("#medium").show();
            $("#short").show();
        } else {
            $("#show_route").hide();
            $("#long").hide();
            $("#medium").hide();
            $("#short").hide();
        }
    }

    display2(false)
    display3(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "start_train_mission") {
            if (item.status == true) {
                display2(true)
                set_information(item.nextstation, item.time, item.finish)
            } else {
                table_road = {}
                table_road_table = {}
                display2(false)
            }
        }
        if (item.type === "show_route") {
            if (show == true) {
                display3(false)
                show = false
            } else{
                show = true
                console.log(item.table1, item.table2, item.table3)
                make_show_route(item.table1, item.table2, item.table3)
                display3(true)
            }
        }

        if (item.type === "hide") {
                display3(false)  
                show = false
            }
        if (item.type === "time_table_set") {
            make_timetable(item.time_table)
        }
        if (item.type === "train_update_menu") {
            if (item.what == "station") {
                update_info("station", item.data)
            }
            if (item.what == "time_finish") {
            }
            if (item.what == "speed") {
                update_info("speed", item.data)
            }
            if (item.what == "time") {
                update_info("time", item.data)
            }
        }
    })
})

function update_info(what, data){
    if (what == "station") {
        document.getElementById("station").innerHTML = "Stanice : "+data;
    }else if (what == "speed") {
        document.getElementById("speed").innerHTML = "Rychlost : "+Math.floor(data * 100) / 100+" km/h";
    }else if (what == "time") {
        document.getElementById("time").innerHTML = "Čas : "+data;
    }
}

function make_timetable(timetable){
    const time_tables = document.getElementById('timetable');
    table_road = ''
    table_road += '</br></br></br>'
    table_road += '<div id="item"><center><b>Jizdní řád</b></center></div>'
    for (var i in timetable) {
        table_road += '<div id="item"><b>'+ timetable[i].hour+":"+timetable[i].minute+' | '+ timetable[i].station+'</b></div>'
    }
    time_tables.innerHTML = table_road
}
function make_show_route(table1, table2, table3){
    const timeTable1 = document.getElementById('long');
    roadTable1 = '';
    roadTable1 += '<div id="item"><center><b><u>Dlouhá</u></b></center></div>'
    if (table1 !== undefined) {
        for (var i in table1) {
            roadTable1 += '<div id="item2"><b>'+ table1[i].hour+":"+table1[i].minute+' | '+ table1[i].station+'</b></div>'
        }
    } else {
        roadTable1 += '<div id="item2">Momentálně nejede</div>' 
    }
    timeTable1.innerHTML = roadTable1

    const timeTable2 = document.getElementById('medium');
    roadTable2 = '';
    roadTable2 += '<div id="item"><center><b><u>Valentine</u></b></center></div>'
    if (table2 !== undefined) {
        for (var i in table2) {
            roadTable2 += '<div id="item2"><b>'+ table2[i].hour+":"+table2[i].minute+' | '+ table2[i].station+'</b></div>'
        }
    } else {
        roadTable2 += '<div id="item2">Momentálně nejede</div>' 
    }
    timeTable2.innerHTML = roadTable2

    const timeTable3 = document.getElementById('short');
    roadTable3 = '';
    roadTable3 += '<div id="item"><center><b><u>Emerald</u></b></center></div>'
    if (table3 !== undefined) {
        for (var i in table3) {
            roadTable3 += '<div id="item2"><b>'+ table3[i].hour+":"+table3[i].minute+' | '+ table3[i].station+'</b></div>'
        }
    } else {
        roadTable3 += '<div id="item2">Momentálně nejede</div>' 
    }
    timeTable3.innerHTML = roadTable3
}

function set_information(station, time, finish_time){
    document.getElementById("station").innerHTML = "Stanice : "+station;
    document.getElementById("time").innerHTML = "Čas : "+time;
    document.getElementById("speed").innerHTML = "Rychlost : 0 km/h";
}

