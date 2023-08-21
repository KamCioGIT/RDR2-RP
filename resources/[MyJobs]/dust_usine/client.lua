RedEM = exports["redem_roleplay"]:RedEM()

local isInteracting = false

local CraftMenuPrompt = nil
local CraftMenuPromptShown = false
local promptGroup

local varString = CreateVarString(10, "LITERAL_STRING", "Craft Menu")
local maxCraftAmountUsine = 0

Citizen.CreateThread(function()
    Wait(10)
    CraftMenuPrompt = PromptRegisterBegin()
    PromptSetActiveGroupThisFrame(promptGroup, varString)
    PromptSetControlAction(CraftMenuPrompt, 0xE8342FF2) -- LEFT ALT
    PromptSetText(CraftMenuPrompt, CreateVarString(10, "LITERAL_STRING", "CRAFT"))
    PromptSetStandardMode(CraftMenuPrompt, true)
    PromptSetEnabled(CraftMenuPrompt, false)
    PromptSetVisible(CraftMenuPrompt, false)
    Citizen.InvokeNative(0x94073D5CA3F16B7B, CraftMenuPrompt, 1000)
    N_0x0c718001b77ca468(CraftMenuPrompt, 2.0)
    PromptSetGroup(CraftMenuPrompt, promptGroup)
    PromptRegisterEnd(CraftMenuPrompt)
end)

RegisterNetEvent("usine:OpenBossMenu", function(menutype)
    local Position = GetEntityCoords(PlayerPedId())
    local _menutype = menutype

    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    CraftMenuPromptShown = false
                end)
                return
            end
        end
    end)

    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local jobgrade = RedEM.GetPlayerData().jobgrade

        local elements = {}

        if jobgrade >= 1 then

            if _menutype == 'gunpowder' then 
                table.insert(elements, {label = "Poudre à canon", value = 'gunpowder', desc = "Transformation > 5 Charbon + 10 Soufre = 10 Poudre à canon"})
                table.insert(elements, {label = "Douille", value = 'douille', desc = "Transformation > 1 Cuivre + 1 Plomb"})
                table.insert(elements, {label = "Pièce d'arme", value = 'piecearme', desc = "Transformation >  10 Fer + 1 Charbon"})
            end

            if jobgrade > 1 then
                if _menutype == 'atelier' then 
                    table.insert(elements, {label = "AMMO_REVOLVER", value = 'ammo_revolver', desc = "Transformation > 10 GunPowder + 10 Douilles"})
                    table.insert(elements, {label = "AMMO_PISTOL", value = 'ammo_pistol', desc = "Transformation > 10 GunPowder + 10 Douilles"})
                    table.insert(elements, {label = "AMMO_REPEATER", value = 'ammo_repeater', desc = "Transformation > 15 GunPowder + 10 Douilles"})
                    table.insert(elements, {label = "AMMO_RIFLE", value = 'ammo_rifle', desc = "Transformation > 20 GunPowder + 10 Douilles"})
                    table.insert(elements, {label = "AMMO_SHOTGUN", value = 'ammo_shotgun', desc = "Transformation > 15 GunPowder + 10 Douilles"})
                end
            end

        else
            return RedEM.Functions.NotifyRight("You don't have any options here.", 3000)
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Craft Usine Menu",
            subtext = "Job Interaction for Usine",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("usine:MaxRessourcesAmount", data.current.value, MenuData, menu)
            CraftMenuPromptShown = false
        end,

        function(data, menu)
            menu.close()
            CraftMenuPromptShown = false
        end)
    end)
end)

RegisterNetEvent("usine:CraftingAction")
AddEventHandler("usine:CraftingAction", function(source, menu)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    FreezeEntityPosition(playerPed, true)
    isInteracting = true
    RequestAnimDict(Config.AnimDict)
    while not HasAnimDictLoaded(Config.AnimDict) do
        Citizen.Wait(50)
    end
    for k,v in pairs(Config.CraftAnim) do
        TaskPlayAnim(playerPed, Config.AnimDict, v, 8.0, -8.0, -1, 1, 0, true)
            Citizen.Wait(3000)
        end
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
    end)    
end)

--- Définir si le joueur est usinier 
Citizen.CreateThread(function()
    local PlayerData = RedEM.GetPlayerData()
    while RedEM.GetPlayerData().isLoggedIn ~= true do 
        Wait(750)
        if RedEM.GetPlayerData().job == "usine" then 
            StartMission()
        end
    end
    if RedEM.GetPlayerData().isLoggedIn then
        if RedEM.GetPlayerData().job == "usine" then
            StartMission()
        end
    end
end)


function StartMission()
    PromptSetEnabled(CraftMenuPrompt, false)
    PromptSetVisible(CraftMenuPrompt, false)
    CraftMenuPromptShown = false
    Citizen.CreateThread(function()
        while true do 
            Wait(2)
            local playerPos = GetEntityCoords(PlayerPedId())
            if #(playerPos - Config.RessourcesPointPos) < 6.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.RessourcesPointPos.x, Config.RessourcesPointPos.y, Config.RessourcesPointPos.z - 1.0, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - Config.RessourcesPointPos) < Config.DistanceToInteract and not isInteracting then
                DrawTxt(Config.MsgWorking, 0.50, 0.90, 0.45, 0.45, true, 255, 255, 255, 255, true)
                if IsControlJustPressed(2, 0x4AF4D473) and not isInteracting then 
                    SouffreRecolt()
                end
            end

            -- CREATE GUNPOWDER
            if #(playerPos - Config.CreateGunPowerPos) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.CreateGunPowerPos.x, Config.CreateGunPowerPos.y, Config.CreateGunPowerPos.z - 1.0, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - Config.CreateGunPowerPos) < Config.DistanceToInteract and not isInteracting then
                if CraftMenuPromptShown == false then
                    PromptSetEnabled(CraftMenuPrompt, true)
                    PromptSetVisible(CraftMenuPrompt, true)
                    CraftMenuPromptShown = true
                end
                if PromptHasHoldModeCompleted(CraftMenuPrompt) then
                    TriggerServerEvent("usine:RequestBossMenu", 'gunpowder')
                    PromptSetEnabled(CraftMenuPrompt, false)
                    PromptSetVisible(CraftMenuPrompt, false)
                end
            end

            -- CREATE GUNPOWDER
            if #(playerPos - Config.Atelier) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.Atelier.x, Config.Atelier.y, Config.Atelier.z - 1.0, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - Config.Atelier) < Config.DistanceToInteract and not isInteracting then
                if CraftMenuPromptShown == false then
                    PromptSetEnabled(CraftMenuPrompt, true)
                    PromptSetVisible(CraftMenuPrompt, true)
                    CraftMenuPromptShown = true
                end
                if PromptHasHoldModeCompleted(CraftMenuPrompt) then
                    TriggerServerEvent("usine:RequestBossMenu", 'atelier')
                    PromptSetEnabled(CraftMenuPrompt, false)
                    PromptSetVisible(CraftMenuPrompt, false)
                end
            end
        end
    end)
end

function SouffreRecolt()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    isInteracting = true
    FreezeEntityPosition(playerPed, true)
    TaskStartScenarioInPlace(playerPed, GetHashKey(Config.RecolteSouffre), Config.WorkingTime, true, false, false, false)
    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true
    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        ClearPedTasksImmediately(playerPed)
		FreezeEntityPosition(playerPed, false)
        isInteracting = false
        TriggerServerEvent('usine:AddItem', 'Souffre', 1)
    end)
end

-- DRAW TEXT ON SCREEEN w/ BACKGROUND
function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1); -- Font
    DisplayText(str, x, y)

    local lineLength = string.len(str) / 100 * 0.70
    DrawTexture("boot_flow", "selection_box_bg_1d", x, y + 0.018, lineLength, 0.07, 0, 0, 0, 0, 200)
end

function DrawTexture(textureStreamed,textureName,x, y, width, height,rotation,r, g, b, a, p11)
    if not HasStreamedTextureDictLoaded(textureStreamed) then
       RequestStreamedTextureDict(textureStreamed, false);
    else
        DrawSprite(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11);
    end
end

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    PromptDelete(CraftMenuPrompt)
end)

RegisterNetEvent("usine:SelectCraftingAmount")
AddEventHandler("usine:SelectCraftingAmount", function(dataType, menuData, menu)
    menuData.CloseAll()
    print("B")

    local elements = {
        { label = "Crafting Amount", 
        value = 0, 
        desc = "Se mettre au travail",
        type = 'slider',
        min = 0,
        max = maxCraftAmountUsine 
        },
    }

    print("C")
    menuData.Open('default', GetCurrentResourceName(), 'craft', {
        title = "Craft Usine Menu",
        subtext = "Select how much ".. dataType .. " craft",
        align = 'top-right',
        elements = elements,
    },

    function(data, menu)
        if data.current.label == "Crafting Amount" then
            --TriggerServerEvent("usine:CraftItem", data.current.value, PlayerPedId(), menu) 
        else
            RedEM.Functions.NotifyLeft("Invalid entry!", "Enter a valid ID.", "menu_textures", "menu_icon_alert", 4000)
        end 
    end,

    function(data, menu)
        menu.close()
        CraftMenuPromptShown = false
    end)
end)

RegisterNetEvent("usine:client:SetMaxAmount", function(value)
    maxCraftAmountUsine = value
end)

