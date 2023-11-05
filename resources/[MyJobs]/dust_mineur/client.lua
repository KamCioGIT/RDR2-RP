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

function startMission()
    GetRandomRessourcePoint()
    Citizen.CreateThread(function() --- MINERAI
        while true do
            if getjob then
                Wait(0)
                local playerPos = GetEntityCoords(PlayerPedId())
                if #(playerPos - Config.RessourcesPoints[ressourcePointIndexForMining]) < Config.DistanceToInteract and not isMining then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(0, 0x760A9C6F) and not isMining then 
                        StartMining()
                    end
                else end
            end
        end
    end)
    Citizen.CreateThread(function() --- DEPOT
        while true do
            if getjob then
                Wait(0)
                local playerPos = GetEntityCoords(PlayerPedId())
                for k, v in ipairs(Config.MinerJobDepositPos) do
                    if #(playerPos - v) < 6.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - v) < Config.DistanceToInteract then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) then 
                            TriggerServerEvent('mineur:server:mineur:depStash')
                        end
                    else end
                end
            end
        end
    end)
end

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
        TriggerServerEvent('mineur:additem', "ferbrut", 5)
    elseif rand > 50 and rand <= 70 then
        Wait(200)
        TriggerServerEvent('mineur:additem', "cuivrebrut", 5)
    elseif rand > 70 and rand <= 85 then
        Wait(200)
        TriggerServerEvent('mineur:additem', "zincbrut", 3)
    elseif rand > 85 and rand <= 100 then
        Wait(200)
        TriggerServerEvent('mineur:additem', "plombbrut", 4)
    end
end
