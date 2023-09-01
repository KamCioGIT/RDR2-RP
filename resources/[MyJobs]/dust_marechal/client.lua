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
        FreezeEntityPosition(horse, false)
        ---- RESET SKIN D'ORIGINE DU CHEVAL 
        for k, v in pairs(Config.Label) do
            Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, OldCompCache[k], true, true, true)
        end
        OldCompCache = {}
    end)
end

function OpenCategory(menu_catagory, horse, horseid)
    MenuData.CloseAll()
    local elements = {}
    local a = 1
    for v, k in pairs(Config.MenuElements[menu_catagory].category) do
        local category = comp_list[k]
        if CompCache[k] == nil then
            CompCache[k] = {}
            CompCache[k].hash = 0
        end
        local options = {}
        for k, v in pairs(category) do
            table.insert(options, k .." Style")
        end
        table.insert(elements, {
            label = Config.Label[k] or v,
            value = CompCache[k].hash or 0,
            category = k,
            desc = "Change component",
            type = "slider",
            min = 0,
            max = #category,
            change_type = "model",
            hop = 1,
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
        MenuUpdateComp(data, menu, horse)
    end)
end

function MenuUpdateComp(data, menu, horse)
    print (data.current.value,  comp_list[data.current.category][data.current.value].hash)
    NativeSetPedComponentEnabled(horse, comp_list[data.current.category][data.current.value].hash)
    for k, v in pairs(CompCache) do
        if k == data.current.category then
            CompCache[k].hash = comp_list[data.current.category][data.current.value].hash
        else
            CompCache[data.current.category].hash = comp_list[data.current.category][data.current.value].hash
        end
    end
    -- if CompCache[data.current.category].hash ~= comp_list[data.current.category][data.current.value].hash then
    --     CompCache[data.current.category].hash = comp_list[data.current.category][data.current.value].hash
    -- end
end

function Change(horse, componentHash)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, componentHash, true, true, true)
end
function NativeSetPedComponentEnabled(ped, component)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, component, true, true, true)
end





RegisterNetEvent('rdr_marechal:OpenCustomMenu')
AddEventHandler('rdr_marechal:OpenCustomMenu', function(Components, horse, horseid)
    CompCache = Components
    for k,v in pairs(comp_list) do
        if CompCache[k] == nil then
            CompCache[k] = {}
            CompCache[k].hash = 0
        end
    end
    OldCompCache = Components
    FreezeEntityPosition(horse, true)
    OpenCustomMenu(horse, horseid)
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



