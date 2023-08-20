RedEM = exports["redem_roleplay"]:RedEM()





----- SPAWN OBJET ----- 
RegisterNetEvent('smallvault')
AddEventHandler('smallvault', function() 
    local vault = "smallvault"
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
    TriggerServerEvent("dust_vault:server:vaultDB", x, y, z) -- Créer le vault dans la db
end, false)