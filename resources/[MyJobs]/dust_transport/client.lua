RedEM = exports["redem_roleplay"]:RedEM()



RegisterNetEvent("dust_job:store")
AddEventHandler("dust_job:store", function(job, grade)
    for k, v in pairs(Config.Jobs) do
        if job == v then
            getjob = job
            StartMission()
        end
    end
end)



RegisterNetEvent("dust_transport:getaccess", function()
    if Config.ExportBla then
        for k, v in pairs(Config.ExportBla) do
            local blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, v)
            SetBlipSprite(blip, 688589278, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Exportateur")
        end
    end
    if Config.ExportStDenis then
        for k, v in pairs(Config.ExportStDenis) do
            local blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, v)
            SetBlipSprite(blip, 688589278, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Exportateur")
        end
    end
    
    while true do
        Citizen.Wait(1)
        local pcoords = GetEntityCoords(PlayerPedId())
        for k, v in ipairs(Config.ExportBla) do
            if #(pcoords - v) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if Vdist(pcoords, v) < 2.0 then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustReleased(0, 0x760A9C6F) then
                    TriggerServerEvent("dust_transport:chekitem", "Blackwater")
                end
            end
        end

        for k, v in ipairs(Config.ExportStDenis) do
            if #(pcoords - v) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if Vdist(pcoords, v) < 2.0 then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustReleased(0, 0x760A9C6F) then
                    TriggerServerEvent("dust_transport:chekitem", "StDenis")
                end
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
            TriggerServerEvent("dust_export:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("dust_export:SelectSellingAmount", data.current.value, MenuData, menu)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)