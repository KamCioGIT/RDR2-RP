RedEM = exports["redem_roleplay"]:RedEM()


local DoorInfo	= {}

RegisterServerEvent('redemrp_doorlocks:updatedoorsv')
AddEventHandler('redemrp_doorlocks:updatedoorsv', function(doorID, state, cb)
	local _source = source
    local user = RedEM.GetPlayer(_source)     
        if not IsAuthorized(user.getJob(), Config.DoorList[doorID]) then
			TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1You do not have a key!^0")
            return
        else 
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
		if not IsAuthorized(user.getJob(), Config.DoorList[doorID]) then
			return
		end
		DoorInfo[doorID] = {}
		TriggerClientEvent('redemrp_doorlocks:setState', -1, doorID, state)
end)

function IsAuthorized(jobName, doorID)
	for _,job in pairs(doorID.authorizedJobs) do
		if job == jobName then
			return true
		end
	end
	return false
end
