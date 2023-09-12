RedEM = exports["redem_roleplay"]:RedEM()

RegisterNetEvent("dust_armurier:addammotoweapon", function (weapon, ammo)
    SetPedAmmo(PlayerPedId(), weapon, ammo)
end)

MenuData = {}
TriggerEvent("redemrp_menu_base:getData", function(call)
    MenuData = call
end)



---- Prompt ----

local customwprompt = UipromptGroup:new("Armurier Atelier")
Uiprompt:new(0x156F7119, "Travailler l'arme", customwprompt):setHoldMode(true)
customwprompt:setActive(false)


----- Open Menu ----
Citizen.CreateThread(function()
    while true do
        Wait(0)
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
    end
end)

function inspectcustom()
    local ped = PlayerPedId()
    local wep = GetCurrentPedWeaponEntityIndex(ped, 0)
    local _, wepHash = GetCurrentPedWeapon(ped, true, 0, true)
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
    Wait(1000)
    OpenCustomWMenu(wepHash, WeapType, ped)
    TriggerEvent("redemrp_inventory:getuid", wepHash)
end

RegisterNetEvent('dust_armurier:repairkitweapon', function()
    TriggerEvent("weapons:CleanAndRepairWeapon")
end)

function GetWeaponType(hash)
	if Citizen.InvokeNative(0x959383DCD42040DA, hash)  or Citizen.InvokeNative(0x792E3EF76C911959, hash)   then
		return "MELEE"
	elseif Citizen.InvokeNative(0x6AD66548840472E5, hash) or Citizen.InvokeNative(0x0A82317B7EBFC420, hash) or Citizen.InvokeNative(0xDDB2578E95EF7138, hash) then
		return "LONGARM"
	elseif  Citizen.InvokeNative(0xC75386174ECE95D5, hash) then
		return "SHOTGUN"
	elseif  Citizen.InvokeNative(0xDDC64F5E31EEDAB6, hash) or Citizen.InvokeNative(0xC212F1D05A8232BB, hash) then
		return "SHORTARM"
	end
	return false
end

function ShopMenu()
    MenuData.CloseAll()
    local elements = {
            {label = "Pistols", value = 'pistols'},
            {label = "Long Guns", value = 'longguns'},
            {label = "Melee Weapons", value = 'handguns'},
            {label = "Ammo", value = 'ammo'}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'weaponshop_main', {
        title    = 'Weapon Shop',
        subtext    = 'choose a category',
        align    = 'top-left',
        elements = elements,
    }, function(data, menu)
        local elements2 = {}
        local OpenSub = false
        local category = data.current.value
        if category == 'pistols' then
            elements2 = {
                {label = "Cattleman Revolver", value = 'cattleman_w', weapon = 'WEAPON_REVOLVER_CATTLEMAN', price = 10, lvl = 1, subtext = '$10 LvL 1'},
                {label = "Double Action Revolver", value = 'doubleaction_w', weapon = 'WEAPON_REVOLVER_DOUBLEACTION', price = 12, lvl = 5, subtext = '$12 LvL 5'},
                {label = "Volcanic", value = 'volcanic_w', weapon = 'WEAPON_PISTOL_VOLCANIC', price = 20, lvl = 10, subtext = '$20 LvL 10'},
                {label = "Semi-auto Pistol", value = 'semiauto-p_w', weapon = 'WEAPON_PISTOL_SEMIAUTO', price = 22, lvl = 15, subtext = '$22 LvL 15'},
                {label = "Mauser", value = 'mauser_w', weapon = 'WEAPON_PISTOL_MAUSER', price = 30, lvl = 20, subtext = '$30 LvL 20'},
                {label = "M 1899", value = 'm1899_w', weapon = 'WEAPON_PISTOL_M1899', price = 40, lvl = 30, subtext = '$40 LvL 30'},
                {label = "Lemat Revolver", value = 'lemat_w', weapon = 'WEAPON_REVOLVER_LEMAT', price = 50, lvl = 40, subtext = "$50 LvL 40"}
            }
            OpenSub = true
        elseif category == 'longguns' then
            elements2 = {
                {label = "Carbine Repeator", value = 'carbine_w', weapon = 'WEAPON_REPEATER_CARBINE', price = 20, lvl = 1, subtext = '$20 LvL 1'},
                {label = "Varmint Rifle", value = 'varmint_w', weapon = 'WEAPON_RIFLE_VARMINT', price = 15, lvl = 1, subtext = "$15 LvL 1"},
                {label = "Evans Repeater", value = 'evans_w', weapon = 'WEAPON_REPEATER_EVANS', price = 30, lvl = 5, subtext = "$30 LvL 5"},
                {label = "Bolt Action Rifle", value = 'bolt_w', weapon = 'WEAPON_RIFLE_BOLTACTION', price = 40, lvl = 10, subtext = "$40 LvL 10"},
                {label = "Carcano Rifle", value = 'carcano_w', weapon = 'WEAPON_SNIPERRIFLE_CARCANO', price = 70, lvl = 30, subtext = "$70 LvL 30"},
                {label = "Rolling Block Rifle", value = 'rolling_w', weapon = 'WEAPON_SNIPERRIFLE_ROLLINGBLOCK', price = 100, lvl = 50, subtext = "$100 LvL 50"},
                {label = "Pump Shotgun", value = 'pump_w', weapon = 'WEAPON_SHOTGUN_PUMP', price = 25, lvl = 10, subtext = "$25 LvL 10"},
                {label = "Repeating Shotgun", value = 'repeating_w', weapon = 'WEAPON_SHOTGUN_REPEATING', price = 40, lvl = 20, subtext = "$40 LvL 20"},
                {label = "Semi-auto Shotgun", value = 'semiauto-s_w', weapon = 'WEAPON_SHOTGUN_SEMIAUTO', price = 55, lvl = 30, subtext = "$55 LvL 30"},
                {label = "Sawed-off Shotgun", value = 'sawedoff_w', weapon = 'WEAPON_SHOTGUN_SAWEDOFF', price = 70, lvl = 50, subtext = "$70 LvL 50"}
            }
            OpenSub = true
        elseif category == 'handguns' then
            elements2 = {
                {label = "Knife", value = 'knife_w', weapon = 'WEAPON_MELEE_KNIFE', price = 2, lvl = 1, subtext = '$2 LvL 1'},
                {label = "Lantern", value = 'lantern_r_w', weapon = 'WEAPON_MELEE_DAVY_LANTERN', price = 10, lvl = 1, subtext = "$10 LvL 1"},
                {label = "Bow", value = 'bow_w', weapon = 'WEAPON_BOW', price = 10, lvl = 5, subtext = "$10 LvL 5"},
                {label = "Lasso", value = 'lasso_w', weapon = 'WEAPON_LASSO', price = 10, lvl = 10, subtext = "$10 LvL 10"},
                {label = "Hatchet", value = 'hatchet_w', weapon = 'WEAPON_MELEE_HATCHET', price = 10, lvl = 15, subtext = "$10 LvL 15"},
                {label = "Throwing knives", value = 'throwing_w', weapon = 'WEAPON_THROWN_THROWING_KNIVES', price = 25, lvl = 25, subtext = "$25 LvL 25"},
                {label = "Electric Lantern", value = 'lantern_w', weapon = 'WEAPON_MELEE_LANTERN_ELECTRIC', price = 30, lvl = 25, subtext = "$30 LvL 25"},
                {label = "Tomahawk", value = 'tomahawk_w', weapon = 'WEAPON_THROWN_TOMAHAWK', price = 25, lvl = 30, subtext = "$25 LvL 30"}
            }
            OpenSub = true
        elseif category == 'ammo' then
            local options = {
                {label = 'Pistols', value = 'pistols'},
                {label = 'Long Guns', value = 'longgunsammo'},
                {label = 'Melee Weapons', value = 'handgunsammo'},
            }
            MenuData.Open('default', GetCurrentResourceName(), 'weaponshop_ammo', {
                title    = 'Ammo Shop',
                align    = 'top-left',
                elements = options,
            }, function(data2, menu2)
                local choice = data2.current.value
                local ammochoices = {}

                if choice == 'pistols' then
                    ammochoices = {
                        {label = "Revolver", value = 'revolver_ammo', price = 3, subtext = '$3'}, 
                        {label = "Pistol", value = 'pistol_ammo', price = 4, subtext = '$4'}
                    }
                elseif choice == 'longgunsammo' then
                    ammochoices = {
                        {label = "Repeator", value = 'repeator_ammo', price = 2, subtext = '$2'},
                        {label = "22 Rifle", value = '22_ammo', price = 2, subtext = '$2'},
                        {label = "Rifle", value = 'rifle_ammo', price = 3, subtext = '$3'},
                        {label = "Sniper Rifle", value = 'snipe_ammo', price = 4, subtext = '$4'},
                        {label = "Shotgun Shells", value = 'shotgun_ammo', price = 3, subtext = '$3'}
                    }
                elseif choice == 'handgunsammo' then
                    ammochoices = {
                        {label = "Arrows", value = 'arrows', price = 5, subtext = '$5'}, 
                        {label = "Throwing knives", value = 'knives', price = 5, subtext = '$5'}, 
                    }
                end

                MenuData.Open('default', GetCurrentResourceName(), 'weaponshop_'..category, {
                    title    = category..' Shop',
                    align    = 'top-left',
                    elements = ammochoices,
                }, function(data3, menu3)
                    local item = data3.current.value
                    local price = data3.current.price
                    TriggerServerEvent("redemrp_gunshop:buyammo", tonumber(price), item)
                end, function(data3, menu3)
                    menu3.close()
                end)
            end, function(data3, menu3)
                menu3.close()
            end) 
        end

        if OpenSub == true then
            OpenSub = false
            MenuData.Open('default', GetCurrentResourceName(), 'weaponshop_'..category, {
                title    = category..' Shop',
                align    = 'top-left',
                elements = elements2,
            }, function(data2, menu2)
                local weapon = data2.current.weapon
                local item = data2.current.value
                local price = data2.current.price
                local lvl = data2.current.lvl
                TriggerServerEvent("redemrp_gunshop:buygun", item, tonumber(price), weapon,  tonumber(lvl))
            end, function(data2, menu2)
                menu2.close()
            end) 
        end
    end, function(data, menu)
        menu.close()
    end) 
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
        desc = "Valider les changements"
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
            -- TriggerServerEvent("rdr_marechal:save", CompCache, horseid)
            OldCompCache = {}
            isInteracting = false

        end

    end, function(data, menu)
        menu.close()
        isInteracting = false
        -- for k, v in pairs(Config.LabelCart) do
        --     Citizen.InvokeNative(0x0D7FFA1B2F69ED82, horse, CompCache[k].hash, true, true, true)
        -- end
        -- Wait(100)
        -- for k, v in pairs(Config.LabelCart) do
        --     Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, OldCompCache[k].hash, true, true, true)
        -- end
        OldCompCache = {}
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

    -- for v, k in pairs(Config.MenuElementsW[menu_catagory].category) do
    --     if menu_catagory == "commun" then 
    --         if weapon_comp["shared_components"][Weapontype][k] ~= nil then
    --             category = weapon_comp["shared_components"][Weapontype][k]
    --         end
    --     elseif menu_catagory == "specialweapon" then 
    --         print (wepHash)
    --         if weapon_comp["model_specific_components"][wepHash][k] ~= nil then
    --             print 'meow'
    --             category = weapon_comp["model_specific_components"][wepHash][k]
    --         end
    --     end
    --     local options = {}
    --     for k, v in pairs(category) do
    --         table.insert(options, k)
    --     end
    --     table.insert(elements, {
    --         label = Config.LabelW[k] or v,
    --         value = 0,
    --         category = k,
    --         desc = "Modifier l'arme",
    --         type = "slider",
    --         min = 0,
    --         max = #category,
    --         change_type = "model",
    --         id = a,
    --         options = options
    --     })
        
    --     a = a + 1
    --     options = {}
    -- end

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
        weapon_component_model_hash = Citizen.InvokeNative(0x59DE03442B6C9598, model )
        Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, model, wepHash, true)
        -- CompCache[data.current.category] = weapon_component_model_hash
    else
        for _, comp in pairs(weapon_comp["shared_components"][Weapontype][data.current.category]) do
            Citizen.InvokeNative(0x19F70C4D80494FF8, ped, GetHashKey(comp), wepHash)
        end
        model = GetHashKey(weapon_comp["shared_components"][Weapontype][data.current.category][data.current.value])
        weapon_component_model_hash =  Citizen.InvokeNative(0x59DE03442B6C9598, model)
        Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, model, wepHash, true)
        -- CompCache[data.current.category] = weapon_component_model_hash
    end
end



RegisterNetEvent('rdr_marechal:OpenCustomMenu')
AddEventHandler('rdr_marechal:OpenCustomMenu', function(value, Components, horse, horseid, model)
    CompCache = Components
    if value == 1 then
        for k, v in pairs(comp_cart) do
            if CompCache[k] == nil then
                CompCache[k] = {}
                CompCache[k].hash = 0
            end
        end
        OldCompCache = deepcopy(CompCache)
        FreezeEntityPosition(horse, true)
        OpenCustomCart(horse, horseid, model)
        print (model)
    end
    if value == 2 then
        for k, v in pairs(comp_list) do
            if CompCache[k] == nil then
                CompCache[k] = {}
                CompCache[k].hash = 0
            end
        end
        OldCompCache = deepcopy(CompCache)
        FreezeEntityPosition(horse, true)
        OpenCustomMenu(horse, horseid)
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

--- AFFICHAGE STATS ARMES ----
-- function getWeaponStats(weaponHash)
--     local emptyStruct = {} -- Create an empty table

--     local charStruct = {} -- Create another empty table
--     Citizen.InvokeNative("0x886DFD3E185C8A89", 1, emptyStruct, GetHashKey("CHARACTER"), -1591664384, charStruct)
        
--     local unkStruct = {} -- Create another empty table
--     Citizen.InvokeNative("0x886DFD3E185C8A89", 1, charStruct, 923904168, -740156546, unkStruct)

--     local weaponStruct = {} -- Create another empty table
--     Citizen.InvokeNative("0x886DFD3E185C8A89", 1, unkStruct, weaponHash, -1591664384, weaponStruct)

--     return weaponStruct
-- end

-- function showWeaponStats()
--     local weapon = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
--     if weapon[1] then
--         local uiFlowBlock = RequestFlowBlock(GetHashKey("PM_FLOW_WEAPON_INSPECT"))

--         local uiContainer = DatabindingAddDataContainerFromPath("", "ItemInspection")
--         Citizen.InvokeNative("0x46DB71883EE9D5AF", uiContainer, "stats", getWeaponStats(weapon[1]), PlayerPedId())
--         DatabindingAddDataString(uiContainer, "tipText", GetLabelTextByHash(-54957657))
--         DatabindingAddDataHash(uiContainer, "itemLabel", weapon[1])
--         DatabindingAddDataBool(uiContainer, "Visible", true)

--         Citizen.InvokeNative("0x10A93C057B6BD944", uiFlowBlock)
--         Citizen.InvokeNative("0x3B7519720C9DCB45", uiFlowBlock, 0)
--         Citizen.InvokeNative("0x4C6F2C4B7A03A266", -813354801, uiFlowBlock)
        
--         Citizen.SetTimeout(function()
--             Citizen.InvokeNative("0x4EB122210A90E2D8", -813354801)
--         end, 5000)
--     end
-- end