RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)



local DoorInfo	= {}

AddEventHandler("redemrp:playerLoaded", function()
	Wait(1000)
	for k, v in pairs(DoorInfo) do
		TriggerClientEvent('redemrp_doorlocks:setState', -1, v.doorID, v.state)
	end
end)



RegisterServerEvent('redemrp_doorlocks:updatedoorsv')
AddEventHandler('redemrp_doorlocks:updatedoorsv', function(doorID, state, cb)
	local _source = source
    local user = RedEM.GetPlayer(_source)     
        if IsAuthorized(user.getJob(), Config.Doors[doorID]) then
            TriggerClientEvent('redemrp_doorlocks:changedoor', _source, doorID, state)
        end
end)


RegisterServerEvent('redemrp_doorlocks:updateState')
AddEventHandler('redemrp_doorlocks:updateState', function(doorID, state, cb)
    local _source = source
    local user = RedEM.GetPlayer(_source)    
		if type(doorID) ~= 'number' then
			return
		end
		if not IsAuthorized(user.getJob(), Config.Doors[doorID]) then
			return
		end
		if not HaveKey(_source, Config.Doors[doorID]) then
			return
		end
		DoorInfo[doorID] = {
			doorID = doorID,
			state = state
		}
		TriggerClientEvent('redemrp_doorlocks:setState', -1, doorID, state)
end)

function IsAuthorized(jobName, doorID)
	for _,job in pairs(doorID.jobs) do
		if job == "all" then
			return true
		else
			if job == jobName then
				return true
			end
		end
	end
	return false
end

function HaveKey(src, doorID)
	if doorID.keys ~= false then
		local ItemData = data.getItem(src, doorID.keys)
		local ItemAmount = tonumber(ItemData.ItemAmount)
		if ItemAmount >= 1 then
			return true
		end
	else
		return true
	end
	return false
end

