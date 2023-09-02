RedEM = exports["redem_roleplay"]:RedEM()

MenuData = {}
TriggerEvent("redemrp_menu_base:getData", function(call)
    MenuData = call
end)


------ PROMPT ------ 

local customprompt = UipromptGroup:new("Maréchal Ferrant")
Uiprompt:new(0x156F7119, "Changer l'équipemement", customprompt):setHoldMode(true)
customprompt:setActive(false)


----- Open Menu ----
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Customzone) do
            if #(playerpos - v ) < 7 and IsPedOnMount(PlayerPedId()) and not isInteracting then
                customprompt:setActiveThisFrame(true)
                if customprompt:hasHoldModeJustCompleted()then
                    isInteracting = true
                    local horse = GetMount(PlayerPedId())
                    local horseid = Entity(horse).state.horseid
                    Wait(200)
                    TriggerServerEvent('rdr_marechal:loadcomp', 2, horseid, horse)
                end
            end
        end
        for k, v in pairs(Config.Customcart) do
            if #(playerpos - v ) < 7 and IsPedInAnyVehicle(PlayerPedId(), 0) then
                customprompt:setActiveThisFrame(true)
                if customprompt:hasHoldModeJustCompleted()then
                    isInteracting = true
                    local cart = GetVehiclePedIsIn(PlayerPedId(), 0)
                    local cartid = Entity(cart).state.horseid
                    Wait(200)
                    TriggerServerEvent('rdr_marechal:loadcomp', 1, cartid, cart)
                end
            end
        end
    end
end)

function OpenCustomMenu(horse, horseid)
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
                    FreezeEntityPosition(horse, false)
                end)
                return
            end
        end
    end)

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
            OpenCategory(data.current.value, horse, horseid)
        else
            menu.close()
            TriggerServerEvent("rdr_marechal:save", CompCache, horseid)
            OldCompCache = {}
            isInteracting = false
            FreezeEntityPosition(horse, false)

        end

    end, function(data, menu)
        menu.close()
        isInteracting = false
        for k, v in pairs(Config.Label) do
            Citizen.InvokeNative(0x0D7FFA1B2F69ED82, horse, CompCache[k].hash, true, true, true)
        end
        Wait(100)
        for k, v in pairs(Config.Label) do
            Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, OldCompCache[k].hash, true, true, true)
        end
        FreezeEntityPosition(horse, false)
        OldCompCache = {}
    end)
end

function OpenCategory(menu_catagory, horse, horseid)
    MenuData.CloseAll()
    local elements = {}
    local a = 1
    for v, k in pairs(Config.MenuElements[menu_catagory].category) do
        local category = comp_list[k]
        local options = {}
        for k, v in pairs(category) do
            table.insert(options, k .." Style")
        end
        table.insert(elements, {
            label = Config.Label[k] or v,
            value = 0,
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
        OpenCustomMenu(horse, horseid)
    end, function(data, menu)
        if data.current.value ~= 0 then 
            MenuUpdateComp(data, menu, horse)
        end
    end)
end

function OpenCustomCart(horse, horseid, model)
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
                    FreezeEntityPosition(horse, false)
                end)
                return
            end
        end
    end)

    local elements = {}

    for v, k in pairs(Config.MenuCart) do

        table.insert(elements, {
            label = k.label or v,
            value = v,
            category = v,
            desc = "Change component"
        })
    end

    table.insert(elements, {
        label = Config.LabelCart["save"] or "Save",
        value = "save",
        desc = "Save Clothes"
    })

    MenuData.Open('default', GetCurrentResourceName(), 'customcart', {

        title = 'Cheval',

        subtext = "Changer l'équipement",

        align = 'top-left',

        elements = elements

    }, function(data, menu)
        if data.current.value ~= "save" then
            OpenCategoryCart(data.current.value, horse, horseid, model)
        else
            menu.close()
            TriggerServerEvent("rdr_marechal:save", CompCache, horseid)
            OldCompCache = {}
            isInteracting = false
            FreezeEntityPosition(horse, false)

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
        FreezeEntityPosition(horse, false)
        OldCompCache = {}
    end)
end

function OpenCategoryCart(menu_catagory, horse, horseid, model)
    MenuData.CloseAll()
    local elements = {}
    local a = 1
    print (model)
    for v, k in pairs(Config.MenuCart[menu_catagory].category) do
        local category = comp_cart[k]
        local options = {}
        for k, v in pairs(category) do
            table.insert(options, k .." Style")
        end
        table.insert(elements, {
            label = Config.LabelCart[k] or v,
            value = 0,
            category = k,
            desc = "Change component",
            type = "slider",
            min = 0,
            max = #category,
            change_type = "model",
            id = a,
            options = options
        })
        table.insert(elements, {
            label = "Props",
            value = comp_cart["propsets"][model],
            category = "propsets",
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
    MenuData.Open('default', GetCurrentResourceName(), 'customcartcategory', {

        title = 'Clothes',

        subtext = 'Options',

        align = 'top-left',

        elements = elements

    }, function(data, menu)

    end, function(data, menu)
        menu.close()
        OpenCustomCart(horse, horseid, model)
    end, function(data, menu)
        if data.current.value ~= 0 then 
            MenuUpdateCart(data, menu, horse)
        end
    end)
end

function MenuUpdateCart(data, menu, horse)
    if data.current.category == "tints" then
        Citizen.InvokeNative(0x8268B098F6FCA4E2, horse, comp_cart[data.current.category][data.current.value].hash)
        if CompCache[data.current.category].hash ~= comp_cart[data.current.category][data.current.value].hash then
            CompCache[data.current.category].hash = comp_cart[data.current.category][data.current.value].hash
        end
    elseif data.current.category == "propsets" then

        if CompCache[data.current.category].hash ~= comp_cart[data.current.category][data.current.value].hash then
            CompCache[data.current.category].hash = comp_cart[data.current.category][data.current.value].hash
        end
    elseif data.current.category == "extras" then
        Citizen.InvokeNative(0xBB6F89150BC9D16B, horse, comp_cart[data.current.category][data.current.value].hash, 0)
        if CompCache[data.current.category].hash ~= comp_cart[data.current.category][data.current.value].hash then
            CompCache[data.current.category].hash = comp_cart[data.current.category][data.current.value].hash
        end
    elseif data.current.category == "liveries" then
        Citizen.InvokeNative(0xF89D82A0582E46ED, horse, comp_cart[data.current.category][data.current.value].hash)
        if CompCache[data.current.category].hash ~= comp_cart[data.current.category][data.current.value].hash then
            CompCache[data.current.category].hash = comp_cart[data.current.category][data.current.value].hash
        end
    end 
    
end

function MenuUpdateComp(data, menu, horse)
    print (data.current.value,  comp_list[data.current.category][data.current.value].hash)
    NativeSetPedComponentEnabled(horse, comp_list[data.current.category][data.current.value].hash)
    if CompCache[data.current.category].hash ~= comp_list[data.current.category][data.current.value].hash then
        CompCache[data.current.category].hash = comp_list[data.current.category][data.current.value].hash
    end
end

function Change(horse, componentHash)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, componentHash, true, true, true)
end
function NativeSetPedComponentEnabled(ped, component)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, component, true, true, true)
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




