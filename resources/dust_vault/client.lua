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


----- SPAWN OBJET ----- 
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
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, -1.55))
    local playerpos = {
        ["x"] = {x},
		["y"] = {y},
		["z"] = {z},
    }
    TriggerServerEvent("dust_vault:server:vaultDB", vault, playerpos) -- Créer le vault dans la db
end, false)