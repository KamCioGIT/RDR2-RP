
local guiEnabled = false

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
end)

RegisterCommand("newspaper", function()

    local input = lib.inputDialog('Imprimer', {"Lien vers l'image", "Montant", "Titre"})
 
    if not input then return end
    TriggerServerEvent("dust_newspaper:new", input[1], input[2], input[3])
end)

RegisterNetEvent("dust_newspaper:get_newspaper")
AddEventHandler("dust_newspaper:get_newspaper", function(link)
	EnableGui2(true, link)
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

                if #(playerPos - Config.Journal) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.Journal, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - Config.Journal) < Config.DistanceToInteract then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) then 
                        local input = lib.inputDialog('Imprimer le journal', {"Lien vers l'image", "Montant", "Titre"})
 
                        if not input then return end
                        TriggerServerEvent("dust_newspaper:new", "journal", input[1], input[2], input[3])
                    end
                end
        end
    end)
    Citizen.CreateThread(function() --- DEPOT et craft
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())

                for k, v in ipairs(Config.Tract) do
                    if #(playerPos - v) < 10.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - v) < Config.DistanceToInteract  then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) then 
                            local input = lib.inputDialog('Imprimer un tract', {"Lien vers l'image", "Montant", "Titre"})
 
                            if not input then return end
                            TriggerServerEvent("dust_newspaper:new", "impression", input[1], input[2], input[3])
                        end
                    end
                end
        end
    end)
end)