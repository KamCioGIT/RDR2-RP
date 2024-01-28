local blockMe = false
local speedCheck = 0.0
local blockSpeedForXxSecond = false
local giveBackTrain = false
local someOneGiveBackTrain = false
local trainTrace = 0
local trainTraceLoop = {}
local loopPosition = 0
local buttons_prompt = GetRandomIntInRange(0, 0xffffff)

TriggerEvent("gum_menu:getData",function(call)
    MenuData = call
end)

RegisterCommand("train", function(source, args, rawCommand)
    TriggerServerEvent("gum_train:check")
end)

RegisterNetEvent("gum_train:send_route")
AddEventHandler("gum_train:send_route", function(trainTable)
    local trainTable1 = nil
    local trainTable2 = nil
    local trainTable3 = nil
    for a,b in pairs(trainTable) do
        print(a,b)
        if tonumber(a) == 1 then
            trainTable1 = b
        end
        if tonumber(a) == 2 then
            trainTable2 = b
        end
        if tonumber(a) == 3 then
            trainTable3 = b
        end
    end
    
    print(trainTable1, trainTable2, trainTable3)
    SendNUIMessage({type = "show_route", table1=trainTable1, table2=trainTable2, table3=trainTable3})
    SetNuiFocus(true, true)
end)

RegisterNUICallback('hide', function(data,cb)
    SendNUIMessage({type = "hide"})
    SetNuiFocus(false, false)
end)

function routeTime()
	MenuData.CloseAll()
	local elements = {
		{label = "Dlouhá trasa", value = 'Big_Route',},
		{label = "Valentine trasa", value = 'Valentine',},
		{label = "Emerald trasa", value = 'Emerald',},
	}
   MenuData.Open('default', GetCurrentResourceName(), 'gum_train',
	{
		title    = 'Jízdní seznam',
		subtext    = 'Spis jíždních řádů',
		align    = 'top-right',
		elements = elements,
	},
	function(data, menu)
        if data.current.value == 'Big_Route' then
            TriggerServerEvent("gum_station:train_start", 1)
            menu.close()
        end
        if data.current.value == 'Valentine' then
            TriggerServerEvent("gum_station:train_start", 2)
            menu.close()
        end
        if data.current.value == 'Emerald' then
            TriggerServerEvent("gum_station:train_start", 3)
            menu.close()
        end
	end,
	function(data, menu)
		menu.close()
	end)  
end

RegisterCommand("testtrain", function()
    TriggerServerEvent("gum_station:train_start", 1)
end)

RegisterNetEvent("gum_station:train_start")
AddEventHandler("gum_station:train_start", function(state)
    trainStart(tonumber(state))
end)

RegisterNetEvent("gum_train:openMenu")
AddEventHandler("gum_train:openMenu", function(state)
    routeTime()
end)

local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
end}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end
      
      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)
      
      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
end
  
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
  
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
  
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end


function trainStart(trace)
    trainTrace = tonumber(trace)
    loopPosition = 1
    SpawnTrain()
    local stationForTrace = makeNewTrace()
    SendNUIMessage({type = "time_table_set", time_table=stationForTrace})
    SendNUIMessage({type = "start_train_mission", status=true, nextstation=trainTraceLoop[loopPosition].name, time=time_calculation(GetClockHours(), GetClockMinutes()), finish=time_calculation(GetClockHours(), GetClockMinutes()+trainTraceLoop[loopPosition].time)})
    TriggerServerEvent("gum_train:set_station", stationForTrace, trainTrace)
end


function SpawnTrain()
    local trainHash = 1365127661
    local trainWagons = N_0x635423d55ca84fc8(trainHash)
    for wagonIndex = 0, trainWagons - 1 do
        trainWagonModel = N_0x8df5f6a19f99f0d5(trainHash, wagonIndex)
        while not HasModelLoaded(trainWagonModel) do
            Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
            Citizen.Wait(100)
        end
    end
    local coords = GetEntityCoords(PlayerPedId())
    train = N_0xc239dbd9a57d2a71(trainHash, coords, 1, 0, 1, 1)
    TaskWarpPedIntoVehicle(PlayerPedId(), train, -1)
    SetEntityAsMissionEntity(train, true, true)
    SetTrainSpeed(train, 0.0)
    NetworkRegisterEntityAsNetworked(train)
    TriggerServerEvent("gum_station:train_id", NetworkGetNetworkIdFromEntity(train))
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
        DeleteEntity(train)
        train = nil
	end
end)

function time_calculation(hour, minute)
    local new_hour,new_minute = 0,0
    if tonumber(minute) >= 60 then
        new_hour= hour+1
        new_minute = minute-60
        if tonumber(new_minute) <= 9 then
            new_minute = "0"..new_minute
        end
    else
        new_hour= hour
        if tonumber(minute) <= 9 then
            new_minute = "0"..minute
        else
            new_minute = minute
        end
    end
    return new_hour..":"..new_minute
end

Citizen.CreateThread(function()
    buttonPrompt()
    for a,b in pairs(Config.Point) do
        for c,d in pairs(b) do
            local trainStation = N_0x554d9d53f696d002(1664425300, d[3], d[4], d[5])
            SetBlipSprite(trainStation, 4044460928, 1)
            SetBlipScale(trainStation, 0.1)
            Citizen.InvokeNative(0x9CB1A1623062F402, trainStation, "Vlakove nadrazi")
        end
    end
    while true do
        local optimize = 1000
        local coords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.TrainSchedule) do
            if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v[1], v[2], v[3], true) < 20.0 then
                optimize = 5
                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v[1], v[2], v[3]-1.1, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 0.4, 179, 166, 122, 155, 0, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v[1], v[2], v[3], true) < 2.0 then
                    PromptSetActiveGroupThisFrame(buttons_prompt, CreateVarString(10, 'LITERAL_STRING', "Jízdní řád"))
                    if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
                        TriggerServerEvent("gum_train:check")
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, 2383.017333984375, -1451.529052734375, 46.09829330444336, true) < 2.0 then
            optimize = 5
            PromptSetActiveGroupThisFrame(buttons_prompt, CreateVarString(10, 'LITERAL_STRING', "Správa vlaků"))
            if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
                TriggerServerEvent("gum_train:openMenu")
            end
        end
        Citizen.Wait(optimize)
    end
end)


RegisterNetEvent("gum_train:giveBackTrain")
AddEventHandler("gum_train:giveBackTrain", function(state)
    someOneGiveBackTrain = state
end)


Citizen.CreateThread(function()
    while true do
        if trainTraceLoop ~= nil then
            if train ~= nil then
                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(train), true) > 100.0 then
                    DeleteEntity(train)
                    TriggerServerEvent("gum_train:set_station", {}, trainTrace)
                    TriggerServerEvent("gum_station:train_clean", trainTrace)
                    loopPosition = 0
                    trainTrace = 0
                    trainTraceLoop = {}
                    SendNUIMessage({type = "start_train_mission", status = false})
                    train = nil
                end
            end
            for a,b in pairs(trainTraceLoop) do
                if tonumber(loopPosition) == tonumber(a) then
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), b.x, b.y, b.z, true) <= 200.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, b.x, b.y, b.z-2.5, 0, 0, 0, 0, 0, 0, 20.5, 20.5, 10.0, 255, 0, 0, 10, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), b.x, b.y, b.z, true) <= 20.0 then
                            local trainSpeed = GetEntitySpeed(train)
                            if trainSpeed == 0 then
                                loopPosition = loopPosition+1
                                blockSpeedForXxSecond = true
                                Citizen.Wait(5000)
                                blockSpeedForXxSecond = false
                                TriggerServerEvent("gum_train:give_money", tonumber((b.time*0.12)))
                                if trainTraceLoop[loopPosition] ~= nil then
                                    SendNUIMessage({type = "start_train_mission", status=true, nextstation=trainTraceLoop[loopPosition].name, time=time_calculation(GetClockHours(), GetClockMinutes()), finish=time_calculation(GetClockHours(), GetClockMinutes()+trainTraceLoop[loopPosition].time)})
                                end
                                if trainTraceLoop[loopPosition] == nil then
                                    TriggerEvent("guminputs:getAnswer", "Přeješ si pokračovat znovu? ", "Ano", "Ne", function(cb)
                                        local answer = cb
                                        if answer == true then
                                            loopPosition = 1
                                            local stationForTrace = makeNewTrace()
                                            SendNUIMessage({type = "time_table_set", time_table=stationForTrace})
                                            SendNUIMessage({type = "start_train_mission", status=true, nextstation=trainTraceLoop[loopPosition].name, time=time_calculation(GetClockHours(), GetClockMinutes()), finish=time_calculation(GetClockHours(), GetClockMinutes()+trainTraceLoop[loopPosition].time)})
                                        else
                                            TriggerServerEvent("gum_train:set_station", {}, trainTrace)
                                            TriggerServerEvent("gum_station:train_clean", trainTrace)
                                            loopPosition = 0
                                            trainTrace = 0
                                            trainTraceLoop = {}
                                            giveBackTrain = true
                                            TriggerServerEvent("gum_train:giveBackTrain", true)
                                            SendNUIMessage({type = "start_train_mission", status = false})
                                        end
                                    end)
                                end
                                Citizen.Wait(1000)
                            end
                        end
                    end
                end
            end
            if train_prompt2 then
                train_prompt2:delete()
            end
            local pedInTrain = GetVehiclePedIsIn(PlayerPedId(), false)
            if pedInTrain ~= 0 then
                local speed = GetEntitySpeed(train)
                if speed >= 7.0 and speed <= 11.0 then
                    train_prompt2 = Uiprompt:new(`INPUT_CONTEXT_B`, "Max and Pin", promptGroup)
                    train_prompt2:setHoldMode(true)
                    if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x0522B243) then
                        if blockMe == false then
                            blockMe = true
                            for i=1, 70 do
                                speedCheck = GetEntitySpeed(train)
                                SetTrainSpeed(train, 8.0+(i/10))
                                Citizen.Wait(100)
                            end
                            blockMe = false
                        end
                    end
                end
                if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x339F3730) then
                    if speedCheck ~= 0 then
                        speedCheck = 0
                    end
                end
                if speedCheck ~= 0.0 then
                    SetTrainSpeed(train, speedCheck)
                end
            end
            if giveBackTrain == true then
                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2491.03857421875,-1477.0634765625,45.9813346862793, true) <= 200.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, 2491.03857421875,-1477.0634765625,45.9813346862793-2.5, 0, 0, 0, 0, 0, 0, 20.5, 20.5, 10.0, 255, 0, 0, 10, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2491.03857421875,-1477.0634765625,45.9813346862793, true) <= 20.0 then
                        giveBackTrain = false
                        DeleteEntity(train)
                        train = nil
                        TriggerServerEvent("gum_train:giveBackTrain", false)
                        Citizen.Wait(500)
                    end
                end
            end
        end
        if someOneGiveBackTrain == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, 2391.689453125,-1431.3079833984375,45.90558624267578-2.5, 0, 0, 0, 0, 0, 0, 10.0, 10.0, 10.0, 0, 0, 255, 10, 0, 0, 2, 0, 0, 0, 0)
        end
        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if loopPosition >= 0 then
            local __speed = GetEntitySpeed(train)
            SendNUIMessage({type = "train_update_menu", what = "time", data = time_calculation(GetClockHours(), GetClockMinutes()) })
            SendNUIMessage({type = "train_update_menu", what = "speed", data = __speed })
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if blockSpeedForXxSecond == true then
            DisableControlAction(0, 0xFF3626FC, true)
            DisableControlAction(0, 0x2D79D80A, true)
        end
        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    while true do
        local optimize = 1000
        local coords = GetEntityCoords(PlayerPedId())
        if tonumber(trainTrace) == 1 then
            optimize = 10
            for a,b in pairs(Config.Train) do
                if a == "Big" then
                    for c,d in pairs(b) do
                        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, d[1], d[2], d[3], true) < 20.0 then
                            for i=1, 20 do
                                Citizen.InvokeNative(0xE6C5E2125EB210C1, d[5], i, d[7])
                                Citizen.InvokeNative(0x3ABFA128F5BF5A70, d[5], i, d[7])
                            end
                        end
                    end
                end
            end
        elseif tonumber(trainTrace) == 2 then
            optimize = 10
            for a,b in pairs(Config.Train) do
                if a == "Medium" then
                    for c,d in pairs(b) do
                        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, d[1], d[2], d[3], true) < 20.0 then
                            for i=1, 20 do
                                Citizen.InvokeNative(0xE6C5E2125EB210C1, d[5], i, d[7])
                                Citizen.InvokeNative(0x3ABFA128F5BF5A70, d[5], i, d[7])
                            end
                        end
                    end
                end
            end
        elseif tonumber(trainTrace) == 3 then
            optimize = 10
            for a,b in pairs(Config.Train) do
                if a == "Short" then
                    for c,d in pairs(b) do
                        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, d[1], d[2], d[3], true) < 20.0 then
                            for i=1, 20 do
                                Citizen.InvokeNative(0xE6C5E2125EB210C1, d[5], i, d[7])
                                Citizen.InvokeNative(0x3ABFA128F5BF5A70, d[5], i, d[7])
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(optimize)
    end
end)

function timeCalculationNew(minute)
    if tonumber(minute) >= 60 then
        new_minute = tonumber(minute)-60
        if tonumber(new_minute) <= 9 then
            new_minute = "0"..math.floor(new_minute)
        end
    else
        if tonumber(minute) <= 9 then
            new_minute = "0"..math.floor(minute)
        else
            new_minute = minute
        end
    end
    return new_minute
end


function makeNewTrace() 
    local stationShare = {}
    if tonumber(trainTrace) == 1 then
        for a,b in pairs(Config.Point) do
            if a == "Big" then
                for c,d in pairs(b) do
                    trainTraceLoop[c] = {time=d[1], name=d[2], x=d[3], y=d[4], z=d[5]}

                    if c <= 1 then
                        calc_hour = GetClockHours()
                        calc_minute = GetClockMinutes()+d[1]
                        edit_minute = timeCalculationNew(calc_minute)
                    else
                        if stationShare[c-1]["minute"]+10+d[1] >= 60 then
                            if stationShare[c-1]["hour"] >= 23 then
                                calc_hour = 0
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            else
                                calc_hour = stationShare[c-1]["hour"]+1
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            end
                        else
                            if stationShare[c-1]["hour"] >= 24 then
                                calc_hour = 0
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            else
                                calc_hour = stationShare[c-1]["hour"]
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            end
                        end
                    end
                    table.insert(stationShare, {hour=calc_hour, minute=edit_minute, station=d[2]})
                end
            end
        end
    elseif tonumber(trainTrace) == 2 then
        for a,b in pairs(Config.Point) do
            if a == "Medium" then
                for c,d in pairs(b) do
                    trainTraceLoop[c] = {time=d[1], name=d[2], x=d[3], y=d[4], z=d[5]}

                    if c <= 1 then
                        calc_hour = GetClockHours()
                        calc_minute = GetClockMinutes()+d[1]
                        edit_minute = timeCalculationNew(calc_minute)
                    else
                        if stationShare[c-1]["minute"]+10+d[1] >= 60 then
                            if stationShare[c-1]["hour"] >= 23 then
                                calc_hour = 0
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            else
                                calc_hour = stationShare[c-1]["hour"]+1
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            end
                        else
                            if stationShare[c-1]["hour"] >= 24 then
                                calc_hour = 0
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            else
                                calc_hour = stationShare[c-1]["hour"]
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            end
                        end
                    end
                    table.insert(stationShare, {hour=calc_hour, minute=edit_minute, station=d[2]})
                end
            end
        end
    elseif tonumber(trainTrace) == 3 then
        for a,b in pairs(Config.Point) do
            if a == "Short" then
                for c,d in pairs(b) do
                    trainTraceLoop[c] = {time=d[1], name=d[2], x=d[3], y=d[4], z=d[5]}

                    if c <= 1 then
                        calc_hour = GetClockHours()
                        calc_minute = GetClockMinutes()+d[1]
                        edit_minute = timeCalculationNew(calc_minute)
                    else
                        if stationShare[c-1]["minute"]+10+d[1] >= 60 then
                            if stationShare[c-1]["hour"] >= 23 then
                                calc_hour = 0
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            else
                                calc_hour = stationShare[c-1]["hour"]+1
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            end
                        else
                            if stationShare[c-1]["hour"] >= 24 then
                                calc_hour = 0
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            else
                                calc_hour = stationShare[c-1]["hour"]
                                calc_minute = stationShare[c-1]["minute"]+10+d[1]
                                edit_minute = timeCalculationNew(calc_minute)
                            end
                        end
                    end
                    table.insert(stationShare, {hour=calc_hour, minute=edit_minute, station=d[2]})
                end
            end
        end
    end
    Citizen.Wait(0)
    return stationShare
end
function buttonPrompt()
	Citizen.CreateThread(function()
        local str = "Otevřít"
        OpenTrainMenu = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(OpenTrainMenu, 0x27D1C284)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(OpenTrainMenu, str)
        PromptSetEnabled(OpenTrainMenu, true)
        PromptSetVisible(OpenTrainMenu, true)
        PromptSetHoldMode(OpenTrainMenu, true)
        PromptSetGroup(OpenTrainMenu, buttons_prompt)
        PromptRegisterEnd(OpenTrainMenu)
	end)
end
