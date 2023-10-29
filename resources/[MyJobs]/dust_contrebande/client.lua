RedEM = exports["redem_roleplay"]:RedEM()

local isInteracting = false


local maxCraftAmountcontrebande = 0


local craftprompt = UipromptGroup:new("Atelier")
Uiprompt:new(0x760A9C6F, "Fabriquer", craftprompt)
craftprompt:setActive(false)




Citizen.CreateThread(function()
    while true do
        Wait(2)
        local playerPos = GetEntityCoords(PlayerPedId())

        -- CREATE GUNPOWDER
        for k, v in pairs(Config.AtelierMoonshine) do
            if #(playerPos - v) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    TriggerEvent("contrebande:OpenBossMenu", "moonshine")
                end
            end
        end


        for k, v in pairs(Config.AtelierOpium) do
            if #(playerPos - v) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    TriggerEvent("contrebande:OpenBossMenu", "opium")
                end
            end
        end

        for k, v in pairs(Config.AlambicMoonshine) do
            if #(playerPos - v.input) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.input, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v.input) < Config.DistanceToInteract and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    TriggerServerEvent('moonshine:depStash', v.group)
                end
            end
            if #(playerPos - v.output) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.output, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v.output) < Config.DistanceToInteract and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    TriggerServerEvent('moonshine:retStash', v.group)
                end
            end
        end

    end
end)


function SouffreRecolt()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    FreezeEntityPosition(playerPed, true)
    RequestAnimDict(Config.RecolteSouffreDict)
    while not HasAnimDictLoaded(Config.RecolteSouffreDict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), Config.RecolteSouffreDict, Config.RecolteSouffreAnim, 1.0, 1.0, -1, 0, 0, true, 0, false, 0, false)
    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true
    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        ClearPedTasks(playerPed)
		FreezeEntityPosition(playerPed, false)
        isInteracting = false
        TriggerServerEvent('contrebande:AddItem', 'souffre', 1)
    end)
end


AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    PromptDelete(CraftMenuPrompt)
end)


RegisterNetEvent("contrebande:OpenBossMenu", function(menutype)
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
            title = "contrebande",
            subtext = "C'est chaud",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("contrebande:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("contrebande:SelectCraftingAmount", data.current.value, MenuData, menu)
            --
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("contrebande:CraftingAction")
AddEventHandler("contrebande:CraftingAction", function()
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

RegisterNetEvent("contrebande:SelectCraftingAmount")
AddEventHandler("contrebande:SelectCraftingAmount", function(dataType, menuData, menu)
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
        max = maxCraftAmountcontrebande 
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
            TriggerServerEvent("contrebande:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("contrebande:client:SetMaxAmount", function(value)
    maxCraftAmountcontrebande = value
end)
