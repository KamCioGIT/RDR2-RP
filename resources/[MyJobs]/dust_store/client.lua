RedEM = exports["redem_roleplay"]:RedEM()


Citizen.CreateThread(function() 
	while true do
		local player = PlayerPedId()
		local pos = GetEntityCoords(player)
		local bellrun = false
		for component, data in pairs(Config.Trapdoor) do
			if DoesObjectOfTypeExistAtCoords(pos, 40.0, GetHashKey(data.doorid)) then
				data.obj = GetClosestObjectOfType(pos, 40.0, GetHashKey(data.doorid), false, false, false)
				DeleteEntity(data.obj)
				if not DoesObjectOfTypeExistAtCoords(pos, 40.0, GetHashKey("p_trapdoor02x")) then
					data.prop = CreateObject("p_trapdoor02x", data.objCoords, false, false, true)
					SetEntityRotation(data.prop, data.objPitchclose, 0, true)
				end
				if IsControlJustReleased(0, 0x760A9C6F) then
					if data.trapopen == true then
						SetEntityRotation(data.prop, data.objPitchclose, 0, true)
						data.trapopen = true
					else
						SetEntityRotation(data.prop, data.objPitchopen, 0, true)
						data.trapopen = true
					end
				end
			end
			if data.prop then
				if IsControlJustReleased(0, 0x760A9C6F) then
					if data.trapopen == true then
						SetEntityRotation(data.prop, data.objPitchclose, 0, true)
						data.trapopen = false
					else
						SetEntityRotation(data.prop, data.objPitchopen, 0, true)
						data.trapopen = true
					end
				end
			end
		end
		Citizen.Wait(10)
	end
end)

local isInteracting = false


local maxCraftAmountstore = 0

local importprompt = UipromptGroup:new("Fournisseur")
Uiprompt:new(0x760A9C6F, "Acheter", importprompt)
importprompt:setActive(false)

local craftprompt = UipromptGroup:new("Atelier")
Uiprompt:new(0x760A9C6F, "Fabriquer", craftprompt)
craftprompt:setActive(false)


local getjob = false
local getgrade = 0
RegisterNetEvent("dust_job:store")
AddEventHandler("dust_job:store", function(job, grade)
    for k, v in pairs(Config.Jobs) do
        if job == v then
            getjob = true
            getgrade = grade
            StartMission()
        end
    end
end)


RegisterNetEvent("store:OpenBossMenu", function()
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
            TriggerServerEvent("store:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("store:SelectCraftingAmount", data.current.value, MenuData, menu)
            --
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("store:CraftingAction")
AddEventHandler("store:CraftingAction", function()
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


function StartMission()
    Citizen.CreateThread(function()
        for k,v in pairs(Config.ImportPoint) do
            local blips = N_0x554d9d53f696d002(1664425300, v)
            SetBlipSprite(blips, 1838354131, 1)
            SetBlipScale(blips, 1.0)
            Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Fournisseur")
        end
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())
            for k, v in ipairs(Config.Atelier) do
                if #(playerPos - v) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerEvent("store:OpenBossMenu")
                    end
                end
            end
            for k, v in ipairs(Config.ImportPoint) do
                if #(playerPos - v) < 10.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                    TriggerEvent('dust_presskey', "Appuyez sur G")
                    if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                        TriggerEvent("store:OpenImportMenu")
                    end
                end
            end
        end
    end)
end

RegisterNetEvent("store:OpenImportMenu", function()
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


        for k, v in pairs(Config.Import) do
            table.insert(elements, {label = v.label.." $"..v.price, value = k, price = v.price})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Marché",
            subtext = "Acheter",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            TriggerServerEvent("store:buypain", data.current.value, data.current.price)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)


AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    PromptDelete(CraftMenuPrompt)
end)

RegisterNetEvent("store:SelectCraftingAmount")
AddEventHandler("store:SelectCraftingAmount", function(dataType, menuData, menu)
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
        max = maxCraftAmountstore 
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
            TriggerServerEvent("store:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("store:client:SetMaxAmount", function(value)
    print (value)
    maxCraftAmountstore = value
end)



---- buy pain

local marketprompt = UipromptGroup:new("Marché")
Uiprompt:new(0x760A9C6F, "Acheter", marketprompt)
marketprompt:setActive(false)

Citizen.CreateThread(function()
    for k,v in pairs(Config.BuyPain) do
        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v)
        SetBlipSprite(blip, 819673798)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, string.format("Marché"))
    end
    while true do
        Wait(2)
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.BuyPain) do
            if #(playerPos - v) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - v) < Config.DistanceToInteract and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    BuyPain()
                    isInteracting = true
                end
            end
        end
    end
end)


function BuyPain()
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


        for k, v in pairs(Config.Market) do
            table.insert(elements, {label = v.label, value = k, price = v.price, desc = "$"..v.price})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'market', {
            title = "Marché",
            subtext = "Acheter",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            TriggerServerEvent("store:buypain", data.current.value, data.current.price)
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end