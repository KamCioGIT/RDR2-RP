RedEM = exports["redem_roleplay"]:RedEM()

local banks
local showing, playerLoaded = false, false
InBank = false
blips = {}


-- RegisterNetEvent('qbr-banking:client:syncBanks')
-- AddEventHandler('qbr-banking:client:syncBanks', function(data)
--     banks = data
--     if showing then
--         showing = false
--     end
-- end)

function openAccountScreen(type)
    if type == "savings" then
        RedEM.TriggerCallback('qbr-banking:getBankingInformation', function(banking)
            if banking ~= nil then
                InBank = true
                SetNuiFocus(true, true)
                SendNUIMessage({
                    status = "openbank",
                    information = banking
                })

                TriggerEvent("debug", 'Banking: Open UI', 2000, 0, 'hud_textures', 'check')
            else
                InBank = true
                SetNuiFocus(true, true)
                SendNUIMessage({
                    status = "openbank",
                    information = {
                        ['name'] = 'Inconnu(e)',
                        ['bankbalance'] = "Vous n'avez pas de compte",
                        ['cash'] = "Vous n'avez pas de compte",
                        ['accountinfo'] = "000000",
                    }

                })
            end
        end)
        TriggerServerEvent('banking:acctype', type)
    elseif type == "business" then
        print'access'
        TriggerServerEvent("dust_banking:checkgrade")
    end
end


RegisterNetEvent("dust_banking:getgrade", function()
    RedEM.TriggerCallback('qbr-banking:getBusinessInformation', function(banking)
        if banking ~= nil then
            InBank = true
            SetNuiFocus(true, true)
            SendNUIMessage({
                status = "openbank",
                information = banking
            })

            TriggerEvent("debug", 'Banking: Open UI', 2000, 0, 'hud_textures', 'check')
        else
            InBank = true
            SetNuiFocus(true, true)
            SendNUIMessage({
                status = "openbank",
                information = {
                    ['name'] = 'Inconnu(e)',
                    ['bankbalance'] = "Vous n'avez pas de compte",
                    ['cash'] = "Vous n'avez pas de compte",
                    ['accountinfo'] = "000000",
                }

            })
        end
    end)
    TriggerServerEvent('banking:acctype', "business")
end)

RegisterNetEvent('qbr-banking:openBankScreen')
AddEventHandler('qbr-banking:openBankScreen', function(type)
    openAccountScreen(type)
end)


local bankprompt = UipromptGroup:new("Banque")
Uiprompt:new(0x6319DB71, "Compte personnel", bankprompt)
Uiprompt:new(0x05CA7C52, "Compte d'entreprise", bankprompt)
bankprompt:setActive(false)

Citizen.CreateThread(function()
    for banks, v in pairs(Config.BankLocations) do
        if v.showblip == true then
            local StoreBlip = N_0x554d9d53f696d002(1664425300, v.coords)
            SetBlipSprite(StoreBlip, -2128054417, 52)
            SetBlipScale(StoreBlip, 0.2)
        end
    end
    while true do
        Wait(0)
        for banks, v in pairs(Config.BankLocations) do
            -- exports['qbr-core']:createPrompt(v.name, v.coords, 0xF3830D8E, 'Open ' .. v.name, {
            --     type = 'client',
            --     event = 'qbr-banking:openBankScreen',
            --     args = { false, true, false },
            -- })
            local playerpos = GetEntityCoords(PlayerPedId())
            if #(playerpos - v.coords ) < 2.0 then
                bankprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x6319DB71) then
                    TriggerEvent("qbr-banking:openBankScreen", "savings")
                end
                if IsControlJustReleased(0, 0x05CA7C52) then
                    TriggerEvent("qbr-banking:openBankScreen", "business")
                end
            end 
        end
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.BankDoors) do
        --for v, door in pairs(k) do
        Citizen.InvokeNative(0xD99229FE93B46286,v,1,1,0,0,0,0)
        Citizen.InvokeNative(0x6BAB9442830C7F53,v,0)
    end
end)


RegisterNetEvent('qbr-banking:transferError')
AddEventHandler('qbr-banking:transferError', function(msg)
    SendNUIMessage({
        status = "transferError",
        error = msg
    })
end)

RegisterNetEvent('qbr-banking:successAlert')
AddEventHandler('qbr-banking:successAlert', function(msg)
    SendNUIMessage({
        status = "successMessage",
        message = msg
    })
end)
