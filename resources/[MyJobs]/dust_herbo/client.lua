RedEM = exports["redem_roleplay"]:RedEM()

local ressourcePointIndexForMining = nil

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


local isInteracting = false


local maxCraftAmountherbo = 0


local getjob = false
local getgrade = 0
RegisterNetEvent("dust_job:herbo")
AddEventHandler("dust_job:herbo", function(job, grade)

    for k, v in pairs(Config.Jobs) do

        if job == v then
            getjob = true
            getgrade = grade
            StartMission()
        end
    end
end)


RegisterNetEvent("herbo:OpenBossMenu", function(menutype)
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
            if v.type == menutype then
                table.insert(elements, {label = v.label, value = k, descriptionimages = v.descriptionimages})
            end
        end

        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Atelier",
            subtext = "Fabriquer",
            align = 'top-right',
            elements = elements,
        },

        function(data, menu)
            MenuData.CloseAll()
            TriggerServerEvent("herbo:MaxRessourcesAmount", data.current.value)
            Wait(150)
            TriggerEvent("herbo:SelectCraftingAmount", data.current.value, MenuData, menu)
            --
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
end)

RegisterNetEvent("herbo:CraftingAction")
AddEventHandler("herbo:CraftingAction", function()
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

RegisterNetEvent("herbo:SelectCraftingAmount")
AddEventHandler("herbo:SelectCraftingAmount", function(dataType, menuData, menu)
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
        max = maxCraftAmountherbo 
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
            TriggerServerEvent("herbo:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("herbo:client:SetMaxAmount", function(value)
    maxCraftAmountherbo = value
end)




function StartMission()
    Citizen.CreateThread(function()
        while true do
            if getjob then
                Wait(2)
                local playerPos = GetEntityCoords(PlayerPedId())


                for k, pos in pairs(Config.Atelier) do
                    if #(playerPos - pos) < 10.0 then
                        Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, pos, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                    end
                    if #(playerPos - pos) < Config.DistanceToInteract and not isInteracting then
                        TriggerEvent('dust_presskey', "Appuyez sur G")
                        if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                            TriggerEvent("herbo:OpenBossMenu", "herboetabli")
                        end
                    end
                end
            end
        end
    end)
end



Citizen.CreateThread(function()
    for k,v in pairs(Config.Relais) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, -675651933, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Maison d'herboriste")
	end
end)



