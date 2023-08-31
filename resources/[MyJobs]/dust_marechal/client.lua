RedEM = exports["redem_roleplay"]:RedEM()

MenuData = {}
TriggerEvent("redemrp_menu_base:getData", function(call)
    MenuData = call
end)


------ PROMPT ------ 

local CustomPromptGroup = GetRandomIntInRange(0, 0xffffff)
local CustomPromptName = CreateVarString(10, "LITERAL_STRING", "Écurie")
local CustomPrompt
local CustomPromptShown = false
local IsInteracting = false
Citizen.CreateThread(function()
    local str = "Mettre à l'écurie"
    CustomPrompt = PromptRegisterBegin()
    PromptSetControlAction(CustomPrompt, 0x156F7119)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(CustomPrompt, str)
    PromptSetEnabled(CustomPrompt, true)
    PromptSetVisible(CustomPrompt, true)
    PromptSetHoldMode(CustomPrompt, false)
    PromptSetGroup(CustomPrompt, CustomPromptGroup)
    PromptRegisterEnd(CustomPrompt)
end)

----- Open Menu ----
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Customzone) do
            if #(playerpos - v ) < 7 and IsPedOnMount(PlayerPedId()) and not isInteracting then
                PromptSetActiveGroupThisFrame(CustomPromptGroup, CustomPromptName)
                if IsControlJustReleased(0, 0x156F7119) then
                    isInteracting = true
                    local horse = GetMount(PlayerPedId())
                    local horseid = Entity(horse).state.horseid
                    Wait(200)
                    TriggerServerEvent('rdr_marechal:loadcomp', 2, horseid, horse)
                end
            end
        end
    end
end)

function OpenCustomMenu(horse, horseid)
    MenuData.CloseAll()
    local elements = {}

    for v, k in pairs(Config.MenuElements) do

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
            OpenCategory(data.current.value)
        else
            menu.close()
            TriggerServerEvent("rdr_marechal:save", CompCache, horseid, CurrentPrice)
            OldCompCache = {}

        end

    end, function(data, menu)
        menu.close()
        OldCompCache = {}
        ---- RESET SKIN D'ORIGINE DU CHEVAL 
    end)
end

function OpenCategory(menu_catagory)
    MenuData.CloseAll()
    local elements = {}
    local a = 1
    for v, k in pairs(Config.MenuElements[menu_catagory].category) do
        print (v, k)
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
            label = Config.Label[k] or v,
            value = CompCache[k].model or 0,
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

        -- for i = 1, GetMaxTexturesForModel(k, CompCache[k].model or 1), 1 do
        --     table.insert(options, i.." Color")
        -- end
        -- table.insert(elements, {
        --     label = Config.Label[k] .. " Color" or v,
        --     value = CompCache[k].texture or 1,
        --     category = k,
        --     desc = "Change the color",
        --     type = "slider",
        --     min = 1,
        --     -- max = GetMaxTexturesForModel(k, CompCache[k].model or 1),
        --     change_type = "texture",
        --     id = a,
        --     options = options
        -- })

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
        OpenCustomMenu(horse)
    end, function(data, menu)
        MenuUpdateComp(data, menu, horse)
    end)
end

function MenuUpdateComp(data, menu, horse)

    if data.current.change_type == "model" then
        if CompCache[data.current.category].model ~= data.current.value then
            CompCache[data.current.category].texture = 1
            CompCache[data.current.category].model = data.current.value
            -- if data.current.value > 0 then
            --     local options = {}
            --     -- print(GetMaxTexturesForModel(data.current.category, data.current.value))
            --     -- if GetMaxTexturesForModel(data.current.category, data.current.value) > 1 then
            --     --     for i = 1, GetMaxTexturesForModel(data.current.category, data.current.value), 1 do
            --     --         table.insert(options, i .. " Color")
            --     --     end
            --     -- else
            --         table.insert(options, "None")

            --     -- end
            --     menu.setElement(data.current.id + 1, "options", options)
            --     -- menu.setElement(data.current.id + 1, "max",
            --     --     GetMaxTexturesForModel(data.current.category, data.current.value))
            --     menu.setElement(data.current.id + 1, "min", 1)
            --     menu.setElement(data.current.id + 1, "value", 1)
            --     menu.refresh()

            -- else
            --     menu.setElement(data.current.id + 1, "max", 0)
            --     menu.setElement(data.current.id + 1, "min", 0)
            --     menu.setElement(data.current.id + 1, "value", 0)
            --     menu.refresh()

            -- end
            Change(data.current.value, data.current.category, data.current.change_type, horse)
        end
    end
    -- if data.current.change_type == "texture" then
    --     print(CompCache[data.current.category].texture)
    --     if CompCache[data.current.category].texture ~= data.current.value then
    --         CompCache[data.current.category].texture = data.current.value
    --         Change(data.current.value, data.current.category, data.current.change_type, horse)
    --     end
    -- end

end


RegisterNetEvent('rdr_marechal:OpenCustomMenu')
AddEventHandler('rdr_marechal:OpenCustomMenu', function(ClothesComponents, horse)
    CompCache = ClothesComponents
    for k,v in pairs(comp_list) do
        if CompCache[k] == nil then
            CompCache[k] = {}
            CompCache[k].model = 0
            CompCache[k].texture = 0
        end
    end
    OldCompCache = deepcopy(CompCache)
    OpenCustomMenu(horse)
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

function Change(id, category, change_type, horse)
    if id < 1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, componentHash, true, true, true)
    end
end

RegisterNetEvent('rdr_marechal:ApplyComp')
AddEventHandler('rdr_marechal:ApplyComp', function(ClothesComponents, horse)
    Citizen.CreateThread(function()
        local _Target = Target
        local LoadingCheck = false
        if type(ClothesComponents) ~= "table" then
            return
        end
        if next(ClothesComponents) == nil then
            return
        end
        SetEntityAlpha(_Target, 0)
        CompCache = ClothesComponents
        for k, v in pairs(ClothesComponents) do
            if v ~= nil then
                local id = tonumber(v.model)
                if comp_list[k] ~= nil then
                    if comp_list[k][tonumber(v.model)] ~= nil then
                        if comp_list[k][tonumber(v.model)][tonumber(v.texture)] ~= nil then
                            Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, tonumber(
                                comp_list[k][tonumber(v.model)][tonumber(v.texture)].hash), true,
                                true, true)
                        end
                    end
                end
            end
        end
        SetEntityAlpha(_Target, 255)
    end)
end)



-- Citizen.CreateThread(function()
--     while true do
--         Wait(0)
--         local playerPed = PlayerPedId()
--         local coords = GetEntityCoords(playerPed)
--         for k, v in pairs(Config.Customzone) do
--             local dist = Vdist(coords, v)
--             if dist < 2 and IsPedOnMount(playerPed) then
--                 if dist < 20 then
--                     canwait = false
--                 end
--                 if not active then
--                     active = true
--                     target = k
--                 end
--                 if IsControlJustReleased(0, Config.OpenKey) then
--                     local horse = GetMount(PlayerPedId())
--                     local horseid = Entity(horse).state.horseid
--                     ---- freeze horse
--                     ---- demount
--                     TriggerServerEvent("rdr_marechal:loadcomp", 2, horseid, horse)
--                 end
--             end
--         end
--     end
-- end)