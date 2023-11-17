RedEM = exports["redem_roleplay"]:RedEM()

local isInteracting = false


local maxCraftAmountUsine = 0

local souffreprompt = UipromptGroup:new("Souffre")
Uiprompt:new(0x760A9C6F, "Récolter", souffreprompt)
souffreprompt:setActive(false)

local craftprompt = UipromptGroup:new("Atelier")
Uiprompt:new(0x760A9C6F, "Fabriquer", craftprompt)
craftprompt:setActive(false)


local getjob = false
local getgrade = 0
RegisterNetEvent("dust_job:usine")
AddEventHandler("dust_job:usine", function(job, grade)
    for k, v in pairs(Config.Jobs) do
        if job == v then
            getjob = true
            getgrade = grade
            StartMission()
        else
            getjob = false
            getgrade = 0
        end
    end
end)


function StartMission()
    Citizen.CreateThread(function()
        for k,v in pairs(Config.ImportPoint) do
            local blips = N_0x554d9d53f696d002(1664425300, v)
            SetBlipSprite(blips, 1838354131, 1)
            SetBlipScale(blips, 1.0)
            Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Fournisseur")
        end
        while true do
            if getjob then
                Wait(2)
                local playerPos = GetEntityCoords(PlayerPedId())
                if #(playerPos - Config.RessourcesPointPos) < 6.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.RessourcesPointPos.x, Config.RessourcesPointPos.y, Config.RessourcesPointPos.z - 1.0, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - Config.RessourcesPointPos) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        isInteracting = true
                        SouffreRecolt()
                    end
                end

                -- CREATE GUNPOWDER
                if #(playerPos - Config.Atelier) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.Atelier, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - Config.Atelier) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerEvent("usine:OpenBossMenu", "usineetabli")
                    end
                end


                if #(playerPos - Config.Etabli) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.Etabli, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - Config.Etabli) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerEvent("usine:OpenBossMenu", "usineetablideux")
                    end
                end

                if #(playerPos - Config.Poudre) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.Poudre, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - Config.Poudre) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerEvent("usine:OpenBossMenu", "usinepoudre")
                    end
                end

                if #(playerPos - Config.Assembly) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.Assembly, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - Config.Assembly) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerEvent("usine:OpenBossMenu", "usineassemblage")
                    end
                end

                for k, v in ipairs(Config.ImportPoint) do
                    if #(playerPos - v) < 10.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                            TriggerEvent("fermier:OpenImportMenu")
                        end
                    end
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


RegisterNetEvent("usine:OpenBossMenu", function(menutype)
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
            title = "usine",
            subtext = "C'est chaud",
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
        max = maxCraftAmountusine 
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
            TriggerServerEvent("usine:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("usine:client:SetMaxAmount", function(value)
    maxCraftAmountusine = value
end)


RegisterNetEvent("usine:OpenImportMenu", function()
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


        for k, v in pairs(Config.Import) do
            table.insert(elements, {label = v.label.." $"..v.price, value = k, price = v.price})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Marché",
            subtext = "Acheter",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            TriggerServerEvent("usine:buy", data.current.value, data.current.price)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)