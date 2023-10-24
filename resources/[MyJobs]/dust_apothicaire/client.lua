RedEM = exports["redem_roleplay"]:RedEM()

local isInteracting = false


local maxCraftAmountdoctor = 0

local craftprompt = UipromptGroup:new("Atelier")
Uiprompt:new(0x760A9C6F, "Fabriquer", craftprompt)
craftprompt:setActive(false)


local getjob = false
local getgrade = 0
RegisterNetEvent("dust_job:doctor")
AddEventHandler("dust_job:doctor", function(job, grade)
    for k, v in pairs(Config.Jobs) do
        if job == v then
            getjob = true
            getgrade = grade
            StartMission()
        end
    end
end)


RegisterNetEvent("doctor:OpenBossMenu", function()
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
            table.insert(elements, {label = v.label, value = k, descriptionimages = v.descriptionimages})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Cuisine",
            subtext = "Laisse le cuisiner",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("doctor:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("doctor:SelectCraftingAmount", data.current.value, MenuData, menu)
            --
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("doctor:CraftingAction")
AddEventHandler("doctor:CraftingAction", function()
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


function StartMission()
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())
            for k, v in ipairs(Config.Atelier) do
                if #(playerPos - v) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                    craftprompt:setActiveThisFrame(true)
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerEvent("doctor:OpenBossMenu")
                    end
                end
            end
        end
    end)
end



AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    PromptDelete(CraftMenuPrompt)
end)

RegisterNetEvent("doctor:SelectCraftingAmount")
AddEventHandler("doctor:SelectCraftingAmount", function(dataType, menuData, menu)
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
        max = maxCraftAmountdoctor 
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
            TriggerServerEvent("doctor:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("doctor:client:SetMaxAmount", function(value)
    print (value)
    maxCraftAmountdoctor = value
end)



---- mortier
RegisterNetEvent('doctor:mortier', function()
    if getjob then
        TriggerEvent("mortier:OpenBossMenu")
    end
end)

RegisterNetEvent("mortier:OpenBossMenu", function()
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
            table.insert(elements, {label = v.label, value = k, descriptionimages = v.descriptionimages})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Mortier",
            subtext = "Fabriquer",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("mortier:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("mortier:SelectCraftingAmount", data.current.value, MenuData, menu)
            --
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("mortier:SelectCraftingAmount")
AddEventHandler("mortier:SelectCraftingAmount", function(dataType, menuData, menu)
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
        max = maxCraftAmountdoctor 
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
            TriggerServerEvent("doctor:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("mortier:client:SetMaxAmount", function(value)
    maxCraftAmountdoctor = value
end)