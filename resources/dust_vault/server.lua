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

spawnvault = {}

-- RECUP LES POS ---
RegisterServerEvent("dust_vault:server:Askcoords")
AddEventHandler("dust_vault:server:Askcoords", function()
	local _source = source
	MySQL.query('SELECT `coords` FROM `vault`;',{}, function(result)
		if #result ~= 0 then
			for i = 1, #result do
				local coords = json.decode(result[i].coords)
				TriggerClientEvent("dust_vault:server:getcoords", _source, coords)
			end                    
		end
	end)
end)


RegisterServerEvent("dust_vault:server:AskModel")
AddEventHandler("dust_vault:server:AskModel", function (vaultcoords)
	local _source = source
	local coords = json.encode(vaultcoords)
	MySQL.query('SELECT `id`,`model`,`heading` FROM `vault` WHERE `coords`=@coords ;',{coords = coords}, function(result)
		if #result ~= 0 then
			for i = 1, #result do
				local id = result[i].id
				local model = result[i].model
				local heading = result[i].heading
				local coords = json.decode(coords)
				TriggerClientEvent("dust_vault:server:getmodel", _source, model, heading, coords)
			end                    
		end
	end)
end)


---- REQUEST STASHES

RegisterServerEvent("dust_vault:server:AskStashes")
AddEventHandler("dust_vault:server:AskStashes", function()
	local _source = source
	MySQL.query('SELECT `coords`, `stashid`, `code`, `model` FROM `vault`;',{}, function(result)
		if #result ~= 0 then
			for i = 1, #result do
				local coords = json.decode(result[i].coords)
				local stashid = result[i].stashid
				local code = result[i].code
				local model = result[i].model
				TriggerClientEvent("dust_vault:server:getStashes", _source, coords, stashid, code, model)
			end                    
		end
	end)
end)

RegisterServerEvent("dust_vault:server:ChangeCode")
AddEventHandler("dust_vault:server:ChangeCode", function(code, vaultcoords)
	local coords = json.encode(vaultcoords)
	MySQL.update(
		'UPDATE vault SET `code`=@code WHERE `coords`=@coords;',
		{
			code = code,
			coords = coords
		}, function(rowsChanged)
	end)
end)



--- CREER LE VAULT DANS LA DB ---
RegisterServerEvent("dust_vault:server:vaultDB")
AddEventHandler("dust_vault:server:vaultDB", function(vault, playerpos, heading, code)
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
			stashid = "vault_"..generetedUid
		}, function(rowsChanged)
	end)
	
	MySQL.update(
		'INSERT INTO vault (`identifier`, `charid`, `stashid`, `model`, `coords`, `heading`, `code`) VALUES (@identifier, @charid, @stashid, @model, @coords, @heading, @code);',
		{
			identifier = identifier,
			charid = charid,
			stashid = "vault_"..generetedUid,
			model = vault,
			coords = vaultcoords,
			heading = heading,
			code = code
		},
		function(rowsChanged)
		end
	)
	if vault == Config.SmallVault then
		local ItemData = data.getItem(_source, "smallvault")
		ItemData.RemoveItem(1)
	elseif vault == Config.MediumVault then
		local ItemData = data.getItem(_source, "mediumvault")
		ItemData.RemoveItem(1)
	elseif vault == Config.LargeVault then
		local ItemData = data.getItem(_source, "largevault")
		ItemData.RemoveItem(1)
	end
end)

--- SUPPRIMER LE VAULT DE LA DB QUAND ON LE REPREND, S'ASSURER QUE LE COFFRE EST VIDE ----

RegisterServerEvent("dust_vault:server:removestash")
AddEventHandler("dust_vault:server:removestash", function(stashid, model, pos)
	local _source = source
    local user = RedEM.GetPlayer(_source)
    local identifier = user.identifier
    local charid = user.charid
	local stashW = exports.redemrp_inventory.GetStashWeight(source, tostring(stashid))
	local weight = TriggerEvent("redemrp_inventory:checkuserweight", identifier, charid)
	print (weight)
	if stashW == 0 then
		if model == Config.SmallVault then
			local ItemData = data.getItem(_source, "smallvault")
			retval = ItemData.AddItem(1)
		elseif model == Config.MediumVault then
			local ItemData = data.getItem(_source, "mediumvault")
			retval = ItemData.AddItem(1)
		elseif model == Config.LargeVault then
			local ItemData = data.getItem(_source, "largevault")
			retval = ItemData.AddItem(1)
		end
		if retval == true then
			MySQL.update('DELETE FROM vault WHERE `stashid`=@stashid', {stashid = stashid })
			Citizen.Wait(100)
			MySQL.update('DELETE FROM stashes WHERE `stashid`=@stashid', {stashid = stashid })
			TriggerClientEvent("dust_vault:server:delvault", _source, pos)
		else
			return
		end
	end
end)