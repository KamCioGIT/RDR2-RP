
local guiEnabled = false

RegisterNetEvent("gum_newspapers:newspapers")
AddEventHandler("gum_newspapers:newspapers", function(list)
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
