RedEM = exports["redem_roleplay"]:RedEM()

local ressourcePointIndexForMining = nil

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


local isInteracting = false


local maxCraftAmountchasse = 0


local getjob = false
local getgrade = 0
RegisterNetEvent("dust_job:chasse")
AddEventHandler("dust_job:chasse", function(job, grade)

    for k, v in pairs(Config.Jobs) do

        if job == v then
            getjob = true
            getgrade = grade
            StartMission()
        end
    end
end)


RegisterNetEvent("chasse:OpenBossMenu", function(menutype)
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
            title = "chasse",
            subtext = "C'est chaud",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("chasse:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("chasse:SelectCraftingAmount", data.current.value, MenuData, menu)
            --
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("chasse:CraftingAction")
AddEventHandler("chasse:CraftingAction", function()
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

RegisterNetEvent("chasse:SelectCraftingAmount")
AddEventHandler("chasse:SelectCraftingAmount", function(dataType, menuData, menu)
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
        max = maxCraftAmountchasse 
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
            TriggerServerEvent("chasse:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("chasse:client:SetMaxAmount", function(value)
    maxCraftAmountchasse = value
end)




function StartMission()
    Citizen.CreateThread(function()
        while true do
            if getjob then
                Wait(2)
                local playerPos = GetEntityCoords(PlayerPedId())


                for k, pos in pairs(Config.Atelier) do
                    if #(playerPos - pos) < 10.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, pos, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - pos) < Config.DistanceToInteract and not isInteracting then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                            TriggerEvent("chasse:OpenBossMenu", "chasseetabli")
                        end
                    end
                end
            end
        end
    end)
end







local depviandeprompt = UipromptGroup:new("Boucherie")
Uiprompt:new(0x760A9C6F, "Récupérer la viande", depviandeprompt)
depviandeprompt:setActive(false)


Citizen.CreateThread(function()
    for k,v in pairs(Config.Boucher) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, 1369919445, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Boucher")
	end
    for k,v in pairs(Config.Relais) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, 423351566, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Relais de Chasse")
	end
    while true do
        Citizen.Wait(1)
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, v in ipairs(Config.Boucher) do
            if #(playerPos - v) < 6.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 2.2, 2.2, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarke
                if #(playerPos - v) < 2.2 then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustReleased(0, 0x760A9C6F) then 
                        depviande()
                    end
                end
            end  
        end       
    end
end)

function depviande() -- Carcasse into viande
    local playerPed = PlayerPedId()
    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local hold = GetPedType(holding)
    local quality = Citizen.InvokeNative(0x88EFFED5FE8B0B4A, holding) -- Native pour l'état de la carcasse
    local model = GetEntityModel(holding)
    if holding ~= false then
        for i, row in pairs(Config.Animal) do
            if hold == 28 then
                print(model)
                if model == Config.Animal[i]["model"] then
                    if quality == false then
                        local deleted = DeleteThis(holding)
                        if deleted then
                            local dict = "amb_camp@prop_camp_butcher@working@rabbit@male_a@rabbit_chop@base"
                            RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do
                                Wait(10)
                            end
                            TaskPlayAnim(playerPed, dict, "rabbitchop_trans_meatscoop", 1.0, 1.0, -1, 0, 0, false, false, false)
                            Wait(3000)
                            ClearPedTasks(playerPed)
                            -- TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["viande"], 1)
                        end
                    elseif quality ~= false then                   
                        local deleted = DeleteThis(holding)
                        if deleted then
                            local dict = "amb_camp@prop_camp_butcher@working@rabbit@male_a@rabbit_chop@base"
                            RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do
                                Wait(10)
                            end
                            TaskPlayAnim(playerPed, dict, "rabbitchop_trans_meatscoop", 1.0, 1.0, -1, 0, 0, false, false, false)
                            Wait(3000)
                            ClearPedTasks(playerPed)
                            TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["viande"], (2))
                        end
                    end
                end
            end
        end
    else
    end
end

local deppeauprompt = UipromptGroup:new("Tannerie")
Uiprompt:new(0x760A9C6F, "Récupérer le cuir", deppeauprompt)
deppeauprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, v in ipairs(Config.Craftcuir) do
            if #(playerPos - v) < 6.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 2.2, 2.2, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarke
                if #(playerPos - v) < 2.2 then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustReleased(0, 0x760A9C6F) then 
                        deppeau()
                    end
                end
            end  
        end       
    end
end)

function deppeau() -- Peau into cuir
    local playerPed = PlayerPedId()
    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, holding) -- Native pour l'état de la peau
    local model = GetEntityModel(holding)
    local hold = GetPedType(holding)
    if holding ~= false then
        for i, row in pairs(Config.Animal) do
            if quality ~= false then
                print(quality)
                if quality == Config.Animal[i]["poor"] then
                    local deleted = DeleteThis(holding)
                    if deleted then
                        local dict = "amb_work@prop_human_tanning_rack_fleshing@male_a@base"
                        RequestAnimDict(dict)
                        while not HasAnimDictLoaded(dict) do
                            Wait(10)
                        end
                        TaskPlayAnim(playerPed, dict, "base", 1.0, 1.0, -1, 0, 0, false, false, false)
                        Wait(3000)
                        ClearPedTasks(playerPed)
                        TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["peau"], 1)
                    end
                elseif quality == Config.Animal[i]["good"] then
                    local deleted = DeleteThis(holding)   
                    if deleted then
                        local dict = "amb_work@prop_human_tanning_rack_fleshing@male_a@base"
                        RequestAnimDict(dict)
                        while not HasAnimDictLoaded(dict) do
                            Wait(10)
                        end
                        TaskPlayAnim(playerPed, dict, "base", 1.0, 1.0, -1, 0, 0, false, false, false)
                        Wait(3000)
                        ClearPedTasks(playerPed)
                        TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["peau"], 2)
                    end
                elseif quality == Config.Animal[i]["perfect"] then
                    local deleted = DeleteThis(holding)   
                    if deleted then
                        local dict = "amb_work@prop_human_tanning_rack_fleshing@male_a@base"
                        RequestAnimDict(dict)
                        while not HasAnimDictLoaded(dict) do
                            Wait(10)
                        end
                        TaskPlayAnim(playerPed, dict, "base", 1.0, 1.0, -1, 0, 0, false, false, false)
                        Wait(3000)
                        ClearPedTasks(playerPed)
                        TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["peau"], 2)
                    end
                end
            end

        end
    else
    end
end

function DeleteThis(holding) -- Delete carcasse
    NetworkRequestControlOfEntity(holding)
    SetEntityAsMissionEntity(holding, true, true)
    Wait(100)
    DeleteEntity(holding)
    Wait(500)
    local entitycheck = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local holdingcheck = GetPedType(entitycheck)
    if holdingcheck == 0 then
        return true
    else
        return false
    end
end

-- DRAW TEXT ON SCREEEN w/ BACKGROUND

-- RegisterCommand('cart', function()
--     huntcart()
-- end)

local huntingwagonstash = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
    [4] = nil,
    [5] = nil,
    [6] = nil,
    [7] = nil,
    [8] = nil,
    [9] = nil,
    [10] = nil
}

function huntcart()
    local playerPed = PlayerPedId() -- get the local player ped
    local pos = GetEntityCoords(playerPed) -- get the position of the local player ped
    
    if not HasModelLoaded(-1698498246) then
        RequestModel(-1698498246)
        while not HasModelLoaded(-1698498246) do
            Citizen.Wait(10)
        end
    end
    wagon = CreateVehicle(-1698498246, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
    if not Citizen.InvokeNative(0x48A88FC684C55FDC, GetHashKey("pg_mp005_huntingWagonTarp01")) then
        Citizen.InvokeNative(0xF3DE57A46D5585E9, GetHashKey("pg_mp005_huntingWagonTarp01"))
    end
    SetIgnoreVehicleOwnershipForStowing(0) -- Donne l'accès à l'arrière à tout les joueurs
    Citizen.InvokeNative(0x75F90E4051CC084C, wagon, GetHashKey("pg_mp005_huntingWagonTarp01"))
    Citizen.Wait(500)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(0.0), true)-- Gère la hauteur du drap
    Citizen.Wait(2000)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(0.2), true)
    Citizen.Wait(2000)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(0.3), true)
    Citizen.Wait(2000)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(0.4), true)
    Citizen.Wait(2000)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(0.7), true)
    Citizen.Wait(2000)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(1.0), true)
    Citizen.Wait(2000)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(1.2), true)
    Citizen.Wait(2000)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(1.4), true)
end

