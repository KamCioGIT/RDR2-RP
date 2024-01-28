local mymessage = {}

RegisterNetEvent("gum_notepad:get_notepad")
AddEventHandler("gum_notepad:get_notepad", function(tbl)
	mymessage = tbl
end)

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
	Citizen.CreateThread(function()
		TriggerServerEvent("gum_notepad:get_notepad")
	end)
end)

RegisterNUICallback('exit', function(data, cb)
	SendNUIMessage({
        type = "notepad",
		status = false,
    })
    SetNuiFocus(false, false)
end)

RegisterCommand("notepad", function()
	TriggerServerEvent("gum_notepad:get_notepad")
	Citizen.Wait(1000)
	SendNUIMessage({
        type = "notepad",
		status = true,
		table = mymessage,
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('save', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	TriggerServerEvent("gum_notepad:save", data.name, data.value)
end)

RegisterNUICallback('save_new', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	TriggerServerEvent("gum_notepad:save_new", data.value)
end)

RegisterNUICallback('delete', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	TriggerServerEvent("gum_notepad:delete", data.name)
end)

RegisterNUICallback('send', function(data, cb)
    SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	TriggerEvent("guminputs:getInput", "Potvrdit", "Vlož ID hráče kterému to chceš poslat", function(cb)
		local id_player = tonumber(cb)
		if id_player ~= "close" and id_player ~= nil then
			TriggerServerEvent("gum_notepad:send", id_player, data.value)
		end
	end)
end)
