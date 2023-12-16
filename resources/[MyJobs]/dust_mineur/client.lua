RedEM = exports["redem_roleplay"]:RedEM()
local isMining = false
local isDeposit = false
local ressourcePointIndexForMining = nil
local isInBossMenu = false


local getjob = false
local getgrade = tonumber(0)
RegisterNetEvent("dust_job:mineur")
AddEventHandler("dust_job:mineur", function(job, grade)
    for k, v in pairs(Config.Jobs) do
        if job == v then
            getjob = true
            getgrade = tonumber(grade)
            startMission()
            if getgrade >= 2 then
                contremaitre()
            end
        else
            getjob = false
            getgrade = 0
        end
    end
end)


-- VA MINER   
local mineraiprompt = UipromptGroup:new("Minerai")
Uiprompt:new(0x760A9C6F, "Miner", mineraiprompt)
mineraiprompt:setActive(false)

local depprompt = UipromptGroup:new("Tapis")
Uiprompt:new(0x760A9C6F, "Déposer", depprompt)
depprompt:setActive(false)

Citizen.CreateThread(function()
    for _, data in pairs(Config.Blips) do
        local blipId = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, data.x, data.y, data.z)
        SetBlipSprite(blipId, data.sprite, 1);
        if data.color then
            Citizen.InvokeNative(0x662D364ABF16DE2F, blipId, GetHashKey(data.color));
        else 
            Citizen.InvokeNative(0x662D364ABF16DE2F, blipId, GetHashKey(Config.colors.WHITE));
        end
        local varString = CreateVarString(10, 'LITERAL_STRING', data.name);
        Citizen.InvokeNative(0x9CB1A1623062F402, blipId, varString)
    end
    TriggerServerEvent("mineur:askpricetable")


    for k,v in pairs(Config.SellNPC) do
        local model = RequestModel(GetHashKey("loansharking_asbminer_males_01"))

        while not HasModelLoaded(GetHashKey("loansharking_asbminer_males_01")) do
            Wait(100)
        end

        local spawnCoords = v.coords
        local ped = CreatePed(GetHashKey("loansharking_asbminer_males_01"), spawnCoords.x, spawnCoords.y, spawnCoords.z, v.heading, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        SetEntityNoCollisionEntity(PlayerPedId(), ped, false)
        SetEntityCanBeDamaged(ped, false)
        SetEntityInvincible(ped, true)
        Wait(2000)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetModelAsNoLongerNeeded(GetHashKey("loansharking_asbminer_males_01"))
    end
    GetRandomRessourcePoint()
    Citizen.CreateThread(function() --- MINERAI
        while true do
                Wait(0)
                local playerPos = GetEntityCoords(PlayerPedId())
                if #(playerPos - Config.RessourcesPoints[ressourcePointIndexForMining]) < Config.DistanceToInteract and not isMining then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(0, 0x760A9C6F) and not isMining then 
                        StartMining()
                    end
                else end
                for k, v in pairs(Config.SellNPC) do
                    if #(playerPos - v.interact) < 10.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.interact, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - v.interact) < Config.DistanceToInteract and not isInteracting then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                            TriggerEvent("mineur:OpenExportMenu")
                        end
                    end
                end
        end
    end)
    -- Citizen.CreateThread(function() --- DEPOT
    --     while true do
    --         if getjob then
    --             Wait(0)
    --             local playerPos = GetEntityCoords(PlayerPedId())
    --             for k, v in ipairs(Config.MinerJobDepositPos) do
    --                 if #(playerPos - v) < 6.0 then
    --                     Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
    --                 end
    --                 if #(playerPos - v) < Config.DistanceToInteract then
    --                     TriggerEvent('dust_presskey', "Appuyez sur G")
    --                     if IsControlJustPressed(2, 0x760A9C6F) then 
    --                         TriggerServerEvent('mineur:server:mineur:depStash')
    --                     end
    --                 else end
    --             end
    --         end
    --     end
    -- end)


end)

local retprompt = UipromptGroup:new("Tapis")
Uiprompt:new(0x760A9C6F, "Récupérer", retprompt)
retprompt:setActive(false)

function contremaitre() --- RETRAIT
    while true do    
        if getjob then
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())
            for k, v in ipairs(Config.MinerJobWithdrawalPos) do
                if #(playerPos - v) < 6.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) then 
                        TriggerServerEvent('mineur:server:mineur:retStash')
                    end
                else end
            end
            for k, v in ipairs(Config.BuyingPoint) do
                if #(playerPos - v) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerServerEvent("mineur:checksellingstash", "ret_mineur")
                    end
                end
            end
        end
    end
end


local blip
function GetRandomRessourcePoint()
    if blip ~= nil then 
        RemoveBlip(blip)
    end

    ressourcePointIndexForMining = math.random(1, #Config.RessourcesPoints)
    blip = Citizen.InvokeNative(0x554d9d53f696d002, Config.PointSprite, Config.RessourcesPoints[ressourcePointIndexForMining].x, Config.RessourcesPoints[ressourcePointIndexForMining].y, Config.RessourcesPoints[ressourcePointIndexForMining].z)
    Citizen.CreateThread(function()
        while true do
            Wait(50)
            local playerPos = GetEntityCoords(PlayerPedId())    
            if #(playerPos - Config.RessourcesPoints[ressourcePointIndexForMining]) < 100 then
                
                DeleteEntity(tempweath)
                tempweath = CreateObject(GetHashKey("old_hen_rock_02"), Config.RessourcesPoints[ressourcePointIndexForMining].x, Config.RessourcesPoints[ressourcePointIndexForMining].y, Config.RessourcesPoints[ressourcePointIndexForMining].z, false, true, true)
                PlaceObjectOnGroundProperly(tempweath)
                FreezeEntityPosition(tempweath, true)
                break
            end
        end
    end)
end

-- ACTION DE MINER
function StartMining()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    started = false
    pressing = false
    FreezeEntityPosition(playerPed, true)
    TaskStartScenarioInPlace(playerPed, GetHashKey(Config.MiningAnim), Config.WorkingTime, true, false, false, false)
    local timer = GetGameTimer() + Config.WorkingTime
    isMining = true
    Citizen.CreateThread(function()
        while GetGameTimer() < timer do
            Wait(0)
        end
        ClearPedTasksImmediately(PlayerPedId())
		FreezeEntityPosition(playerPed, false)
        isMining = false
        GivePlayerRessource()
        DeleteEntity(temprock)
        GetRandomRessourcePoint()
    end)
end

---- RECOLTE CHARBON

function GivePlayerRessource()
    local rand = math.random(100)
    print (rand)
    if rand <= 25 then
        Wait(200)
        TriggerServerEvent('mineur:additem', "charbon", 3)
    elseif rand > 25 and rand <= 50 then
        Wait(200)
        TriggerServerEvent('mineur:additem', "ferbrut", 4)
    elseif rand > 50 and rand <= 70 then
        Wait(200)
        TriggerServerEvent('mineur:additem', "cuivrebrut", 6)
    elseif rand > 70 and rand <= 85 then
        Wait(200)
        TriggerServerEvent('mineur:additem', "zincbrut", 3)
    elseif rand > 85 and rand <= 100 then
        Wait(200)
        TriggerServerEvent('mineur:additem', "plombbrut", 3)
    end
end


-----  sell 
local pricetable = {}
RegisterNetEvent("mineur:getpricetable", function(table)
    pricetable = table
end)

RegisterNetEvent("mineur:OpenExportMenu", function(selltable, localisation)
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
            table.insert(elements, {label = v.label.." $"..pricetable[k], value = k, price = pricetable[k]})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Exportateur",
            subtext = "Vendre",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("mineur:MaxSellingAmount", data.current.value)
            Wait(150)
            TriggerEvent("mineur:SelectSellingAmount", data.current.value, MenuData, menu, localisation)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)


RegisterNetEvent("mineur:SelectSellingAmount")
AddEventHandler("mineur:SelectSellingAmount", function(dataType, menuData, menu, localisation)
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
            TriggerServerEvent("mineur:SellItem", dataType, menu, data.current.value, localisation)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("mineur:client:SetMaxAmount", function(value)
    maxsellamount = value
end)


----- achat

local maxAmountmineur = nil

RegisterNetEvent("mineur:client:SetMaxAmount", function(value)
    maxAmountmineur = value
end)

RegisterNetEvent("mineur:OpenBuyingMenu", function(sellingtable, type)
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
            TriggerServerEvent("mineur:checkstash", data.current.value, MenuData, type)
            Wait(200)

            TriggerEvent("mineur:SelectBuyingAmount", data.current.value, MenuData, type)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("mineur:SelectBuyingAmount")
AddEventHandler("mineur:SelectBuyingAmount", function(dataType, menuData, type)
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
        max = maxAmountmineur 
        },
    }

    menuData.Open('default', GetCurrentResourceName(), 'buymineur', {
        title = "Acheter",
        subtext = "Choisir la quantité",
        align = 'top-right',
        elements = elements,
    },

    function(data, menu)
        if data.current.label == "Quantité" then
            TriggerServerEvent("mineur:buyItem", dataType, data.current.value, type)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)
