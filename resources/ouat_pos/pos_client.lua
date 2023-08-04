local showCoordinates = false

-- Fonction pour afficher les coordonnées
function ShowCoordinates()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local x, y, z = table.unpack(playerCoords)

    local roundedX = string.format("%.2f", x)
    local roundedY = string.format("%.2f", y)
    local roundedZ = string.format("%.2f", z)

    local coordsText = "X: " .. roundedX .. " Y: " .. roundedY .. " Z: " .. roundedZ

    SetTextFont(4)
    SetTextScale(0.5, 0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    AddTextComponentString(coordsText)
    DrawText(0.01, 0.95)
end

-- Commande pour activer/désactiver l'affichage des coordonnées
RegisterCommand("pos", function()
    showCoordinates = not showCoordinates
    if showCoordinates then
        TriggerEvent("chatMessage", "^1Coordonnées activées.")
    else
        TriggerEvent("chatMessage", "^1Coordonnées désactivées.")
    end
end)

-- Événement pour afficher les coordonnées lorsque la variable showCoordinates est vraie
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if showCoordinates then
            ShowCoordinates()
        end
    end
end)
