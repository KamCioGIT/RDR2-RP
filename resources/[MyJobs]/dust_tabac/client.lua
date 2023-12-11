RedEM = exports["redem_roleplay"]:RedEM()

local isInteracting = false


local maxCraftAmounttabac = 0

local souffreprompt = UipromptGroup:new("Souffre")
Uiprompt:new(0x760A9C6F, "Récolter", souffreprompt)
souffreprompt:setActive(false)

local craftprompt = UipromptGroup:new("Atelier")
Uiprompt:new(0x760A9C6F, "Fabriquer", craftprompt)
craftprompt:setActive(false)


local getjob = false
local getgrade = 0
RegisterNetEvent("dust_job:tabac")
AddEventHandler("dust_job:tabac", function(job, grade)

    for k, v in pairs(Config.Jobs) do

        if job == v then
            getjob = true
            getgrade = grade
            TriggerEvent("tabac:StartMission")
            if tonumber(grade) >= 2 then
                contremaitre()
            end
        end
    end
end)


RegisterNetEvent("tabac:OpenBossMenu", function(menutype)
    local Position = GetEntityCoords(PlayerPedId())

    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    isInteracting = false
                end)
                return
            end
        end
    end)

    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local jobgrade = RedEM.GetPlayerData().jobgrade

        local elements = {}


        for k, v in pairs(Config.CraftingsReceipe) do
            if v.type == menutype then
                table.insert(elements, {label = v.label, value = k, descriptionimages = v.descriptionimages})
            end
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Atelier",
            subtext = "Que veux-tu fabriquer ?",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("tabac:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("tabac:SelectCraftingAmount", data.current.value, MenuData, menu)
            --
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("tabac:CraftingAction")
AddEventHandler("tabac:CraftingAction", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    FreezeEntityPosition(playerPed, true)
    isInteracting = true
    RequestAnimDict(Config.AnimDict)
    while not HasAnimDictLoaded(Config.AnimDict) do
        Citizen.Wait(50)
    end

    for k,v in pairs(Config.CraftAnim) do
        TaskPlayAnim(playerPed, Config.AnimDict, v, 4.0, 4.0, -1, 1, 0, true)
    end

    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true

    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        ClearPedTasks(PlayerPedId())
        FreezeEntityPosition(playerPed, false)
        isInteracting = false
    end)    
end)

RegisterNetEvent("tabac:SelectCraftingAmount")
AddEventHandler("tabac:SelectCraftingAmount", function(dataType, menuData, menu)
    menuData.CloseAll()
    local Position = GetEntityCoords(PlayerPedId())

    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    isInteracting = false
                end)
                return
            end
        end
    end)


    local elements = {
        { label = "Quantité", 
        value = 0, 
        desc = "Se mettre au travail",
        type = 'slider',
        min = 0,
        max = maxCraftAmounttabac 
        },
    }

    menuData.Open('default', GetCurrentResourceName(), 'craft', {
        title = "Atelier",
        subtext = "Choisir la quantité",
        align = 'top-right',
        elements = elements,
    },

    function(data, menu)
        if data.current.label == "Quantité" then
            TriggerServerEvent("tabac:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("tabac:client:SetMaxAmount", function(value)
    maxCraftAmounttabac = value
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("crp_wheat_dry_aa_sim"))
    if HasModelLoaded(GetHashKey("crp_wheat_dry_aa_sim")) then
        Wait(10)
    end
    for k,v in pairs(Config.SellNPC) do
        local model = RequestModel(GetHashKey("mp_u_m_m_nat_farmer_02"))

        while not HasModelLoaded(GetHashKey("mp_u_m_m_nat_farmer_02")) do
            Wait(100)
        end

        local spawnCoords = v.coords
        local ped = CreatePed(GetHashKey("mp_u_m_m_nat_farmer_02"), spawnCoords.x, spawnCoords.y, spawnCoords.z, v.heading, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        SetEntityNoCollisionEntity(PlayerPedId(), ped, false)
        SetEntityCanBeDamaged(ped, false)
        SetEntityInvincible(ped, true)
        Wait(2000)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetModelAsNoLongerNeeded(GetHashKey("mp_u_m_m_nat_farmer_02"))
end
    GetRandomRessourcePoint()
    Citizen.CreateThread(function() --- MINERAI
        while true do
                Wait(0)
                local playerPos = GetEntityCoords(PlayerPedId())
                if #(playerPos - Config.RessourcesPoints[ressourcePointIndexForMining]) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(0, 0x760A9C6F) and not isInteracting then 
                        StartMining()
                    end
                else end
                for k, v in ipairs(Config.Dep) do
                    if #(playerPos - v) < 6.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) then 
                            TriggerEvent("redemrp_inventory:OpenStash", "dep_tabac", 3000.0)
                        end
                    else end
                end
                for k, v in pairs(Config.Ret) do
                    if #(playerPos - v) < 6.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - v) < Config.DistanceToInteract then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) then 
                            TriggerEvent("redemrp_inventory:OpenStash", "ret_tabac", 3000.0)
                        end
                    else end
                end

                for k, v in pairs(Config.SellNPC) do
                    if #(playerPos - v.interact) < 10.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.interact, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - v.interact) < Config.DistanceToInteract and not isInteracting then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                            TriggerEvent("tabac:OpenExportMenu")
                        end
                    end
                end
        end
    end)
end)

RegisterNetEvent("tabac:StartMission",function()
    Citizen.CreateThread(function()
        while true do
                Wait(2)
                local playerPos = GetEntityCoords(PlayerPedId())

                if #(playerPos - Config.Atelier) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.Atelier, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - Config.Atelier) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerEvent("tabac:OpenBossMenu", "tabac")
                    end
                end
        end
    end)
    Citizen.CreateThread(function() --- DEPOT et craft
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())

                for k, v in ipairs(Config.BuyingPoint) do
                    if #(playerPos - v) < 10.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                            TriggerServerEvent("tabac:checksellingstash", "npc_tabac")
                        end
                    end
                end
        end
    end)
end)

function contremaitre() --- RETRAIT
    while true do
        Wait(0)
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Ret) do
            if #(playerPos - v) < 6.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v) < Config.DistanceToInteract then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) then 
                    TriggerServerEvent('tabac:retStash')
                end
            else end
        end
end
end


AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    PromptDelete(CraftMenuPrompt)
end)

function StartMining()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    started = false
    pressing = false
    FreezeEntityPosition(playerPed, true)
    RequestAnimDict(Config.GatherDict)
    while not HasAnimDictLoaded(Config.GatherDict) do
        Wait(10)
    end
    TaskPlayAnim(playerPed, Config.GatherDict, "stn_enter", 1.0, 1.0, -1, 2, 0, false, false, false)
    Wait(500)
    TaskPlayAnim(playerPed, Config.GatherDict, Config.GatherAnim, 1.0, 1.0, -1, 1, 0, false, false, false)
    isInteracting = true
    Wait(Config.WorkingTime)
    FreezeEntityPosition(playerPed, false)
    TaskPlayAnim(playerPed, Config.GatherDict, "stn_exit", 1.0, 1.0, -1, 2, 0, false, false, false)
    Wait(500)
    ClearPedTasks(playerPed)
    TriggerServerEvent('tabac:addtabac')
    isInteracting = false
    GetRandomRessourcePoint()
end


function GetRandomRessourcePoint()
    -- if blip ~= nil then 
    --     RemoveBlip(blip)
    -- end
    ressourcePointIndexForMining = math.random(1, #Config.RessourcesPoints)
    -- blip = Citizen.InvokeNative(0x554d9d53f696d002, Config.PointSprite, Config.RessourcesPoints[ressourcePointIndexForMining].x, Config.RessourcesPoints[ressourcePointIndexForMining].y, Config.RessourcesPoints[ressourcePointIndexForMining].z)
    Citizen.CreateThread(function()
        while true do
            Wait(50)
            local playerPos = GetEntityCoords(PlayerPedId())    
            if #(playerPos - Config.RessourcesPoints[ressourcePointIndexForMining]) < 100 then
                
                DeleteEntity(tempweath)
                tempweath = CreateObject(GetHashKey("crp_tobaccoplant_ca_sim"), Config.RessourcesPoints[ressourcePointIndexForMining].x, Config.RessourcesPoints[ressourcePointIndexForMining].y, Config.RessourcesPoints[ressourcePointIndexForMining].z, false, true, true)
                PlaceObjectOnGroundProperly(tempweath)
                break
            end
        end
    end)
end



-----  sell 

RegisterNetEvent("tabac:OpenExportMenu", function(selltable, localisation)
    local Position = GetEntityCoords(PlayerPedId())

    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    isInteracting = false
                end)
                return
            end
        end
    end)

    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()
        local elements = {}


        for k, v in pairs(Config.Sell) do
            table.insert(elements, {label = v.label.." $"..v.price, value = k, price = v.price})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Exportateur",
            subtext = "Vendre",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("tabac:MaxSellingAmount", data.current.value)
            Wait(150)
            TriggerEvent("tabac:SelectSellingAmount", data.current.value, MenuData, menu, localisation)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)


RegisterNetEvent("tabac:SelectSellingAmount")
AddEventHandler("tabac:SelectSellingAmount", function(dataType, menuData, menu, localisation)
    menuData.CloseAll()
    local Position = GetEntityCoords(PlayerPedId())

    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    isInteracting = false
                end)
                return
            end
        end
    end)


    local elements = {
        { label = "Quantité", 
        value = maxsellamount, 
        desc = "Vendre",
        type = 'slider',
        min = 0,
        max = maxsellamount 
        },
    }

    menuData.Open('default', GetCurrentResourceName(), 'craft', {
        title = "Exportateur",
        subtext = "Choisir la quantité",
        align = 'top-right',
        elements = elements,
    },

    function(data, menu)
        if data.current.label == "Quantité" then
            TriggerServerEvent("tabac:SellItem", dataType, menu, data.current.value, localisation)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("tabac:client:SetMaxAmount", function(value)
    maxsellamount = value
end)


----- achat

local maxAmounttabac = nil

RegisterNetEvent("tabac:client:SetMaxAmount", function(value)
    maxAmounttabac = value
end)

RegisterNetEvent("tabac:OpenBuyingMenu", function(sellingtable, type)
    local Position = GetEntityCoords(PlayerPedId())

    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    isInteracting = false
                end)
                return
            end
        end
    end)

    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()
        local elements = {}

        for k, v in pairs(sellingtable) do
            table.insert(elements, {label = "$"..v.price .." "..v.label, value = k, price = v.price})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Marché",
            subtext = "Acheter",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            menu.close()
            TriggerServerEvent("tabac:checkstash", data.current.value, MenuData, type)
            Wait(200)

            TriggerEvent("tabac:SelectBuyingAmount", data.current.value, MenuData, type)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("tabac:SelectBuyingAmount")
AddEventHandler("tabac:SelectBuyingAmount", function(dataType, menuData, type)
    menuData.CloseAll()
    local Position = GetEntityCoords(PlayerPedId())

    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    isInteracting = false
                end)
                return
            end
        end
    end)


    local elements = {
        { label = "Quantité", 
        value = 0, 
        desc = "Acheter",
        type = 'slider',
        min = 0,
        max = maxAmounttabac 
        },
    }

    menuData.Open('default', GetCurrentResourceName(), 'buytabac', {
        title = "Acheter",
        subtext = "Choisir la quantité",
        align = 'top-right',
        elements = elements,
    },

    function(data, menu)
        if data.current.label == "Quantité" then
            TriggerServerEvent("tabac:buyItem", dataType, data.current.value, type)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)