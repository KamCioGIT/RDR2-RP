RedEM = exports["redem_roleplay"]:RedEM()


----- REQUEST LES MODEL ----

Citizen.CreateThread(function()
    RequestModel(Config.SmallVault, true)
    while not RequestModel(Config.SmallVault, true) do
        Citizen.Wait(100)
    end
    Citizen.Wait(100)
    RequestModel(Config.MediumVault, true)
    while not RequestModel(Config.MediumVault, true) do
        Citizen.Wait(100)
    end
    Citizen.Wait(100)
    RequestModel(Config.LargeVault, true)
    while not RequestModel(Config.LargeVault, true) do
        Citizen.Wait(100)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        TriggerServerEvent("dust_vault:server:Askcoords")
    end
end)

RegisterNetEvent("dust_vault:server:getcoords")
AddEventHandler("dust_vault:server:getcoords", function (coords)
    local playerPos = GetEntityCoords(PlayerPedId())
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    if #(playerPos - vaultpos) < 10.0 then
        TriggerServerEvent("dust_vault:server:AskModel", vaultpos)
    end
end)

local spawnedvault = {}
RegisterNetEvent("dust_vault:server:getmodel")
AddEventHandler("dust_vault:server:getmodel", function (model, heading, coords, id)
    local playerPos = GetEntityCoords(PlayerPedId())
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            print (id)
            for k, v in ipairs(spawnedvault) do
                if id ~= v then
                    if #(playerPos - vaultpos) < 10.0 then
                        if not prop then
                            print 'spawn'
                            local prop = CreateObject(Config.SmallVault, coords.x, coords.y, coords.z, true, false, true)
                            SetEntityHeading(prop, heading)
                            PlaceObjectOnGroundProperly(prop)
                            table.insert(spawnedvault, id)
                        end
                    end
                else return end
            end
        end
    end)
end)



----- CREER OBJET ----- 
RegisterNetEvent('smallvault')
AddEventHandler('smallvault', function() 
    local vault = Config.SmallVault
    local playerPed = PlayerPedId()
    RequestAnimDict(Config.MenuDict)
    while not HasAnimDictLoaded(Config.MenuDict) do
        Citizen.Wait(50)
    end
    for k,v in pairs(Config.MenuAnim) do
        TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
    end
    Citizen.Wait(3000)
    RequestAnimDict(Config.CloseMenuDict)
    while not HasAnimDictLoaded(Config.CloseMenuDict) do
        Citizen.Wait(50)
    end
    for k,v in pairs(Config.CloseMenuAnim) do
        TaskPlayAnim(playerPed, Config.CloseMenuDict, v, 8.0, -8.0, -1, 0, 0, true)
        Citizen.Wait(1000)
    end
    local playerpos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, -1.55)
    local heading = GetEntityHeading(PlayerPedId())
    TriggerServerEvent("dust_vault:server:vaultDB", vault, playerpos, heading) -- Créer le vault dans la db
end, false)