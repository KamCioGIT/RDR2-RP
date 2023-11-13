RedEM = exports["redem_roleplay"]:RedEM()


RegisterNetEvent("dust_job:marechal")
AddEventHandler("dust_job:marechal", function(job, grade)
    for k, v in pairs(Config.Jobs) do
        if job == v then
            getjob = true
            getgrade = grade
            Buy()
        else
            getjob = false
            getgrade = 0
        end
    end
end)


Citizen.CreateThread(function()
    Wait(1000)
    if RedEM.GetPlayerData().isLoggedIn then
        TriggerServerEvent("dust_mineur:server:RequestJob")
    end
end)

RegisterNetEvent("dust_stable:client:ReceiveJob", function(_job, _jobgrade, _gang, _ganggrade)
    playerjob = _job
    playerjobgrade = _jobgrade
    playergang = _gang
    playerganggrade = _ganggrade
end)


----- INTERACT WITH STABLE ----

-- local stableprompt = UipromptGroup:new("Écurie")
-- Uiprompt:new(0x6319DB71, "Ouvrir", stableprompt)
-- Uiprompt:new(0x05CA7C52, "Gérer", stableprompt):setHoldMode(true)
-- stableprompt:setActive(false)

Citizen.CreateThread(function()
    for k, v in pairs(Config.Stables) do
        local blips = N_0x554d9d53f696d002(1664425300, v.pos)
        SetBlipSprite(blips, -1350763423, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Écurie")
    end
    for k,v in pairs(Config.Certif) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, -361388975, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Gestion des chevaux")
    end
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Stables) do
            if #(playerpos - v.pos ) < 4.5 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur Entrée")
                if IsControlJustReleased(0, 0xC7B5340A) then
                    isInteracting = true
                    local menutype = "Ouvrir"
                    TriggerServerEvent("dust_stable:server:askhorse")
                    Wait(200)
                    OpenStable(menutype, v.name)
                end
            end
        end
        for k, v in pairs(Config.Certif) do
            if #(playerpos - v ) < 1.5 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur Entrée")
                if IsControlJustReleased(0, 0xC7B5340A) then
                    isInteracting = true
                    local menutype = "Chevaux"
                    TriggerServerEvent("dust_stable:server:askhorse")
                    Wait(200)
                    OpenStable(menutype, nil)
                end
            end
        end
    end
end)


-- local storeprompt = UipromptGroup:new("Écurie")
-- Uiprompt:new(0xC7B5340A, "Mettre à l'écurie", storeprompt)
-- storeprompt:setActive(false)


Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Stables) do
            if #(playerpos - v.pos ) < 4.5 and IsPedOnMount(PlayerPedId()) then
                -- storeprompt:setActiveThisFrame(true)
                TriggerEvent('dust_presskey', "Appuyez sur Entrée")
                if IsControlJustReleased(0, 0xC7B5340A) then
                    local horse = GetMount(PlayerPedId())
                    local horseid = Entity(horse).state.horseid
                    local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, horse, 0)
                    local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, horse, 1)
                    local type = "horse"
                    TriggerServerEvent("dust_stable:server:stockhorse", v.name, horseid, valueHealth, valueStamina, type)
                end
            end
            if #(playerpos - v.pos ) < 4.5 and IsPedInAnyVehicle(PlayerPedId(), 0) then
                -- storeprompt:setActiveThisFrame(true)
                TriggerEvent('dust_presskey', "Appuyez sur Entrée")
                if IsControlJustReleased(0, 0xC7B5340A) then
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
                if stable then
                    if tostring(v.stable) == tostring(stable) then
                        table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
                    end
                else
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
                    Wait(300)
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
                        table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
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
                        if stable then
                            if tostring(v.stable) == tostring(stable) then
                                table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
                            end
                        else
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
                        if stable then
                            if tostring(v.stable) == tostring(stable) then
                                table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
                            end
                        else
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
                        if stable then
                            if tostring(v.stable) == tostring(stable) then
                                table.insert(elements, {label = v.name, value = v.id, desc = "Race:  "..v.lib.."   ID:  " ..v.id})
                            end
                        else
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
function spawnhorse(model, name, horseid, stashid, health, stamina)
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
    Entity(horse).state:set('horseid', horseid, true)
    Entity(horse).state:set('name', name, true)
    -- for _, component in pairs(selectedcomp) do
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, component, true, true, true)
    -- end

    --- SET LES META DU CHEVAL
    
    for k, v in pairs(Config.Label) do
        Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, CompCache[k].hash, true, true, true)
    end
    if CompCache["HORSE_SADDLEBAGS"].hash ~= nil then
        Entity(horse).state:set('saddle', "true", true)
        Entity(horse).state:set('stashid', stashid, true)
    end
    SetPedConfigFlag(horse, 297, true)
    if  health and stamina then
        Citizen.InvokeNative(0xC6258F41D86676E0, horse, 0, 10)
        Citizen.InvokeNative(0xC6258F41D86676E0, horse, 1, 10)
    else
        Citizen.InvokeNative(0xC6258F41D86676E0, horse, 0, selectedmeta.health)
        Citizen.InvokeNative(0xC6258F41D86676E0, horse, 1, selectedmeta.stamina)
    end

    TriggerServerEvent("dust_stable:server:horseout", horseid)
    SetEntityAsMissionEntity(horse, true, true)
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
            print('boucle')
            Citizen.Wait(10)
        end
    end

    initializing = true
    local spawnPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 3.0, 0.0)
    local cart = CreateVehicle(modelHash, spawnPosition, GetEntityHeading(ped), true, true)
    SetModelAsNoLongerNeeded(modelHash)

    SetPedPromptName(cart, name)
    Entity(cart).state:set('horseid', horseid, true)
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
    Entity(cart).state:set('stashid', stashid, true)
    
    for k, v in pairs(Config.StashWeight) do
        if k == model then
            Entity(cart).state:set('stashweight', v, true)
        end
    end

    TriggerServerEvent("dust_stable:server:horseout", horseid)

    table.insert(spawnedhorses, cart)
    initializing = false
    print 'spawned'
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

-- local AchatPrompt = UipromptGroup:new("Écurie")
-- Uiprompt:new(0x156F7119, "Acheter", AchatPrompt)
-- AchatPrompt:setActive(false)

function Buy()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Buyhorse) do
            if #(playerpos - v.pos) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.pos, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerpos - v.pos ) < Config.DistanceToInteract and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustReleased(0, 0x760A9C6F) then
                    buyhorse(v.stable)
                    isInteracting = true
                end
            end
        end
        for k, v in pairs(Config.Buycart) do
            if #(playerpos - v.pos) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.pos, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerpos - v.pos ) < Config.DistanceToInteract and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustReleased(0, 0x760A9C6F) then
                    buycart(v.stable)
                    isInteracting = true
                end
            end
        end
    end
end

Citizen.CreateThread(function()
    for k,v in pairs(Config.NoobPos) do
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.pos)
            SetBlipSprite(blip, -1715189579)
            SetBlipScale(blip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, string.format("Vente de chevaux"))
    end
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.NoobPos) do
            if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustReleased(0, 0x760A9C6F) then
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
        if stable == 'Stdenis_start' or stable == 'Startbla' then
            for k, v in pairs(Config.NoobHorses) do
                table.insert(elements, {label = v.name, value = v.model, desc = "Prix:  $"..v.price, price = v.price})
            end
        else
            for k, v in pairs(Config.BuyHorses) do
                table.insert(elements, {label = v.name, value = v.model, desc = "Prix:  $"..v.price, price = v.price})
            end
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
            TriggerServerEvent("dust_stable:server:createhorse", data.current.label, data.current.value, stable, data.current.label, comp, type, data.current.price)
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
            table.insert(elements, {label = v.name, value = v.model, desc = "Prix:  $"..v.price, price = v.price})
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
            TriggerServerEvent("dust_stable:server:createhorse", data.current.label, data.current.value, stable, data.current.label, comp, type, data.current.price)
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

AddEventHandler('txAdmin:events:serverShuttingDown', function()
    TriggerServerEvent('dust_stable:server:resethorse')
end)

---- LOOT STASHES ---
-- local saddleprompt = UipromptGroup:new("Sacoches")
-- Uiprompt:new(0x760A9C6F, "Ouvrir", saddleprompt)
-- saddleprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 1.5, itemSet, 1, Citizen.ResultAsInteger())
      
        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
                if Entity(entity).state.saddle == "true" and not IsPedOnMount(PlayerPedId()) then
                    -- TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustReleased(0, 0xC1989F95) then
                        -- Citizen.InvokeNative(0xCD181A959CFDD7F4, PlayerPedId(), entity, GetHashKey("Interaction_LootSaddleBags"), 0, 1)
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

-- local charretteprompt = UipromptGroup:new("Charrette")
-- Uiprompt:new(0x760A9C6F, "Ouvrir", charretteprompt)
-- charretteprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        local cart = lib.getClosestVehicle(coords, 3.0, false)
        if cart then
            if Entity(cart).state.stashid then
                if GetEntityModel(cart) == -1698498246 then
                    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
                    local hold = GetPedType(holding)
                    local quality = Citizen.InvokeNative(0x88EFFED5FE8B0B4A, holding) -- Native pour l'état de la carcasse
                    local model = GetEntityModel(holding)
                    if holding ~= false then
                        if hold == 28 then
                            if IsControlJustReleased(0, 0x760A9C6F) then
                                TriggerServerEvent("dust_stable:hunt:stock", quality, model, cart, Entity(cart).state.stashid, holding)
                            end
                        end
                    else
                        if IsControlJustReleased(0, 0x760A9C6F) then
                            TriggerServerEvent("dust_stable:hunt:retrieve", quality, model, cart, Entity(cart).state.stashid)
                        end
                    end
                else
                    if IsControlJustReleased(0, 0xC1989F95) then
                        TriggerEvent("redemrp_inventory:OpenStash", Entity(cart).state.stashid, Entity(cart).state.stashweight)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("dust_stable:hunt:stockanim", function(cart, hauteur, holding)
    DeleteThis(holding)
    for k, v in pairs(Config.Hauteur) do
        if k == hauteur then
            Citizen.InvokeNative(0x31F343383F19C987, cart, tonumber(v), true)
        end
    end
end)

RegisterNetEvent("dust_stable:hunt:retrieveanim", function(qual, mod, cart, hauteur)
    for k, v in pairs(Config.Hauteur) do
        if k == hauteur then
            Citizen.InvokeNative(0x31F343383F19C987, cart, tonumber(v), true)
        end
    end
    if type(mod) == 'number' then 
        modelHash = mod
    end
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(10)
        end
    end
    local ped = PlayerPedId()
    local spawnPosition = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.0, 0.0)
    local animal = CreatePed(modelHash, spawnPosition, GetEntityHeading(ped) - 90.0, true, true)
    SetEntityCarcassType(animal, qual)
end)

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
------- META/STATUS CHEVAUX -----

RegisterNetEvent('dust_stable:brosse')
AddEventHandler('dust_stable:brosse', function(source)
    while true do
        Citizen.Wait(0)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 2.0, itemSet, 1, Citizen.ResultAsInteger())
      
        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
                if Entity(entity).state.horseid then
                -- SetEntityCoords(entity, spawnPosition.x, spawnPosition.y, spawnPosition.z, 0, 0, 1, 0)
                    Citizen.InvokeNative(0xCD181A959CFDD7F4, PlayerPedId(), entity, GetHashKey("Interaction_Brush"), GetHashKey("p_brushHorse02x"), 1)
                    Wait(3000)
                    ClearPedEnvDirt(entity) 
                    ClearPedDamageDecalByZone(entity ,10 ,"ALL")
                    ClearPedBloodDamage(entity)
                    return
                end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)

RegisterNetEvent('dust_stable:horsehaycube')
AddEventHandler('dust_stable:horsehaycube', function(source)
    local ped = PlayerPedId()
    while true do
        Citizen.Wait(0)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(ped), 2.0, itemSet, 1, Citizen.ResultAsInteger())
      
        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
                if Entity(entity).state.horseid then
                    Citizen.InvokeNative(0xCD181A959CFDD7F4, ped, entity, GetHashKey("Interaction_Food"), 0, 1)
                    Citizen.Wait(3500)
                    local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, entity, 1)
                    if not tonumber(valueStamina) then valueStamina = 0 end
                    if valueStamina <= 10 then
                        TriggerEvent("redem_roleplay:NotifyLeft", "Cheval", "Il faut changer les fers de votre monture !", "menu_textures", "menu_icon_on_horse", 4000)
                        Citizen.InvokeNative(0xC6258F41D86676E0, entity, 1, 10)
                    else
                        Citizen.InvokeNative(0xC6258F41D86676E0, entity, 1, valueStamina + 60)
                    end
                    TriggerServerEvent("dust_stable:removeitem", "horsehaycube")
                    return
                end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)


RegisterNetEvent('dust_stable:horsestimulant')
AddEventHandler('dust_stable:horsestimulant', function(source)
    local ped = PlayerPedId()
    while true do
        Citizen.Wait(0)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(ped), 2.0, itemSet, 1, Citizen.ResultAsInteger())
      
        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
                if Entity(entity).state.horseid then
                    Citizen.InvokeNative(0xCD181A959CFDD7F4, PlayerPedId(), entity, GetHashKey("Interaction_Injection_Quick"), GetHashKey("p_cs_syringe01x"), 1)

                    local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, entity, 0)
                    local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, entity, 1)
            
                    if not tonumber(valueHealth) then valueHealth = 0 end
                    if not tonumber(valueStamina) then valueStamina = 0 end
                    Citizen.Wait(3500)
                    Citizen.InvokeNative(0xC6258F41D86676E0, entity, 0, valueHealth + 35)
                    Citizen.InvokeNative(0xC6258F41D86676E0, entity, 1, valueStamina + 35)
            
            
                    Citizen.InvokeNative(0xF6A7C08DF2E28B28, entity, 0, 1000.0)
                    Citizen.InvokeNative(0xF6A7C08DF2E28B28, entity, 1, 1000.0)
            
                    Citizen.InvokeNative(0x50C803A4CD5932C5, true) --core
                    Citizen.InvokeNative(0xD4EE21B7CC7FD350, true) --core
                    PlaySoundFrontend("Core_Fill_Up", "Consumption_Sounds", true, 0)
                    TriggerServerEvent("dust_stable:removeitem", "horsestimulant")
                    return
                end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)

RegisterNetEvent('dust_stable:horsereviver')
AddEventHandler('dust_stable:horsereviver', function(source)
    local ped = PlayerPedId()
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
                     TaskStartScenarioInPlace(ped, `WORLD_HUMAN_CROUCH_INSPECT`, playEnterAnim, true)
                    Wait(3000)
                    spawnhorse(GetEntityModel(entity), Entity(entity).state.name, Entity(entity).state.horseid, Entity(entity).state.stashid, 10, 10)
                    DeleteEntity(entity)
                    ClearPedTasks(ped)
                    TriggerServerEvent("dust_stable:removeitem", "horsereviver")
                    return
                end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)

RegisterNetEvent('dust_stable:horsemedicine')
AddEventHandler('dust_stable:horsemedicine', function(source)
    local ped = PlayerPedId()
    while true do
        Citizen.Wait(0)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 2.0, itemSet, 1, Citizen.ResultAsInteger())
      
        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
                if Entity(entity).state.horseid then
                    Citizen.InvokeNative(0xCD181A959CFDD7F4, PlayerPedId(), entity, GetHashKey("Interaction_Injection_Quick"), GetHashKey("p_cs_syringe01x"), 1)
                    Wait(5000)
                    local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, entity, 0)
                    Citizen.InvokeNative(0xC6258F41D86676E0, entity, 0, valueHealth + 50)
                    ClearPedTasks(ped)
                    TriggerServerEvent("dust_stable:removeitem", "horsemedicine")
                    return
                end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)


RegisterNetEvent('dust_stable:fercheval')
AddEventHandler('dust_stable:fercheval', function(source)
    local ped = PlayerPedId()
    while true do
        Citizen.Wait(0)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(ped), 2.0, itemSet, 1, Citizen.ResultAsInteger())
      
        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
                if Entity(entity).state.horseid then
                    TaskStartScenarioInPlace(ped, `WORLD_HUMAN_CROUCH_INSPECT`, playEnterAnim, true)
                    Wait(5000)
                    Citizen.InvokeNative(0xC6258F41D86676E0, entity, 1, 50)
                    ClearPedTasks(ped)
                    TriggerServerEvent("dust_stable:removeitem", "fercheval")
                    return
                end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)




----- CHARRETTE ----- 
local cartprompt = UipromptGroup:new("Charrette")
Uiprompt:new(0x156F7119, "Ouvrir", cartprompt)
cartprompt:setActive(false)

-- Citizen.CreateThread(function()
--     while true do
--         Wait(0)
--         local playerpos = GetEntityCoords(PlayerPedId())
--         for k, v in pairs(Config.Buyhorse) do
--             if #(playerpos - v.pos ) < 7 and not IsPedOnMount(PlayerPedId()) and not isInteracting then
--                 TriggerEvent('dust_presskey', "Appuyez sur G")
--                 if IsControlJustReleased(0, 0x760A9C6F) then
--                     buyhorse(v.stable)
--                     isInteracting = true
--                 end
--             end
--         end
--     end
-- end)

--- depop 
RegisterCommand("depop", function(source, args, rawCommand)
    if args[1] then
        TriggerServerEvent('dust_stable:server:depophorse', args[1])
    end
end)

