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
	print(data.page, data.value)
	TriggerServerEvent("dust_notepad:save", data.page, data.value)
end)

RegisterNUICallback('save_new', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	print(data.page, data.value)
	print 'get'
	TriggerServerEvent("dust_notepad:save_new", data.page, data.value)
end)

RegisterNUICallback('delete', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	TriggerServerEvent("dust_notepad:delete", data.page)
end)