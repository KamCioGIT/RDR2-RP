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
    isInteracting = true
    RequestAnimDict(Config.AnimDict)
    while not HasAnimDictLoaded(Config.AnimDict) do
        Citizen.Wait(50)
    end
    TaskPlayAnim(playerPed, Config.AnimDict, Config.CraftAnim, 4.0, 4.0, -1, 25, 0, true)

    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true

    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        ClearPedTasks(PlayerPedId())
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
                    TriggerEvent('dust_presskey', "Appuyez sur G")
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


local poisonprompt = UipromptGroup:new("Poison")
Uiprompt:new(0x5181713D, "Mélanger", poisonprompt)
Uiprompt:new(0x8E90C7BB, "Boire", poisonprompt):setHoldMode(true)
poisonprompt:setActive(false)

local poisontable = {}
RegisterNetEvent("doctor:poison", function(ptable)
    poisontable = ptable
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
        local pname = GetHashKey('s_rc_poisonedwater01x')
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
        if Gourde and not isInteracting then
            poisonprompt:setActiveThisFrame(true)
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
            RemoveAllPedWeapons(PlayerPedId(), true)

            if IsControlJustReleased(0, 0x5181713D) and not Gourding and not isInteracting then
                TriggerEvent("poison:menu", poisontable)
            end

            if poisonprompt:hasHoldModeJustCompleted() and not Gourding and not isInteracting then
                local dict = "amb_rest_drunk@world_human_drinking@male_a@idle_a"
                local playerPed = PlayerPedId()
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    Citizen.Wait(10)
                end
                TaskPlayAnim(PlayerPedId(), dict, "idle_a", 1.0, 8.0, -1, 31, 0, false, false, false)
                Citizen.Wait(4000)
                TriggerEvent("dust_maladie:poison")
            end
        end
    end
end)



RegisterNetEvent("poison:menu", function(poisontable)
    local Position = GetEntityCoords(PlayerPedId())
    local playerPed = PlayerPedId()
    isInteracting = true
    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 1.5 then
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
        for k, v in pairs(poisontable) do
            if k then
                table.insert(elements, {label = v.label, value = k, desc = "Que vous êtes sournois..."})
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
            title = "Poison",
            subtext = "Recettes",
            align = 'top-right',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("redemrp_inventory:ChangePoison", data.current.value)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("doctor:getpoison", function()
    TriggerEvent("dust_maladie:poison")
end)
