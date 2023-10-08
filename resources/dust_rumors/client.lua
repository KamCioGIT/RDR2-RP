RedEM = exports["redem_roleplay"]:RedEM()

showOnPed = false

--- prompt achat
local rumorPrompt = UipromptGroup:new("ShareRumor")
Uiprompt:new(0x760A9C6F, "Lancer une Rumeur", rumorPrompt)
rumorPrompt:setActive(false)

isInteracting = false;

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         local itemSet = CreateItemset(true)
--         local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 7.0, itemSet, 1, Citizen.ResultAsInteger())
      
--         if size > 0 then
--             for index = 0, size - 1 do
--                 local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
--                 local model = GetEntityModel(entity)

--                 local boolA = Citizen.InvokeNative(0x9A100F1CF4546629, entity)
--                 if boolA ~= nil then
--                     print(boolA)
--                 end

--                 if PlayerPedId() ~= entity then 
--                     if IsPedAPlayer(entity) ~= true then
--                         if IsEntityDead(entity) == false then
--                             if 
--                                 -- Pas d'animaux
--                                 showOnPed = true
--                             end
--                         end
--                     end
--                 end

--                 if showOnPed then
--                     local entityPos = GetEntityCoords(entity) 
--                     boneCoord = GetWorldPositionOfEntityBone(entity, 31086)
--                     coords = entityPos + boneCoord
--                     DrawText3D(coords.x, coords.y, coords.z + 1, "MONSTRE")
--                 end

--                 showOnPed = false
--             end
--         end

--         if IsItemsetValid(itemSet) then
--             DestroyItemset(itemSet)
--         end
--     end
-- end)

-- Ecrire Nv Rumeur
Citizen.CreateThread(function()
    local price = Config.RumorPrice
    print(price)
    while true do
        Citizen.Wait(0)
        local playerPosition = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.ShareRumorSpot) do 
            if #(playerPosition - v) < 2 and not isInteracting then 
                rumorPrompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x760A9C6F) then
                    isInteracting = true
                    FreezeEntityPosition(PlayerPedId(), true)
                    TrySendRumor()
                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str, _x, _y)
    local factor = (string.len(text)) / 150
    DrawSprite("generic_textures", "selection_box_bg_1d", _x, _y + 0.0125, 0.015 + factor, 0.03, 0.1, 100, 1, 1, 190, 0)
end

function TrySendRumor()
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()

        local elements = {}

        table.insert(elements, {
            label = "Lancer une rumeur", 
            value = 'TrySendRumor', 
            desc = "Dites nous vos ragots et nous nous occuperons de les faires circuler. Mais attention, ce n'est pas gratuit. Price " .. Config.RumorPrice
        })

        table.insert(elements, {
            label = "S'en aller", 
            value = 'Exit', 
            desc = "Finalement, je préfère faire demi-tour."
        })

        MenuData.Open('default', GetCurrentResourceName(), 'rumor', {
            title = "Passeur d'information",
            subtext = "Qu'avez vous de si important à nous dire ?",
            align = 'top-right',
            elements = elements,
        },
    
        function(data, menu)
            Wait(5)
            if data.current.value == 'TrySendRumor' then 
                TriggerEvent("redemrp_menu_base:getData", function(MenuData)
                    MenuData.CloseAll()
                    AddTextEntry("FMMC_MPM_TYP86", "Votre Rumeur / Limite de 250 caractères")
                    DisplayOnscreenKeyboard(4, "FMMC_MPM_TYP86", "", "", "", "", "", 250) -- KTEXTTYPE_ALPHABET
                    while (UpdateOnscreenKeyboard() == 0) do
                        DisableAllControlActions(0)
                        Citizen.Wait(0)
                    end
                    if (GetOnscreenKeyboardResult()) then
                        local rumeurTextString = GetOnscreenKeyboardResult()
                        print(rumeurTextString)
                        print(PlayerPedId().name)
                        TriggerServerEvent("dust_rumors:server:SendRumor", PlayerPedId().name, rumeurTextString)
                        isInteracting = false
                    else
                        menu.close()
                        isInteracting = false
                    end
                end)
            else 
                MenuData.CloseAll()
                menu.close()
                isInteracting = false
            end
        end,

        function(data, menu)
            menu.close()
            isInteracting = false
            FreezeEntityPosition(PlayerPedId(), false)
        end)
    end)
end

RegisterNetEvent("dust_rumors:ReceiveRumor")
AddEventHandler("dust_rumors:ReceiveRumor", function(rumorText)

end)
