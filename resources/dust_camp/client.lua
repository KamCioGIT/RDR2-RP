RedEM = exports["redem_roleplay"]:RedEM()


local isInteracting = false

local CraftMenuPrompt = nil
local CraftMenuPromptShown = false
local promptGroup

local varString = CreateVarString(10, "LITERAL_STRING", "Craft Menu")
 
Citizen.CreateThread(function()
    local PlayerData = RedEM.GetPlayerData()
    while RedEM.GetPlayerData().isLoggedIn ~= true do 
        Wait(750)
        CraftCamp()
    end
    if RedEM.GetPlayerData().isLoggedIn then
        CraftCamp()
    end
end)


Citizen.CreateThread(function()
    Wait(10)
    CraftMenuPrompt = PromptRegisterBegin()
    PromptSetActiveGroupThisFrame(promptGroup, varString)
    PromptSetControlAction(CraftMenuPrompt, 0xE8342FF2) -- LEFT ALT
    PromptSetText(CraftMenuPrompt, CreateVarString(10, "LITERAL_STRING", "Camp"))
    PromptSetStandardMode(CraftMenuPrompt, true)
    PromptSetEnabled(CraftMenuPrompt, false)
    PromptSetVisible(CraftMenuPrompt, false)
    Citizen.InvokeNative(0x94073D5CA3F16B7B, CraftMenuPrompt, 1000)
    N_0x0c718001b77ca468(CraftMenuPrompt, 2.0)
    PromptSetGroup(CraftMenuPrompt, promptGroup)
    PromptRegisterEnd(CraftMenuPrompt)
end)

function CraftCamp()
    PromptSetEnabled(CraftMenuPrompt, false)
    PromptSetVisible(CraftMenuPrompt, false)
    CraftMenuPromptShown = false
    Citizen.CreateThread(function()
        while true do
            Wait(2)
            local pos = GetEntityCoords(PlayerPedId()), true
            local campfire = GetClosestObjectOfType(pos, 2.0, GetHashKey("p_campfire05x"), false, false, false)
            if campfire ~= 0 then
                local objectPos = GetEntityCoords(campfire)
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, objectPos.x, objectPos.y, objectPos.z, true) < 2.5 and not isInteracting then
                    if not CraftMenuPromptShown then
                        --print("Showing boss menu prompt")
                        PromptSetEnabled(CraftMenuPrompt, true)
                        PromptSetVisible(CraftMenuPrompt, true)
                        CraftMenuPromptShown = true
                    end
                    if PromptHasHoldModeCompleted(CraftMenuPrompt) then
                        TriggerServerEvent("camp:RequestCampMenu",'fire')
                        local playerPed = PlayerPedId()
                        FreezeEntityPosition(playerPed, true)
                        RequestAnimDict(Config.MenuDict)
                        while not HasAnimDictLoaded(Config.MenuDict) do
                            Citizen.Wait(50)
                        end
                        for k,v in pairs(Config.MenuAnim) do
                            TaskPlayAnim(playerPed, Config.MenuDict, v, 8.0, -8.0, -1, 2, 0, true)
                            Citizen.Wait(3000)
                        end
                    end 
                end
            end
            if CraftMenuPromptShown then -- FERMER LE MENU    
                local pos = GetEntityCoords(PlayerPedId()), true
                local campfire = GetClosestObjectOfType(pos, 2.0, GetHashKey("p_campfire05x"), false, false, false)
                local objectPos = GetEntityCoords(campfire)          
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, objectPos.x, objectPos.y, objectPos.z, true) > 2.5 then 
					print("Hiding boss menu prompt")
                    print(CraftMenuPrompt)
                    Citizen.InvokeNative(0x8A0FB4D03A630D21, CraftMenuPrompt, false)
                    Citizen.InvokeNative(0x71215ACCFDE075EE, CraftMenuPrompt, false)					
					CraftMenuPromptShown = false
                end
			end
        end
    end)
end

RegisterNetEvent("camp:OpenCampMenu", function(menutype)
    local Position = GetEntityCoords(PlayerPedId())
    local _menutype = menutype
    local playerPed = PlayerPedId()
    RequestAnimDict(Config.IdleDict)
    while not HasAnimDictLoaded(Config.IdleDict) do
        Citizen.Wait(50)
        print "okay"
    end
    for k,v in pairs(Config.IdleAnim) do
        TaskPlayAnim(playerPed, Config.IdleDict, v, 8.0, -8.0, -1, 1, 0, true)
        Citizen.Wait(2000)
    end
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

        local jobgrade = RedEM.GetPlayerData().jobgrade

        local elements = {}

        if _menutype == 'fire' then 
            table.insert(elements, {label = "Poudre à canon", value = 'gunpowder', desc = "Transformation > 5 Charbon + 10 Soufre = 10 Poudre à canon"})
            table.insert(elements, {label = "Douille", value = 'douille', desc = "Transformation > 1 Cuivre + 1 Plomb"})
            table.insert(elements, {label = "Pièce d'arme", value = 'piecearme', desc = "Transformation >  10 Fer + 1 Charbon"})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'Camp', {
            title = "Craft Camp Menu",
            subtext = "Cuisine",
            align = 'top-right',
            elements = elements,
        },
        
        function(data, menu)
            MenuData.CloseAll()
            StartCooking(data.current.value, menu, _menutype)
        end,

        function(data, menu)
            menu.close()
            RequestAnimDict(Config.CloseMenuDict)
            while not HasAnimDictLoaded(Config.CloseMenuDict) do
                Citizen.Wait(50)
            end
            for k,v in pairs(Config.CloseMenuAnim) do
                TaskPlayAnim(playerPed, Config.CloseMenuDict, v, 8.0, -8.0, -1, 0, 0, true)
                Citizen.Wait(3000)
            end
        end)
    end)
end)


function StartCooking(itemName, menu, _menutype)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    FreezeEntityPosition(playerPed, true)
    isInteracting = true
    RequestAnimDict(Config.CookDict)
    while not HasAnimDictLoaded(Config.CookDict) do
        Citizen.Wait(50)
    end
    for k,v in pairs(Config.CookAnim) do
        TaskPlayAnim(playerPed, Config.CookDict, v, 8.0, -8.0, -1, 2, 0, true)
        Citizen.Wait(2000)
    end
    for k,v in pairs(Config.CookAnim2) do
        TaskPlayAnim(playerPed, Config.CookDict, v, 8.0, -8.0, -1, 2, 0, true)
        Citizen.Wait(1000)
    end
    -- TaskStartScenarioInPlace(playerPed, GetHashKey(Config.CraftAnim), Config.WorkingTime, true, false, false, false)
    menu.close()
    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true
    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        ClearPedTasksImmediately(PlayerPedId())
		FreezeEntityPosition(playerPed, false)
        isInteracting = false
        TriggerServerEvent("camp:CraftItem", itemName, playerPed)
    end)
    TriggerEvent("camp:OpenCampMenu", _menutype)
end




--- SPAWN OBJET
RegisterNetEvent('cookfirespit')
AddEventHandler('cookfirespit', function() 
    if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        SetEntityAsMissionEntity(cookspit)
        DeleteObject(cookspit)
        campfire = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 1000, true, false, false, false)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
    local prop = CreateObject(GetHashKey("p_campfire05x"), x, y, z, true, false, true)
    local prop2 = CreateObject(GetHashKey("p_campfirecook01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    SetEntityHeading(prop2, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    PlaceObjectOnGroundProperly(prop2)
    campfire = prop
    cookspit = prop2
end, false)