RedEM = exports["redem_roleplay"]:RedEM()
local isInteracting = false
local isDeposit = false
local ressourcePointIndexForMining = nil
local isInBossMenu = false
local showweath = false

Citizen.CreateThread(function()
    while RedEM.GetPlayerData().isLoggedIn ~= true do 
        Wait(5000)
        TriggerServerEvent("fermier:askjob")
    end
    if RedEM.GetPlayerData().isLoggedIn then
        TriggerServerEvent("fermier:askjob")
    end
end)

--- Définir si le joueur est fermier 
RegisterNetEvent("fermier:CheckPlayerJob", function(job, jobgrade)
    if job == "fermier" then
        startMission()
        if jobgrade >= 2 then
            contremaitre()
            if jobgrade == 3 then
                patronUpdate()  
            end 
        end
    end
end)


-- VA MINER   
local bleprompt = UipromptGroup:new("Blé")
Uiprompt:new(0x760A9C6F, "Récolter", bleprompt)
bleprompt:setActive(false)

local depprompt = UipromptGroup:new("Blé")
Uiprompt:new(0x760A9C6F, "Déposer", depprompt)
depprompt:setActive(false)

function startMission()
    GetRandomRessourcePoint()
    Citizen.CreateThread(function() --- MINERAI
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())
            if #(playerPos - Config.RessourcesPoints[ressourcePointIndexForMining]) < Config.DistanceToInteract and not isInteracting then
                bleprompt:setActiveThisFrame(true)
                if IsControlJustPressed(0, 0x760A9C6F) and not isInteracting then 
                    StartMining()
                end
            else end
        end
    end)
    Citizen.CreateThread(function() --- DEPOT
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())
            for k, v in ipairs(Config.FarmerDepositPos) do
                if #(playerPos - v) < 6.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                    depprompt:setActiveThisFrame(true)
                    if IsControlJustPressed(2, 0x760A9C6F) then 
                        TriggerServerEvent('fermier:depStash')
                    end
                else end
            end
        end
    end)
end

local retprompt = UipromptGroup:new("Farine")
Uiprompt:new(0x760A9C6F, "Récupérer", retprompt)
retprompt:setActive(false)

function contremaitre() --- RETRAIT
    while true do    
        Wait(0)
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, v in ipairs(Config.FarmerWithdrawalPos) do
            if #(playerPos - v) < 6.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v) < Config.DistanceToInteract then
                retprompt:setActiveThisFrame(true)
                if IsControlJustPressed(2, 0x760A9C6F) then 
                    TriggerServerEvent('fermier:retStash')
                end
            else end
        end
    end
end

local patronprompt = UipromptGroup:new("Patron")
Uiprompt:new(0x760A9C6F, "Gérer", patronprompt)
patronprompt:setActive(false)
function patronUpdate()
    while true do
        Wait(0)
        local playerPos = GetEntityCoords(PlayerPedId())    
        for k, v in ipairs(Config.GetVirginContractPos) do
            if #(playerPos - v) < 6.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v) < Config.DistanceToInteract and not isInBossMenu then
                patronprompt:setActiveThisFrame(true)
                if IsControlJustPressed(2, 0x760A9C6F) then 
                    TriggerServerEvent('fermier:RequestBossMenu')
                    isInBossMenu = true
                end
            else end
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
                tempweath = CreateObject(GetHashKey("crp_wheat_dry_aa_sim"), Config.RessourcesPoints[ressourcePointIndexForMining].x, Config.RessourcesPoints[ressourcePointIndexForMining].y, Config.RessourcesPoints[ressourcePointIndexForMining].z, false, true, true)
                PlaceObjectOnGroundProperly(tempweath)
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
    RequestAnimDict(Config.GatherDict)
    while not HasAnimDictLoaded(Config.GatherDict) do
        Wait(10)
    end
    TaskPlayAnim(playerPed, Config.GatherDict, "stn_enter", 1.0, 1.0, -1, 2, 0, false, false, false)
    Wait(500)
    TaskPlayAnim(playerPed, Config.GatherDict, Config.GatherAnim, 1.0, 1.0, -1, 1, 0, false, false, false)
    isInteracting = true
    local timer = GetGameTimer() + Config.WorkingTime
    Citizen.CreateThread(function()
        
        while GetGameTimer() < timer do 
            Wait(0)
        end
        DeleteEntity(tempweath)
		FreezeEntityPosition(playerPed, false)
        TaskPlayAnim(playerPed, Config.GatherDict, "stn_exit", 1.0, 1.0, -1, 2, 0, false, false, false)
        Wait(500)
        ClearPedTasks(playerPed)
        GivePlayerRessource()
        isInteracting = false
        GetRandomRessourcePoint()
    end)
end


function GivePlayerRessource()
    TriggerServerEvent('fermier:addble')
end



RegisterNetEvent("fermier:OpenBossMenu", function()
    local Position = GetEntityCoords(PlayerPedId())

    Citizen.CreateThread(function()
        while true do
            Wait(250)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    isInBossMenu = false
                end)
                return
            end
        end
    end)

    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local jobgrade = RedEM.GetPlayerData().jobgrade

        local elements = {}

        if jobgrade > 2 then
            table.insert(elements, {label = "Contrat pour fermier", value = 'virginFarmerContrat', desc = "Retirer un contrat vierge de fermier"})
        else
            return RedEM.Functions.NotifyRight("You don't have any options here.", 3000)
        end

        MenuData.Open('default', GetCurrentResourceName(), 'farmerrecrutement', {
            title = "Fermier",
            subtext = "Recruter des fermiers",
            align = 'top-left',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent('dust_contract:AddVirginContrat')
        end,

        function(data, menu)
            menu.close()
        end)
    end)
end)