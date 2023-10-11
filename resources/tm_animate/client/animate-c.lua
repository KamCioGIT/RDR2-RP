Citizen.CreateThread(function() 
	while true do
		local player = PlayerPedId()
		local pos = GetEntityCoords(player)
		local currentHour = GetClockHours()
		local currentMinute = GetClockMinutes()
		local bellrun = false
		for component, data in pairs(AnimConfig.Animations) do
			if DoesObjectOfTypeExistAtCoords(pos, AnimConfig.Radius, GetHashKey(data.model)) then
				if data.obj == nil then
					data.obj = GetClosestObjectOfType(pos, AnimConfig.Radius, GetHashKey(data.model), false, false, false)
					RequestAnimDict(data.dict)
					while not HasAnimDictLoaded(data.dict) do
						Citizen.Wait(10)
					end
					if not data.bell then
						print("^4Start Animating :^6 "..data.model.."|"..data.obj)
						Citizen.InvokeNative(0xDC6D22FAB76D4874, data.obj, data.anim, data.dict, -1, true, true, false, 1.0, 0)
					else
						local currentH = GetClockHours()
						local currentM = GetClockMinutes()
						if currentH == 12 and currentM >= 0 and currentM <=15 and bellrun == false then
							print("^4Start Animating Bell (no loop):^6 "..data.model.."|"..data.obj)
							bellrun = true
							Citizen.InvokeNative(0xDC6D22FAB76D4874, data.obj, data.anim, data.dict, -1, true, true, false, 1.0, 0)
						else
							Citizen.InvokeNative(0x786591D986DE9159, data.obj, data.anim, data.dict, 0)
							bellrun = false
						end
					end
				else
					if data.bell then
						local currentH = GetClockHours()
						local currentM = GetClockMinutes()
						if currentH == 12 and currentM >= 0 and currentM <=15 and bellrun == false then
							bellrun = true
							print("^4Start Animating Bell (no loop):^6 "..data.model.."|"..data.obj)
							Citizen.InvokeNative(0xDC6D22FAB76D4874, data.obj, data.anim, data.dict, -1, true, true, false, 1.0, 0)
							Citizen.Wait(15000)
						else
							Citizen.InvokeNative(0x786591D986DE9159, data.obj, data.anim, data.dict, 0)
							bellrun = false
						end
					end
				end
			else
				if data.obj ~= nil then
					print("^4Stop Animating :^6 "..data.model.."|"..data.obj)
					Citizen.InvokeNative(0x786591D986DE9159, data.obj, data.anim, data.dict, 0)
					data.obj = nil
					bellrun = false
				end		
			end

		end
		Citizen.Wait(2000)
	end
end)