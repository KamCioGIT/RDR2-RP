local mymessage = {}

RegisterNetEvent("dust_notepad:get_notepad")
AddEventHandler("dust_notepad:get_notepad", function(tbl)
	TriggerEvent("redemrp_inventory:closeinv")
	TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_WRITE_NOTEBOOK'), -1, true, false, false, false)
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
	ClearPedTasksImmediately(PlayerPedId(), true, true)
end)


RegisterNUICallback('save', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	print(data.page, data.value)
	TriggerServerEvent("dust_notepad:save", data.page, data.value)
	ClearPedTasksImmediately(PlayerPedId(), true, true)
end)

RegisterNUICallback('save_new', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	print(data.page, data.value)
	print 'get'
	TriggerServerEvent("dust_notepad:save_new", data.page, data.value)
	ClearPedTasksImmediately(PlayerPedId(), true, true)
end)

RegisterNUICallback('delete', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "notepad",status = false,})
	TriggerServerEvent("dust_notepad:delete", data.page)
	ClearPedTasksImmediately(PlayerPedId(), true, true)
end)