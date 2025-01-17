RedEM = exports["redem_roleplay"]:RedEM()

showOnPed = false

--- prompt achat

isInteracting = false;


Citizen.CreateThread(function()
    while true do
        Wait(Config.RefreshRumors)
        currentrumors = nil
        TriggerServerEvent("dust_rumors:server:askRumor")
    end
end)
-- function showOnPed(entity)
--     print "'oouaizs "
--     if currentrumors ~= nil and #currentrumors > 0 then
--         randomrumor = math.random(1, #currentrumors)
--         local timer = GetGameTimer() + Config.RefreshRumors
--         print (tostring(currentrumors[randomrumor]))
--         while GetGameTimer() < timer do
--             Wait(0)
--             local entityPos = GetEntityCoords(entity) 
--             boneCoord = GetWorldPositionOfEntityBone(entity, 31086)
--             coords = entityPos + boneCoord
--             DrawText3D(coords.x, coords.y, coords.z + 1, tostring(currentrumors[randomrumor]))
--         end
--     end
-- end


RegisterNetEvent("dust_rumors:client:getRumor", function(rumorsTable)
    currentrumors = rumorsTable
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 7.0, itemSet, 1, Citizen.ResultAsInteger())
      
        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet

                local boolA = Citizen.InvokeNative(0x9A100F1CF4546629, entity)
                if IsEntityAPed(entity) and not IsPedAPlayer(entity) and not Citizen.InvokeNative(0x9A100F1CF4546629, entity) then
                    if PlayerPedId() ~= entity then 
                        if IsEntityDead(entity) == false then
                            if boolA ~= nil and boolA == false then
                                if currentrumors ~= nil and #currentrumors > 0 then
                                    TriggerEvent("rumors:DrawText3D", entity)
                                end
                            end
                        end
                    end
                end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)



local isEventRunning = {}
local entityRandomRumors = {}
RegisterNetEvent("rumors:DrawText3D",function(ent)
    if not isEventRunning[ent] then
        isEventRunning[ent] = true
        local timer = GetGameTimer() + Config.RefreshRumors
        if not entityRandomRumors[ent] then
            entityRandomRumors[ent] = currentrumors[math.random(1, #currentrumors)]
        end
        local chance = math.random(0, 100)
        while GetGameTimer() < timer do
            Wait(0)
            if chance >= 50 then
                local playerPosition = GetEntityCoords(PlayerPedId())
                local entityPos = GetEntityCoords(ent) 
                boneCoord = GetWorldPositionOfEntityBone(ent, 31086)
                coords = entityPos + boneCoord
                if #(playerPosition - entityPos) < 10 then 
                    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z + 1)
                    SetTextScale(0.25, 0.25)
                    SetTextFontForCurrentCommand(25)
                    SetTextColor(255, 255, 255, 200)
                    local str = CreateVarString(10, "LITERAL_STRING", tostring(entityRandomRumors[ent]), Citizen.ResultAsLong())
                    SetTextCentre(1)
                    DisplayText(str, _x, _y)
                    local factor = (string.len(tostring(entityRandomRumors[ent]))) / 250
                    DrawSprite("honor_display", "honor_bg", _x, _y + 0.0125, 0.015 + factor, 0.03, 0.1, 0, 0, 0, 100, 0)
                end
            end
        end
        isEventRunning[ent] = false
        entityRandomRumors[ent] = nil
    end
end)


-- Ecrire Nv Rumeur

local rumorPrompt = UipromptGroup:new("Colporteur")
Uiprompt:new(0x760A9C6F, "Lancer une Rumeur", rumorPrompt)
rumorPrompt:setActive(false)

Citizen.CreateThread(function()
    for k,v in pairs(Config.ShareRumorSpot) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, -1043855483, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Colporteur")
	end
    while true do
        Citizen.Wait(0)
        local playerPosition = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.ShareRumorSpot) do 
            if #(playerPosition - v) < 2 and not isInteracting then 
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustReleased(0, 0x760A9C6F) then
                    isInteracting = true
                    FreezeEntityPosition(PlayerPedId(), true)
                    TrySendRumor()
                end
            end
        end
    end
end)

function TrySendRumor()
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local elements = {}

        table.insert(elements, {
            label = "Lancer une rumeur", 
            value = 'TrySendRumor', 
            desc = "Faites propager vos ragots pour $" .. Config.RumorPrice
        })

        table.insert(elements, {
            label = "S'en aller", 
            value = 'Exit', 
            desc = "Finalement, je préfère faire demi-tour."
        })

        MenuData.Open('default', GetCurrentResourceName(), 'rumor', {
            title = "Passeur de rumeur",
            subtext = "Qu'avez vous de si important à transmettre ?",
            align = 'top-right',
            elements = elements,
        },
    
        function(data, menu)
            Wait(5)
            if data.current.value == 'TrySendRumor' then 
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    AddTextEntry("FMMC_KEY_TIP8", "Votre Rumeur")
                    DisplayOnscreenKeyboard(0, "FMMC_KEY_TIP8", "", "", "", "", "", 100) -- KTEXTTYPE_ALPHABET
                    while (UpdateOnscreenKeyboard() == 0) do
                        DisableAllControlActions(0)
                        Citizen.Wait(0)
                    end
                    if (GetOnscreenKeyboardResult()) then
                        local rumeurTextString = GetOnscreenKeyboardResult()
                        TriggerServerEvent("dust_rumors:server:SendRumor", rumeurTextString)
                        isInteracting = false
                        FreezeEntityPosition(PlayerPedId(), false)
                    else
                        menu.close()
                        isInteracting = false
                        FreezeEntityPosition(PlayerPedId(), false)
                    end
                end)
            else 
                MenuData.CloseAll()
                menu.close()
                isInteracting = false
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
            FreezeEntityPosition(PlayerPedId(), false)
        end)
    end)
end
