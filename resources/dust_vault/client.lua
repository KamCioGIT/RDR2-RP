RedEM = exports["redem_roleplay"]:RedEM()

local isInteracting = false
---- PROMPT ----
local PoseCoffrePromptGroup = GetRandomIntInRange(0, 0xffffff)
local PoseCoffrePromptName = CreateVarString(10, "LITERAL_STRING", "Poser le coffre")
local LeavePrompt
local CoffrePrompt
local PoseCoffrePromptShown = false

local coordscache = {}
local stashcache = {}

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
    PromptSetHoldMode(DemontPrompt, false)
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
RegisterNetEvent("dust_vault:server:getStashes")
AddEventHandler("dust_vault:server:getStashes", function (coords, stashid, code, model)
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    if not stashcache[stashid] then
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
                        TaskPlayAnim(PlayerPedId(), Config.SafeDict, Config.SafeAnim, 1.0, 1.0, -1, 1, 0.0, 0, 0, 0)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0)
                            Citizen.Wait(0)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            inputcode = GetOnscreenKeyboardResult()
                            ClearPedTasks(PlayerPedId())
                        else
                            ClearPedTasks(PlayerPedId())
                        return
                        end
                                    
                        if inputcode == v.getcode then
                            TriggerEvent("redemrp_inventory:OpenStash", k, weight)
                        return
                        end
                    end)
                end
                if IsControlJustReleased(0, 0x156F7119) then
                    isInteracting = true
                    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                        MenuData.CloseAll()
                        AddTextEntry("FMMC_MPM_TYP86", "Code")
                        DisplayOnscreenKeyboard(3, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
                        TaskPlayAnim(PlayerPedId(), Config.SafeDict, Config.SafeAnim, 1.0, 1.0, -1, 1, 0.0, 0, 0, 0)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0)
                            Citizen.Wait(0)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            _inputcode = GetOnscreenKeyboardResult()
                            ClearPedTasks(PlayerPedId())
                        else
                            ClearPedTasks(PlayerPedId())
                        return
                        end
                                    
                        if _inputcode == v.getcode then
                            ManageVault(k, v.getmodel, weight, v.pos)
                        end
                    end)
                end      
            end
        end
    end
end)

function ManageVault(stashid, model, weight, pos)
    isInteracting = true
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local elements = {
            {label = "Changer le code", value = 'changecode', desc = "Changer le code du coffre"},
            {label = "Démonter", value = 'demonter', desc = "Récupérer le coffre si il est vide"}
        }

        MenuData.Open('default', GetCurrentResourceName(), 'CoffreFort', {
            title = "Coffre Fort",
            subtext = "Gestion",
            align = 'top-right',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            Submenu(data.current.value, menu, stashid, model, weight, pos)
        end,

        function(data, menu)
            menu.close()
        end)
    end)
end

function Submenu(action, menu, stashid, model, weight, pos)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    isInteracting = true
    menu.close()
    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true
    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        if action == "demonter" then
            TriggerServerEvent("dust_vault:server:removestash", stashid, model, pos)
        end
        if action == "changecode" then
            TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                MenuData.CloseAll()
                AddTextEntry("FMMC_MPM_TYP86", "Nouveau Code")
                DisplayOnscreenKeyboard(3, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
                TaskPlayAnim(PlayerPedId(), Config.SafeDict, Config.SafeAnim, 1.0, 1.0, -1, 1, 0.0, 0, 0, 0)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0)
                    Citizen.Wait(0)
                end
                if (GetOnscreenKeyboardResult()) then
                    newcode = GetOnscreenKeyboardResult()
                    ClearPedTasks(PlayerPedId())
                else
                    menu.close()
                    ClearPedTasks(PlayerPedId())
                return
                end
                            
                if #(newcode) >= 1 then
                    TriggerServerEvent("dust_vault:server:ChangeCode", newcode, pos)
                    TriggerEvent("redemrp_inventory:OpenStash", stashid, weight)
                    for k, v in pairs(stashcache) do
                        if pos == v.pos then
                            v.getcode = tostring(newcode)
                        end
                    end
                return
                end
            end)
        end
    end)
end

RegisterNetEvent("dust_vault:server:delvault")
AddEventHandler("dust_vault:server:delvault", function (pos)
    for k, v in pairs(coordscache) do
        if v.pos == pos then
            print (pos)
            SetEntityAsMissionEntity(v.object)
            DeleteObject(v.object)
        end
        for k, v in pairs(stashcache) do
            if pos == v.pos then
                v.pos = vector3(0.0, 0.0, 0.0)
            end
        end
    end
    TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
end)

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
    RequestModel(GetHashKey("p_boxlrgtool01x"))
    while not HasModelLoaded(GetHashKey("p_boxlrgtool01x")) do
        Citizen.Wait(0)
    end
    RequestAnimDict(Config.SafeDict)
    while not HasAnimDictLoaded(Config.SafeDict) do
        Citizen.Wait(50)
    end
    TriggerServerEvent("dust_vault:server:Askcoords")
end)


---- SPAWN DES COFFRES EN DB ----
RegisterNetEvent("dust_vault:server:getcoords")
AddEventHandler("dust_vault:server:getcoords", function (coords)
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    TriggerServerEvent("dust_vault:server:AskModel", vaultpos)
end)

RegisterNetEvent("dust_vault:server:getmodel")
AddEventHandler("dust_vault:server:getmodel", function (model, heading, coords)
    local playerPos = GetEntityCoords(PlayerPedId())
    local vaultpos = vector3(coords.x, coords.y, coords.z)
    table.insert(coordscache, {pos = vaultpos, spawn = 'false', head = heading, mod = model, prop = "nil"})
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
                    v.object = prop
                end
            end
        end
    end
end)


----- CREER OBJET ----- 
RegisterNetEvent('smallvault')
AddEventHandler('smallvault', function() 
    posecoffre(Config.SmallVault)
    spawned = false
end)

RegisterNetEvent('mediumvault')
AddEventHandler('mediumvault', function() 
    posecoffre(Config.MediumVault)
    spawned = false
end)

RegisterNetEvent('largevault')
AddEventHandler('largevault', function() 
    posecoffre(Config.LargeVault)
    spawned = false
end)



local carryingCrate = false
local crateEntity = nil
function posecoffre(model)
    PoseCoffrePromptShown = false
    showtempvault = true
    Citizen.CreateThread(function()
        while not spawned do
            Citizen.Wait(0)
            local playerPed = PlayerPedId()
            if PoseCoffrePromptShown == false then
                PromptSetActiveGroupThisFrame(PoseCoffrePromptGroup, PoseCoffrePromptName)

                if PromptHasHoldModeCompleted(LeavePrompt) then
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
                            TriggerServerEvent("dust_vault:server:vaultDB", model, vaultpos, heading, code) -- Créer le vault dans la db
                            local prop = CreateObject(model, vaultpos.x, vaultpos.y, vaultpos.z, true, true, true)
                            SetEntityHeading(prop, tonumber(heading))
                            PlaceObjectOnGroundProperly(prop)
                            table.insert(coordscache, {pos = vaultpos, spawn = 'true', head = heading, mod = model, object = prop})
                            showtempvault = false
                            
                            spawned = true
                            return
                        end
                    end)
                end
                if IsControlJustReleased(0, 0x8E90C7BB) then
                    showtempvault = false
                    PoseCoffrePromptShown = true

                    spawned = true
                    return
                end
            end
            
        end
    end)
    Citizen.CreateThread(function()
        while showtempvault == true do
            local playerpos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, 0)
            local heading = GetEntityHeading(PlayerPedId())
            -- Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, playerpos.x, playerpos.y, playerpos.z - 1.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0)
            local tempvault = CreateObject(model, playerpos.x, playerpos.y, playerpos.z, false, true, true)
            SetEntityHeading(tempvault, tonumber(heading))
            PlaceObjectOnGroundProperly(tempvault)
            SetEntityAlpha(tempvault, 195)

            local propModel = GetHashKey("p_boxlrgtool01x")
            local boneIndex = GetEntityBoneIndexByName(PlayerPedId(), "SKEL_L_Hand")
            local xOffset, yOffset, zOffset = 0.48, 0.07, 0.09 -- Ajustez ces valeurs pour l'attache correcte
            local tool = CreateObject(propModel, 0, 0, 0, true, true, true)

            AttachEntityToEntity(tool, PlayerPedId(), boneIndex, xOffset, yOffset, zOffset, -100.0, 58.9, 89.7, true, true, false, true, 0, true)

            

            Citizen.Wait(10)
            DeleteEntity(tempvault)
            DeleteEntity(tool)

        end
    end)
end



---- Anim porter la caisse ---- 



-- Citizen.CreateThread(function()
--     while placement do
--         Wait(50)
--         if not carryingCrate then
--             RequestAnimDict('mech_loco_m@generic@carry@box@front@idle') -- Remplacez 'anim_dict' par le nom de votre animation
            
--             while not HasAnimDictLoaded('mech_loco_m@generic@carry@box@front@idle') do
--                 Citizen.Wait(0)
--             end
            
--             local ped = PlayerPedId()
--             local x, y, z = table.unpack(GetEntityCoords(ped))
--             crateEntity = CreateObject(GetHashKey('p_ammoboxlancaster02x'), x, y, z + 0.15, true, true, true)
            
--             AttachEntityToEntity(crateEntity, ped, GetPedBoneIndex(ped, 57005), 0.12, 0.0, 0.0, 0.0, 180.0, 180.0, true, true, false, true, 1, true)
            
--             TaskPlayAnim(ped, 'mech_loco_m@generic@carry@box@front@idle', 'idle', 8.0, -8.0, -1, 49, 0, false, false, false)
            
--             carryingCrate = true
--         else
--             local ped = PlayerPedId()
            
--             DetachEntity(crateEntity, true, true)
--             DeleteEntity(crateEntity)
            
--             ClearPedTasksImmediately(ped)
            
--             carryingCrate = false
--         end
--     end
-- end)