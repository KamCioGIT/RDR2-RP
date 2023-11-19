RedEM = exports["redem_roleplay"]:RedEM()



RegisterNetEvent("dust_job:transport")
AddEventHandler("dust_job:transport", function(job, grade)
    for k, v in pairs(Config.Jobs) do
        if job == v then
            TriggerEvent("dust_transport:getaccess")
        end
    end
end)



RegisterNetEvent("dust_transport:getaccess", function()
    if Config.ExportBla then
        local blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, Config.ExportBla)
        SetBlipSprite(blip, 623155783, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Gros Exportateur")
    end
    if Config.ExportStDenis then
        local blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, Config.ExportStDenis)
        SetBlipSprite(blip, 623155783, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Gros Exportateur")
    end
    
    while true do
        Citizen.Wait(1)
        local pcoords = GetEntityCoords(PlayerPedId())
        if #(pcoords - Config.ExportBla) < 10.0 then
            Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.ExportBla, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
        end
        if Vdist(pcoords, Config.ExportBla) < 2.0 then
            TriggerEvent('dust_presskey', "Appuyez sur G")
            if IsControlJustReleased(0, 0x760A9C6F) then
                TriggerServerEvent("dust_transport:chekitem", "Blackwater")
            end
        end

        if #(pcoords - Config.ExportStDenis) < 10.0 then
            Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.ExportStDenis, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
        end
        if Vdist(pcoords, Config.ExportStDenis) < 2.0 then
            TriggerEvent('dust_presskey', "Appuyez sur G")
            if IsControlJustReleased(0, 0x760A9C6F) then
                TriggerServerEvent("dust_transport:chekitem", "StDenis")
            end
        end
    end
end)

RegisterNetEvent("dust_transport:OpenExportMenu", function(selltable)
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
            TriggerServerEvent("dust_transport:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("dust_transport:SelectSellingAmount", data.current.value, MenuData, menu)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("dust_transport:SelectSellingAmount")
AddEventHandler("dust_transport:SelectSellingAmount", function(dataType, menuData, menu)
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
            TriggerServerEvent("dust_transport:SellItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("dust_transport:client:SetMaxAmount", function(value)
    maxsellamount = value
end)