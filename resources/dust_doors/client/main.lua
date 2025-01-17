local CoolDown = 0
local OpenPrompt
local PromptGroup = GetRandomIntInRange(0, 0xffffff)
local isInteracting = false


function SetupOpenPrompt()
    Citizen.CreateThread(function()
        local str = 'Porte'
        OpenPrompt = PromptRegisterBegin()
        PromptSetControlAction(OpenPrompt, Config.KeyPress)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(OpenPrompt, str)
        PromptSetEnabled(OpenPrompt, 1)
        PromptSetVisible(OpenPrompt, 1)
		PromptSetHoldMode(OpenPrompt, 1)
		PromptSetGroup(OpenPrompt, PromptGroup)
		PromptRegisterEnd(OpenPrompt)
    end)
end

Citizen.CreateThread(function() 
	while true do
		local player = PlayerPedId()
		local pos = GetEntityCoords(player)
		local bellrun = false
		for component, data in pairs(Config.Trapdoor) do
			if DoesObjectOfTypeExistAtCoords(pos, 40.0, GetHashKey(data.doorid)) then
				data.obj = GetClosestObjectOfType(pos, 40.0, GetHashKey(data.doorid), false, false, false)
				DeleteEntity(data.obj)
			-- 	if not DoesObjectOfTypeExistAtCoords(pos, 40.0, GetHashKey("p_trapdoor02x")) then
			-- 		data.prop = CreateObject("p_trapdoor02x", data.objCoords, false, false, true)
			-- 		SetEntityRotation(data.prop, data.objPitchclose, 0, true)
			-- 	end
			-- 	if IsControlJustReleased(0, 0x760A9C6F) then
			-- 		if data.trapopen == true then
			-- 			SetEntityRotation(data.prop, data.objPitchclose, 0, true)
			-- 			data.trapopen = true
			-- 		else
			-- 			SetEntityRotation(data.prop, data.objPitchopen, 0, true)
			-- 			data.trapopen = true
			-- 		end
			-- 	end
			-- end
			-- if data.prop then
			-- 	if IsControlJustReleased(0, 0x760A9C6F) then
			-- 		if data.trapopen == true then
			-- 			SetEntityRotation(data.prop, data.objPitchclose, 0, true)
			-- 			data.trapopen = false
			-- 		else
			-- 			SetEntityRotation(data.prop, data.objPitchopen, 0, true)
			-- 			data.trapopen = true
			-- 		end
			-- 	end
			-- end
			end
		Citizen.Wait(10)
		end
	end
end)




-- Get objects every second, instead of every frame
-- Citizen.CreateThread(function()
-- 	while true do
-- 		for _,doorID in pairs(Config.DoorList) do
-- 			if doorID.doors then
-- 				for k,v in pairs(doorID.doors) do
-- 					if not v.object or not DoesEntityExist(v.object) then
-- 						local shapeTest = StartShapeTestBox(v.objCoords, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
-- 						local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
-- 						v.object = entityHit
-- 					end
-- 				end
-- 			else
-- 				if not doorID.object or not DoesEntityExist(doorID.object) then
-- 					local shapeTest = StartShapeTestBox(doorID.objCoords, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
-- 					local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
-- 					doorID.object = entityHit
-- 				end
-- 			end
-- 		end

-- 		Citizen.Wait(1000)
-- 	end
-- end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		for _,values in pairs(Config.Doors) do
-- 			if v.door2 ~= 0 then
-- 				if not v.door2 or not DoesEntityExist(v.door2) then
-- 					local shapeTest = StartShapeTestBox(v.DoorCoord2, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
-- 					local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
-- 					v.door2 = entityHit
-- 				end
-- 				if not v.door or not DoesEntityExist(v.door) then
-- 					local shapeTest = StartShapeTestBox(v.DoorCoord, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
-- 					local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
-- 					v.door = entityHit
-- 				end
-- 			else
-- 				if not v.door or not DoesEntityExist(v.door) then
-- 					local shapeTest = StartShapeTestBox(v.DoorCoord, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
-- 					local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
-- 					v.door = entityHit
-- 				end
-- 			end
-- 		end

-- 		Citizen.Wait(1000)
-- 	end
-- end)


-- Citizen.CreateThread(function()
-- 	SetupOpenPrompt()
-- 	while true do
-- 		Citizen.Wait(0)
-- 		local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true

-- 		for k,doorID in ipairs(Config.DoorList) do
-- 			local distance = #(playerCoords - doorID.textCoords)

-- 			local maxDistance, displayText = 1.25, 'unlocked'

-- 			if doorID.distance then
-- 				maxDistance = doorID.distance
-- 			end

-- 			if distance < 50 then
-- 				letSleep = false

-- 				if doorID.doors then
-- 					if doorID.locked then
-- 						for _,v in ipairs(doorID.doors) do
-- 							if Citizen.InvokeNative(0x160AA1B32F6139B8, v.doorid) ~= 3 then
-- 								Citizen.InvokeNative(0xD99229FE93B46286, v.doorid,1,1,0,0,0,0)
-- 								Citizen.InvokeNative(0x6BAB9442830C7F53, v.doorid, 3) 
-- 							end
-- 							local current = GetEntityRotation(v.object).z - v.objYaw
-- 							if v.objYaw and current > 0.5 or current < -0.5 then
-- 								SetEntityRotation(v.object, 0.0, 0.0, v.objYaw, 2, true)
-- 							end
-- 							FreezeEntityPosition(v.object,true)
-- 						end
-- 					else
-- 						for _,v in ipairs(doorID.doors) do
-- 							if Citizen.InvokeNative(0x160AA1B32F6139B8, v.doorid) ~= false then
-- 								Citizen.InvokeNative(0xD99229FE93B46286, v.doorid,1,1,0,0,0,0)
-- 								Citizen.InvokeNative(0x6BAB9442830C7F53, v.doorid, 0) 
-- 							end
-- 						end
-- 						FreezeEntityPosition(doorID.object,false)
-- 					end

-- 				else
-- 					if doorID.locked then
-- 						if Citizen.InvokeNative(0x160AA1B32F6139B8, doorID.doorid) ~= 3 then
-- 							Citizen.InvokeNative(0xD99229FE93B46286, doorID.doorid,1,1,0,0,0,0)
-- 							Citizen.InvokeNative(0x6BAB9442830C7F53, doorID.doorid, 3) 
-- 						end
-- 						local current = GetEntityRotation(doorID.object).z - doorID.objYaw
-- 						if doorID.objYaw and current > 0.5 or current < -0.5 then
-- 							SetEntityRotation(doorID.object, 0.0, 0.0, doorID.objYaw, 2, true)
-- 						end
-- 						FreezeEntityPosition(doorID.object,true)
-- 					else
-- 						if Citizen.InvokeNative(0x160AA1B32F6139B8, doorID.doorid) ~= false then
-- 							Citizen.InvokeNative(0xD99229FE93B46286, doorID.doorid,1,1,0,0,0,0)
-- 							Citizen.InvokeNative(0x6BAB9442830C7F53, doorID.doorid, 0) 
-- 						end
-- 						FreezeEntityPosition(doorID.object,false)
-- 					end
-- 				end
-- 			end

-- 			if distance < maxDistance then
-- 				if distance < 1.75 then
-- 					if Config.UsePrompt then
-- 						if doorID.locked then
-- 							local label  = CreateVarString(10, 'LITERAL_STRING', "Fermée")
-- 							PromptSetActiveGroupThisFrame(PromptGroup, label)
-- 							if PromptHasHoldModeCompleted(OpenPrompt) and CoolDown < 1 then
-- 								CoolDown = 1000
-- 								local state = not doorID.locked
-- 								TriggerServerEvent("redemrp_doorlocks:updatedoorsv", k, state)
-- 							end

-- 						else
-- 							local label  = CreateVarString(10, 'LITERAL_STRING', "Ouverte")
-- 							PromptSetActiveGroupThisFrame(PromptGroup, label)
-- 							if PromptHasHoldModeCompleted(OpenPrompt) and CoolDown < 1 then
-- 								CoolDown = 1000
-- 								local state = not doorID.locked
-- 								TriggerServerEvent("redemrp_doorlocks:updatedoorsv", k, state)
-- 							end
-- 						end
-- 					else
-- 						if IsControlJustPressed(0,Config.KeyPress) and CoolDown < 1 then
-- 							CoolDown = 1000
-- 							local state = not doorID.locked
-- 							TriggerServerEvent("redemrp_doorlocks:updatedoorsv", k, state)
-- 						end
-- 					end
-- 				end
-- 			end

-- 			if CoolDown > 0 then
-- 				CoolDown = CoolDown - 1
-- 			end
-- 		end

-- 		if letSleep then
-- 			Citizen.Wait(500)
-- 		end
-- 	end
-- end)



-- RegisterNetEvent('redemrp_doorlocks:changedoor')
-- AddEventHandler('redemrp_doorlocks:changedoor', function(doorID, state)
-- 	ChangeStateText(Config.DoorList[doorID].textCoords, state)
-- 	prop_name = 'P_KEY02X'
-- 	local ped = PlayerPedId()
--         local p1 = GetEntityCoords(ped, true)
--         local p2 = Config.DoorList[doorID].textCoords
--         local dx = p2.x - p1.x
--         local dy = p2.y - p1.y

--         local heading = GetHeadingFromVector_2d(dx, dy)
--         SetPedDesiredHeading( ped, heading )

-- 	local x,y,z = table.unpack(GetEntityCoords(ped, true))
-- 	local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
-- 	local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")

-- 	if not IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
-- 		local waiting = 0
-- 		if not HasAnimDictLoaded("script_common@jail_cell@unlock@key") then
-- 			RequestAnimDict("script_common@jail_cell@unlock@key")
-- 			while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
-- 				Citizen.Wait(100)
-- 				RequestAnimDict("script_common@jail_cell@unlock@key")
-- 			end
-- 		end
-- 			Wait(100)
-- 		TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
-- 		RemoveAnimDict("script_common@jail_cell@unlock@key")
-- 			Wait(750)
-- 		AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
-- 			Wait(250)
-- 		TriggerServerEvent('redemrp_doorlocks:updateState', doorID, state, function(cb) end)
-- 			Wait(1500)
-- 		ClearPedSecondaryTask(ped)
-- 		DeleteObject(prop)
-- 	end
-- end)

function ChangeStateText(coords, state)
	Citizen.CreateThread(function()
		local timeout = 80
		local Text = ""
		local r,g,b = 0,0,0
		if state == false then
			Text =  "Ouverture"
			r,g,b = 51, 153, 51
		elseif state == true then
			Text = 'Fermeture'
			r,g,b = 153, 1, 1
		end
		while timeout > 0 do
			Wait(0)
			timeout = timeout - 1
			DrawText3D(coords.x, coords.y, coords.z, Text, r, g, b)
		end
	end)
end


function DrawText3D(x, y, z, text, r, g, b)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    local factor = (string.len(text)) / 150
    DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, r, g, b, 190, 0)
end

-- Set state for a door
-- RegisterNetEvent('redemrp_doorlocks:setState')
-- AddEventHandler('redemrp_doorlocks:setState', function(doorID, state)
-- 	Config.DoorList[doorID].locked = state
-- end)



--- rework 

RegisterNetEvent('redemrp_doorlocks:setState')
AddEventHandler('redemrp_doorlocks:setState', function(doorID, state)
	print(doorID, state)
	Config.Doors[doorID].locked = state
end)


Citizen.CreateThread(function()
	while true do
		for _,v in pairs(Config.Doors) do
			if v.door2 ~= 0 then
				if not v.object2 or not DoesEntityExist(v.object2) then
					local shapeTest = StartShapeTestBox(v.DoorCoord2, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
					local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
					v.object2 = entityHit
				end
				if not v.object or not DoesEntityExist(v.object) then
					local shapeTest = StartShapeTestBox(v.DoorCoord, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
					local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
					v.object = entityHit
				end
			else
				if not v.object or not DoesEntityExist(v.object) then
					local shapeTest = StartShapeTestBox(v.OpenCoord, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
					local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
					v.object = entityHit
				end
			end
		end

		Citizen.Wait(1000)
	end
end)


Citizen.CreateThread(function()
	SetupOpenPrompt()
	while true do
		Citizen.Wait(1)
		local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true

		for k,v in ipairs(Config.Doors) do
			local distance = #(playerCoords - v.OpenCoord)

				maxDistance = 2.0

			if distance < 50 then
				letSleep = false

				if v.door2 ~= 0 then
					if v.locked then
							if Citizen.InvokeNative(0x160AA1B32F6139B8, v.door) ~= 3 then
								Citizen.InvokeNative(0xD99229FE93B46286, v.door,1,1,0,0,0,0)
								Citizen.InvokeNative(0x6BAB9442830C7F53, v.door, 3) 
							end
							local current = GetEntityRotation(v.object).z - v.CloseRotation
							if v.CloseRotation and current > 0.5 or current < -0.5 then
								SetEntityRotation(v.object, 0.0, 0.0, v.CloseRotation, 2, true)
							end
							FreezeEntityPosition(v.object,true)
							if Citizen.InvokeNative(0x160AA1B32F6139B8, v.door2) ~= 3 then
								Citizen.InvokeNative(0xD99229FE93B46286, v.door2,1,1,0,0,0,0)
								Citizen.InvokeNative(0x6BAB9442830C7F53, v.door2, 3) 
							end
							local current = GetEntityRotation(v.object2).z - v.CloseRotation2
							if v.CloseRotation2 and current > 0.5 or current < -0.5 then
								SetEntityRotation(v.object2, 0.0, 0.0, v.CloseRotation2, 2, true)
							end
							FreezeEntityPosition(v.object2,true)
					else
						if Citizen.InvokeNative(0x160AA1B32F6139B8, v.door) ~= false then
							Citizen.InvokeNative(0xD99229FE93B46286, v.door,1,1,0,0,0,0)
							Citizen.InvokeNative(0x6BAB9442830C7F53, v.door, 0) 
						end
						FreezeEntityPosition(v.object,false)
						if Citizen.InvokeNative(0x160AA1B32F6139B8, v.door2) ~= false then
							Citizen.InvokeNative(0xD99229FE93B46286, v.door2,1,1,0,0,0,0)
							Citizen.InvokeNative(0x6BAB9442830C7F53, v.door2, 0) 
						end
						FreezeEntityPosition(v.object2,false)
					end
				else
					if v.locked then
						if Citizen.InvokeNative(0x160AA1B32F6139B8, v.door) ~= 3 then
							Citizen.InvokeNative(0xD99229FE93B46286, v.door,1,1,0,0,0,0)
							Citizen.InvokeNative(0x6BAB9442830C7F53, v.door, 3) 
						end
						local current = GetEntityRotation(v.object).z - v.CloseRotation
						if v.CloseRotation and current > 0.5 or current < -0.5 then
							SetEntityRotation(v.object, 0.0, 0.0, v.CloseRotation, 2, true)
						end
						FreezeEntityPosition(v.object,true)
				else
					if Citizen.InvokeNative(0x160AA1B32F6139B8, v.door) ~= false then
						Citizen.InvokeNative(0xD99229FE93B46286, v.door,1,1,0,0,0,0)
						Citizen.InvokeNative(0x6BAB9442830C7F53, v.door, 0) 
					end
					FreezeEntityPosition(v.object,false)
				end
				end
			end

			if distance < maxDistance then
				if distance < 1.75 then
					if Config.UsePrompt then
						if v.locked then
							local label  = CreateVarString(10, 'LITERAL_STRING', "Fermée")
							PromptSetActiveGroupThisFrame(PromptGroup, label)
							if PromptHasHoldModeCompleted(OpenPrompt) and CoolDown < 1 then
								CoolDown = 1000
								isInteracting = true
								local state = not v.locked
								TriggerServerEvent("redemrp_doorlocks:updatedoorsv", k, state)
							end

						else
							local label  = CreateVarString(10, 'LITERAL_STRING', "Ouverte")
							PromptSetActiveGroupThisFrame(PromptGroup, label)
							if PromptHasHoldModeCompleted(OpenPrompt) and CoolDown < 1 then
								CoolDown = 1000
								isInteracting = true
								local state = not v.locked
								TriggerServerEvent("redemrp_doorlocks:updatedoorsv", k, state)
							end
						end
					else
						if IsControlJustPressed(0,Config.KeyPress) and CoolDown < 1 then
							CoolDown = 1000
							isInteracting = true
							local state = not v.locked
							TriggerServerEvent("redemrp_doorlocks:updatedoorsv", k, state)
						end
					end
				end
			end

			if CoolDown > 0 then
				CoolDown = CoolDown - 1
			end
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)



RegisterNetEvent('redemrp_doorlocks:changedoor')
AddEventHandler('redemrp_doorlocks:changedoor', function(doorID, state)
	prop_name = 'P_KEY02X'
	local ped = PlayerPedId()
        local p1 = GetEntityCoords(ped, true)
        local p2 = Config.Doors[doorID].OpenCoord
        local dx = p2.x - p1.x
        local dy = p2.y - p1.y

        local heading = GetHeadingFromVector_2d(dx, dy)
        SetPedDesiredHeading( ped, heading )

	local x,y,z = table.unpack(GetEntityCoords(ped, true))
	local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
	local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")
	AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)

	if not IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
		local waiting = 0
		if not HasAnimDictLoaded("script_common@jail_cell@unlock@key") then
			RequestAnimDict("script_common@jail_cell@unlock@key")
			while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
				Citizen.Wait(100)
				RequestAnimDict("script_common@jail_cell@unlock@key")
			end
		end
			Wait(100)
		TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
		RemoveAnimDict("script_common@jail_cell@unlock@key")
			Wait(1000)
		TriggerServerEvent('redemrp_doorlocks:updateState', doorID, state, function(cb) end)
			Wait(1500)
		ClearPedSecondaryTask(ped)
		SetEntityAsMissionEntity(prop)
		DeleteObject(prop)
	end
	SetEntityAsMissionEntity(prop)
	DeleteObject(prop)
	isInteracting = false
end)