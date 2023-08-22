RedEM = exports["redem_roleplay"]:RedEM()

local PoseCoffrePromptGroup = GetRandomIntInRange(0, 0xffffff)
local PoseCoffrePromptName = CreateVarString(10, "LITERAL_STRING", "Poser le coffre")
local LeavePrompt
local CoffrePrompt
local PoseCoffrePromptShown = false

Citizen.CreateThread(function()
    local str = 'Annuler'
    CoffrePrompt = PromptRegisterBegin()
    PromptSetControlAction(CoffrePrompt, 0x8E90C7BB)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(CoffrePrompt, str)
    PromptSetEnabled(CoffrePrompt, true)
    PromptSetVisible(CoffrePrompt, true)
    PromptSetHoldMode(CoffrePrompt, false)
    PromptSetGroup(CoffrePrompt, PoseCoffrePromptGroup)
    PromptRegisterEnd(CoffrePrompt)

    str = 'Poser'
    LeavePrompt = PromptRegisterBegin()
    PromptSetControlAction(LeavePrompt, 0x5181713D)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(LeavePrompt, str)
    PromptSetEnabled(LeavePrompt, true)
    PromptSetVisible(LeavePrompt, true)
    PromptSetHoldMode(LeavePrompt, true)
    PromptSetGroup(LeavePrompt, PoseCoffrePromptGroup)
    PromptRegisterEnd(LeavePrompt)
end)

----- REQUEST LES MODEL ----

Citizen.CreateThread(function()
    RequestModel(Config.SmallVault, true)
    while not HasModelLoaded(Config.SmallVault) do
        Citizen.Wait(100)
    end
    RequestModel(Config.MediumVault, true)
    while not HasModelLoaded(Config.MediumVault, true) do
        Citizen.Wait(100)
    end
    RequestModel(Config.LargeVault, true)
    while not HasModelLoaded(Config.LargeVault, true) do
        Citizen.Wait(100)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        TriggerServerEvent("dust_vault:server:Askcoords")
    end
end)


local spawned = {}
RegisterNetEvent("dust_vault:server:getcoords")
AddEventHandler("dust_vault:server:getcoords", function (coords)
    local playerPos = GetEntityCoords(PlayerPedId())
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    if #(playerPos - vaultpos) < 10.0 then
        table.insert(spawned, {
            vaultpos = vaultpos,
            isSpawned = "false"
        })
        for k, v in ipairs(spawned) do
            if vaultpos == v.vaultpos then
                if v.isSpawned == "false" then
                    TriggerServerEvent("dust_vault:server:AskModel", vaultpos)
                    spawned[k].isSpawned = "true"
                else
                    print "cancel"
                end
            end
        end
    end
end)



RegisterNetEvent("dust_vault:server:getmodel")
AddEventHandler("dust_vault:server:getmodel", function (model, heading, coords, id)
    local playerPos = GetEntityCoords(PlayerPedId())
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    -- table.insert(spawned, {
    --     id = id,
    --     isSpawned = "false"
    -- }) 
    -- for k, v in ipairs(spawned) do
    --     if id == v.id then
    --         if v.isSpawned == "false" then
                print "spawned"
                local prop = CreateObject(model, coords.x, coords.y, coords.z, false, true, true)
                SetEntityHeading(prop, tonumber(heading))
                PlaceObjectOnGroundProperly(prop)
                -- table.insert(spawned, {
                --     id = id,
                --     isSpawned = "true"
                -- }) 
    --         else
    --         print "cancel"
    --         end
    --     end
    -- end
end)



----- CREER OBJET ----- 
RegisterNetEvent('smallvault')
AddEventHandler('smallvault', function() 
    posecoffre(Config.SmallVault)
end)

RegisterNetEvent('mediumvault')
AddEventHandler('mediumvault', function() 
    posecoffre(Config.MediumVault)
end)

RegisterNetEvent('largevault')
AddEventHandler('largevault', function() 
    posecoffre(Config.LargeVault)
end)




function posecoffre(model)
    local vault = model
    local playerPed = PlayerPedId()
    PoseCoffrePromptShown = false
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if PoseCoffrePromptShown == false then
                PromptSetActiveGroupThisFrame(PoseCoffrePromptGroup, PoseCoffrePromptName)
            end
            ---- Lancer anim porter une caisse
            local playerpos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, 0)
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, playerpos.x, playerpos.y, playerpos.z - 1.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0)
            if PromptHasHoldModeCompleted(LeavePrompt) then
                ---- cancel anim
                ----- définir code et l'envoyer en db
                PoseCoffrePromptShown = true
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
            if IsControlJustReleased(0, 0x8E90C7BB) then
                PoseCoffrePromptShown = true
                ---- cancel anim
                return
            end
        end
    end)
end