local mymessage = {}

RegisterNetEvent("dust_notepad:get_notepad")
AddEventHandler("dust_notepad:get_notepad", function(tbl)
	mymessage = tbl
	SendNUIMessage({
        type = "notepad",
		status = true,
		table = mymessage,
    })
    SetNuiFocus(true, true)
end)


RegisterNUICallback('exit', function(data, cb)
	SendNUIMessage({
        type = "notepad",
		status = false,
    })
    SetNuiFocus(false, false)
end)

RegisterCommand("notepad", function()
	TriggerServerEvent("dust_notepad:get_notepad")
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
	TriggerServerEvent("dust_notepad:save", data.name, data.value)
end)

RegisterNUICallback('save_new', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	TriggerServerEvent("dust_notepad:save_new", data.value)
end)

RegisterNUICallback('delete', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	TriggerServerEvent("dust_notepad:delete", data.name)
end)

RegisterNUICallback('send', function(data, cb)
    SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	TriggerEvent("dustinputs:getInput", "Potvrdit", "Vlož ID hráče kterému to chceš poslat", function(cb)
		local id_player = tonumber(cb)
		if id_player ~= "close" and id_player ~= nil then
			TriggerServerEvent("dust_notepad:send", id_player, data.value)
		end
	end)
end)
