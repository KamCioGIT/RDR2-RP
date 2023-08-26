RedEM = exports["redem_roleplay"]:RedEM()


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
    PromptSetControlAction(OpenPrompt, 0xC7B5340A)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(OpenPrompt, str)
    PromptSetEnabled(OpenPrompt, true)
    PromptSetVisible(OpenPrompt, true)
    PromptSetHoldMode(OpenPrompt, false)
    PromptSetGroup(OpenPrompt, StablePromptGroup)
    PromptRegisterEnd(OpenPrompt)

    str = 'Gérer'
    ManagePrompt = PromptRegisterBegin()
    PromptSetControlAction(ManagePrompt, 0xD9D0E1C0)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(ManagePrompt, str)
    PromptSetEnabled(ManagePrompt, true)
    PromptSetVisible(ManagePrompt, true)
    PromptSetHoldMode(ManagePrompt, true)
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
    PromptSetControlAction(RangerPrompt, 0xC7B5340A)
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
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) then
                TriggerServerEvent("dust_stable:server:askhorse", v.name)
                PromptSetActiveGroupThisFrame(StablePromptGroup, StablePromptName)
                if IsControlJustReleased(0, 0xC7B5340A) then
                    isInteracting = true
                    local menutype = "Ouvrir"
                    -- TriggerServerEvent("dust_stable:server:askhorse", v.name)
                    OpenStable(menutype)
                end
                if PromptHasHoldModeCompleted(ManagePrompt) then
                    isInteracting = true
                    local menutype = "Chevaux"
                    -- TriggerServerEvent("dust_stable:server:askhorse", v.name)
                    OpenStable(menutype)
                end
            end
            if #(playerpos - v.pos ) < 7 and IsPedOnMount(PlayerPedId()) then
                PromptSetActiveGroupThisFrame(StablePromptGroup, StablePromptName)
                if IsControlJustReleased(0, 0xC7B5340A) then
                    local horse = GetMount(PlayerPedId())
                    local horseid = GetVehicleNumberPlateText(horse)
                    TriggerServerEvent("dust_stable:server:stockhorse", v.name, horseid)
                end
            end
        end
    end
end)

---- Refresh DB Stable ----

local horselist = {}
RegisterNetEvent("dust_stable:server:gethorse")
AddEventHandler("dust_stable:server:gethorse", function(horseid, nom, model)
    for k, v in pairs(horselist) do
        horselist[k] = nil
    end
    Wait(50)
    table.insert(horselist, {id = horseid, name = nom, race = model})
end)

---- Menu stable ----

function OpenStable(menutype)
    local _menutype = menutype
    local playerPed = PlayerPedId()
    local Position = GetEntityCoords(playerPed)
    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
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
                table.insert(elements, {label = v.name, value = v.id, desc = "Race"..v.race.. "ID:" ..v.id})
            end
        end
        if _menutype == 'Chevaux' then 
            table.insert(elements, {label = "Certificat de vente", value = 'sell', desc = "Utile pour donner son bien à une personne"})
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
            align = 'top-right',
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
                    end
                end
            end
            if data.current.value == "sell" then
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    local elements = {}
                    for k, v in pairs(horselist) do
                        table.insert(elements, {label = v.name, value = v.id, desc = "Race"..v.race.. "ID:" ..v.id})
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
                        end
                    end)
                end)
            end
            if data.current.value == "job" then
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    local elements = {}
                    for k, v in pairs(horselist) do
                        table.insert(elements, {label = v.name, value = v.id, desc = "Race"..v.race.. "ID:" ..v.id})
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
                                    end
                                    if data.current.value == "boss" then
                                        local jobgrade = 2
                                        TriggerServerEvent("dust_stable:server:addjob", playerjob, jobgrade, selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                    end
                                    if data.current.value == "all" then
                                        local jobgrade = 1
                                        TriggerServerEvent("dust_stable:server:addjob", playerjob, jobgrade, selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                    end
                                end)
                            end)
                        end
                    end)
                end)
            end
            if data.current.value == "gang" then
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    local elements = {}
                    for k, v in pairs(horselist) do
                        table.insert(elements, {label = v.name, value = v.id, desc = "Race"..v.race.. "ID:" ..v.id})
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
                                    end
                                    if data.current.value == "boss" then
                                        local ganggrade = 2
                                        TriggerServerEvent("dust_stable:server:addgang", playergang, ganggrade, selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                    end
                                    if data.current.value == "all" then
                                        local ganggrade = 1
                                        TriggerServerEvent("dust_stable:server:addgang", playergang, ganggrade, selectedhorse)
                                        for k, v in pairs(horselist) do
                                            horselist[k] = nil
                                        end
                                    end
                                end)
                            end)
                        end
                    end)
                end)
            end 
        end,
        function(data, menu)
            menu.close()
        end)
    end)
end

---- Get Horse ----

local selectedcomp = {}
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
    local entity = CreatePed(modelHash, spawnPosition, GetEntityHeading(ped), true, true)
    Citizen.InvokeNative(0x283978A15512B2FE, entity, true) -- set random outfit components
    SetModelAsNoLongerNeeded(modelHash)
    -- PlaceEntityOnGroundProperly(entity, 0)
    SetPedWrithingDuration(entity, -1, -1, 0)
    SetPedPersonality(entity, GetHashKey("PLAYER_HORSE"))

    SetPedConfigFlag(entity, 324, true)
    SetPedConfigFlag(entity, 211, true)
    SetPedConfigFlag(entity, 208, true)
    SetPedConfigFlag(entity, 209, true)
    SetPedConfigFlag(entity, 400, true)
    SetPedConfigFlag(entity, 297, true)
    SetPedConfigFlag(entity, 136, false)
    SetPedConfigFlag(entity, 312, false)
    SetPedConfigFlag(entity, 113, false)
    SetPedConfigFlag(entity, 301, false)
    SetPedConfigFlag(entity, 277, true)
    SetPedConfigFlag(entity, 319, true)
    SetPedConfigFlag(entity, 6, true)

    SetAnimalTuningBoolParam(entity, 25, false)
    SetAnimalTuningBoolParam(entity, 24, false)

    TaskAnimalUnalerted(entity, -1, false, 0, 0)

    SpawnplayerHorse = entity

    SetPedPromptName(entity, name)
    SetVehicleNumberPlateText(entity, horseid)
    if selectedcomp ~= nil and selectedcomp ~= "0" then
        for _, componentHash in pairs(selectedcomp) do
            Citizen.InvokeNative(0xD3A7B003ED343FD9, entity, componentHash, true, true, true)
        end
    end

    SetPedConfigFlag(entity, 297, true)
    
    for k, v in pairs(selectedcomp) do
        selectedcomp[k] = nil
    end
    TriggerServerEvent("dust_stable:server:horsestocked", horseid)
    initializing = false
end

---- RANGER LE CHEVAL  ----
RegisterNetEvent("dust_stable:server:horsestocked")
AddEventHandler("dust_stable:server:horsestocked", function()
    local horse = GetMount(PlayerPedId())
    RemovePedFromMount(PlayerPedId())
    Wait(1000)
    DeleteEntity(horse)
end)

----- CHOISIR LE NOM -----
RegisterNetEvent("dust_stable:server:choosename")
AddEventHandler("dust_stable:server:choosename", function (horseid, model, _type)
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
            if _type == "transfer" then
                TriggerServerEvent("dust_stable:server:add", name, horseid)
            elseif _type == "create" then
                local stable = "buyhorse"
                TriggerServerEvent("dust_stable:server:createhorse", name, horseid, model, stable)
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
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) then
                PromptSetActiveGroupThisFrame(AchatPromptGroup, AchatPromptName)
                if IsControlJustReleased(0, 0xC7B5340A) then
                    buyhorse()
                end
            end
        end
    end
end)


function buyhorse()
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
            TriggerServerEvent("redemrp_inventory:createhorse", data.current.value)
        end,

        function(data, menu)
            menu.close()
        end)
    end)
end