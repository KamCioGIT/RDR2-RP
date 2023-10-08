RedEM = exports["redem_roleplay"]:RedEM()
local isMining = false
local isDeposit = false
local ressourcePointIndexForMining = nil
local isInBossMenu = false


Citizen.CreateThread(function()
    Wait(1000)
    if RedEM.GetPlayerData().isLoggedIn then
        TriggerServerEvent("dust_armurier:server:RequestJob")
    end
end)

local getjob = false
local getgrade = 0
RegisterNetEvent("redem_roleplay:JobChange")
AddEventHandler("redem_roleplay:JobChange", function(job, grade)
    for k, v in pairs(Config.Jobs) do
        if job == v then
            getjob = true
            getgrade = grade
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
                    mineraiprompt:setActiveThisFrame(true)
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
                        depprompt:setActiveThisFrame(true)
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
                    retprompt:setActiveThisFrame(true)
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
    local rand = math.random(1,100)
    for item, entry in pairs(Config.Loottable) do
        if rand <= entry.chance then
            Wait(200)
            selectedItem = entry.item
            print (rand, selectedItem)
            TriggerServerEvent('mineur:additem', item)
            break
        else
            rand = rand + entry.chance
        end
    end
end
