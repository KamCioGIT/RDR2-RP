-- Script pour afficher les coordonnées du joueur en temps réel et en continu
-- Framework RedEM:RP
ShowNotificationTicker = function(message)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostTicker(0, 1)
end

local displayingCoordinates = false
local varString = CreateVarString(10, "LITERAL_STRING", "Boss Menu")

RegisterCommand("pos", function()
    displayingCoordinates = not displayingCoordinates

    if displayingCoordinates then
        DisplayCoordinates()
    else
        TriggerEvent('chatMessage', 'COORDINATES', {255, 0, 0}, "Arrêt de l'affichage des coordonnées.")
    end
end)

RegisterCommand('getpos', function()
    local coords, heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())
    SendNUIMessage({
        type = 'clipboard',
        data = '' .. vec(coords.x, coords.y, coords.z - 1)
    })
    TriggerEvent('chatMessage', 'Copied to clipboard! ' .. vec(coords.x, coords.y, coords.z - 1))
end)

function DisplayCoordinates()
    Citizen.CreateThread(function()
        while displayingCoordinates do
            Citizen.Wait(0) -- Vous pouvez ajuster le délai (en millisecondes) entre chaque actualisation ici. Actuellement défini à 1 seconde (1000 ms).

            local playerPed = PlayerId()
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(playerPed), true))
            local heading = GetEntityHeading(PlayerPedId())

            --TriggerEvent('chatMessage', 'COORDINATES', {255, 0, 0}, string.format("X: %.2f, Y: %.2f, Z: %.2f", x, y, z))
            DrawTxt("x = " .. tonumber(string.format("%.2f", x)) .. " y = " .. tonumber(string.format("%.2f", y)) .. " z = " .. tonumber(string.format("%.2f", z)).."heading = ".. tonumber(string.format("%.2f", heading)), 0.01, 0.0, 0.4, 0.4, true, 255, 255, 255, 255)
        end
    end)
end

AddEventHandler('playerSpawned', function()
    local player = source
    if displayingCoordinates then
        DisplayCoordinates()
    end
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a)
    local str = CreateVarString(10, "LITERAL_STRING", str)

    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end