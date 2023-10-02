RedEM = exports["redem_roleplay"]:RedEM()
local isInteracting = false
local isDeposit = false
local ressourcePointIndexForMining = nil
local isInBossMenu = false
local showweath = false
local isFarmer = false

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
        Paturages()
        cattle()
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

--- prompt achat
local cattleprompt = UipromptGroup:new("Bétail")
Uiprompt:new(0x760A9C6F, "Acheter", cattleprompt)
cattleprompt:setActive(false)

--- zone achat
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Buycattle) do
            if #(playerpos - v.pos ) < 5 and not isInteracting then
                cattleprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x760A9C6F) then
                    buycow(v.stable)
                    isInteracting = true
                end
            end
        end
    end
end)


--- menu achat
function buycow(stable)
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local elements = {}

        for k, v in pairs(Config.Cattle) do
            table.insert(elements, {label = "$"..v.price.." - " ..v.name, value = v.model, desc = v.desc, price = v.price, name = v.name})
        end
        MenuData.Open('default', GetCurrentResourceName(), 'buycattle', {
            title = "Acheter du bétail",
            subtext = "Bétail",
            align = 'top-right',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            Wait(10)
            TriggerServerEvent("dust_ferme:createcattle", data.current.name, data.current.value, stable, data.current.name, data.current.price) 
            isInteracting = false
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end

-- prompt étable
local farmprompt = UipromptGroup:new("Étable")
Uiprompt:new(0x6319DB71, "Ouvrir", farmprompt)
Uiprompt:new(0x05CA7C52, "Gérer", farmprompt):setHoldMode(true)
farmprompt:setActive(false)

-- zone étable
function cattle()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.FarmStables) do
            if #(playerpos - v.pos ) < 7 and not isInteracting then
                farmprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x6319DB71) then
                    isInteracting = true
                    local menutype = "Ouvrir"
                    TriggerServerEvent("dust_ferme:server:askcow")
                    Wait(200)
                    OpenFarmStable(menutype, v.name)
                end
                if farmprompt:hasHoldModeJustCompleted() then
                    isInteracting = true
                    local menutype = "Bétail"
                    TriggerServerEvent("dust_ferme:server:askcow")
                    Wait(200)
                    OpenFarmStable(menutype, v.name)
                end
            end 
        end
    end
end

-- menu base étable
local cowlist = {}
RegisterNetEvent("dust_ferme:getcow")
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
            -- table.insert(elements, {label = "Certificat de vente", value = 'sell', desc = "Utile pour donner son bien à une personne"})
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
            -- if data.current.value == "sell" then
            --     TriggerEvent("redemrp_menu_base:getData", function(MenuData)
            --         MenuData.CloseAll()
            --         local elements = {}
            --         for k, v in pairs(cowlist) do
            --             if v.stable == stable then
            --                 table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
            --             end
            --         end
            --         MenuData.Open('default', GetCurrentResourceName(), 'sell', {
            --             title = "Vendre",
            --             subtext = "Vos biens",
            --             align = 'top-right',
            --             elements = elements,
            --         },
            --         function(data, menu)
            --             MenuData.CloseAll()
            --             if data.current.value then
            --                 TriggerServerEvent("dust_ferme:sellcow", data.current.value)
            --                 for k, v in pairs(cowlist) do
            --                     cowlist[k] = nil
            --                 end
            --                 isInteracting = false
            --             end
            --         end)
            --     end)
            -- end
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
function spawncow(model, name, id)
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
    local spawnPosition = GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.0)
    local cow = CreatePed(modelHash, spawnPosition, GetEntityHeading(ped) - 90.0, true, true)
    Citizen.InvokeNative(0x283978A15512B2FE, cow, false)
    SetModelAsNoLongerNeeded(modelHash)
   
    SetAnimalTuningBoolParam(cow, 25, false)
    SetAnimalTuningBoolParam(cow, 24, false)
    SetAnimalTuningBoolParam(cow, 9, false)

    TaskAnimalUnalerted(cow, -1, false, 0, 0)

    SetPedPromptName(cow, name)
    Entity(cow).state.cowid = id
    Entity(cow).state.name = name
    Entity(cow).state.grazing = false

    SetPedConfigFlag(cow, 297, true)
    SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(cow), GetHashKey('PLAYER'))
    SetPedConfigFlag(cow, 310, true)
    SetPedConfigFlag(cow, 40, false)
    Citizen.InvokeNative(0xAE6004120C18DF97, cow, 5, false)
    Citizen.InvokeNative(0xAE6004120C18DF97, cow, 6, false) --- lasso
    SetEntityAsMissionEntity(cow, true, true)
    TriggerServerEvent("dust_ferme:server:cowout", id)
    initializing = false
end
-- prompt vache

function SetupPrompt(promptID, key, group, text)
    if not PromptIsValid(promptID) then
        promptID = PromptRegisterBegin()
        PromptSetControlAction(promptID, key)
        local str = CreateVarString(10, 'LITERAL_STRING', text)
        PromptSetText(promptID, str)
        PromptSetEnabled(promptID, 1)
        PromptSetVisible(promptID, 1)
        PromptSetStandardMode(promptID, 1)
        PromptSetGroup(promptID, group)
        PromptRegisterEnd(promptID)
    end
    return promptID
end

Citizen.CreateThread(function ()
    local paitrePrompt
    local guidePrompt
    while true do
        local res, entity = GetPlayerTargetEntity(PlayerId()) 
        if entity ~= 0 then
            if Entity(entity).state.cowid then
                print ('getcow')
                local playerCoords = GetEntityCoords(PlayerPedId())
                local targetCoords = GetEntityCoords(entity)
                if #(playerCoords - targetCoords) <= 7.0 then
                    local id = Citizen.InvokeNative(0xB796970BD125FCE8, entity) -- UiPromptGetGroupIdForTargetEntity
                    if not paitrePrompt then
                        paitrePrompt = SetupPrompt(1, 0x156F7119, id, "Paître")
                    end
                    if not guidePrompt then
                        guidePrompt = SetupPrompt(1, 0x760A9C6F, id, "Guider")
                    end
                    if not stopPrompt then
                        stopPrompt = SetupPrompt(1, 0x8CC9CD42, id, "S'arrêter")
                    end
                    if not laitPrompt then
                        laitPrompt = SetupPrompt(1, 0x80F28E95, id, "Traire")
                    end
                    if IsControlJustReleased(0, 0x8CC9CD42) and Entity(entity).state.grazing ~= true then
                        ClearPedTasks(entity)
                        TaskFollowToOffsetOfEntity(entity, PlayerPedId(), 0.0, -3.0, 0.0, 1.0, 200, 100, 1, 1, 0, 0, 1)
                    end
                    if IsControlJustReleased(0, 0x760A9C6F) and Entity(entity).state.grazing ~= true then
                            ClearPedTasks(entity)
                            local duration = math.random(30000, 120000)
                            TaskFollowToOffsetOfEntity(entity, PlayerPedId(), 0.0, -3.0, 0.0, 1.0, duration, 100, 1, 1, 0, 0, 1)
                        -- guider
                    end
                    if IsControlJustReleased(0, 0x156F7119) then
                        -- paitre
                        local cowid = Entity(entity).state.cowid
                        for k, v in pairs(Config.FarmStables) do
                            if #(targetCoords - v.pos) < 7 then
                                TriggerServerEvent("dust_ferme:server:stockcow", v.name, cowid, entity)
                            end
                        end
                        for k, v in pairs(Config.Paturages) do
                            if #(targetCoords - v.pos) < Config.blipRadius then
                                if Entity(entity).state.grazing == false then
                                    TriggerServerEvent("dust_ferme:cowup", Entity(entity).state.cowid)
                                    TaskStartScenarioInPlace(entity, GetHashKey('WORLD_ANIMAL_COW_GRAZING'), 12000, true, false, false, false)
                                end
                            end
                        end
                    end
                    if IsControlJustReleased(0, 0x80F28E95) then
                        for k, v in pairs(Config.Lait) do
                            if #(targetCoords - v.pos) < 7 then
                                if  #(targetCoords - playerCoords) < 3.0 then
                                    isInteracting = true
                                    RequestAnimDict(Config.PedMilkingDict)
                                    while not HasAnimDictLoaded(Config.PedMilkingDict) do
                                        Wait(10)
                                    end
                                    TaskPlayAnim(PlayerPedId(), Config.PedMilkingDict, Config.PedMilkingAnim, 1.0, 1.0, -1, 1, 0, false, false, false)
                                    Wait(5000)
                                    ClearPedTasks(PlayerPedId())
                                    TriggerServerEvent("dust_ferme:serveur:milking", Entity(entity).state.cowid)
                                    isInteracting = false
                                end
                            end
                        end

                    end

                else
                    if paitrePrompt then 
                        PromptDelete(paitrePrompt)
                        paitrePrompt = nil
                    end
                    if guidePrompt then 
                        PromptDelete(guidePrompt)
                        guidePrompt = nil
                    end
                    if stopPrompt then 
                        PromptDelete(stopPrompt)
                        stopPrompt = nil
                    end
                    if laitPrompt then 
                        PromptDelete(laitPrompt)
                        laitPrompt = nil
                    end
                end
            end
                
        else
            if paitrePrompt then 
                PromptDelete(paitrePrompt)
                paitrePrompt = nil
            end
            if guidePrompt then 
                PromptDelete(guidePrompt)
                guidePrompt = nil
            end
            if stopPrompt then 
                PromptDelete(stopPrompt)
                stopPrompt = nil
            end
            if laitPrompt then 
                PromptDelete(laitPrompt)
                laitPrompt = nil
            end
        end
        Citizen.Wait(0)
    end
end)

function Graze(entity)
    
    Entity(entity).state.grazing = true
    Wait(120000)
    ClearPedTasks(entity)
    
    Entity(entity).state.grazing = false
end

--- cow ranger
RegisterNetEvent("dust_ferme:cowstocked")
AddEventHandler("dust_ferme:cowstocked", function(entity)
    TaskStartScenarioInPlace(entity, GetHashKey('WORLD_ANIMAL_COW_RESTING'), -1, true, false, false, false)
    Wait(2000)
    DeleteEntity(entity)
end)

-- différentes zones de paturage

function Paturages()
    for k,v in pairs(Config.Buycattle) do
        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.pos)
        SetBlipSprite(blip, v.blip)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, string.format("Marché aux bestiaux"))
    end
    for k,v in pairs(Config.Paturages) do
        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.pos)
        local radius = Citizen.InvokeNative(0x45F13B7E0A15C880, Config.radiusStyle, v.pos, Config.blipRadius)
        SetBlipSprite(blip, Config.BlipSprite)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, string.format("Pâturage"))
    end
end

-- lait
local laitprompt = UipromptGroup:new("Bétail")
Uiprompt:new(0x760A9C6F, "Traire", laitprompt)
laitprompt:setActive(false)

----------------------- boucherie --------------------

-- prompt boucherie
local boucherieprompt = UipromptGroup:new("Abattoir")
Uiprompt:new(0x6319DB71, "Ouvrir", boucherieprompt)
boucherieprompt:setActive(false)


Citizen.CreateThread(function()
    for k,v in pairs(Config.Boucherie) do
        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.pos)
        SetBlipSprite(blip, v.blip)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, string.format("Abattoir"))
    end
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Boucherie) do
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                boucherieprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x6319DB71) then
                    isInteracting = true
                    TriggerServerEvent("dust_ferme:server:askcowboucherie")
                    Wait(200)
                    OpenBoucherie()
                end
            end 
        end
    end
end)

-- menu pour vendre connecté à l'étable
local boucherielist = {}
RegisterNetEvent("dust_ferme:getcowboucherie")
AddEventHandler("dust_ferme:getcowboucherie", function(horseid, nom, model, pos, _race)
    boucherielist = {}
    Wait(50)
    table.insert(boucherielist, {id = horseid, name = nom, race = model, stable = pos, lib = _race})
end)

function OpenBoucherie()
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

        for k, v in pairs(boucherielist) do
                table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'boucherie', {
            title = "Abattoir",
            subtext = "Abattre du bétail",
            align = 'top-right',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            if data.current.value then
                Wait(500)
                for k, v in pairs(boucherielist) do
                    if v.id == data.current.value then
                        --- delete et giveitem
                        TriggerServerEvent('dust_ferme:server:killcow', data.current.value)
                    end
                    Wait(100)
                    boucherielist[k] = nil
                    isInteracting = false
                end
            end
        end,
        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end

--- reset vache

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    TriggerServerEvent('dust_ferme:server:resetcow')
end)

AddEventHandler('txAdmin:events:scheduledRestart', function()
    TriggerServerEvent('dust_ferme:server:resetcow')
end)

AddEventHandler('txAdmin:events:serverShuttingDown', function()
    TriggerServerEvent('dust_ferme:server:resetcow')
end)