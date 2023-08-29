RedEM = exports["redem_roleplay"]:RedEM()





RegisterNetEvent("dust_stable:server:getjob", function (_job, _jobgrade, _gang, _ganggrade)
    playerjob = _job
    playerjobgrade = _jobgrade
    playergang = _gang
    playerganggrade = _ganggrade
end)

Citizen.CreateThread(function()
    while RedEM.GetPlayerData().isLoggedIn do
        Wait(1000)
        TriggerServerEvent("dust_stable:server:askjob")
    end
    if RedEM.GetPlayerData().isLoggedIn then
        TriggerServerEvent("dust_stable:server:askjob")
    end
end)


---- PROMPT ----
local StablePromptGroup = GetRandomIntInRange(0, 0xffffff)
local StablePromptName = CreateVarString(10, "LITERAL_STRING", "Écurie")
local OpenPrompt
local ManagePrompt
local StablePromptShown = false
local IsInteracting = false
Citizen.CreateThread(function()
    local str = 'Ouvrir'
    OpenPrompt = PromptRegisterBegin()
    PromptSetControlAction(OpenPrompt, 0x156F7119)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(OpenPrompt, str)
    PromptSetEnabled(OpenPrompt, true)
    PromptSetVisible(OpenPrompt, true)
    PromptSetHoldMode(OpenPrompt, false)
    PromptSetGroup(OpenPrompt, StablePromptGroup)
    PromptRegisterEnd(OpenPrompt)

    str = 'Gérer'
    ManagePrompt = PromptRegisterBegin()
    PromptSetControlAction(ManagePrompt, 0x8AAA0AD4)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(ManagePrompt, str)
    PromptSetEnabled(ManagePrompt, true)
    PromptSetVisible(ManagePrompt, true)
    PromptSetHoldMode(ManagePrompt, false)
    PromptSetGroup(ManagePrompt, StablePromptGroup)
    PromptRegisterEnd(ManagePrompt)
end)

local GaragePromptGroup = GetRandomIntInRange(0, 0xffffff)
local GaragePromptName = CreateVarString(10, "LITERAL_STRING", "Écurie")
local RangerPrompt
local GaragePromptShown = false
local IsInteracting = false
Citizen.CreateThread(function()
    local str = "Mettre à l'écurie"
    RangerPrompt = PromptRegisterBegin()
    PromptSetControlAction(RangerPrompt, 0x156F7119)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(RangerPrompt, str)
    PromptSetEnabled(RangerPrompt, true)
    PromptSetVisible(RangerPrompt, true)
    PromptSetHoldMode(RangerPrompt, false)
    PromptSetGroup(RangerPrompt, GaragePromptGroup)
    PromptRegisterEnd(RangerPrompt)
end)

----- INTERACT WITH STABLE ----
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Stables) do
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                PromptSetActiveGroupThisFrame(StablePromptGroup, StablePromptName)
                if IsControlJustReleased(0, 0x156F7119) then
                    isInteracting = true
                    local menutype = "Ouvrir"
                    TriggerServerEvent("dust_stable:server:askhorse")
                    Wait(200)
                    OpenStable(menutype, v.name)
                end
                if IsControlJustReleased(0, 0x8AAA0AD4) then
                    isInteracting = true
                    local menutype = "Chevaux"
                    TriggerServerEvent("dust_stable:server:askhorse")
                    Wait(200)
                    OpenStable(menutype, v.name)
                end
            end
            if #(playerpos - v.pos ) < 7 and IsPedOnMount(PlayerPedId()) then
                PromptSetActiveGroupThisFrame(GaragePromptGroup, GaragePromptName)
                if IsControlJustReleased(0, 0x156F7119) then
                    local horse = GetMount(PlayerPedId())
                    local horseid = Entity(horse).state.horseid
                    TriggerServerEvent("dust_stable:server:stockhorse", v.name, horseid)
                end
            end
        end
    end
end)

---- Refresh DB Stable ----

local horselist = {}
RegisterNetEvent("dust_stable:server:gethorse")
AddEventHandler("dust_stable:server:gethorse", function(horseid, nom, model, pos)
    for k, v in pairs(horselist) do
        table.remove(horselist, k)
    end
    Wait(50)
    table.insert(horselist, {id = horseid, name = nom, race = model, stable = pos})
end)

---- Menu stable ----

function OpenStable(menutype, stable)
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
            for k, v in pairs(horselist) do
                if v.stable == stable then
                    table.insert(elements, {label = v.name, value = v.id, desc = "Race"..v.race.. "ID:" ..v.id})
                end
            end
        end
        if _menutype == 'Chevaux' then 
            table.insert(elements, {label = "Certificat de vente", value = 'sell', desc = "Utile pour donner son bien à une personne"})
            table.insert(elements, {label = "Renommer", value = 'rename', desc = "Changer le nom de votre bien"})
            if playerjob ~= "unemployed"  then
                table.insert(elements, {label = "Accès Entreprise", value = 'job', desc = "Gérer l'accès au bien pour votre entreprise"})
            end
            if playergang ~= "none" then
                table.insert(elements, {label = "Accès Groupe", value = 'gang', desc = "Gérer l'accès au bien pour votre groupe"})
            end
        end

        MenuData.Open('default', GetCurrentResourceName(), 'écurie', {
            title = "Écurie",
            subtext = "Vos biens",
            align = 'top-left',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            if _menutype == 'Ouvrir' then
                if data.current.value then
                    TriggerServerEvent("dust_stable:server:askcomponents", data.current.value)
                    Wait(500)
                    for k, v in pairs(horselist) do
                        if v.id == data.current.value then
                            spawnhorse(v.race, v.name, v.id)
                        end
                        Wait(100)
                        horselist[k] = nil
                        isInteracting = false
                    end
                end
            end
            if data.current.value == "sell" then
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    local elements = {}
                    for k, v in pairs(horselist) do
                        if v.stable == stable then
                            table.insert(elements, {label = v.name, value = v.id, desc = "Race"..v.race.. "ID:" ..v.id})
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
                            TriggerServerEvent("dust_stable:server:sellhorse", data.current.value)
                            for k, v in pairs(horselist) do
                                horselist[k] = nil
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
                    for k, v in pairs(horselist) do
                        if v.stable == stable then
                            table.insert(elements, {label = v.name, value = v.id, desc = "Race"..v.race.. "ID:" ..v.id})
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
                                    TriggerServerEvent("dust_stable:server:rename", name, data.current.value)
                                    isInteracting = false
                                else
                                    menu.close()
                                    isInteracting = false
                                return
                                end
                            end)
                            for k, v in pairs(horselist) do
                                horselist[k] = nil
                            end
                            isInteracting = false
                        end
                    end)
                end)
            end
            if data.current.value == "job" then
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    local elements = {}
                    for k, v in pairs(horselist) do
                        if v.stable == stable then
                            table.insert(elements, {label = v.name, value = v.id, desc = "Race"..v.race.. "ID:" ..v.id})
                        end
                    end
                    MenuData.Open('default', GetCurrentResourceName(), 'job', {
                        title = "Gérer l'accès",
                        subtext = "Vos biens",
                        align = 'top-right',
                        elements = elements,
                    },
                    function(data, menu)
                        MenuData.CloseAll()
                        if data.current.value then
                            local selectedhorse = data.current.value
                            TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                                MenuData.CloseAll()
                                local elements = {
                                    {label = "Retirer l'accès", value = "remove", desc = "Retire l'accès à l'entreprise"},
                                    {label = "Donner l'accès aux gérants", value = "boss", desc = "Donne l'accès aux gérants de votre entreprise"},
                                    {label = "Donner l'accès à tous", value = "all", desc = "Donne l'accès à tout le monde dans votre entreprise"}
                                }
                                MenuData.Open('default', GetCurrentResourceName(), 'subjob', {
                                    title = "Accès Entreprise",
                                    subtext = "Vos biens",
                                    align = 'top-right',
                                    elements = elements,
                                },
                                function(data, menu)
                                    MenuData.CloseAll()
                                    if data.current.value == "remove" then
                                        TriggerServerEvent("dust_stable:server:removejob", selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                        isInteracting = false
                                    end
                                    if data.current.value == "boss" then
                                        local jobgrade = 2
                                        TriggerServerEvent("dust_stable:server:addjob", playerjob, jobgrade, selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                        isInteracting = false
                                    end
                                    if data.current.value == "all" then
                                        local jobgrade = 1
                                        TriggerServerEvent("dust_stable:server:addjob", playerjob, jobgrade, selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                        isInteracting = false
                                    end
                                end)
                            end)
                            isInteracting = false
                        end
                    end)
                end)
            end
            if data.current.value == "gang" then
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    local elements = {}
                    for k, v in pairs(horselist) do
                        if v.stable == stable then
                            table.insert(elements, {label = v.name, value = v.id, desc = "Race"..v.race.. "ID:" ..v.id})
                        end
                    end
                    MenuData.Open('default', GetCurrentResourceName(), 'gang', {
                        title = "Gérer l'accès",
                        subtext = "Vos biens",
                        align = 'top-right',
                        elements = elements,
                    },
                    function(data, menu)
                        MenuData.CloseAll()
                        if data.current.value then
                            local selectedhorse = data.current.value
                            TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                                MenuData.CloseAll()
                                local elements = {
                                    {label = "Retirer l'accès", value = "remove", desc = "Retire l'accès au groupe"},
                                    {label = "Donner l'accès aux gérants", value = "boss", desc = "Donne l'accès aux gérants du groupe"},
                                    {label = "Donner l'accès à tous", value = "all", desc = "Donne l'accès à tout le monde dans votre groupe"}
                                }
                                MenuData.Open('default', GetCurrentResourceName(), 'subgang', {
                                    title = "Accès Entreprise",
                                    subtext = "Vos biens",
                                    align = 'top-right',
                                    elements = elements,
                                },
                                function(data, menu)
                                    MenuData.CloseAll()
                                    if data.current.value == "remove" then
                                        TriggerServerEvent("dust_stable:server:removegang", selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                        isInteracting = false
                                    end
                                    if data.current.value == "boss" then
                                        local ganggrade = 2
                                        TriggerServerEvent("dust_stable:server:addgang", playergang, ganggrade, selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                        isInteracting = false
                                    end
                                    if data.current.value == "all" then
                                        local ganggrade = 1
                                        TriggerServerEvent("dust_stable:server:addgang", playergang, ganggrade, selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                        isInteracting = false
                                    end
                                end)
                            end)
                        end
                        isInteracting = false
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

---- Get Horse ----

local selectedcomp = {}
local spawnedhorses = {}
RegisterNetEvent("dust_stable:server:getcomponents")
AddEventHandler("dust_stable:server:getcomponents", function(horseid, components, model)
    for k, v in pairs(selectedcomp) do
        selectedcomp[k] = nil
    end
    table.insert(selectedcomp, components)
end)

local initializing = false
function spawnhorse(model, name, horseid)
    if initializing then
        return
    end

    local ped = PlayerPedId()
    local pCoords = GetEntityCoords(ped)
    local modelHash = GetHashKey(model)

    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(10)
        end
    end

    initializing = true
    local spawnPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, 0.0)
    local horse = CreatePed(modelHash, spawnPosition, GetEntityHeading(ped) - 90.0, true, true)
    Citizen.InvokeNative(0x283978A15512B2FE, horse, true) -- set random outfit components
    SetModelAsNoLongerNeeded(modelHash)
    -- PlaceEntityOnGroundProperly(entity, 0)
    -- SetPedPersonality(horse, GetHashKey("PLAYER_HORSE"))

    -- SetPedConfigFlag(entity, 324, true)
    -- SetPedConfigFlag(entity, 211, true)
    -- SetPedConfigFlag(entity, 208, true)
    -- SetPedConfigFlag(entity, 209, true)
    -- SetPedConfigFlag(entity, 400, true)
    -- SetPedConfigFlag(entity, 297, true)
    -- SetPedConfigFlag(entity, 136, false)
    -- SetPedConfigFlag(entity, 312, false)
    -- SetPedConfigFlag(entity, 113, false)
    -- SetPedConfigFlag(entity, 301, false)
    -- SetPedConfigFlag(entity, 277, true)
    -- SetPedConfigFlag(entity, 319, true)
    -- SetPedConfigFlag(entity, 6, true)

    SetAnimalTuningBoolParam(horse, 25, false)
    SetAnimalTuningBoolParam(horse, 24, false)

    TaskAnimalUnalerted(horse, -1, false, 0, 0)

    SetPedPromptName(horse, name)
    Entity(horse).state.horseid = horseid
    if selectedcomp ~= nil and selectedcomp ~= "0" then
        for _, componentHash in pairs(selectedcomp) do
            Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, componentHash, true, true, true)
        end
    end

    SetPedConfigFlag(horse, 297, true)
    
    for k, v in pairs(selectedcomp) do
        selectedcomp[k] = nil
    end
    TriggerServerEvent("dust_stable:server:horseout", horseid)
    
    table.insert(spawnedhorses, horse)
    initializing = false
end

---- RANGER LE CHEVAL  ----
RegisterNetEvent("dust_stable:server:horsestocked")
AddEventHandler("dust_stable:server:horsestocked", function()
    local horse = GetMount(PlayerPedId())
    TaskDismountAnimal(PlayerPedId(), 0x48E92D3DDE23C23A, 0, 0 ,0, horse)
    Wait(3000)
    DeleteEntity(horse)
end)

----- CHOISIR LE NOM -----
RegisterNetEvent("dust_stable:server:choosename")
AddEventHandler("dust_stable:server:choosename", function (horseid)
    TriggerEvent('redemrp_inventory:close_inventory')
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()
        AddTextEntry("FMMC_MPM_TYP86", "Nom du bien")
        DisplayOnscreenKeyboard(4, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0)
            Citizen.Wait(0)
        end
        if (GetOnscreenKeyboardResult()) then
            name = GetOnscreenKeyboardResult()
            if name then
                TriggerServerEvent("dust_stable:server:rename", name, horseid)
            end
        else
            menu.close()
        return
        end
        end)
end)





------ ACHAT CHEVAL ------ 

local AchatPromptGroup = GetRandomIntInRange(0, 0xffffff)
local AchatPromptName = CreateVarString(10, "LITERAL_STRING", "Écurie")
local AchatPrompt
local AchatPromptShown = false
Citizen.CreateThread(function()
    local str = "Acheter un cheval"
    AchatPrompt = PromptRegisterBegin()
    PromptSetControlAction(AchatPrompt, 0xC7B5340A)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(AchatPrompt, str)
    PromptSetEnabled(AchatPrompt, true)
    PromptSetVisible(AchatPrompt, true)
    PromptSetHoldMode(AchatPrompt, false)
    PromptSetGroup(AchatPrompt, AchatPromptGroup)
    PromptRegisterEnd(AchatPrompt)
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Buyhorse) do
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                PromptSetActiveGroupThisFrame(AchatPromptGroup, AchatPromptName)
                if IsControlJustReleased(0, 0xC7B5340A) then
                    buyhorse(v.stable)
                    isInteracting = true
                end
            end
        end
    end
end)


function buyhorse(stable)
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local elements = {}

        for k, v in pairs(Config.WarHorses) do
            table.insert(elements, {label = v.name, value = v.model, desc = v.desc})
        end
        MenuData.Open('default', GetCurrentResourceName(), 'buyhorse', {
            title = "Acheter un cheval",
            subtext = "Chevaux",
            align = 'top-right',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("dust_stable:server:createhorse", data.current.label, data.current.value, stable)
            isInteracting = false
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end


---- SIFFLER LE CHEVAL ----
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustReleased(0, 0x24978A28) then
            for k, v in pairs(spawnedhorses) do
                if GetScriptTaskStatus(v, 0x4924437D, 0) ~= 0 then
                    local pcoords = GetEntityCoords(PlayerPedId())
                    local hcoords = GetEntityCoords(v)
                    local caldist = Vdist(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z)
                    if caldist < 100 then
                        TaskGoToEntity(v, PlayerPedId(), -1, 7.2, 2.0, 0, 0)
                    end
                end
            end
        end
    end
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    TriggerServerEvent('dust_stable:server:resethorse')
end)
