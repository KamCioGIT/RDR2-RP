-- Script pour afficher les coordonnées du joueur en temps réel et en continu
-- Framework RedEM:RP

local displayingCoordinates = false

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
            Citizen.Wait(1000) -- Vous pouvez ajuster le délai (en millisecondes) entre chaque actualisation ici. Actuellement défini à 1 seconde (1000 ms).

            local playerPed = PlayerId()
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(playerPed), true))

            TriggerEvent('chatMessage', 'COORDINATES', {255, 0, 0}, string.format("X: %.2f, Y: %.2f, Z: %.2f", x, y, z))
        end
    end)
end

AddEventHandler('playerSpawned', function()
    local player = source
    if displayingCoordinates then
        DisplayCoordinates()
    end
end)
