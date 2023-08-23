RedEM = exports["redem_roleplay"]:RedEM()

local isInteracting = false
---- PROMPT ----
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
    PromptSetControlAction(LeavePrompt, 0xD9D0E1C0)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(LeavePrompt, str)
    PromptSetEnabled(LeavePrompt, true)
    PromptSetVisible(LeavePrompt, true)
    PromptSetHoldMode(LeavePrompt, true)
    PromptSetGroup(LeavePrompt, PoseCoffrePromptGroup)
    PromptRegisterEnd(LeavePrompt)
end)

local OpenCoffrePromptGroup = GetRandomIntInRange(0, 0xffffff)
local OpenCoffrePromptName = CreateVarString(10, "LITERAL_STRING", "Coffre fort")
local OpenPrompt
local DemontPrompt
local OpenCoffrePromptShown = false
Citizen.CreateThread(function()
    local str = 'Ouvrir'
    OpenPrompt = PromptRegisterBegin()
    PromptSetControlAction(OpenPrompt, 0xD9D0E1C0)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(OpenPrompt, str)
    PromptSetEnabled(OpenPrompt, true)
    PromptSetVisible(OpenPrompt, true)
    PromptSetHoldMode(OpenPrompt, false)
    PromptSetGroup(OpenPrompt, OpenCoffrePromptGroup)
    PromptRegisterEnd(OpenPrompt)

    local str = 'Gérer'
    DemontPrompt = PromptRegisterBegin()
    PromptSetControlAction(DemontPrompt, 0x156F7119)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(DemontPrompt, str)
    PromptSetEnabled(DemontPrompt, true)
    PromptSetVisible(DemontPrompt, true)
    PromptSetHoldMode(DemontPrompt, true)
    PromptSetGroup(DemontPrompt, OpenCoffrePromptGroup)
    PromptRegisterEnd(DemontPrompt)
end)

----- ZONE STASHES -----

Citizen.CreateThread(function()
    while true do
        Citizen.Wait (1000)
        TriggerServerEvent("dust_vault:server:AskStashes")
    end
end)

local stashcache = {}
RegisterNetEvent("dust_vault:server:getStashes")
AddEventHandler("dust_vault:server:getStashes", function (coords, stashid, code, model)
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    if  not stashcache[stashid] then
        stashcache[stashid] = {pos = vaultpos, getcode = code, getmodel = model}
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(stashcache) do
            if #(playerPos - v.pos) < 1.5 and not IsInteracting then
                PromptSetActiveGroupThisFrame(OpenCoffrePromptGroup, OpenCoffrePromptName)
                if v.getmodel == Config.SmallVault then
                    weight = Config.SmallWeight
                elseif v.getmodel == Config.MediumVault then
                    weight = Config.MediumWeight
                elseif v.getmodel == Config.LargeVault then
                    weight = Config.LargeWeight
                end
                if IsControlJustReleased(0, 0xD9D0E1C0) then
                    isInteracting = true
                    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                        MenuData.CloseAll()
                        AddTextEntry("FMMC_MPM_TYP86", "Code")
                        DisplayOnscreenKeyboard(3, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
                    
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0)
                            Citizen.Wait(0)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            inputcode = GetOnscreenKeyboardResult()
                        else
                        return
                        end
                                    
                        if inputcode == v.getcode then
                            TriggerEvent("redemrp_inventory:OpenStash", k, weight)
                        return
                        end
                    end)
                end
                if PromptHasHoldModeCompleted(DemontPrompt) then
                    isInteracting = true
                    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                        MenuData.CloseAll()
                        AddTextEntry("FMMC_MPM_TYP86", "Code")
                        DisplayOnscreenKeyboard(3, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
                    
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0)
                            Citizen.Wait(0)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            _inputcode = GetOnscreenKeyboardResult()
                        else
                        return
                        end
                                    
                        if _inputcode == v.getcode then
                            print 'yeti gay'
                            TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                                MenuData.CloseAll()
                        
                                local elements = {}
                                    table.insert(elements, {label = "Changer le code", value = 'changecode', desc = "Changer le code du coffre"})
                                    table.insert(elements, {label = "Démonter", value = 'démonter', desc = "Récupérer le coffre si il est vide"})
                        
                                MenuData.Open('default', GetCurrentResourceName(), 'Coffre Fort', {
                                    title = "Coffre Fort",
                                    subtext = "Gestion",
                                    align = 'top-right',
                                    elements = elements,
                                },
                                
                                function(data, menu)
                                    MenuData.CloseAll()
                                    ManageVault(data.current.value, menu, k, v.getmodel, weight, v.pos)
                                end,
                        
                                function(data, menu)
                                    menu.close()
                                    isInteracting = false
                                end)
                            end)
                        end
                    end)
                end      
            end
        end
    end
end)

function ManageVault(action, menu, stashid, model, weight, pos)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    FreezeEntityPosition(playerPed, true)
    isInteracting = true
    RequestAnimDict(Config.CookDict)
    while not HasAnimDictLoaded(Config.CookDict) do
        Citizen.Wait(50)
    end
    for k,v in pairs(Config.CookAnim) do
        TaskPlayAnim(playerPed, Config.CookDict, v, 8.0, -8.0, -1, 2, 0, true)
        Citizen.Wait(2000)
    end
    for k,v in pairs(Config.CookAnim2) do
        TaskPlayAnim(playerPed, Config.CookDict, v, 8.0, -8.0, -1, 2, 0, true)
        Citizen.Wait(1000)
    end
    menu.close()
    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true
    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        if action == "change code" then
            TriggerServerEvent("dust_vault:server:removestash", stashid, model)
        elseif action == "démonter" then
            TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                MenuData.CloseAll()
                AddTextEntry("FMMC_MPM_TYP86", "Nouveau Code")
                DisplayOnscreenKeyboard(3, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
            
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0)
                    Citizen.Wait(0)
                end
                if (GetOnscreenKeyboardResult()) then
                    newcode = GetOnscreenKeyboardResult()
                else
                    menu.close()
                return
                end
                            
                if #(newcode) >= 1 then
                    TriggerServerEvent("dust_vault:server:ChangeCode", newcode, pos)
                    TriggerEvent("redemrp_inventory:OpenStash", stashid, weight)
                return
                end
            end)
        end
    end)
end

----- REQUEST LES MODEL ----

Citizen.CreateThread(function()
    RequestModel(Config.SmallVault, true)
    while not HasModelLoaded(Config.SmallVault) do
        Citizen.Wait(0)
    end
    RequestModel(Config.MediumVault, true)
    while not HasModelLoaded(Config.MediumVault, true) do
        Citizen.Wait(0)
    end
    RequestModel(Config.LargeVault, true)
    while not HasModelLoaded(Config.LargeVault, true) do
        Citizen.Wait(0)
    end
    TriggerServerEvent("dust_vault:server:Askcoords")
end)


---- SPAWN DES COFFRES EN DB ----
RegisterNetEvent("dust_vault:server:getcoords")
AddEventHandler("dust_vault:server:getcoords", function (coords)
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    TriggerServerEvent("dust_vault:server:AskModel", vaultpos)
end)

local coordscache = {}
RegisterNetEvent("dust_vault:server:getmodel")
AddEventHandler("dust_vault:server:getmodel", function (model, heading, coords)
    local playerPos = GetEntityCoords(PlayerPedId())
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    table.insert(coordscache, {pos = vaultpos, spawn = 'false', head = heading, mod = model})
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPos = GetEntityCoords(PlayerPedId())
        -- print(#coordscache)
        for k, v in pairs (coordscache) do 
            if #(playerPos - v.pos) < Config.DistanceAffichage then
                if v.spawn == 'false' then
                    local prop = CreateObject(v.mod, v.pos.x, v.pos.y, v.pos.z, false, true, true)
                    SetEntityHeading(prop, tonumber(v.head))
                    PlaceObjectOnGroundProperly(prop)
                    print "spawn"
                    v.spawn = 'true'
                end
            end
        end
    end
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
                 ---- Lancer anim porter une caisse
                local playerpos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, 0)
                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, playerpos.x, playerpos.y, playerpos.z - 1.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0)
                if PromptHasHoldModeCompleted(LeavePrompt) then
                    print ("pose")
                    ---- cancel anim
                    PoseCoffrePromptShown = true
                    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                        MenuData.CloseAll()
                        AddTextEntry("FMMC_MPM_TYP86", "Définir le code du coffre")
                        DisplayOnscreenKeyboard(3, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
                    
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0)
                            Citizen.Wait(0)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            code = GetOnscreenKeyboardResult()
                        else
                            menu.close()
                        return
                        end
                                    
                        if #(code) >= 1 then
                            -- Appeler methods
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
                            local vaultpos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, -1.0)
                            print (vaultpos)
                            TriggerServerEvent("dust_vault:server:vaultDB", vault, vaultpos, heading, code) -- Créer le vault dans la db
                            local prop = CreateObject(model, vaultpos.x, vaultpos.y, vaultpos.z, true, true, true)
                            SetEntityHeading(prop, tonumber(heading))
                            PlaceObjectOnGroundProperly(prop)
                            return
                        end
                    end)
                end
                if IsControlJustReleased(0, 0x8E90C7BB) then
                    PoseCoffrePromptShown = true
                    ---- cancel anim
                    return
                end
            end
            
        end
    end)
end

