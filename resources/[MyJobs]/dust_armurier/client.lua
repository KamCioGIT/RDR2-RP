RedEM = exports["redem_roleplay"]:RedEM()

RegisterNetEvent("dust_armurier:addammotoweapon", function (weapon, ammo)
    SetPedAmmo(PlayerPedId(), weapon, ammo)
end)

MenuData = {}
TriggerEvent("redemrp_menu_base:getData", function(call)
    MenuData = call
end)


local CurrentPrice = 0
--- Définir si le joueur est armurier

local getjob = false
local getgrade = 0

RegisterNetEvent("dust_job:armurier")
AddEventHandler("dust_job:armurier", function(job, grade)
    for k, v in pairs(Config.Jobs) do
        if job == v then
            getjob = true
            getgrade = grade
        else
            getjob = false
            getgrade = 0
        end
    end
end)


---- Prompt ----

local customwprompt = UipromptGroup:new("Armurier Atelier")
Uiprompt:new(0x156F7119, "Travailler l'arme", customwprompt):setHoldMode(true)
customwprompt:setActive(false)
local craftprompt = UipromptGroup:new("Atelier")
Uiprompt:new(0x760A9C6F, "Fabriquer", craftprompt)
craftprompt:setActive(false)

----- Open Menu ----
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if getjob == true then
            local playerpos = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Atelier) do
                if #(playerpos - v ) < 1.5 and not isInteracting then
                    customwprompt:setActiveThisFrame(true)
                    if customwprompt:hasHoldModeJustCompleted()then
                        isInteracting = true
                        Wait(200)
                        inspectcustom()
                    end
                end
            end
            for k, v in pairs(Config.CraftArme) do
                if #(playerpos - v) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerpos - v) < Config.DistanceToInteract and not isInteracting then
                    craftprompt:setActiveThisFrame(true)
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerEvent("gunstore:OpenBossMenu")
                    end
                end
            end
        end
    end
end)

function inspectcustom()
    local ped = PlayerPedId()
    local wep = GetCurrentPedWeaponEntityIndex(ped, 0)
    local _, wepHash = GetCurrentPedWeapon(ped, true, 0, true)
    if wepHash == -1569615261 then
        isInteracting = false
        return
    end
    local WeapType = GetWeaponType(wepHash)
    if wepHash == `WEAPON_UNARMED` then return end
    if WeapType == "SHOTGUN" then WeaponType = "LONGARM" end
    if WeapType == "MELEE" then WeaponType = "SHORTARM" end
	if WeapType == "BOW" then WeaponType = "SHORTARM" end
    if WeapType == "LONGARM" then WeaponType = "LONGARM" end
    if WeapType == "SHORTARM" then WeaponType = "SHORTARM" end
    Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), wepHash, wep, 0, GetHashKey(WeaponType.."_HOLD_ENTER"), 0, 0, -1.0)
    local Position = GetEntityCoords(ped)
    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 1.0 then
                isInteracting = false
                return
            end
        end
    end)
    TriggerEvent("redemrp_inventory:askuid", wepHash, WeapType, ped)
    Wait(1000)
    OpenCustomWMenu(wepHash, WeapType, ped)
end

RegisterNetEvent('dust_armurier:repairkitweapon', function()
    TriggerEvent("weapons:CleanAndRepairWeapon")
end)

function GetWeaponType(hash)
	if Citizen.InvokeNative(0x959383DCD42040DA, hash)  or Citizen.InvokeNative(0x792E3EF76C911959, hash)   then
		return "MELEE"
	elseif Citizen.InvokeNative(0x6AD66548840472E5, hash) or Citizen.InvokeNative(0x0A82317B7EBFC420, hash) or Citizen.InvokeNative(0xDDB2578E95EF7138, hash) or Citizen.InvokeNative(0xC4DEC3CA8C365A5D, hash) then
		return "LONGARM"
	elseif  Citizen.InvokeNative(0xC75386174ECE95D5, hash) then
		return "SHOTGUN"
	elseif  Citizen.InvokeNative(0xDDC64F5E31EEDAB6, hash) or Citizen.InvokeNative(0xC212F1D05A8232BB, hash) then
		return "SHORTARM"
	end
	return false
end



----- Menu Custom -----

function OpenCustomWMenu(wepHash, Weapontype, ped)
    MenuData.CloseAll()
    local playerPed = PlayerPedId()
    local Position = GetEntityCoords(playerPed)
    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 10.0 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    isInteracting = false
                end)
                return
            end
        end
    end)

    local elements = {}

    for v, k in pairs(Config.MenuElementsW) do

        table.insert(elements, {
            label = k.label or v,
            value = v,
            category = v,
            desc = "Change component"
        })
    end

    table.insert(elements, {
        label = Config.LabelW["save"] or "Valider",
        value = "save",
        desc = "Valider les changements pour $"..CurrentPrice
    })

    MenuData.Open('default', GetCurrentResourceName(), 'customweapon', {

        title = 'Arme',

        subtext = "Modifier l'arme",

        align = 'top-left',

        elements = elements

    }, function(data, menu)
        if data.current.value ~= "save" then
            OpenCategoryWeapon(data.current.value, wepHash, Weapontype, ped)
        else
            menu.close()
            TriggerServerEvent("dust_armurier:savecomp", NewCompCache, wep_uid, CurrentPrice)
            ClearPedTasks(PlayerPedId())
            isInteracting = false
        end

    end, function(data, menu)
        menu.close()
        ClearPedTasks(PlayerPedId())
        isInteracting = false
        --- reset skin de base
    end)
end

function OpenCategoryWeapon(menu_catagory, wepHash, Weapontype, ped)
    MenuData.CloseAll()
    local elements = {}
    local a = 1
    print(menu_catagory)
    if menu_catagory == "commun" then
        for k, v in pairs(weapon_comp["shared_components"][Weapontype]) do
            if k ~= nil then
                category = v
            end
            local options = {}
            for k, v in pairs(category) do
                table.insert(options, k)
            end
            table.insert(elements, {
                label = Config.LabelW[k] or v,
                value = 0,
                category = k,
                desc = "Modifier l'arme",
                type = "slider",
                min = 0,
                max = #category,
                change_type = "model",
                id = a,
                options = options
            })
            
            a = a + 1
            options = {}
        end
    end
    if menu_catagory == "specialweapon" then
        print (wepHash)
        for k, v in pairs(weapon_comp["model_specific_components"][wepHash]) do
            if k ~= nil then
                category = v
            end
            local options = {}
            for k, v in pairs(category) do
                table.insert(options, k)
            end
            table.insert(elements, {
                label = Config.LabelW[k] or v,
                value = 0,
                category = k,
                desc = "Modifier l'arme",
                type = "slider",
                min = 0,
                max = #category,
                change_type = "model",
                id = a,
                options = options
            })
            
            a = a + 1
            options = {}
        end
    end

    MenuData.Open('default', GetCurrentResourceName(), 'customweaponcategory', {

        title = 'Arme',

        subtext = 'Options',

        align = 'top-left',

        elements = elements

    }, function(data, menu)

    end, function(data, menu)
        menu.close()
        OpenCustomWMenu(wepHash, Weapontype, ped)
    end, function(data, menu)
        if data.current.value ~= 0 then 
            MenuUpdateWeapon(data, menu, wepHash, Weapontype, ped, menu_catagory)
        end
    end)
end


function MenuUpdateWeapon(data, menu, wepHash, Weapontype, ped, menu_catagory)    
    if menu_catagory == "specialweapon" then
        for _, comp in pairs(weapon_comp["model_specific_components"][wepHash][data.current.category]) do
            Citizen.InvokeNative(0x19F70C4D80494FF8, ped, GetHashKey(comp), wepHash)
        end

        
        model = GetHashKey(weapon_comp["model_specific_components"][wepHash][data.current.category][data.current.value])
        -- weapon_component_model_hash = Citizen.InvokeNative(0x59DE03442B6C9598, model )
        Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, model, wepHash, true)
        NewCompCache["specific"][data.current.category] = model
    else
        for _, comp in pairs(weapon_comp["shared_components"][Weapontype][data.current.category]) do
            Citizen.InvokeNative(0x19F70C4D80494FF8, ped, GetHashKey(comp), wepHash)
        end
        model = GetHashKey(weapon_comp["shared_components"][Weapontype][data.current.category][data.current.value])
        -- weapon_component_model_hash =  Citizen.InvokeNative(0x59DE03442B6C9598, model)
        Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, model, wepHash, true)
        NewCompCache["commun"][data.current.category] = model
    end
    if CurrentPrice ~= CalculatePrice(wepHash, Weapontype) then
        CurrentPrice = CalculatePrice(wepHash, Weapontype)
        local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING",
            tostring(CurrentPrice .. "$"), Citizen.ResultAsLong())
        Citizen.InvokeNative(0xFA233F8FE190514C, str)
        Citizen.InvokeNative(0xE9990552DEC71600)
    end
end


RegisterNetEvent("dust_armurier:getuid", function(name, uid, comp, WeapType, ped)
    wep_name = name
    wep_uid = uid
    NewCompCache = comp
    _wephash = GetHashKey(name)
    if NewCompCache then
        for k, v in pairs(weapon_comp["shared_components"][WeapType]) do
            if NewCompCache["commun"][k] == nil then
                NewCompCache["commun"][k] = {}
                NewCompCache["commun"][k] = 0
            end
        end
        for k, v in pairs(weapon_comp["model_specific_components"][_wephash]) do
            if NewCompCache["specific"][k] == nil then
                NewCompCache["specific"][k] = {}
                NewCompCache["specific"][k] = 0
            end
        end
    else
        NewCompCache = {}
        NewCompCache["commun"] = {}
        NewCompCache["specific"] = {}
    end
end)

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function IsPedReadyToRender(ped)
    return Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ped)
end
function SetMetaPedTag(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    Citizen.InvokeNative(0xBC6DF00D7A4A6819, ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
end
function UpdatePedVariation(ped)
    Citizen.InvokeNative(0xAAB86462966168CE, ped, true) -- UNKNOWN "Fixes outfit"- always paired with _UPDATE_PED_VARIATION
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false) -- _UPDATE_PED_VARIATION
end

RegisterCommand("tc", function(source, args, rawCommand)
    print (args[1], args[2] )
    local playerPed = PlayerPedId()
    local drawable = GetHashKey(args[1])
    local albedo = GetHashKey(args[2])
    local normal = GetHashKey(args[3])
    local material = GetHashKey(args[4])
    local palette = GetHashKey(args[5])
    local tint0 = args[6]
    local tint1 = args[7]
    local tint2 = args[8]
    while not IsPedReadyToRender(playerPed) do
        Wait(0)
    end
    SetMetaPedTag(playerPed, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    UpdatePedVariation(playerPed)
end)



Citizen.CreateThread(function()

    while true do
        local ped = PlayerPedId()
        SetPedConfigFlag(ped,263,true) -- No Critical Hits
        -- SetPedConfigFlag(ped,169,true) -- Disable Grapple
        SetPedConfigFlag(ped,340,true)  --- no melle finish
        Wait(500)
        local _,wep = GetCurrentPedWeapon(ped)
        Citizen.InvokeNative(0xD77AE48611B7B10A, ped, Config.DamageModifier[wep])

    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if Config.WeaponRecoilSystem then
            local ped = PlayerPedId()
            if IsPedShooting(ped) then
                local _,wep = GetCurrentPedWeapon(ped)
                if Config.WeaponRecoils[wep] and Config.WeaponRecoils[wep] ~= 0 then
                    TimeValue =     0
                    repeat
                        Wait(0)
                        GameplayCamPitch = GetGameplayCamRelativePitch()
                        if Config.WeaponRecoils[wep] > 0.1 then
                            SetGameplayCamRelativePitch(GameplayCamPitch+0.6, 1.2)
                            TimeValue = TimeValue+0.6
                        else
                            SetGameplayCamRelativePitch(GameplayCamPitch+0.016, 0.333)
                            TimeValue = TimeValue+0.1
                        end
                    until TimeValue >= Config.WeaponRecoils[wep]
                end
            end
        end
    end
end)


----- craft

RegisterNetEvent("gunstore:OpenBossMenu", function()
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

        local jobgrade = RedEM.GetPlayerData().jobgrade

        local elements = {}


        for k, v in pairs(Config.CraftingsReceipe) do
            table.insert(elements, {label = v.label, value = k, descriptionimages = v.descriptionimages})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Cuisine",
            subtext = "Laisse le cuisiner",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("gunstore:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("gunstore:SelectCraftingAmount", data.current.value, MenuData, menu)
            --
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("gunstore:CraftingAction")
AddEventHandler("gunstore:CraftingAction", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    FreezeEntityPosition(playerPed, true)
    isInteracting = true
    RequestAnimDict(Config.AnimDict)
    while not HasAnimDictLoaded(Config.AnimDict) do
        Citizen.Wait(50)
    end

    for k,v in pairs(Config.CraftAnim) do
        TaskPlayAnim(playerPed, Config.AnimDict, v, 4.0, 4.0, -1, 1, 0, true)
    end

    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true

    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        ClearPedTasks(PlayerPedId())
        FreezeEntityPosition(playerPed, false)
        isInteracting = false
    end)    
end)

RegisterNetEvent("gunstore:SelectCraftingAmount")
AddEventHandler("gunstore:SelectCraftingAmount", function(dataType, menuData, menu)
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
        desc = "Se mettre au travail",
        type = 'slider',
        min = 0,
        max = maxCraftAmountgunstore 
        },
    }

    menuData.Open('default', GetCurrentResourceName(), 'craft', {
        title = "Atelier",
        subtext = "Choisir la quantité",
        align = 'top-right',
        elements = elements,
    },

    function(data, menu)
        if data.current.label == "Quantité" then
            TriggerServerEvent("gunstore:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("gunstore:client:SetMaxAmount", function(value)
    maxCraftAmountgunstore = value
end)




function CalculatePrice(hash, type)
	local price = 0
    for k,v in pairs(weapon_comp["shared_components"][type]) do
        print (k)
        if NewCompCache["commun"][k] then
            print (1)
            if NewCompCache["commun"][k] > 0 then
                print (Config.LabelPrice[k])
                price = price + Config.LabelPrice[k]
            end
        end
    end
    for k,v in pairs(weapon_comp["model_specific_components"][hash]) do
        if NewCompCache["specific"][k] then
            if NewCompCache["specific"][k] > 0 then
                price = price + Config.LabelPrice[k]
            end
        end
    end
    return price
end