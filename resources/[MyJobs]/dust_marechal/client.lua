RedEM = exports["redem_roleplay"]:RedEM()

MenuData = {}
TriggerEvent("redemrp_menu_base:getData", function(call)
    MenuData = call
end)


function OpenCustomMenu()
    MenuData.CloseAll()
    local elements = {}

    for v, k in pairsByKeys(Config.MenuElements) do

        table.insert(elements, {
            label = k.label or v,
            value = v,
            category = v,
            desc = "Change component"
        })
    end

    table.insert(elements, {
        label = Config.Label["save"] or "Save",
        value = "save",
        desc = "Save Clothes"
    })

    MenuData.Open('default', GetCurrentResourceName(), 'custommenu', {

        title = 'Cheval',

        subtext = "Changer l'équipement",

        align = 'top-left',

        elements = elements

    }, function(data, menu)
        if data.current.value ~= "save" then
            OpenCateogry(data.current.value)
        else
            destory()
            menu.close()
            local output = nil
            AddTextEntry('FMMC_MPM_NA', "Outfit Name:")
            DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "Name", "", "", "", 30)
            while (UpdateOnscreenKeyboard() == 0) do
                DisableAllControlActions(0)
                Citizen.Wait(0)
            end
            if (GetOnscreenKeyboardResult()) then
                output = GetOnscreenKeyboardResult()
            end
            saveOutfit = true
            TriggerServerEvent("rdr_clothes_store:Save", ClothesCache, output, CurrentPrice)
            OldClothesCache = {}

        end

    end, function(data, menu)
        menu.close()
        OldClothesCache = {}
        destory()
        TriggerServerEvent("RedEM:server:LoadSkin")
    end)
end

function OpenCateogry(menu_catagory)
    MenuData.CloseAll()
    local elements = {}
    local a = 1
    for v, k in pairsByKeys(Config.MenuElements[menu_catagory].category) do
        local category = comp_list[k]
        if CompCache[k] == nil then
            CompCache[k] = {}
            CompCache[k].model = 0
            CompCache[k].texture = 1
        end
        local options = {}
        for k, v in pairs(category) do
            table.insert(options, k .." Style")
        end
        table.insert(elements, {
            label = Config.Label[k].. " ($" .. Config.Price[k]..")" or v,
            value = CompsCache[k].model or 0,
            category = k,
            desc = "Change component",
            type = "slider",
            min = 0,
            max = #category,
            change_type = "model",
            id = a,
            options = options
        })
        a = a + 1
        options = {}

        for i = 1, GetMaxTexturesForModel(k, ClothesCache[k].model or 1), 1 do
            table.insert(options, i.." Color")
        end
        table.insert(elements, {
            label = Config.Label[k] .. " Color" or v,
            value = CompCache[k].texture or 1,
            category = k,
            desc = "Change the color",
            type = "slider",
            min = 1,
            max = GetMaxTexturesForModel(k, ClothesCache[k].model or 1),
            change_type = "texture",
            id = a,
            options = options
        })

        options = {}
        a = a + 1
    end
    MenuData.Open('default', GetCurrentResourceName(), 'custommenucategory', {

        title = 'Clothes',

        subtext = 'Options',

        align = 'top-left',

        elements = elements

    }, function(data, menu)

    end, function(data, menu)
        menu.close()
        OpenCustomMenu()
    end, function(data, menu)
        MenuUpdateComp(data, menu)
    end)
end

function MenuUpdateComp(data, menu)

    if data.current.change_type == "model" then
        if CompCache[data.current.category].model ~= data.current.value then
            CompCache[data.current.category].texture = 1
            CompCache[data.current.category].model = data.current.value
            if data.current.value > 0 then
                local options = {}
                -- print(GetMaxTexturesForModel(data.current.category, data.current.value))
                if GetMaxTexturesForModel(data.current.category, data.current.value) > 1 then
                    for i = 1, GetMaxTexturesForModel(data.current.category, data.current.value), 1 do
                        table.insert(options, i .. " Color")
                    end
                else
                    table.insert(options, "None")

                end
                menu.setElement(data.current.id + 1, "options", options)
                menu.setElement(data.current.id + 1, "max",
                    GetMaxTexturesForModel(data.current.category, data.current.value))
                menu.setElement(data.current.id + 1, "min", 1)
                menu.setElement(data.current.id + 1, "value", 1)
                menu.refresh()

            else
                menu.setElement(data.current.id + 1, "max", 0)
                menu.setElement(data.current.id + 1, "min", 0)
                menu.setElement(data.current.id + 1, "value", 0)
                menu.refresh()

            end
            if CurrentPrice ~= CalculatePrice() then
                CurrentPrice = CalculatePrice()
                local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING",
                    tostring(CurrentPrice .. "$"), Citizen.ResultAsLong())
                Citizen.InvokeNative(0xFA233F8FE190514C, str)
                Citizen.InvokeNative(0xE9990552DEC71600)
            end
            Change(data.current.value, data.current.category, data.current.change_type)
        end
    end
    if data.current.change_type == "texture" then
        print(CompCache[data.current.category].texture)
        if CompCache[data.current.category].texture ~= data.current.value then
            CompCache[data.current.category].texture = data.current.value
            Change(data.current.value, data.current.category, data.current.change_type)
        end
    end

end

function GetMaxTexturesForModel(category, model)
    -- print(model)
    -- print(category)
    if model == 0 then
        model = 1
    end
    return #comp_list[category][model]
end

RegisterNetEvent('rdr_marechal:OpenCustomMenu')
AddEventHandler('rdr_marechal:OpenCustomMenu', function(ClothesComponents)
    CompCache = ClothesComponents
    for k,v in pairs(comp_list) do
        if CompCache[k] == nil then
            CompCache[k] = {}
            CompCache[k].model = 0
            CompCache[k].texture = 0
        end
    end
    OldCompCache = deepcopy(CompCache)
    OpenCustomMenu()
end)

-- function Change(id, category, change_type)
--     if id < 1 then
--         Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), GetHashKey(category), 0)
--         NativeUpdatePedVariation(PlayerPedId())
--         if category == "pants" or category == "boots" then
--             NativeSetPedComponentEnabled(PlayerPedId(), exports.rdr_creator:GetBodyCurrentComponentHash("BODIES_LOWER"),
--                 false, true, true)
--         end
--         if category == "shirts_full" then
--             NativeSetPedComponentEnabled(PlayerPedId(), exports.rdr_creator:GetBodyCurrentComponentHash("BODIES_UPPER"),
--                 false, true, true)
--         end
--     else
--         if change_type == "model" then
--             NativeSetPedComponentEnabled(PlayerPedId(), clothes_list["male"][category][id][1].hash, false, true,
--                 true)
--         else
--             NativeSetPedComponentEnabled(PlayerPedId(),
--                 clothes_list["male"][category][ClothesCache[category].model][id].hash, false, true, true)
--         end
--     end
-- end

RegisterNetEvent('rdr_marechal:ApplyComp')
AddEventHandler('rdr_marechal:ApplyComp', function(ClothesComponents, Target)
    Citizen.CreateThread(function()
        local _Target = Target or PlayerPedId()
        local LoadingCheck = false
        if type(ClothesComponents) ~= "table" then
            return
        end
        if next(ClothesComponents) == nil then
            return
        end
        SetEntityAlpha(_Target, 0)
        ClothesCache = ClothesComponents
        for k, v in pairs(ClothesComponents) do
            if v ~= nil then
                local id = tonumber(v.model)
                if id >= 1 then
                    if IsPedMale(_Target) then
                        if clothes_list["male"][k] ~= nil then
                            if clothes_list["male"][k][tonumber(v.model)] ~= nil then
                                if clothes_list["male"][k][tonumber(v.model)][tonumber(v.texture)] ~= nil then
                                    NativeSetPedComponentEnabled(_Target, tonumber(
                                        clothes_list["male"][k][tonumber(v.model)][tonumber(v.texture)].hash), false,
                                        true, true)
                                end
                            end
                        end
                    else
                        if clothes_list["female"][k] ~= nil then
                            if clothes_list["female"][k][tonumber(v.model)] ~= nil then
                                if clothes_list["female"][k][tonumber(v.model)][tonumber(v.texture)] ~= nil then
                                    NativeSetPedComponentEnabled(_Target, tonumber(
                                        clothes_list["female"][k][tonumber(v.model)][tonumber(v.texture)].hash), false,
                                        true, true)
                                end
                            end

                        end
                    end
                end
            end
        end
        SetEntityAlpha(_Target, 255)
    end)
end)


Citizen.CreateThread(function()
    for k, v in pairs(Config.Zones) do
        local blip = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blip, Config.BlipSprite, 1)
        SetBlipScale(blip, Config.BlipScale)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.BlipName)
    end
    for k, v in pairs(Config.Cloakroom) do
        local blip = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blip, Config.BlipSpriteCloakRoom, 1)
        SetBlipScale(blip, Config.BlipScale)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.BlipNameCloakRoom)
    end
end)
