RedEM = exports["redem_roleplay"]:RedEM()

local CraftMenuPrompt = nil
local CraftMenuPromptShown = false
local promptGroup

local varString = CreateVarString(10, "LITERAL_STRING", "Poser le coffre")

Citizen.CreateThread(function()
    Wait(10)
    CraftMenuPrompt = PromptRegisterBegin()
    PromptSetActiveGroupThisFrame(promptGroup, varString)
    PromptSetControlAction(CraftMenuPrompt, 0xE8342FF2) -- LEFT ALT
    PromptSetText(CraftMenuPrompt, CreateVarString(10, "LITERAL_STRING", "Poser le coffre"))
    PromptSetStandardMode(CraftMenuPrompt, true)
    PromptSetEnabled(CraftMenuPrompt, false)
    PromptSetVisible(CraftMenuPrompt, false)
    Citizen.InvokeNative(0x94073D5CA3F16B7B, CraftMenuPrompt, 1000)
    N_0x0c718001b77ca468(CraftMenuPrompt, 2.0)
    PromptSetGroup(CraftMenuPrompt, promptGroup)
    PromptRegisterEnd(CraftMenuPrompt)
end)

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

RegisterNetEvent("dust_vault:server:getmodel")
AddEventHandler("dust_vault:server:getmodel", function (model, heading, coords, id)
    local playerPos = GetEntityCoords(PlayerPedId())
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    local limit = 0
    print 'spawn'
    print (model, heading, coords.x, coords.y, coords.z, id)
    local prop = CreateObject(Config.SmallVault, coords.x, coords.y, coords.z, false, true, true)
    SetEntityHeading(prop, tonumber(heading))
    PlaceObjectOnGroundProperly(prop)
end)



----- CREER OBJET ----- 
RegisterNetEvent('smallvault')
AddEventHandler('smallvault', function() 
    local vault = Config.SmallVault
    local playerPed = PlayerPedId()
    if CraftMenuPromptShown == false then
        PromptSetEnabled(CraftMenuPrompt, true)
        PromptSetVisible(CraftMenuPrompt, true)
        CraftMenuPromptShown = true
    end
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(50)
            local playerpos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, 0)
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, playerpos.x, playerpos.y, playerpos.z - 1.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0)
            if PromptHasHoldModeCompleted(CraftMenuPrompt) then
                PromptSetEnabled(CraftMenuPrompt, false)
                PromptSetVisible(CraftMenuPrompt, false)
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
                local heading = GetEntityHeading(PlayerPedId())
                local playerpos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, -1.55)
                TriggerServerEvent("dust_vault:server:vaultDB", vault, playerpos, heading) -- Créer le vault dans la db
                return
            end
        end
    end)
end)