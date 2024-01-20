RedEM = exports["redem_roleplay"]:RedEM()

local robtime = 140 -- Time to rob (in seconds) now its 3.3mins
local timerCount = robtime
local isRobbing = false
local speaked = false
local started = false
local maksettu = false
local Blowedynamite = false
local missionCompleted = false


--Robbery startpoint
Citizen.CreateThread(function() 
    while true do
	Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
        local zone = Citizen.InvokeNative(0x43AD8FC02B429D33, GetEntityCoords(PlayerPedId()), 1)
		local betweencoords = GetDistanceBetweenCoords(coords,1290.0882568359, -1312.4019775391, 76.039939880371, true)
		if betweencoords < 2.0 and isRobbing == true then
                TriggerEvent('dust_presskey', "Appuyez sur G pour braquer")
				if IsControlJustReleased(0, 0x760A9C6F) then
                isRobbing = false   
				TriggerServerEvent("mushy_robbery:startrobbery", function()          
				Wait(Config.Policealert)
				TriggerServerEvent("braquage:AlertSheriff", coords, zone) 
				end)
			end
		end
	end
end)


RegisterNetEvent('mushy_robbery:startAnimation2')
AddEventHandler('mushy_robbery:startAnimation2', function()	
	local _source = source
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
    Wait(1000)
	BlowDynamite()
    TriggerServerEvent("mushy_robbery:loot")
    Blowedynamite = true                            
	Citizen.Wait(6000)
	ClearPedTasksImmediately(PlayerPedId())
	ClearPedSecondaryTask(PlayerPedId())               
end)

RegisterNetEvent('mushy_robbery:loot2')
AddEventHandler('mushy_robbery:loot2', function()	
	while true do
		Citizen.Wait(0)
        local _source = source    
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords,1290.0882568359, -1312.4019775391, 76.039939880371, true)
		if betweencoords < 2.0 and Blowedynamite == true then
            TriggerEvent('dust_presskey', "Appuyez sur G pour prendre")
			if IsControlJustReleased(0, 0xC7B5340A) then
              TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 6000, true, false, false, false)
	          exports['progressBars']:startUI(Config.LockpickTime, "Getting The Loot...")     
              Blowedynamite = false 
              isRobbing = false
              speaked = false
              started = false
              maksettu = false     
			  Citizen.Wait(6000)
	          ClearPedTasksImmediately(PlayerPedId())
	          ClearPedSecondaryTask(PlayerPedId())
	          TriggerServerEvent("mushy_robbery:payout", function()
              end)            
			end
		end
	end
end)              
            


Citizen.CreateThread(function()
    while not HasModelLoaded( GetHashKey("CS_johnmarston") ) do
        Wait(500)
        RequestModel( GetHashKey("CS_johnmarston") )
    end
    local npc = CreatePed(GetHashKey("CS_johnmarston"), -404.98327636719, 663.14361572266, 114.55465698242, false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey("CS_johnmarston"))
end)


Citizen.CreateThread(function()
   local blip = N_0x554d9d53f696d002(1664425300,-404.98327636719, 663.14361572266, 114.55465698242)
    SetBlipSprite(blip, 90287351, 1)
         Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Start Bank Heist") 
 end)


RegisterCommand("dynamite", function(source, args, raw)
    -- BlowDynamite()
    AddExplosion(-816.1816, -1277.426, 42.63773, tonumber(args[1]), 1.0 ,true , false , 27)
end)

function BlowDynamite()
			
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	itemDynamiteprop = CreateObject(GetHashKey('p_dynamite01x'), x, y, z+0.2,  true,  true, true)
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
	AddExplosion(x, y, z, 26, 10000.0 ,true , false , 27)
	Blowedynamite = true
	local playerPed2 = PlayerPedId()
    local coords = GetEntityCoords(playerPed2)        
	
end