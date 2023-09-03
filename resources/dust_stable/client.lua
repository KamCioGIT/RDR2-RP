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

----- INTERACT WITH STABLE ----

local stableprompt = UipromptGroup:new("Écurie")
Uiprompt:new(0x760A9C6F, "Ouvrir", stableprompt)
Uiprompt:new(0x156F7119, "Gérer", stableprompt):setHoldMode(true)
stableprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Stables) do
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                stableprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x760A9C6F) then
                    isInteracting = true
                    local menutype = "Ouvrir"
                    TriggerServerEvent("dust_stable:server:askhorse")
                    Wait(200)
                    OpenStable(menutype, v.name)
                end
                if stableprompt:hasHoldModeJustCompleted() then
                    isInteracting = true
                    local menutype = "Chevaux"
                    TriggerServerEvent("dust_stable:server:askhorse")
                    Wait(200)
                    OpenStable(menutype, v.name)
                end
            end 
        end
    end
end)


local storeprompt = UipromptGroup:new("Écurie")
Uiprompt:new(0x156F7119, "Mettre à l'écurie", storeprompt)
storeprompt:setActive(false)


Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Stables) do
            if #(playerpos - v.pos ) < 7 and IsPedOnMount(PlayerPedId()) then
                storeprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x156F7119) then
                    local horse = GetMount(PlayerPedId())
                    local horseid = Entity(horse).state.horseid
                    local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, horse, 0)
                    local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, horse, 1)
                    local type = "horse"
                    TriggerServerEvent("dust_stable:server:stockhorse", v.name, horseid, valueHealth, valueStamina, type)
                end
            end
            if #(playerpos - v.pos ) < 7 and IsPedInAnyVehicle(PlayerPedId(), 0) then
                storeprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x156F7119) then
                    local cart = GetVehiclePedIsIn(PlayerPedId(), 0)
                    local cartid = Entity(cart).state.horseid
                    local type = "cart"
                    TriggerServerEvent("dust_stable:server:stockhorse", v.name, cartid, valueHealth, valueStamina, type)
                end
            end
        end
    end
end)
---- Refresh DB Stable ----

local horselist = {}
RegisterNetEvent("dust_stable:server:gethorse")
AddEventHandler("dust_stable:server:gethorse", function(horseid, nom, model, pos, _race, idstash, _type)
    horselist = {}
    Wait(50)
    table.insert(horselist, {id = horseid, name = nom, race = model, stable = pos, lib = _race, stashid = idstash, type = _type})
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
                    table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
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
                            if v.type == "horse" then
                                spawnhorse(v.race, v.name, v.id, v.stashid)
                            elseif v.type == "cart" then
                                spawncart(v.race, v.name, v.id, v.stashid)
                            end
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
                            table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
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
                            table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
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

local spawnedhorses = {}
RegisterNetEvent("dust_stable:server:getcomponents")
AddEventHandler("dust_stable:server:getcomponents", function(components, _meta)
    CompCache = components
    selectedmeta = _meta
end)

local initializing = false
function spawnhorse(model, name, horseid, stashid)
    print 'rrr'
    if initializing then
        return
    end

    local ped = PlayerPedId()
    local pCoords = GetEntityCoords(ped)
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
    Entity(horse).state.name = name
    -- for _, component in pairs(selectedcomp) do
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, component, true, true, true)
    -- end

    --- SET LES META DU CHEVAL
    
    for k, v in pairs(Config.Label) do
        Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, CompCache[k].hash, true, true, true)
    end
    if CompCache["HORSE_SADDLEBAGS"].hash ~= nil then
        Entity(horse).state.saddle = "true"
        Entity(horse).state.stashid = stashid
        print (stashid)
    end
    SetPedConfigFlag(horse, 297, true)
    Citizen.InvokeNative(0xC6258F41D86676E0, horse, 0, selectedmeta.health)
    Citizen.InvokeNative(0xC6258F41D86676E0, horse, 1, selectedmeta.stamina)

    TriggerServerEvent("dust_stable:server:horseout", horseid)

    table.insert(spawnedhorses, horse)
    initializing = false
end

function spawncart(model, name, horseid, stashid)
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
    local cart = CreateVehicle(modelHash, spawnPosition, GetEntityHeading(ped) - 90.0, true, true)
    SetModelAsNoLongerNeeded(modelHash)

    SetPedPromptName(cart, name)
    Entity(cart).state.horseid = horseid
    -- for _, component in pairs(selectedcomp) do
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, component, true, true, true)
    -- end
    

    for k, v in pairs(Config.CartCustom) do
        if k == "tints" then
            Citizen.InvokeNative(0x8268B098F6FCA4E2, cart, tonumber(CompCache['tints'].hash))
      
        elseif k == "propsets" then
            Citizen.InvokeNative(0x75F90E4051CC084C, cart, tonumber(CompCache['propsets'].hash))
        
        elseif k == "extras" then
            Citizen.InvokeNative(0xBB6F89150BC9D16B, cart, tonumber(CompCache['extras'].hash), 0) -- EXTRA
           
        elseif k == "liveries" then
            Citizen.InvokeNative(0xF89D82A0582E46ED, cart, tonumber(CompCache['liveries'].hash))
          
        end 
    end
    Entity(cart).state.stashid = stashid

    TriggerServerEvent("dust_stable:server:horseout", horseid)

    table.insert(spawnedhorses, cart)
    initializing = false
end


---- RANGER LE CHEVAL  ----
RegisterNetEvent("dust_stable:server:horsestocked")
AddEventHandler("dust_stable:server:horsestocked", function(type)
    if type == "horse" then
        local horse = GetMount(PlayerPedId())
        TaskDismountAnimal(PlayerPedId(), 0x48E92D3DDE23C23A, 0, 0 ,0, horse) --- joue l'anim descendre du cheval
        Wait(2000)
        DeleteEntity(horse)
    elseif type == "cart" then
        local cart = GetVehiclePedIsIn(PlayerPedId(), 0)
        TaskLeaveVehicle(PlayerPedId(), cart, 256)
        Wait(3000)
        DeleteEntity(cart)
    end

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
    PromptSetControlAction(AchatPrompt, 0x156F7119)
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
                if IsControlJustReleased(0, 0x156F7119) then
                    buyhorse(v.stable)
                    isInteracting = true
                end
            end
        end
        for k, v in pairs(Config.Buycart) do
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                PromptSetActiveGroupThisFrame(AchatPromptGroup, AchatPromptName)
                if IsControlJustReleased(0, 0x156F7119) then
                    buycart(v.stable)
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
            local comp = {}
            for k,v in pairs(Config.Label) do
                if comp[k] == nil then
                    comp[k] = {}
                    comp[k].hash = nil
                end
            end
            local type = "horse"
            TriggerServerEvent("dust_stable:server:createhorse", data.current.label, data.current.value, stable, data.current.label, comp, type)
            isInteracting = false
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end

function buycart(stable)
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local elements = {}

        for k, v in pairs(Config.Cart) do
            table.insert(elements, {label = v.name, value = v.model, desc = v.desc})
        end
        MenuData.Open('default', GetCurrentResourceName(), 'buycart', {
            title = "Acheter une charrette",
            subtext = "Charrette",
            align = 'top-right',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            local comp = {}
            for k,v in pairs(Config.CartCustom) do
                if comp[k] == nil then
                    comp[k] = {}
                    comp[k].hash = nil
                end
            end
            local type = "cart"
            TriggerServerEvent("dust_stable:server:createhorse", data.current.label, data.current.value, stable, data.current.label, comp, type)
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


---- RESET CHEVAUX AU RESTART ----
AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    TriggerServerEvent('dust_stable:server:resethorse')
end)

AddEventHandler('txAdmin:events:scheduledRestart', function()
    TriggerServerEvent('dust_stable:server:resethorse')
end)

---- LOOT STASHES ---
local saddleprompt = UipromptGroup:new("Sacoches")
Uiprompt:new(0x760A9C6F, "Ouvrir", saddleprompt)
saddleprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 1.5, itemSet, 1, Citizen.ResultAsInteger())
      
        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
                if Entity(entity).state.saddle == "true" and not IsPedOnMount(PlayerPedId()) then
                    saddleprompt:setActiveThisFrame(true)
                    if IsControlJustReleased(0, 0x760A9C6F) then
                        TriggerEvent("redemrp_inventory:OpenStash", Entity(entity).state.stashid, 10.0)
                        local oldpos = GetEntityCoords(entity)
                        -- while true do
                        --     Wait(0)
                        --     local pos = GetEntityCoords(entity)
                        --     if #(pos - oldpos) > 2.0 then
                        --         TriggerEvent("redemrp_inventory:closeinv")
                        --     end
                        -- end
                    end
                end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)

local saddleprompt = UipromptGroup:new("Charrette")
Uiprompt:new(0x760A9C6F, "Ouvrir", saddleprompt)
saddleprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        local cart = lib.getClosestVehicle(coords, 3.0, false)
        if cart then
            if Entity(cart).state.stashid then
                saddleprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x760A9C6F) then
                    TriggerEvent("redemrp_inventory:OpenStash", Entity(cart).state.stashid, 10.0)
                end
            end
        end
    end
end)


------- META/STATUS CHEVAUX -----
RegisterNetEvent('horse:haycube')
AddEventHandler('horse:haycube', function(source)

    local player = PlayerPedId()
    local onhorse = IsPedOnMount(player)
    local _source = source
        if onhorse then
            local Cavallo = GetMount(player)

            TaskAnimalInteraction(player, horse, -224471938, true, true) --Animazione

            local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, horse, 0)
            local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, horse, 1)

            if not tonumber(valueHealth) then valueHealth = 0 end
            if not tonumber(valueStamina) then valueStamina = 0 end
            Citizen.Wait(3500)
            Citizen.InvokeNative(0xC6258F41D86676E0, horse, 0, valueHealth + 15)
            Citizen.InvokeNative(0xC6258F41D86676E0, horse, 1, valueStamina + 15)
        end
end)


RegisterNetEvent('horse:horsestimulant')
AddEventHandler('horse:horsestimulant', function(source)

    local player = PlayerPedId()
    local onhorse = IsPedOnMount(Ped)
    local _source = source

            local horse = GetMount(player)

                TaskAnimalInteraction(PlayerPedId(), horse,-1355254781, 0, 0) --stem

                local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, horse, 0)
                local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, horse, 1)

                    if not tonumber(valueHealth) then valueHealth = 0 end
                    if not tonumber(valueStamina) then valueStamina = 0 end
                Citizen.Wait(3500)
                Citizen.InvokeNative(0xC6258F41D86676E0, horse, 0, valueHealth + 35)
                Citizen.InvokeNative(0xC6258F41D86676E0, horse, 1, valueStamina + 35)


                Citizen.InvokeNative(0xF6A7C08DF2E28B28, horse, 0, 1000.0)
                Citizen.InvokeNative(0xF6A7C08DF2E28B28, horse, 1, 1000.0)

                Citizen.InvokeNative(0x50C803A4CD5932C5, true) --core
                Citizen.InvokeNative(0xD4EE21B7CC7FD350, true) --core
                PlaySoundFrontend("Core_Fill_Up", "Consumption_Sounds", true, 0)
end)

RegisterNetEvent('horse:horsereviver')
AddEventHandler('horse:horsereviver', function(source)
    while true do
        Citizen.Wait(0)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 2.0, itemSet, 1, Citizen.ResultAsInteger())
      
        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
                if Entity(entity).state.horseid then
                -- SetEntityCoords(entity, spawnPosition.x, spawnPosition.y, spawnPosition.z, 0, 0, 1, 0)
                    TriggerServerEvent("dust_stable:server:askcomponents", Entity(entity).state.horseid)
                    Wait(200)
                    print (GetEntityModel(entity))
                    spawnhorse(GetEntityModel(entity), Entity(entity).state.name, Entity(entity).state.horseid, Entity(entity).state.stashid)
                    break
                end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)


----- CHARRETTE ----- 
local cartprompt = UipromptGroup:new("Sacoches")
Uiprompt:new(0x156F7119, "Ouvrir", cartprompt)
cartprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Buyhorse) do
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                cartprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x156F7119) then
                    buycart(v.stable)
                    isInteracting = true
                end
            end
        end
    end
end)

