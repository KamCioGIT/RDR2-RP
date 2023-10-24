local promptDataOpen = GetRandomIntInRange(0, 0xffffff)
local promptDataClose = GetRandomIntInRange(0, 0xffffff)
local backupPoster = {}
local posterBoard = {}
local backupJob = ""
local backupName = ""
local backupCity = ""
local cam = nil
local inPoster = false
local api
TriggerEvent("getApi",function(gumApi)
    api = gumApi
end)

Citizen.CreateThread(function()
	api.createPrompt(""..Config.Language[2].."", 0x27D1C284, promptDataOpen, nil, "gum_poster:open")
	api.createPrompt(""..Config.Language[7].."", 0x4A903C11, promptDataClose, nil, "gum_poster:close")
	api.createPrompt(""..Config.Language[8].."", 0x07CE1E61, promptDataClose, nil)
	api.createPrompt(""..Config.Language[9].."", 0x6328239B, promptDataClose, nil)
end)

RegisterNetEvent('gum_poster:open', function()
	api.setPromptEnable(""..Config.Language[2].."", promptDataOpen, false)
	local pCoords = GetEntityCoords(PlayerPedId(), true)
	for a,b in pairs(posterBoard) do
		local dist = GetDistanceBetweenCoords(pCoords, GetEntityCoords(b), true)
		if dist < 4 then
				local coords = GetEntityCoords(b)
				local offset = GetOffsetFromEntityInWorldCoords(b, 0.0, -0.6, 1.6)
				setCamera(offset.x, offset.y, offset.z, GetEntityHeading(b), coords)
				backupCity = Config.Posters[a].name
				TriggerServerEvent("gum_poster:getInformation", Config.Posters[a].name)
		end
	end
	Citizen.Wait(1000)
	api.setPromptEnable(""..Config.Language[2].."", promptDataOpen, true)
	inPoster = true
end)

Citizen.CreateThread(function()
	while true do
		local loop = 1000
		local pCoords = GetEntityCoords(PlayerPedId(), true)
		local coords, entity = api.getTarget()
		api.showPrompt('', promptDataOpen, false)
		api.showPrompt("", promptDataClose, false)
		for a,b in pairs(posterBoard) do
			local dist = GetDistanceBetweenCoords(pCoords, GetEntityCoords(b), true)
			if dist < 3 then
				loop = 120
					if inPoster then
						api.showPrompt(""..Config.Language[1].."", promptDataClose, true)
					else
						api.showPrompt(""..Config.Language[1].."", promptDataOpen, true)
					end
			end
		end
		for k,v in pairs(Config.Posters) do
			local dist = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, v.coords[1], v.coords[2], v.coords[3], true)
			if dist < 40.0 then
				if posterBoard[k] == nil then
					posterBoard[k] = CreateObject(Config.Posters[k].object, v.coords[1], v.coords[2], v.coords[3], false, true, false)
					SetEntityHeading(posterBoard[k], v.coords[4])
					while not DoesEntityExist(posterBoard[k]) do
						Citizen.Wait(10)
					end
					SetEntityHeading(posterBoard[k], v.coords[4])
				end
			else
				if posterBoard[k] ~= nil then
					api.deleteObj(posterBoard[k])
					posterBoard[k] = nil
				end
			end
		end
		Citizen.Wait(loop)
	end
end)



function setCamera(x,y,z,h,entityCoords)
	cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", x, y, z, 0.0, 0.0, h, 90.0)
	SetCamActive(cam,true)
	RenderScriptCams(true, true, 500, true, true)
	-- PointCamAtCoord(cam, entityCoords + 0.5)
end


RegisterNUICallback('exit', function(data, cb)
	SetNuiFocus(false, false)
	api.setPromptEnable(""..Config.Language[7].."", promptDataClose, false)
	api.setPromptEnable(""..Config.Language[8].."", promptDataClose, false)
	api.setPromptEnable(""..Config.Language[9].."", promptDataClose, false)
    RenderScriptCams(false, true, 800, true, false)
	cam = nil
	Citizen.Wait(800)
	DestroyCam(cam, false)
	DestroyAllCams(true)
	inPoster = false
	api.setPromptEnable(""..Config.Language[7].."", promptDataClose, true)
	api.setPromptEnable(""..Config.Language[8].."", promptDataClose, true)
	api.setPromptEnable(""..Config.Language[9].."", promptDataClose, true)
end)

RegisterNUICallback('pinMeOnBoard', function(data, cb)
	table.insert(backupPoster, {name=backupName, poster_link=data.link, date=data.time, job=backupJob, city=backupCity})
	TriggerServerEvent("gum_poster:savePin", data.link, data.time, backupName, backupCity)
	table.sort(backupPoster, function(a,b) return a.date > b.date end)
	SendNUIMessage({type = "ui", display=true, table=backupPoster, icName=Config.ICNamePoster, job=job})
	SendNUIMessage({type = "clear"})
	SetNuiFocus(true, true)
end)

RegisterNUICallback('removePoster', function(data, cb)
	if Config.JobForDelete then
		local haveJob = false
		if Config.JobForPlace then
			if type(backupJob) == "table" then
				for a,b in pairs(Config.JobDeleteTable) do
					for c,d in pairs(backupJob) do
						if d.job == b then
							haveJob = true
						end
					end
				end
			else
				for a,b in pairs(Config.JobDeleteTable) do
					if b == backupJob then
						haveJob = true
					end
				end
			end
		end
		if haveJob then
			api.getAnswer( ""..Config.Language[3].."", ""..Config.Language[4].."", ""..Config.Language[5].."", function(cb)
				local answer = cb
				if answer == true then
					for a,b in pairs(backupPoster) do
						if b.poster_link == data.link and backupCity == b.city then
							table.remove(backupPoster, a)
						end
					end
					table.sort(backupPoster, function(a,b) return a.date > b.date end)
					SendNUIMessage({type = "ui", display=true, table=backupPoster, icName=Config.ICNamePoster, job=job})
					SendNUIMessage({type = "clear"})
					TriggerServerEvent("gum_poster:removePinFraction", data.link, backupCity)
				end
			end)
		else
			local hisOwn = false
			for a,b in pairs(backupPoster) do
				if b.poster_link == data.link and backupCity == b.city and backupName == b.icName then
					hisOwn = true
				end
			end
			if hisOwn then
				api.getAnswer( ""..Config.Language[3].."", ""..Config.Language[4].."", ""..Config.Language[5].."", function(cb)
					local answer = cb
					if answer == true then
						for a,b in pairs(backupPoster) do
							if b.poster_link == data.link and backupCity == b.city and backupName == b.icName then
								table.remove(backupPoster, a)
							end
						end
						table.sort(backupPoster, function(a,b) return a.date > b.date end)
						SendNUIMessage({type = "ui", display=true, table=backupPoster, icName=Config.ICNamePoster, job=job})
						SendNUIMessage({type = "clear"})
						TriggerServerEvent("gum_poster:removePin", data.link, backupName, backupCity)
					end
				end)
			else
				api.notify(""..Config.Language[1].."", ""..Config.Language[6].."", ''..Config.NotifyImage..'', 2000)
			end
		end
	else
		local hisOwn = false
		if Config.CityPoster then
			for a,b in pairs(backupPoster) do
				if b.poster_link == data.link and backupCity == b.city and backupName == b.icName then
					hisOwn = true
				end
			end
		else
			for a,b in pairs(backupPoster) do
				if b.poster_link == data.link and backupName == b.icName then
					hisOwn = true
				end
			end
		end
		if hisOwn then
			api.getAnswer( ""..Config.Language[3].."", ""..Config.Language[4].."", ""..Config.Language[5].."", function(cb)
				local answer = cb
				if answer == true then
					if Config.CityPoster then
						for a,b in pairs(backupPoster) do
							if b.poster_link == data.link and backupCity == b.city and backupName == b.icName then
								table.remove(backupPoster, a)
								break
							end
						end
					else
						for a,b in pairs(backupPoster) do
							if b.poster_link == data.link and backupName == b.icName then
								table.remove(backupPoster, a)
								break
							end
						end
					end
					table.sort(backupPoster, function(a,b) return a.date > b.date end)
					SendNUIMessage({type = "ui", display=true, table=backupPoster, icName=Config.ICNamePoster, job=job})
					SendNUIMessage({type = "clear"})
					TriggerServerEvent("gum_poster:removePin", data.link, backupName, backupCity)
				end
			end)
		else
			api.notify(""..Config.Language[1].."", ""..Config.Language[6].."", ''..Config.NotifyImage..'', 2000)
		end
	end
end)


RegisterNetEvent('gum_poster:sendList')
AddEventHandler('gum_poster:sendList', function(posterTable, job, name)
	table.sort(posterTable, function(a,b) return a.date > b.date end)
	backupPoster = posterTable
	backupJob = job
	backupName = name
	local jobForPlace = false
	if Config.JobForPlace then
		if type(backupJob) == "table" then
			for a,b in pairs(Config.JobPlaceTable) do
				for c,d in pairs(backupJob) do
					if d.job == b then
						jobForPlace = true
					end
				end
			end
		else
			for a,b in pairs(Config.JobPlaceTable) do
				if b == backupJob then
					jobForPlace = true
				end
			end
		end
	end
	SendNUIMessage({type = "ui", display=true, table=posterTable, icName=Config.ICNamePoster, job=job, placeJob=jobForPlace, configJob=Config.JobForPlace})
	SetNuiFocus(true, true)
end)

Citizen.CreateThread(function()
	for k,v in pairs(Config.Posters) do
		if v.blip then
			local blips = N_0x554d9d53f696d002(1664425300, v.coords[1], v.coords[2], v.coords[3])
			SetBlipSprite(blips, 1735233562, 1)
			SetBlipScale(blips, 1.0)
			Citizen.InvokeNative(0x9CB1A1623062F402, blips, ""..v.name.."")
		end
	end
end)
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
		for k,v in pairs(posterBoard) do
			DeleteEntity(v)
		end
	end
end)