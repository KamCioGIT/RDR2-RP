RedEM = exports["redem_roleplay"]:RedEM()

local robtime = 140 -- Time to rob (in seconds) now its 3.3mins
local timerCount = robtime
local isRobbing = false
local speaked = false
local started = false
local maksettu = false
local Blowedynamite = false
local missionCompleted = false

---- OUVERTURE PORTE ------
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local _, wepHash = GetCurrentPedWeapon(playerPed, true, 0, true)
		local WeapType = GetWeaponType(wepHash)
		local playerPos = GetEntityCoords(PlayerPedId())
		local coords = GetEntityCoords(playerPed)
		local zone = Citizen.InvokeNative(0x43AD8FC02B429D33, GetEntityCoords(PlayerPedId()), 1)

		for k, v in pairs(Config.Doors) do
			if #(playerPos - v.pos) < 1.2 then
				if v.gun == true then
					if WeapType == "SHOTGUN" or WeapType == "LONGARM" or WeapType == "SHORTARM" then
						TriggerEvent('dust_presskey', "Appuyez sur G pour braquer")
						if IsControlJustPressed(2, 0x760A9C6F) then
							TriggerServerEvent("dust_braquage:askgrille", k)
						end
					end
				end
				if v.gun == false then
					TriggerEvent('dust_presskey', "Appuyez sur G pour poser la dynamite")
					if IsControlJustReleased(0, 0x760A9C6F) then 
                        TriggerServerEvent("dust_braquage:askdynamite", k)
                    end
				end
			end
		end
	end
end)

RegisterNetEvent("dust_braquage:ouvrirgrille", function(door)
	local playerPed = PlayerPedId()
	local playerPos = GetEntityCoords(PlayerPedId())
	local coords = GetEntityCoords(playerPed)
	local zone = Citizen.InvokeNative(0x43AD8FC02B429D33, GetEntityCoords(PlayerPedId()), 1)
	TriggerServerEvent('redemrp_doorlocks:braquageopen', door, false)
	TriggerServerEvent("braquage:AlertSheriff", coords, zone) 
	HandsUpAnim(Config.Doors[door].npc)
end)


RegisterNetEvent("dust_braquage:poserdynamite", function(doorid)
	local playerPed = PlayerPedId()
	local playerPos = GetEntityCoords(PlayerPedId())
	local coords = GetEntityCoords(playerPed)
	local zone = Citizen.InvokeNative(0x43AD8FC02B429D33, GetEntityCoords(PlayerPedId()), 1)
	BlowDynamite(doorid)
	TriggerServerEvent("braquage:AlertSheriff", coords, zone) 
end)


function GetWeaponType(hash)
	if Citizen.InvokeNative(0x959383DCD42040DA, hash)  or Citizen.InvokeNative(0x792E3EF76C911959, hash)   then
		return "MELEE"
	elseif Citizen.InvokeNative(0x6AD66548840472E5, hash) or Citizen.InvokeNative(0x0A82317B7EBFC420, hash) or Citizen.InvokeNative(0xDDB2578E95EF7138, hash) or Citizen.InvokeNative(0xC4DEC3CA8C365A5D, hash) then
		return "LONGARM"
	elseif  Citizen.InvokeNative(0xC75386174ECE95D5, hash) then
		return "SHOTGUN"
	elseif  Citizen.InvokeNative(0xDDC64F5E31EEDAB6, hash) or Citizen.InvokeNative(0xC212F1D05A8232BB, hash) then
		return "SHORTARM"
	end
	return false
end




Citizen.CreateThread(function()
	for k,v in pairs(Config.Doors) do
		if v.npccoords ~= nil then
			local model = RequestModel(GetHashKey(v.npcmodel))
			while not HasModelLoaded(GetHashKey(v.npcmodel)) do
				Wait(100)
			end

			local spawnCoords = v.npccoords
			local ped = CreatePed(GetHashKey(v.npcmodel), spawnCoords.x, spawnCoords.y, spawnCoords.z, v.npcheading, false, true, true, true)
			Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
			SetEntityNoCollisionEntity(PlayerPedId(), ped, false)
			SetEntityCanBeDamaged(ped, false)
			SetEntityInvincible(ped, true)
			Wait(2000)
			FreezeEntityPosition(ped, true)
			SetBlockingOfNonTemporaryEvents(ped, true)
			SetModelAsNoLongerNeeded(GetHashKey(v.npcmodel))
			Config.Doors[k].npc = ped
		end
	end
end)

function HandsUpAnim(ped)
    key = math.random(1, #Config.HandsUpAnim)
    RequestAnimDict(Config.HandsUpAnim[key].dict)
    while not HasAnimDictLoaded(Config.HandsUpAnim[key].dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(ped, Config.HandsUpAnim[key].dict, Config.HandsUpAnim[key].anim, 1.0, -1.0, -1, 25, 0, true, 0, false, 0, false)
	Citizen.Wait(180*1000)
	ClearPedTasks(ped)
end


function BlowDynamite(doorid)
			
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	itemDynamiteprop = CreateObject(GetHashKey('p_stick_dynamite01x'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(itemDynamiteprop, playerPed, GetPedBoneIndex(playerPed, 54565), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)
	Citizen.Wait(700)
	FreezeEntityPosition(playerPed, true)
	TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 15000, true, false, false, false)
			
	Citizen.Wait(5500)
			
	ClearPedTasks(playerPed)
	DetachEntity(itemDynamiteprop)
	FreezeEntityPosition(playerPed, false)

	Citizen.Wait(10000)
	AddExplosion(x, y, z, 25, 1.0 ,true , false , 27)
    DeleteObject(itemDynamiteprop)
	TriggerServerEvent('redemrp_doorlocks:braquageopen', doorid, false)
	Blowedynamite = true
	local playerPed2 = PlayerPedId()
    local coords = GetEntityCoords(playerPed2)        
	
end



Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local _, wepHash = GetCurrentPedWeapon(playerPed, true, 0, true)
		local WeapType = GetWeaponType(wepHash)
		local playerPos = GetEntityCoords(PlayerPedId())
		local coords = GetEntityCoords(playerPed)
		local zone = Citizen.InvokeNative(0x43AD8FC02B429D33, GetEntityCoords(PlayerPedId()), 1)

		--- if le joueur a une arme en main 
		for k, v in pairs(Config.Vault) do
			if #(playerPos - v.pos) < 3.0 then
				Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, v.pos, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
			end
			if #(playerPos - v.pos) < 1.2 then
				if v.difficulty == "simple" then
					TriggerEvent('dust_presskey', "Appuyez sur G pour crocheter")
					if IsControlJustPressed(2, 0x760A9C6F) then
						TriggerServerEvent("dust_braquage:asklockpick", k, v.difficulty)
					end
				end
				if v.difficulty == "hard" then
					TriggerEvent('dust_presskey', "Appuyez sur G pour forcer le coffre")
					if IsControlJustPressed(2, 0x760A9C6F) then
						TriggerServerEvent("dust_braquage:asklockpick", k, v.difficulty)
					end
				end

			end
		end
	end
end)



RegisterNetEvent("dust_braquage:dolockpick", function(vault, dif, open)
	if dif == "simple" then
		if open == false then
			local result = exports.rsd_lockpick:StartLockPick(1) --return "result lockpicking"
			if result then 
				TriggerEvent("redemrp_inventory:OpenStash", "braquage_"..vault, 40.0)
				TriggerServerEvent("dust_braquage:isopen", vault)
			else
				print 'no'
			end
		elseif open == true then
			TriggerEvent("redemrp_inventory:OpenStash", "braquage_"..vault, 40.0)
		end
	elseif dif == "hard" then
		if open == false then
			local result = exports.gtp_safecracking:StartSafeCrackingMiniGame(6)
			if result then 
				TriggerEvent("redemrp_inventory:OpenStash", "braquage_"..vault, 40.0)
				TriggerServerEvent("dust_braquage:isopen", vault)
			else
				print 'no'
			end
		elseif open == true then
			TriggerEvent("redemrp_inventory:OpenStash", "braquage_"..vault, 40.0)
		end
	end
end)