---- SPAWN DU TRAIN ET GESTION DU STASH

------- DROP DES BIJOUX A LA BANQUE DE ST DENIS


--------------------------------------------
----------MENU ACHAT ET VENTE --------------
-------------------------------------------

Citizen.CreateThread(function()
    while true do
        Wait(2)
        local playerPos = GetEntityCoords(PlayerPedId())

        for k, v in pairs(Config.Tableau) do
            if #(playerPos - v) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(1, 0x760A9C6F) and not isInteracting then 
                    TriggerServerEvent("dust_train:askitemneed")
                end
            end
        end
    end
end)


RegisterNetEvent("dust_train:sell:OpenNeedMenu", function(needtable)
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


        for k, v in pairs(needtable) do
            for item, properties in pairs(v) do
                table.insert(elements, {label = k, value = k, desc = properties.label.." à "..properties.price.."$"})
            end
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Exportateur",
            subtext = "Vendre",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            isInteracting = false
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)



Citizen.CreateThread(function()
    while true do
        Wait(2)
        local playerPos = GetEntityCoords(PlayerPedId())

        for k, v in pairs(Config.Gare) do
            if #(playerPos - v.npccoords) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.npccoords, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v.npccoords) < Config.DistanceToInteract and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(1, 0x760A9C6F) and not isInteracting then 
                    TriggerServerEvent("dust_train:checksellingstash", k)
                end
            end
            if #(playerPos - v.droppoint) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.droppoint, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v.droppoint) < Config.DistanceToInteract and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(1, 0x760A9C6F) and not isInteracting then 
                    TriggerServerEvent("dust_train:sell:chekitem", k)
                end
            end
        end

    end
end)




--- pop pnj
Citizen.CreateThread(function()
    Wait(1000)
    for k,v in pairs(Config.Gare) do
        local npcmodel = RequestModel(GetHashKey(v.npcmodel))
    
        while not HasModelLoaded(GetHashKey(v.npcmodel)) do
            Wait(100)
        end
    
        local spawnCoords = v.npccoords
        local ped = CreatePed(GetHashKey(v.npcmodel), spawnCoords.x, spawnCoords.y, spawnCoords.z, v.npcheading, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        SetEntityNoCollisionEntity(PlayerPedId(), ped, false)
        SetEntityCanBeDamaged(ped, false)
        SetEntityInvincible(ped, true)
        Wait(2000)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetModelAsNoLongerNeeded(GetHashKey(v.npcmodel))
    end
end)

----- menu achat dans les gares

local maxAmountsell = nil

RegisterNetEvent("dust_train:SetMaxAmount", function(value)
    maxAmountsell = value
end)

RegisterNetEvent("dust_train:OpenImportMenu", function(sellingtable, type)
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
            TriggerServerEvent("dust_train:checkstash", data.current.value, MenuData, type)
            Wait(200)

            TriggerEvent("dust_train:SelectBuyingAmount", data.current.value, MenuData, type)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("dust_train:SelectBuyingAmount")
AddEventHandler("dust_train:SelectBuyingAmount", function(dataType, menuData, type)
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
        max = maxAmountsell 
        },
    }

    menuData.Open('default', GetCurrentResourceName(), 'buypavot', {
        title = "Acheter",
        subtext = "Choisir la quantité",
        align = 'top-right',
        elements = elements,
    },

    function(data, menu)
        if data.current.label == "Quantité" then
            TriggerServerEvent("dust_train:buyItem", dataType, data.current.value, type)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)


---- menu vente dans les gares


RegisterNetEvent("dust_train:sell:OpenExportMenu", function(selltable)
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


        for k, v in pairs(selltable) do
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
            TriggerServerEvent("dust_train:sell:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("dust_train:sell:SelectSellingAmount", data.current.value, MenuData, menu)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("dust_train:sell:SelectSellingAmount")
AddEventHandler("dust_train:sell:SelectSellingAmount", function(dataType, menuData, menu)
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
            TriggerServerEvent("dust_train:sell:SellItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("dust_train:sell:client:SetMaxAmount", function(value)
    maxsellamount = value
end)