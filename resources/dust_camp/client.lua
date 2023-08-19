RedEM = exports["redem_roleplay"]:RedEM()


local isInteracting = false
local spawncamp = false
 
Citizen.CreateThread(function()
    local PlayerData = RedEM.GetPlayerData()
    while RedEM.GetPlayerData().isLoggedIn ~= true do 
        Wait(750)
        CraftCamp()
    end
    if RedEM.GetPlayerData().isLoggedIn then
        CraftCamp()
        print (Config.Campfire)
    end
end)

local CampPromptGroup = GetRandomIntInRange(0, 0xffffff)
local CampPromptName = CreateVarString(10, "LITERAL_STRING", "Feu de camp")
local CancelPrompt
local CampPrompt
Citizen.CreateThread(function()
    local str = 'Cuisiner'
    CampPrompt = PromptRegisterBegin()
    PromptSetControlAction(CampPrompt, 0x5181713D)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(CampPrompt, str)
    PromptSetEnabled(CampPrompt, true)
    PromptSetVisible(CampPrompt, true)
    PromptSetHoldMode(CampPrompt, false)
    PromptSetGroup(CampPrompt, CampPromptGroup)
    PromptRegisterEnd(CampPrompt)

    str = 'Démonter'
    CancelPrompt = PromptRegisterBegin()
    PromptSetControlAction(CancelPrompt, 0x8E90C7BB)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(CancelPrompt, str)
    PromptSetEnabled(CancelPrompt, true)
    PromptSetVisible(CancelPrompt, true)
    PromptSetHoldMode(CancelPrompt, true)
    PromptSetGroup(CancelPrompt, CampPromptGroup)
    PromptRegisterEnd(CancelPrompt)
end)

Citizen.CreateThread(function()
    while true do
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(), true
    campfire = GetClosestObjectOfType(pos, 2.0, Config.Campfire, false, false, false)
    cookgrill = GetClosestObjectOfType(pos, 2.0, Config.CampGrill, false, false, false)
    cauldron = GetClosestObjectOfType(pos, 2.0, Config.CampChaudron, false, false, false)
    Citizen.Wait(500)
    end
end)

function CraftCamp()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local playerPed = PlayerPedId()
            local pos = GetEntityCoords(), true
            if campfire ~= 0 then
                local objectPos = GetEntityCoords(campfire)
                if #(pos - objectPos) < 2.5 and not isInteracting then
                    PromptSetActiveGroupThisFrame(CampPromptGroup, CampPromptName)
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
                    if PromptHasHoldModeCompleted(CancelPrompt) and not isInteracting then
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
            elseif cookgrill ~= 0 then
                local objectPos = GetEntityCoords(cookgrill)
                if  #(pos - objectPos) < 2.5 and not isInteracting then
                    PromptSetActiveGroupThisFrame(CampPromptGroup, CampPromptName)
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
                    if PromptHasHoldModeCompleted(CancelPrompt) and not isInteracting then
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
                        SetEntityAsMissionEntity(cookgrill)
                        DeleteObject(cookgrill)
                        campfire = 0
                        cookgrill = 0
                        spawncamp = false
                    end
                end
            elseif cauldron ~= 0 then
                local objectPos = GetEntityCoords(cauldron)
                if #(pos - objectPos) < 2.5 and not isInteracting then
                    PromptSetActiveGroupThisFrame(CampPromptGroup, CampPromptName)
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
                    if PromptHasHoldModeCompleted(CancelPrompt) and not isInteracting then
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
                        spawncamp = false
                    end
                end
            end
        end
    end)
end


RegisterNetEvent("camp:OpenCampMenu", function(menutype)
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
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
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

        if _menutype == 'fire' then 
            table.insert(elements, {label = "Steak cuit", value = 'gunpowder', desc = "Recette: 1 Steak"})
        end
        if _menutype == 'grill' then 
            table.insert(elements, {label = "Steak Grillé", value = 'gunpowder', desc = "Recette: 1 Steak"})
            table.insert(elements, {label = "Steak au Thym", value = 'gunpowder', desc = "Recette: 1 Steak + 1 Thym"})
        end
        if _menutype == 'cauldron' then 
            table.insert(elements, {label = "Ragout", value = 'gunpowder', desc = "Recette: 1 Steak + 1 Carotte Sauvage"})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'Camp', {
            title = "Craft Camp Menu",
            subtext = "Cuisine",
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
    end)
    TriggerEvent("camp:OpenCampMenu", _menutype)
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
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
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
    if spawncamp == false then
        if campfire ~= 0 then
            SetEntityAsMissionEntity(campfire)
            DeleteObject(campfire)
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
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
        local prop = CreateObject(Config.Campfire, x, y, z, true, false, true)
        local prop2 = CreateObject(Config.CampGrill, x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        SetEntityHeading(prop2, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        PlaceObjectOnGroundProperly(prop2)
        campfire = prop
        cookgrill = prop2
        spawncamp = true
    else return end
end, false)

RegisterNetEvent('cookfirecauldron')
AddEventHandler('cookfirecauldron', function() 
    if spawncamp == false then
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
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
        local prop = CreateObject(Config.CampChaudron, x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        cauldron = prop
        spawncamp = true
    else return end
end, false)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if campfire then if DoesEntityExist(campfire) then DeleteEntity(campfire) end end
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