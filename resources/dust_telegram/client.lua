
local prompts = GetRandomIntInRange(0, 0xffffff)

function TogglePost(name)
    TriggerServerEvent('dust_telegram:check_inbox')
    Wait(100)
    InMenu = true
    SetNuiFocus(true, true)
    SendNUIMessage({ type = 'openGeneral', postname = name })
end


Citizen.CreateThread(function()
    if Config.postoffice then
        for k, v in pairs(Config.postoffice) do
            local blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, v.coords)
            SetBlipSprite(blip, v.blip, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Lafayette Wire Express")
        end
    end
end)

local postPrompt = UipromptGroup:new("Lafayette Express Wire")
Uiprompt:new(0x760A9C6F, "Consulter ses télégrammes", postPrompt)
postPrompt:setActive(false)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local pcoords = GetEntityCoords(PlayerPedId())
        for k, v in ipairs(Config.postoffice) do
            if Vdist(pcoords, v.coords) < 1.5 then
                postPrompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x760A9C6F) then
                    TogglePost(v.name)
                end
            end
        end
    end
end)

function GetPlayers()
	local players = {}

	for _, player in ipairs(GetActivePlayers()) do
		if NetworkIsPlayerActive(player) then
			table.insert(players, player)
		end
	end

	return players
end


RegisterNUICallback('getview', function(data)
    InMenu = false
    SetNuiFocus(false, false)
    TriggerServerEvent('dust_telegram:getTelegram', tonumber(data.id))
    TriggerServerEvent("dust_telegram:DeleteTelegram", tonumber(data.id))
end)

RegisterNUICallback('sendTelegram', function(data)
    TriggerServerEvent('dust_telegram:SendTelegram', data)
end)

RegisterNUICallback('delete', function(data)
end)

RegisterNetEvent('messageData')
AddEventHandler('messageData', function(tele)
    TriggerEvent("redemrp_inventory:closeinv")
    InMenu = true
    SetNuiFocus(true, true)
    SendNUIMessage({ type = 'view', telegram = tele })
end)

RegisterNetEvent('dust_telegram:inboxlist')
AddEventHandler('dust_telegram:inboxlist', function(data)
    SendNUIMessage({ type = 'inboxlist', response = data })
end)

RegisterNUICallback('NUIFocusOff', function()
    InMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({ type = 'closeAll' })

end)







