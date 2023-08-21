RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

RegisterServerEvent("RegisterUsableItem:smallvault")
AddEventHandler("RegisterUsableItem:smallvault", function(source)
    TriggerClientEvent("smallvault", source)    
end)

RegisterServerEvent("RegisterUsableItem:mediumvault")
AddEventHandler("RegisterUsableItem:mediumvault", function(source)
    TriggerClientEvent("mediumvault", source)    
end)

RegisterServerEvent("RegisterUsableItem:largevault")
AddEventHandler("RegisterUsableItem:largevault", function(source)
    TriggerClientEvent("largevault", source)  
end)



---- RECUP LES POS ET LE PROP---
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		MySQL.query('SELECT `coords`, `model`, `heading` FROM `vault`;',{}, function(result)
			if #result ~= 0 then
				for i = 1, #result do
					local coords = json.decode(result[i].coords)
					TriggerClientEvent("dust_vault:server:getcoords", coords)
				end                    
			end
		end)
	end
end)

RegisterServerEvent("dust_vault:server:AskModel")
AddEventHandler("dust_vault:server:AskModel", function (vaultcoords)
	local coords = vaultcoords
	MySQL.query('SELECT `model`,`heading` FROM `vault` WHERE `coords`=@coords ;',{coords = coords}, function(result)
		if #result ~= 0 then
			for i = 1, #result do
				local model = result[i].model
				local heading = result[i].heading
				TriggerClientEvent("dust_vault:server:getmodel", model, heading)
			end                    
		end
	end)
end)



--- CREER LE VAULT DANS LA DB ---
RegisterServerEvent("dust_vault:server:vaultDB")
AddEventHandler("dust_vault:server:vaultDB", function(vault, playerpos, heading)
	local _source = source
    local user = RedEM.GetPlayer(_source)
    local identifier = user.identifier
    local charid = user.charid
	local numBase0 = math.random(100, 999)
    local numBase1 = math.random(0, 9999)
    local generetedUid = string.format("%03d%04d", numBase0, numBase1)
	local vaultcoords = json.encode(playerpos)
	MySQL.update(
		'INSERT INTO stashes (`stashid`) VALUES (@stashid);',
		{
			stashid = generetedUid
		}, function(rowsChanged)
	end)
	
	MySQL.update(
		'INSERT INTO vault (`identifier`, `charid`, `stashid`, `model`, `coords`, `heading`) VALUES (@identifier, @charid, @stashid, @model, @coords, @heading);',
		{
			identifier = identifier,
			charid = charid,
			stashid = generetedUid,
			model = vault,
			coords = vaultcoords,
			heading = heading
		},
		function(rowsChanged)
		end
	)
end)

--- SUPPRIMER LE VAULT DE LA DB QUAND ON LE REPREND, S'ASSURER QUE LE COFFRE EST VIDE ----