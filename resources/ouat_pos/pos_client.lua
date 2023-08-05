-- Script pour afficher les coordonnées du joueur en temps réel et en continu
-- Framework RedEM:RP

local displayingCoordinates = false
local varString = CreateVarString(10, "LITERAL_STRING", "Boss Menu")

RegisterCommand("pos", function()
    displayingCoordinates = not displayingCoordinates

    if displayingCoordinates then
        DisplayCoordinates()
    else
        TriggerEvent('chatMessage', 'COORDINATES', {255, 0, 0}, "Arrêt de l'affichage des coordonnées.")
    end
end, false)

function DisplayCoordinates()
    Citizen.CreateThread(function()
        while displayingCoordinates do
            Citizen.Wait(0) -- Vous pouvez ajuster le délai (en millisecondes) entre chaque actualisation ici. Actuellement défini à 1 seconde (1000 ms).

            local playerPed = PlayerId()
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(playerPed), true))

            --TriggerEvent('chatMessage', 'COORDINATES', {255, 0, 0}, string.format("X: %.2f, Y: %.2f, Z: %.2f", x, y, z))
            DrawTxt("x = " .. tonumber(string.format("%.2f", x)) .. " y = " .. tonumber(string.format("%.2f", y)) .. " z = " .. tonumber(string.format("%.2f", z)), 0.01, 0.0, 0.4, 0.4, true, 255, 255, 255, 255)
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