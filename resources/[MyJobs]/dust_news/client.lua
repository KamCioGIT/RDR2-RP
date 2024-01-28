
local guiEnabled = false

RegisterNetEvent("dust_newspapers:newspapers")
AddEventHandler("dust_newspapers:newspapers", function(list)
    if Config.ImageUi then
	    EnableGui(true, list)
    end
    if Config.LinkWebsite then
	    EnableGui2(true, list)
    end
end)


function EnableGui(bool, newspaper)
    SetNuiFocus(bool, bool)

    guiEnabled = bool
    SendNUIMessage({
        type = "folder",
        status = bool,
        newspaper = newspaper,
    })
end

function EnableGui2(bool, newspaper)
    SetNuiFocus(bool, bool)

    guiEnabled = bool
    SendNUIMessage({
        type = "website",
        status = bool,
        newspaper = newspaper,
    })
end

RegisterNUICallback('exit', function(data, cb)
    EnableGui(false, false)
    SetNuiFocus(false, false)
    guiEnabled = false
    cb('ok')
end)

RegisterCommand("newspaper", function()

    local input = lib.inputDialog('Imprimer', {"Lien vers l'image", "Montant", "Titre"})
 
    if not input then return end
    TriggerServerEvent("dust_newspaper:new", input[1], input[2], input[3])
end)

RegisterNetEvent("dust_newspaper:get_newspaper")
AddEventHandler("dust_newspaper:get_newspaper", function(link)
	EnableGui2(true, link)
end)
