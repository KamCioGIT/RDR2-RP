RedEM = exports["redem_roleplay"]:RedEM()

local promptGroup
local varStringCasa = CreateVarString(10, "LITERAL_STRING", "Écurie")
local blip
local prompts = {}
local SpawnPoint = {}
local StablePoint = {}
local HeadingPoint
local CamPos = {}

Citizen.CreateThread(
    function()
        local str = 'Ouvrir'
        CoffrePrompt = PromptRegisterBegin()
        PromptSetControlAction(CoffrePrompt, 0x8E90C7BB)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(CoffrePrompt, str)
        PromptSetEnabled(CoffrePrompt, true)
        PromptSetVisible(CoffrePrompt, true)
        PromptSetHoldMode(CoffrePrompt, false)
        PromptSetGroup(CoffrePrompt, PoseCoffrePromptGroup)
        PromptRegisterEnd(CoffrePrompt)

        str = 'Gérer'
        LeavePrompt = PromptRegisterBegin()
        PromptSetControlAction(LeavePrompt, 0xD9D0E1C0)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(LeavePrompt, str)
        PromptSetEnabled(LeavePrompt, true)
        PromptSetVisible(LeavePrompt, true)
        PromptSetHoldMode(LeavePrompt, true)
        PromptSetGroup(LeavePrompt, PoseCoffrePromptGroup)
        PromptRegisterEnd(LeavePrompt)
        end
    end
end)

----- INTERACT WITH STABLE ----
Citizen.CreateThread(
    function()
        while true do
            Wait(0)
            local playerpos = GetEntityCoords(PlayerPedId())
                for k, v in pairs(Config.Stables) do
                    local coords = {v.pos.x, v.pos.y, v.pos.z}
                    if #(playerpos - coords ) < 7 then
                        HeadingPoint = v.Heading
                        StablePoint = {v.Pos.x, v.Pos.y, v.Pos.z}
                        CamPos = {v.SpawnPoint.CamPos.x, v.SpawnPoint.CamPos.y}
                        SpawnPoint = {x = v.SpawnPoint.Pos.x, y = v.SpawnPoint.Pos.y, z = v.SpawnPoint.Pos.z, h = v.SpawnPoint.Heading}
                        Wait(300)
                    end
                end
                OpenStable()
                end
            end
        end
    end
)

---- Refresh DB Stable ----

local horselist = {}
RegisterNetEvent("dust_stable:server:gethorse")
AddEventHandler("dust_stable:server:gethorse", function(horseid, nom, model)
    table.insert(horselist, {id = horseid, name = nom, race = model})
end )

---- Menu stable ----

RegisterNetEvent("dust_stable:server:menu", function(menutype)
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
                    for k, v in pairs(horselist) do
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
                        title = "Vendre",
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
                        title = "Vendre",
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
        end
        function(data, menu)
            menu.close()
        end)
    end)
end)

---- Get Horse ----






AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            for _, prompt in pairs(prompts) do
                PromptDelete(prompt)
                RemoveBlip(blip)
            end
        end
    end
)