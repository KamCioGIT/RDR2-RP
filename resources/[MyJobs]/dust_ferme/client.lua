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


Citizen.CreateThread(function()
    RequestModel(GetHashKey("crp_wheat_dry_aa_sim"))
    if HasModelLoaded(GetHashKey("crp_wheat_dry_aa_sim")) then
        Wait(10)
    end
end)

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
                tempweath = CreateObject(GetHashKey("crp_wheat_stk_ab_sim"), Config.RessourcesPoints[ressourcePointIndexForMining].x, Config.RessourcesPoints[ressourcePointIndexForMining].y, Config.RessourcesPoints[ressourcePointIndexForMining].z, false, true, true)
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
    Wait(Config.WorkingTime)
    FreezeEntityPosition(playerPed, false)
    TaskPlayAnim(playerPed, Config.GatherDict, "stn_exit", 1.0, 1.0, -1, 2, 0, false, false, false)
    Wait(500)
    ClearPedTasks(playerPed)
    GivePlayerRessource()
    isInteracting = false
    GetRandomRessourcePoint()
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



------- ELEVAGE -------


-- prompt étable
local farmprompt = UipromptGroup:new("Étable")
Uiprompt:new(0x760A9C6F, "Ouvrir", farmprompt)
Uiprompt:new(0x156F7119, "Gérer", farmprompt):setHoldMode(true)
farmprompt:setActive(false)

-- zone étable
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.FarmStables) do
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                stableprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x760A9C6F) then
                    isInteracting = true
                    local menutype = "Ouvrir"
                    TriggerServerEvent("dust_ferme:server:askcow")
                    Wait(200)
                    OpenFarmStable(menutype, v.name)
                end
                if stableprompt:hasHoldModeJustCompleted() then
                    isInteracting = true
                    local menutype = "Bétail"
                    TriggerServerEvent("dust_ferme:server:askcow")
                    Wait(200)
                    OpenFarmStable(menutype, v.name)
                end
            end 
        end
    end
end)

-- menu base étable
local cowlist = {}
RegisterNetEvent("dust_ferme::getcow")
AddEventHandler("dust_ferme:getcow", function(horseid, nom, model, pos, _race)
    cowlist = {}
    Wait(50)
    table.insert(cowlist, {id = horseid, name = nom, race = model, stable = pos, lib = _race})
end)

function OpenFarmStable(menutype, stable)
    local _menutype = menutype
    local playerPed = PlayerPedId()
    local Position = GetEntityCoords(playerPed)
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

        if _menutype == 'Ouvrir' then
            for k, v in pairs(cowlist) do
                if v.stable == stable then
                    table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
                end
            end
        end
        if _menutype == 'Bétail' then 
            table.insert(elements, {label = "Certificat de vente", value = 'sell', desc = "Utile pour donner son bien à une personne"})
            table.insert(elements, {label = "Renommer", value = 'rename', desc = "Changer le nom de votre bien"})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'écurie', {
            title = "Étable",
            subtext = "Vos biens",
            align = 'top-right',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            if _menutype == 'Ouvrir' then
                if data.current.value then
                    Wait(500)
                    for k, v in pairs(cowlist) do
                        if v.id == data.current.value then
                            spawncow(v.race, v.name, v.id, v.stashid)
                        end
                        Wait(100)
                        cowlist[k] = nil
                        isInteracting = false
                    end
                end
            end
            if data.current.value == "sell" then
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    local elements = {}
                    for k, v in pairs(cowlist) do
                        if v.stable == stable then
                            table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
                        end
                    end
                    MenuData.Open('default', GetCurrentResourceName(), 'sell', {
                        title = "Vendre",
                        subtext = "Vos biens",
                        align = 'top-right',
                        elements = elements,
                    },
                    function(data, menu)
                        MenuData.CloseAll()
                        if data.current.value then
                            TriggerServerEvent("dust_ferme:sellcow", data.current.value)
                            for k, v in pairs(cowlist) do
                                cowlist[k] = nil
                            end
                            isInteracting = false
                        end
                    end)
                end)
            end
            if data.current.value == "rename" then
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    local elements = {}
                    for k, v in pairs(cowlist) do
                        if v.stable == stable then
                            table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
                        end
                    end
                    MenuData.Open('default', GetCurrentResourceName(), 'sell', {
                        title = "Vendre",
                        subtext = "Vos biens",
                        align = 'top-right',
                        elements = elements,
                    },
                    function(data, menu)
                        MenuData.CloseAll()
                        if data.current.value then
                            TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                                MenuData.CloseAll()
                                AddTextEntry("FMMC_MPM_TYP86", "Nom du bien")
                                DisplayOnscreenKeyboard(4, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
                                while (UpdateOnscreenKeyboard() == 0) do
                                    DisableAllControlActions(0)
                                    Citizen.Wait(0)
                                end
                                if (GetOnscreenKeyboardResult()) then
                                    local name = GetOnscreenKeyboardResult()
                                    TriggerServerEvent("dust_ferme:server:rename", name, data.current.value)
                                    isInteracting = false
                                else
                                    menu.close()
                                    isInteracting = false
                                return
                                end
                            end)
                            for k, v in pairs(cowlist) do
                                cowlist[k] = nil
                            end
                            isInteracting = false
                        end
                    end)
                end)
            end
        end,
        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end

-- spawn vache
local initializing = false
function spawncow(race, name, id)
    if initializing then
        return
    end

    local ped = PlayerPedId()
    local modelHash = GetHashKey(model)
    if type(model) == 'number' then 
        modelHash = model
    end
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(10)
        end
    end

    initializing = true
    local spawnPosition = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.5, 0.0)
    local horse = CreatePed(modelHash, spawnPosition, GetEntityHeading(ped) - 90.0, true, true)
    SetEntityAsMissionEntity(horse, true, true)
    SetModelAsNoLongerNeeded(modelHash)
   
    SetAnimalTuningBoolParam(horse, 25, false)
    SetAnimalTuningBoolParam(horse, 24, false)

    TaskAnimalUnalerted(horse, -1, false, 0, 0)

    SetPedPromptName(horse, name)
    Entity(horse).state.horseid = horseid
    Entity(horse).state.name = name

    SetPedConfigFlag(horse, 297, true)

    initializing = false
end
-- prompt vache


-- différentes zones de paturage


-- lait