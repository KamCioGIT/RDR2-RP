RegisterCommand("doorsearch", function(source, args)
	TriggerClientEvent("doorsearch:search", source)
end)

RegisterCommand("door", function(source, args)
	local door = tonumber(args[1])
	local state = tonumber(args[2])
	TriggerClientEvent("doorsearch:door", source, door, state)
end)
