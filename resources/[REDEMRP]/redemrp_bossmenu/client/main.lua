RedEM = exports["redem_roleplay"]:RedEM()

local PlayerJob = nil
local PlayerJobgrade = nil
local promptGroup
local BossMenuPrompt = nil
local BossMenuPromptShown = false
local NearAnything = false
local FoundSomething = false
local varString = CreateVarString(10, "LITERAL_STRING", "Boss Menu")
local Timeout = nil
local isInteracting = false


RegisterNetEvent("dust_job:sheriff")
AddEventHandler("dust_job:sheriff", function(job, grade)
    for k, v in pairs(Config.AlerteVente) do
        if job == v then
            TriggerServerEvent("redemrp_bossmenu:server:ToggleDuty")
        end
    end
end)

RegisterNetEvent('sellnpc:addAlert')
AddEventHandler('sellnpc:addAlert', function (coords)
    local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords.x, coords.y, coords.z)
    local radius = Citizen.InvokeNative(0x45F13B7E0A15C880, Config.radiusStyle, coords.x, coords.y, coords.z, Config.blipRadius)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, "C'est louche par ici")
    SetBlipSprite(blip, Config.alertBlipSprite, true)
    SetBlipScale(blip, 0.2)
    Citizen.Wait(Config.alertTimeout*1000)
    RemoveBlip(blip)
    RemoveBlip(radius)
end)



Citizen.CreateThread(function()
    Wait(1000)
    for k,v in pairs(Config.ExportNPC) do
            local model = RequestModel(GetHashKey("mp_u_m_m_fos_dockworker_01"))

            while not HasModelLoaded(GetHashKey("mp_u_m_m_fos_dockworker_01")) do
                Wait(100)
            end
    
            local spawnCoords = v.coords
            local ped = CreatePed(GetHashKey("mp_u_m_m_fos_dockworker_01"), spawnCoords.x, spawnCoords.y, spawnCoords.z, v.heading, false, true, true, true)
            Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
            SetEntityNoCollisionEntity(PlayerPedId(), ped, false)
            SetEntityCanBeDamaged(ped, false)
            SetEntityInvincible(ped, true)
            Wait(2000)
            FreezeEntityPosition(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetModelAsNoLongerNeeded(GetHashKey("mp_u_m_m_fos_dockworker_01"))
    end
    for k,v in pairs(Config.ImportNPC) do
        local model = RequestModel(GetHashKey("mp_u_m_m_lom_sd_dockworker_01"))

        while not HasModelLoaded(GetHashKey("mp_u_m_m_lom_sd_dockworker_01")) do
            Wait(100)
        end

        local spawnCoords = v.coords
        local ped = CreatePed(GetHashKey("mp_u_m_m_lom_sd_dockworker_01"), spawnCoords.x, spawnCoords.y, spawnCoords.z, v.heading, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        SetEntityNoCollisionEntity(PlayerPedId(), ped, false)
        SetEntityCanBeDamaged(ped, false)
        SetEntityInvincible(ped, true)
        Wait(2000)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetModelAsNoLongerNeeded(GetHashKey("mp_u_m_m_lom_sd_dockworker_01"))
end
    for k,v in pairs(Config.Jobs) do
        if v.blisprite then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.MenuLocations)
            SetBlipSprite(blip, v.blisprite)
            SetBlipScale(blip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, string.format(v.Name))
        end
    end
    if RedEM.GetPlayerData().isLoggedIn then
        TriggerServerEvent("redemrp_bossmenu:server:RequestJob")
    end
end)

RegisterNetEvent("redemrp_bossmenu:client:ReceiveJob", function(job, grade)
    PromptSetEnabled(BossMenuPrompt, false)
    PromptSetVisible(BossMenuPrompt, false)
    BossMenuPromptShown = false
    PlayerJob, PlayerJobgrade = job, grade
    if Config.Jobs[job] then
        if Config.Jobs[job].bigjob then
            local bigjob = Config.Jobs[job].bigjob
            TriggerEvent("dust_job:"..bigjob, PlayerJob, PlayerJobgrade)
        end
    end
    if tonumber(PlayerJobgrade) >= 3 then
        print('getaccess')
        TriggerEvent("dust_export:getaccess")
    end
end)

Citizen.CreateThread(function()
    BossMenuPrompt = PromptRegisterBegin()
    PromptSetActiveGroupThisFrame(promptGroup, varString)
    PromptSetControlAction(BossMenuPrompt, 0x6319DB71)
    PromptSetText(BossMenuPrompt, CreateVarString(10, "LITERAL_STRING", "Bureau"))
    PromptSetStandardMode(BossMenuPrompt, true)
    PromptSetEnabled(BossMenuPrompt, false)
    PromptSetVisible(BossMenuPrompt, false)
    PromptSetHoldMode(BossMenuPrompt, 1)
    N_0x0c718001b77ca468(BossMenuPrompt, 3.0)
    PromptSetGroup(BossMenuPrompt, promptGroup)
    PromptRegisterEnd(BossMenuPrompt)
    Wait(1000)
    if RedEM.GetPlayerData().isLoggedIn then
        TriggerServerEvent("redemrp_bossmenu:server:RequestJob")
    end
end)

local onCooldown = false

RegisterNetEvent("redemrp_bossmenu:client:ToggleDuty", function() TriggerServerEvent("redemrp_bossmenu:server:ToggleDuty") end)

RegisterNetEvent("redemrp_bossmenu:client:OpenBossMenu", function()
    local Position = GetEntityCoords(PlayerPedId())
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
    TriggerEvent("redemrp_menu_base:getData",function(MenuData)
        MenuData.CloseAll()
        local elements = {}
        if Config.Jobs[PlayerJob].HasDuty then
            table.insert(elements, {label = "Service", value = 'duty', desc = "Prendre/Quitter son service."})
        end
        if Config.Jobs[PlayerJob].Grades[PlayerJobgrade].Personnel then
            table.insert(elements, {label = "Employés", value = 'personnel', desc = "Gérer vos employés"})
        end
        if Config.Jobs[PlayerJob].Grades[PlayerJobgrade].StorageAccess then
            table.insert(elements, {label = "Stockage", value = 'stash', desc = "Accéder au stockage"})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'bossmenu', {
            title = "Entreprise",
            subtext = "Gérer l'entreprise",
            align = 'top-right',
            elements = elements,
        },
        function(data, menu)
            if data.current.value == 'duty' then
                if not onCooldown then
                    TriggerServerEvent("redemrp_bossmenu:server:ToggleDuty")
                    onCooldown = true
                    menu.close()
                    Citizen.SetTimeout(3000, function()
                        onCooldown = false
                    end)
                else
                    RedEM.Functions.NotifyRight( "Attendez quelques secondes !", 3000)
                    menu.close()
                end
            elseif data.current.value == 'personnel' then
                local elements = {
                    {label = "Recruter", value = 'hire', desc = "Recruter la personne à côté de vous"},
                    {label = "Gérer les grades", value = 'setgrade', desc = "Promouvoir/Dégrader un employé"},
                    {label = "Renvoyer un employé", value = 'fireo', desc = "Renvoyer un employé"},
                }
                MenuData.Open('default', GetCurrentResourceName(), 'bossmenu_personnelmenu', {
                    title = "Entreprise",
                    subtext = "Gestion du personnel",
                    align = 'top-right',
                    elements = elements,
                },
                function(data, menu)
                    if data.current.value == 'hire' then
                        local closestPlayer, closestDistance = GetClosestPlayer()

                        if closestPlayer ~= -1 and closestDistance <= 1.5 then
                            TriggerServerEvent("redemrp_bossmenu:server:HireMember", GetPlayerServerId(closestPlayer))
                            TriggerServerEvent("redemrp_bossmenu:server:RequestBossMenu")
                        else
                            RedEM.Functions.NotifyLeft("Introuvable", "Il n'y a personne devant vous !", "menu_textures", "menu_icon_alert", 4000)
                            TriggerServerEvent("redemrp_bossmenu:server:RequestBossMenu")
                        end
                    elseif data.current.value == 'setgrade' then
                        MenuData.CloseAll()
                        TriggerServerEvent("redemrp_bossmenu:server:GetGradeList")
                    elseif data.current.value == 'fireo' then
                        MenuData.CloseAll()
                        TriggerServerEvent("redemrp_bossmenu:server:GetOfflineFireList")
                    end
                end,
                function(data, menu)
                    menu.close()
                    TriggerServerEvent("redemrp_bossmenu:server:RequestBossMenu")
                end)
            elseif data.current.value == 'stash' then
                MenuData.CloseAll()
                isInteracting = false
                TriggerServerEvent("redemrp_bossmenu:server:RequestBossStash")
            end
        end,
        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)


FiringPlayer = nil
FiringIdentifier = nil
FiringCharID = nil
FiringName = nil
RegisterNetEvent("redemrp_bossmenu:client:ViewFireList", function(FireList)
    TriggerEvent("redemrp_menu_base:getData",function(MenuData)
        MenuData.CloseAll()
        local elements = {}
        for k,v in ipairs(FireList) do
            table.insert(elements, {label = v.char .. " ("..v.name..")", value = v.id, desc = "Fire "..v.name.."?"})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'bossmenu_firelist', {
            title = "Fire Employee",
            subtext = "List of <span style=\"color:lightgreen\">ONLINE</span> Employees",
            align = 'top-right',
            elements = elements,
        },
        function(data, menu)
            FiringPlayer = data.current.value
            FiringName = data.current.label

            local elements = {
                {label = "<span style=\"color:#FF2D2D\">Confirm</span>", value = 'confirm', desc = "Fire "..FiringName.."?"},
                {label = "Cancel", value = 'cancel', desc = "Cancel this action."},
            }

            MenuData.Open('default', GetCurrentResourceName(), 'bossmenu_firelistconfirm', {
                title = "Fire Employee",
                subtext = "Are you sure?",
                align = 'top-right',
                elements = elements,
            },
            function(data, menu)
                if data.current.value == "confirm" then
                    TriggerServerEvent("redemrp_bossmenu:server:FireMember", FiringPlayer)
                elseif data.current.value == "cancel" then
                    menu.close()
                end
            end,
            function(data, menu)
                menu.close()
                isInteracting = false
            end)
        end,
        function(data, menu)
            menu.close()
            TriggerServerEvent("redemrp_bossmenu:server:RequestBossMenu")
        end)
    end)
end)


RegisterNetEvent("redemrp_bossmenu:client:ViewOfflineFireList", function(FireList) --- garde
    TriggerEvent("redemrp_menu_base:getData",function(MenuData)
        MenuData.CloseAll()
        local elements = {}
        for k,v in ipairs(FireList) do
            table.insert(elements, {label = v.char, id = v.id, charid = v.charid, desc = "Renvoyer "..v.char.."?"})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'bossmenu_ofirelist', {
            title = "Renvoyer un employé",
            subtext = "Liste du personnel",
            align = 'top-right',
            elements = elements,
        },
        function(data, menu)
            FiringIdentifier = data.current.id
            FiringCharID = data.current.charid
            FiringName = data.current.label

            local elements = {
                {label = "Valider", value = 'confirm', desc = "Renvoyer "..FiringName.."?"},
                {label = "Annuler", value = 'cancel', desc = "Annuler"},
            }

            MenuData.Open('default', GetCurrentResourceName(), 'bossmenu_ofirelistconfirm', {
                title = "Renvoyer un employé",
                subtext = "Confirmation",
                align = 'top-right',
                elements = elements,
            },
            function(data, menu)
                if data.current.value == "confirm" then
                    TriggerServerEvent("redemrp_bossmenu:server:FireMemberOffline", FiringIdentifier, FiringCharID)
                elseif data.current.value == "cancel" then
                    menu.close()
                    isInteracting = false
                end
            end,
            function(data, menu)
                menu.close()
                isInteracting = false
            end)
        end,
        function(data, menu)
            menu.close()
            TriggerServerEvent("redemrp_bossmenu:server:RequestBossMenu")
        end)
    end)
end)

SetGradePlayer = nil
SetGradeName = nil
SetGradeNumber = nil
RegisterNetEvent("redemrp_bossmenu:client:ViewGradeList", function(FireList) ---- garde
    TriggerEvent("redemrp_menu_base:getData",function(MenuData)
        MenuData.CloseAll()
        local elements = {}
        for k,v in ipairs(FireList) do
            table.insert(elements, {label = v.char, value = v.id, desc = "Changer le grade de "..v.char.."?"})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'bossmenu_gradelist', {
            title = "Changer le grade",
            subtext = "Liste des employés",
            align = 'top-right',
            elements = elements,
        },
        function(data, menu)
            SetGradePlayer = data.current.value
            SetGradeName = data.current.label

            local elements = {}
            for k,v in ipairs(Config.Jobs[PlayerJob].Grades) do
                table.insert(elements, {label = v.Name, value = k, desc = "Changer le grade"})
            end

            table.insert(elements, {label = "Annuler", value = 'cancel', desc = "Annuler"})

            MenuData.Open('default', GetCurrentResourceName(), 'bossmenu_gradelistconfirm', {
                title = "Changer le grade",
                subtext = "Confirmation",
                align = 'top-right',
                elements = elements,
            },
            function(data, menu)
                if data.current.value == "cancel" then
                    menu.close()
                else
                    TriggerServerEvent("redemrp_bossmenu:server:SetGrade", SetGradePlayer, data.current.value)
                end
            end,
            function(data, menu)
                menu.close()
                isInteracting = false
            end)
        end,
        function(data, menu)
            menu.close()
            TriggerServerEvent("redemrp_bossmenu:server:RequestBossMenu")
        end)
    end)
end)


local bossPrompt = UipromptGroup:new("Bureau")
Uiprompt:new(0x6319DB71, "Ouvrir", bossPrompt)
bossPrompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if PlayerJob and PlayerJobgrade then
            if Config.Jobs[PlayerJob] then
                local PlayerPos = GetEntityCoords(PlayerPedId())
                FoundSomething = false
                local showPrompt = true
                -- if Config.Jobs[PlayerJob].ShowPrompt then
                --     if Config.Jobs[PlayerJob].ShowPrompt == false then
                --         showPrompt = false
                --     end
                -- end
                -- if showPrompt then
                if Config.Jobs[PlayerJob].MenuLocations then
                    if #(PlayerPos - Config.Jobs[PlayerJob].MenuLocations) < 6.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Jobs[PlayerJob].MenuLocations, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0)--DrawMarker
                    end
                    if #(PlayerPos - Config.Jobs[PlayerJob].MenuLocations) < 2.0 then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustReleased(0, 0x760A9C6F) and not isInteracting then
                            isInteracting = true
                            TriggerServerEvent("redemrp_bossmenu:server:RequestBossMenu")
                        end
                    end
                end
                -- end
                if not FoundSomething then
					NearAnything = false
					if BossMenuPromptShown then
						print("Hiding boss menu prompt")
						PromptSetEnabled(BossMenuPrompt, false)
						PromptSetVisible(BossMenuPrompt, false)
						BossMenuPromptShown = false
					end
				end
            end
        end
    end
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    PromptDelete(BossMenuPrompt)
end)


function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end

    for i = 1, #players, 1 do
        local tgt = GetPlayerPed(players[i])

        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end


--- export

RegisterNetEvent("dust_export:getaccess", function()
    if Config.ExportPoint then
        for k, v in pairs(Config.ExportPoint) do
            local blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, v)
            SetBlipSprite(blip, 688589278, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Exportateur")
        end
    end
    while true do
        Citizen.Wait(1)
        local pcoords = GetEntityCoords(PlayerPedId())
        for k, v in ipairs(Config.ExportPoint) do
            if #(pcoords - v) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if Vdist(pcoords, v) < 2.0 then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustReleased(0, 0x760A9C6F) then
                    TriggerServerEvent("dust_export:chekitem")
                end
            end
        end
    end
end)

RegisterNetEvent("dust_export:OpenExportMenu", function(selltable)
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


        for k, v in pairs(selltable) do
            table.insert(elements, {label = v.label.." $"..v.price, value = k, price = v.price})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Exportateur",
            subtext = "Vendre",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("dust_export:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("dust_export:SelectSellingAmount", data.current.value, MenuData, menu)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)


RegisterNetEvent("dust_export:SelectSellingAmount")
AddEventHandler("dust_export:SelectSellingAmount", function(dataType, menuData, menu)
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
            TriggerServerEvent("dust_export:SellItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("dust_export:client:SetMaxAmount", function(value)
    maxsellamount = value
end)
