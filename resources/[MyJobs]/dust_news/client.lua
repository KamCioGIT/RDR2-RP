
local guiEnabled = false
local propAnim = nil

RegisterNetEvent("dust_newspapers:newspapers")
AddEventHandler("dust_newspapers:newspapers", function(list)
    if Config.ImageUi then
	    EnableGui(true, list)
    end
    if Config.LinkWebsite then
	    EnableGui2(true, list)
    end
end)


function EnableGui(bool, newspaper)
    SetNuiFocus(bool, bool)

    guiEnabled = bool
    SendNUIMessage({
        type = "folder",
        status = bool,
        newspaper = newspaper,
    })
end

function EnableGui2(bool, newspaper)
    SetNuiFocus(bool, bool)

    guiEnabled = bool
    SendNUIMessage({
        type = "website",
        status = bool,
        newspaper = newspaper,
    })
end

RegisterNUICallback('exit', function(data, cb)
    EnableGui(false, false)
    SetNuiFocus(false, false)
    guiEnabled = false
    cb('ok')
    ClearPedTasks(PlayerPedId())
    DeleteEntity(propAnim)
    propanim = nil
end)

RegisterCommand("newspaper", function()

    local input = lib.inputDialog('Imprimer', {"Lien vers l'image", "Montant", "Titre"})
 
    if not input then return end
    TriggerServerEvent("dust_newspaper:new", input[1], input[2], input[3])
end)

RegisterNetEvent("dust_newspaper:get_newspaper")
AddEventHandler("dust_newspaper:get_newspaper", function(link)
	EnableGui2(true, link)
    TriggerEvent("redemrp_inventory:closeinv")
    Wait(500)
    playAnimationProp("amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@base", "base", -1, 25, {"p_newspaper01x", "SKEL_L_Finger00", 0.07, -0.02, 0.17, 86.0, -164.0, 5.0})
end)

RegisterNetEvent("dust_job:newspaper")
AddEventHandler("dust_job:newspaper", function(job, grade)

    for k, v in pairs(Config.Jobs) do

        if job == v then
            print"getjob"
            TriggerEvent("newspaper:StartMission")
            -- if tonumber(grade) >= 2 then
            -- end
        end
    end
end)


RegisterNetEvent("newspaper:StartMission",function()
    Citizen.CreateThread(function()
        while true do
            Wait(2)
            local playerPos = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Journal) do 
                if #(playerPos - v) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) then 
                        TriggerEvent("dust_newspaper:imprimerie", "journal")
                    end
                end
            end
        end
    end)
    Citizen.CreateThread(function() --- DEPOT et craft
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())

            for k, v in pairs(Config.Tract) do
                if #(playerPos - v) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract  then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) then 
                        TriggerEvent("dust_newspaper:imprimerie", "impression")
                    end
                end
            end
        end
    end)
end)

RegisterNetEvent("dust_newspaper:imprimerie")
AddEventHandler("dust_newspaper:imprimerie", function(type)
    if type == "journal" then
        local input = lib.inputDialog('Imprimer le journal', {"Lien vers l'image", "Montant", "Titre"})

        if not input then return end
        TriggerServerEvent("dust_newspaper:new", "journal", input[1], input[2], input[3])
    end
    if type == "impression" then
        local input = lib.inputDialog('Imprimer un tract', {"Lien vers l'image", "Montant", "Titre"})
    
        if not input then return end
        TriggerServerEvent("dust_newspaper:new", "impression", input[1], input[2], input[3])
    end
end)


function playAnimationProp(dict, name, time, flag, setup)
    if dict ~= "" then
        playAnimation(dict, name, time, flag)
    end
    Citizen.Wait(900)
    local pos = GetEntityCoords(PlayerPedId())
    if propAnim == nil then
        while not HasModelLoaded(GetHashKey(setup[1])) do
            Wait(0)
            ModelRequest( GetHashKey(setup[1]) )
        end
        propAnim = CreateObject(setup[1], pos.x, pos.y, pos.z, true, true, false)
        AttachEntityToEntity(propAnim, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), setup[2]), setup[3], setup[4], setup[5], setup[6], setup[7], setup[8], false, false, true, false, 0, true, false, false)
        SetEntityCollision(propAnim, false, true)
    end
end

function playAnimation(dict, name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.0, -1.0, time, flag, 0, true, 0, false, 0, false)
end
function ModelRequest(model)
    Citizen.CreateThread(function()
        RequestModel(model)
    end)
end
