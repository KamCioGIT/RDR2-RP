RedEM = exports["redem_roleplay"]:RedEM()

local isInteracting = false
local spawncamp = false
local spawngrill = false
local spawncauldron= false

local campprompt = UipromptGroup:new("Feu de camp")
Uiprompt:new(0x5181713D, "Cuisiner", campprompt)
Uiprompt:new(0x8E90C7BB, "Démonter", campprompt):setHoldMode(true)
Uiprompt:new(0x9959A6F0, "Purifier l'eau", campprompt)
campprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        local campfire = GetClosestObjectOfType(pos, 2.0, Config.Campfire, false, false, false)
        local cookgrill = GetClosestObjectOfType(pos, 2.0, Config.CampGrill, false, false, false)
        local cauldron = GetClosestObjectOfType(pos, 2.0, Config.CampChaudron, false, false, false)
        if campfire ~= 0 then
            local objectPos = GetEntityCoords(campfire)
            if #(pos - objectPos) < 1.5 and not isInteracting then
                campprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x9959A6F0) then
                    isInteracting = true
                    local playerPed = PlayerPedId()
                    RequestAnimDict(Config.MenuDict)
                    while not HasAnimDictLoaded(Config.MenuDict) do
                        Citizen.Wait(50)
                    end
                    for k,v in pairs(Config.MenuAnim) do
                        TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
                    end
                    Citizen.Wait(5000)
                    RequestAnimDict(Config.CloseMenuDict)
                    while not HasAnimDictLoaded(Config.CloseMenuDict) do
                        Citizen.Wait(50)
                    end
                    for k,v in pairs(Config.CloseMenuAnim) do
                        TaskPlayAnim(playerPed, Config.CloseMenuDict, v, 8.0, -8.0, -1, 0, 0, true)
                        Citizen.Wait(1000)
                    end
                    TriggerServerEvent("redemrp_inventory:ChangeWaterAmmount", "purifier")
                    isInteracting = false
                end
                if IsControlJustReleased(0, 0x5181713D) then
                    isInteracting = true
                    local playerPed = PlayerPedId()
                    FreezeEntityPosition(playerPed, true)
                    RequestAnimDict(Config.MenuDict)
                    while not HasAnimDictLoaded(Config.MenuDict) do
                        Citizen.Wait(50)
                    end
                    for k,v in pairs(Config.MenuAnim) do
                        TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
                    end
                    Citizen.Wait(3000)
                    TriggerServerEvent("camp:RequestCampMenu",'fire')
                end
                if campprompt:hasHoldModeJustCompleted() and not isInteracting then
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
                    SetEntityAsMissionEntity(campfire)
                    DeleteObject(campfire)
                    SetEntityAsMissionEntity(cookspit)
                    DeleteObject(cookspit)
                    campfire = 0
                    cookspit = 0
                    spawncamp = false
                end
            end
        end
        if cookgrill ~= 0 then
            local objectPos = GetEntityCoords(cookgrill)
            if  #(pos - objectPos) < 1.5 and not isInteracting then
                campprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x9959A6F0) then
                    isInteracting = true
                    local playerPed = PlayerPedId()
                    RequestAnimDict(Config.MenuDict)
                    while not HasAnimDictLoaded(Config.MenuDict) do
                        Citizen.Wait(50)
                    end
                    for k,v in pairs(Config.MenuAnim) do
                        TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
                    end
                    Citizen.Wait(5000)
                    RequestAnimDict(Config.CloseMenuDict)
                    while not HasAnimDictLoaded(Config.CloseMenuDict) do
                        Citizen.Wait(50)
                    end
                    for k,v in pairs(Config.CloseMenuAnim) do
                        TaskPlayAnim(playerPed, Config.CloseMenuDict, v, 8.0, -8.0, -1, 0, 0, true)
                        Citizen.Wait(1000)
                    end
                    TriggerServerEvent("redemrp_inventory:ChangeWaterAmmount", "purifier")
                    isInteracting = false
                end
                if IsControlJustReleased(0, 0x5181713D) then
                    isInteracting = true
                    local playerPed = PlayerPedId()
                    FreezeEntityPosition(playerPed, true)
                    RequestAnimDict(Config.MenuDict)
                    while not HasAnimDictLoaded(Config.MenuDict) do
                        Citizen.Wait(50)
                    end
                    for k,v in pairs(Config.MenuAnim) do
                        TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
                    end
                    Citizen.Wait(3000)
                    TriggerServerEvent("camp:RequestCampMenu",'grill')
                end
                if campprompt:hasHoldModeJustCompleted() and not isInteracting then
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
                    SetEntityAsMissionEntity(campfire2)
                    DeleteObject(campfire2)
                    SetEntityAsMissionEntity(cookgrill)
                    DeleteObject(cookgrill)
                    campfire = 0
                    cookgrill = 0
                    spawngrill = false
                end
            end
        end
        if cauldron ~= 0 then
            local objectPos = GetEntityCoords(cauldron)
            if #(pos - objectPos) < 1.5 and not isInteracting then
                campprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x9959A6F0) then
                    isInteracting = true
                    local playerPed = PlayerPedId()
                    RequestAnimDict(Config.MenuDict)
                    while not HasAnimDictLoaded(Config.MenuDict) do
                        Citizen.Wait(50)
                    end
                    for k,v in pairs(Config.MenuAnim) do
                        TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
                    end
                    Citizen.Wait(5000)
                    RequestAnimDict(Config.CloseMenuDict)
                    while not HasAnimDictLoaded(Config.CloseMenuDict) do
                        Citizen.Wait(50)
                    end
                    for k,v in pairs(Config.CloseMenuAnim) do
                        TaskPlayAnim(playerPed, Config.CloseMenuDict, v, 8.0, -8.0, -1, 0, 0, true)
                        Citizen.Wait(1000)
                    end
                    TriggerServerEvent("redemrp_inventory:ChangeWaterAmmount", "purifier")
                    isInteracting = false
                end
                if IsControlJustReleased(0, 0x5181713D) then
                    isInteracting = true
                    local playerPed = PlayerPedId()
                    FreezeEntityPosition(playerPed, true)
                    RequestAnimDict(Config.MenuDict)
                    while not HasAnimDictLoaded(Config.MenuDict) do
                        Citizen.Wait(50)
                    end
                    for k,v in pairs(Config.MenuAnim) do
                        TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
                    end
                    Citizen.Wait(3000)
                    TriggerServerEvent("camp:RequestCampMenu",'cauldron')
                end
                if campprompt:hasHoldModeJustCompleted() and not isInteracting then
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
                    SetEntityAsMissionEntity(cauldron)
                    DeleteObject(cauldron)
                    cauldron = 0
                    spawncauldron = false
                end
            end
        end
    end
end)

RegisterNetEvent("camp:OpenCampMenu", function(craftingtable, menutype)
    local Position = GetEntityCoords(PlayerPedId())
    local _menutype = menutype
    local playerPed = PlayerPedId()
    RequestAnimDict(Config.IdleDict)
    while not HasAnimDictLoaded(Config.IdleDict) do
        Citizen.Wait(50)
    end
    for k,v in pairs(Config.IdleAnim) do
        TaskPlayAnim(playerPed, Config.IdleDict, v, 8.0, -8.0, -1, 2, 0, true)
    end
    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 1.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                end)
                return
            end
        end
    end)

    
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local jobgrade = RedEM.GetPlayerData().jobgrade

        local elements = {}
        for k, v in pairs(craftingtable) do
            if k then
                table.insert(elements, {label = v.label, value = k, descriptionimages = v.descriptionimages})
            end
        end
        -- if _menutype == 'fire' then 
        --     table.insert(elements, {label = "Gros Steak cuit", value = 'grossteakcuit', descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Gros Steak",count = "x1"}})
        -- end
        -- if _menutype == 'grill' then 
        --     table.insert(elements, {label = "Gros Steak Grillé", value = 'gunpowder', desc = "Recette: 1 Steak"})
        --     table.insert(elements, {label = "Gros Steak au Thym", value = 'gunpowder', desc = "Recette: 1 Steak + 1 Thym"})
        -- end
        -- if _menutype == 'cauldron' then 
        --     table.insert(elements, {label = "Gros Steak et Carotte Sauvage", value = 'grossteakcarottesauvage', descriptionimages = 
        --     {{src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Gros Steak",count = "x1"}, 
        --     {src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_carrots.png', text = "Carotte Sauvage",count = "x2"}}})
        -- end

        MenuData.Open('default', GetCurrentResourceName(), 'Camp', {
            title = "Feu de Camp",
            subtext = "Recettes",
            align = 'top-right',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            StartCooking(data.current.value, menu, _menutype)
        end,

        function(data, menu)
            menu.close()
            RequestAnimDict(Config.CloseMenuDict)
            while not HasAnimDictLoaded(Config.CloseMenuDict) do
                Citizen.Wait(50)
            end
            for k,v in pairs(Config.CloseMenuAnim) do
                TaskPlayAnim(playerPed, Config.CloseMenuDict, v, 8.0, -8.0, -1, 0, 0, true)
                Citizen.Wait(1000)
            end
            FreezeEntityPosition(playerPed, false)
            isInteracting = false
        end)
    end)
end)


function StartCooking(itemName, menu, _menutype)
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
        TriggerServerEvent("camp:CraftItem", itemName, playerPed)
        Wait(500)
        TriggerServerEvent("camp:RequestCampMenu", _menutype)
    end)
end




--- SPAWN OBJET
RegisterNetEvent('cookfirespit')
AddEventHandler('cookfirespit', function() 
    if spawncamp == false then
        if campfire ~= 0 then
            SetEntityAsMissionEntity(campfire)
            DeleteObject(campfire)
            SetEntityAsMissionEntity(cookspit)
            DeleteObject(cookspit)
            campfire = 0
        end
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
        local prop = CreateObject(Config.Campfire, x, y, z, true, false, true)
        local prop2 = CreateObject(Config.CampStick, x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        SetEntityHeading(prop2, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        PlaceObjectOnGroundProperly(prop2)
        campfire = prop
        cookspit = prop2
        spawncamp = true
    else return end
end, false)

RegisterNetEvent('cookfiregrill')
AddEventHandler('cookfiregrill', function() 
    if spawngrill == false then
        if campfire ~= 0 then
            SetEntityAsMissionEntity(campfire2)
            DeleteObject(campfire2)
            SetEntityAsMissionEntity(cookgrill)
            DeleteObject(cookgrill)
            campfire = 0
        end
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
        local prop = CreateObject("p_campfire05x_script", x, y, z, true, false, true)
        local prop2 = CreateObject(Config.CampGrill, x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        SetEntityHeading(prop2, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        PlaceObjectOnGroundProperly(prop2)
        campfire2 = prop
        cookgrill = prop2
        spawngrill = true
    else return end
end, false)

RegisterNetEvent('cookfirecauldron')
AddEventHandler('cookfirecauldron', function() 
    if spawncauldron == false then
        if cauldron ~= 0 then
            SetEntityAsMissionEntity(cauldron)
            DeleteObject(cauldron)
            cauldron = 0
        end
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
        local prop = CreateObject(Config.CampChaudron, x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        cauldron = prop
        spawncauldron = true
    else return end
end, false)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if campfire then if DoesEntityExist(campfire) then DeleteEntity(campfire) end end
    if campfire2 then if DoesEntityExist(campfire2) then DeleteEntity(campfire2) end end
    if cookgrill then if DoesEntityExist(cookgrill) then DeleteEntity(cookgrill) end end
    if cauldron then if DoesEntityExist(cauldron) then DeleteEntity(cauldron) end end
    if cookspit then if DoesEntityExist(cookspit) then DeleteEntity(cookspit) end end
    PromptDelete(CampPrompt)
    PromptDelete(CancelPrompt)
end)

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         if PromptHasHoldModeCompleted(CancelPrompt) and not isInteracting then
--             local playerPed = PlayerPedId()
--         RequestAnimDict(Config.MenuDict)
--         while not HasAnimDictLoaded(Config.MenuDict) do
--             Citizen.Wait(50)
--         end
--         for k,v in pairs(Config.MenuAnim) do
--             TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
--         end
--         Citizen.Wait(3000)
--         RequestAnimDict(Config.CloseMenuDict)
--         while not HasAnimDictLoaded(Config.CloseMenuDict) do
--             Citizen.Wait(50)
--         end
--         for k,v in pairs(Config.CloseMenuAnim) do
--             TaskPlayAnim(playerPed, Config.CloseMenuDict, v, 8.0, -8.0, -1, 0, 0, true)
--             Citizen.Wait(1000)
--         end
--             SetEntityAsMissionEntity(campfire)
--             DeleteObject(campfire)
--             SetEntityAsMissionEntity(cookspit)
--             DeleteObject(cookspit)
--             SetEntityAsMissionEntity(cookgrill)
--             DeleteObject(cookgrill)
--             SetEntityAsMissionEntity(cauldron)
--             DeleteObject(cauldron)
--             campfire = 0
--             cookspit = 0
--             cookgrill = 0
--             cauldron = 0
--             spawncamp = false
--         end
--     end
-- end)




----- GOURDE -----

local gourdeprompt = UipromptGroup:new("Gourde")
Uiprompt:new(0x5181713D, "Boire", gourdeprompt)
Uiprompt:new(0x8E90C7BB, "Remplir", gourdeprompt):setHoldMode(true)
gourdeprompt:setActive(false)


RegisterNetEvent("dust_camp:getgourde", function(_quality)
    if Gourde then
        DeleteEntity(Prop)
        Gourde = false
    else
        Gourde = true
        DeleteEntity(Prop)
        quality = _quality
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
        local playerPed = PlayerPedId()
        local pc = GetEntityCoords(playerPed)
        local pname = GetHashKey('p_flask03x')
        local boneIndex = GetEntityBoneIndexByName(playerPed, "SKEL_R_HAND")
        RequestModel(pname)
        while not HasModelLoaded(pname) do
            Wait(10)
        end
        if IsPedMale(playerPed) then
            Prop = CreateObject(pname, pc.x, pc.y, pc.z + 0.2, true, true, true)
            AttachEntityToEntity(Prop, playerPed, boneIndex, 0.05, -0.07, -0.05, -75.0, 60.0, 0.0, true, true, false, true,  1, true)
        else
            Prop = CreateObject(pname, pc.x, pc.y, pc.z + 0.2, true, true, true)
            AttachEntityToEntity(Prop, playerPed, boneIndex, 0.05, -0.07, -0.05, -75.0, 60.0, 0.0, true, true, false, true,  1, true)
        end
        SetModelAsNoLongerNeeded(pname)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Gourde then
            gourdeprompt:setActiveThisFrame(true)
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
            RemoveAllPedWeapons(PlayerPedId(), true)

            if IsControlJustReleased(0, 0x5181713D) and not Gourding then
                    Boire()
            end

            if gourdeprompt:hasHoldModeJustCompleted() and not Gourding then
                if IsEntityInWater(PlayerPedId()) then
                    local x, y, z =  table.unpack(GetEntityCoords(PlayerPedId()))

                    local current_river = Citizen.InvokeNative(0x5BA7A68A346A5A91, x, y, z)
                    Remplirgourde(current_river)
                end
            end
        end
    end
end)

function Remplirgourde(current_water)
    Gourding = true
    local playerPed = PlayerPedId()
    RequestAnimDict(Config.RampInDict)
    while not HasAnimDictLoaded(Config.RampInDict) do
        Citizen.Wait(50)
    end
    for k,v in pairs(Config.RampInAnim) do
        TaskPlayAnim(playerPed, Config.RampInDict, v, 8.0, -8.0, -1, 2, 0, true)
    end
    Citizen.Wait(1500)
    RequestAnimDict(Config.RampOutDict)
    while not HasAnimDictLoaded(Config.RampOutDict) do
        Citizen.Wait(50)
    end
    for k,v in pairs(Config.RampOutAnim) do
        TaskPlayAnim(playerPed, Config.RampOutDict, v, 8.0, -8.0, -1, 0, 0, true)
    end
    Citizen.Wait(2000)
    ClearPedTasks(playerPed)
    for k, v in pairs(Config.EauMaudite) do
        if current_water == v then
            TriggerServerEvent("redemrp_inventory:ChangeWaterAmmount", "remplir",  "croupie")
            Gourding = false
            return
        end
    end
    TriggerServerEvent("redemrp_inventory:ChangeWaterAmmount", "remplir",  "potable")
    Gourding = false
end

function Boire()
    Gourding = true
    local dict = "amb_rest_drunk@world_human_drinking@male_a@idle_a"
    local playerPed = PlayerPedId()
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    TaskPlayAnim(PlayerPedId(), dict, "idle_a", 1.0, 8.0, -1, 31, 0, false, false, false)
    Citizen.Wait(4000)
    ClearPedTasks(PlayerPedId())
    TriggerServerEvent('redemrp_status:server:AddHungerThirst', 0 , 60)
    TriggerServerEvent("redemrp_inventory:ChangeWaterAmmount", "boire", quality)
    Gourding = false
end


---- Remplir à la pompe
local pumpEntities = {}
Citizen.CreateThread(function()
    while true do
        local searched = false
        for entities in EnumerateObjects() do
            if GetEntityModel(entities) == GetHashKey("p_waterpump01x") then
                local playerCd = GetEntityCoords(PlayerPedId())
                local pumpCd = GetEntityCoords(entities)
                if GetDistanceBetweenCoords(playerCd.x, playerCd.y, playerCd.z, pumpCd.x, pumpCd.y, pumpCd.z, false) < 1.5 then
                    searched = true
                    pumpEntities[entities] = true
                end
            end
        end
        if not searched then
            pumpEntities = {}
        end
        Citizen.Wait(2000)
    end
end)

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

local pompeprompt = UipromptGroup:new("Pompe")
Uiprompt:new(0x760A9C6F, "Remplir", pompeprompt)
pompeprompt:setActive(false)


Citizen.CreateThread(function()
    while true do
        for k,v in pairs(pumpEntities) do
            local playerCd = GetEntityCoords(PlayerPedId())
            local pumpCd = GetEntityCoords(k)
            if GetDistanceBetweenCoords(playerCd.x, playerCd.y, playerCd.z, pumpCd.x, pumpCd.y, pumpCd.z, false) < 3.0 and not activePump then
                pompeprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x760A9C6F) then
                    activePump = true
                    Citizen.InvokeNative(0x322BFDEA666E2B0E, PlayerPedId(), pumpCd.x, pumpCd.y, pumpCd.z, 2.0, -1, 1, 1, 1, 1)
                    Citizen.Wait(3000)
                    FreezeEntityPosition(PlayerPedId(), true)
                    Citizen.Wait(7000)
                    Citizen.InvokeNative(0x322BFDEA666E2B0E, PlayerPedId(), pumpCd.x, pumpCd.y, pumpCd.z, 2.0, -1, 1, 1, 1, 1)
                    FreezeEntityPosition(PlayerPedId(), false)
                    ClearPedTasksImmediately(PlayerPedId())
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent("redemrp_inventory:ChangeWaterAmmount", "remplir",  "potable")
                    activePump = false
                end
            end
        end
        Citizen.Wait(0)
    end
end)

