RedEM = exports["redem_roleplay"]:RedEM()

local isInteracting = false


local maxCraftAmountUsine = 0

local souffreprompt = UipromptGroup:new("Souffre")
Uiprompt:new(0x760A9C6F, "Récolter", souffreprompt)
souffreprompt:setActive(false)

local craftprompt = UipromptGroup:new("Atelier")
Uiprompt:new(0x760A9C6F, "Fabriquer", craftprompt)
craftprompt:setActive(false)

Citizen.CreateThread(function()
    Wait(1000)
    if RedEM.GetPlayerData().isLoggedIn then
        TriggerServerEvent("dust_usine:server:RequestJob")
    end
end)

RegisterNetEvent("dust_usine:client:ReceiveJob", function(job, grade)
    if job == "usine" then
        StartMission()
        -- if grade >= 2 then
        --     if grade >= 3 then

        --     end
        -- end
    end
end)


RegisterNetEvent("usine:OpenBossMenu", function(menutype)
    local Position = GetEntityCoords(PlayerPedId())
    local _menutype = menutype

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

        if jobgrade >= 1 then

            if _menutype == 'gunpowder' then 
                table.insert(elements, {label = "Poudre à canon", value = 'gunpowder', desc = "Transformation > 5 Charbon + 10 Soufre = 10 Poudre à canon"})
                table.insert(elements, {label = "Douille", value = 'douille', desc = "Transformation > 1 Cuivre + 1 Plomb"})
                table.insert(elements, {label = "Pièce d'arme", value = 'piecearme', desc = "Transformation >  10 Fer + 1 Charbon"})
            end

            if jobgrade > 1 then
                if _menutype == 'atelier' then 
                    table.insert(elements, {label = "Munitions de Revolver", value = 'ammo_revolver', desc = "Transformation > 10 GunPowder + 10 Douilles"})
                    table.insert(elements, {label = "Munitions de Pistolet", value = 'ammo_pistol', desc = "Transformation > 10 GunPowder + 10 Douilles"})
                    table.insert(elements, {label = "Munitions de Carabine", value = 'ammo_repeater', desc = "Transformation > 15 GunPowder + 10 Douilles"})
                    table.insert(elements, {label = "Munitions de Fusil", value = 'ammo_rifle', desc = "Transformation > 20 GunPowder + 10 Douilles"})
                    table.insert(elements, {label = "Chevrotines", value = 'ammo_shotgun', desc = "Transformation > 15 GunPowder + 10 Douilles"})
                end
            end

        else
            return RedEM.Functions.NotifyRight("You don't have any options here.", 3000)
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Atelier",
            subtext = "Fabrication de munitions",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("usine:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("usine:SelectCraftingAmount", data.current.value, MenuData, menu)
            --
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("usine:CraftingAction")
AddEventHandler("usine:CraftingAction", function()
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
            Wait(2)
            local playerPos = GetEntityCoords(PlayerPedId())
            if #(playerPos - Config.RessourcesPointPos) < 6.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.RessourcesPointPos.x, Config.RessourcesPointPos.y, Config.RessourcesPointPos.z - 1.0, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - Config.RessourcesPointPos) < Config.DistanceToInteract and not isInteracting then
                souffreprompt:setActiveThisFrame(true)
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    isInteracting = true
                    SouffreRecolt()
                end
            end

            -- CREATE GUNPOWDER
            if #(playerPos - Config.CreateGunPowerPos) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.CreateGunPowerPos.x, Config.CreateGunPowerPos.y, Config.CreateGunPowerPos.z - 1.0, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - Config.CreateGunPowerPos) < Config.DistanceToInteract and not isInteracting then
                craftprompt:setActiveThisFrame(true)
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then
                    isInteracting = true
                    TriggerServerEvent("usine:RequestBossMenu", 'gunpowder')
                end
            end

            -- CREATE GUNPOWDER
            if #(playerPos - Config.Atelier) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.Atelier.x, Config.Atelier.y, Config.Atelier.z - 1.0, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - Config.Atelier) < Config.DistanceToInteract and not isInteracting then
                craftprompt:setActiveThisFrame(true)
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    TriggerServerEvent("usine:RequestBossMenu", 'atelier')
                end
            end
        end
    end)
end

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
        TriggerServerEvent('usine:AddItem', 'souffre', 1)
    end)
end


AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    PromptDelete(CraftMenuPrompt)
end)

RegisterNetEvent("usine:SelectCraftingAmount")
AddEventHandler("usine:SelectCraftingAmount", function(dataType, menuData, menu)
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
        max = maxCraftAmountUsine 
        },
    }

    menuData.Open('default', GetCurrentResourceName(), 'craft', {
        title = "Atelier",
        subtext = "Choisir la quantité",
        align = 'top-right',
        elements = elements,
    },

    function(data, menu)
        if data.current.label == "Crafting Amount" then
            print("Start crafting" .. dataType .. " " .. data.current.value .. " times")
            TriggerServerEvent("usine:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        else
            RedEM.Functions.NotifyLeft("Invalid entry!", "Enter a valid ID.", "menu_textures", "menu_icon_alert", 4000)
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("usine:client:SetMaxAmount", function(value)
    maxCraftAmountUsine = value
end)

