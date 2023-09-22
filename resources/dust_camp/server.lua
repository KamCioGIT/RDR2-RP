data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)
 
RegisterServerEvent('camp:CraftItem')
AddEventHandler('camp:CraftItem', function(itemNameStr, playerPedId)
	-- local _source = source
	-- TriggerEvent("redemrp_inventory:server:craftUsine", _source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount, {}, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount, {}, playerPedId, Config.CraftingsReceipe[itemNameStr].WorkingTime, Config.CraftingsReceipe[itemNameStr].ItemToGive, Config.CraftingsReceipe[itemNameStr].Amount, {})                                                      
	local _source = tonumber(source)
	TriggerEvent("redemrp_inventory:getData", function(Inventory)
	if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 1 then
		local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
		if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) then
			local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
			ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
		end
	if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 2 then
		local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
		local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
		if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) then
			local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
			ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
		end
	end
	end)
end)

RegisterServerEvent("camp:RequestCampMenu", function(menutype)
    local _source = source
	TriggerClientEvent("camp:OpenCampMenu", _source, menutype)
end)

----Usable items needed for crafting to work
RegisterServerEvent("RegisterUsableItem:cauldron")
AddEventHandler("RegisterUsableItem:cauldron", function(source)
    TriggerClientEvent("cookfirecauldron", source)    
end)

RegisterServerEvent("RegisterUsableItem:grill")
AddEventHandler("RegisterUsableItem:grill", function(source)
    TriggerClientEvent("cookfiregrill", source)    
end)

RegisterServerEvent("RegisterUsableItem:spit")
AddEventHandler("RegisterUsableItem:spit", function(source)
    TriggerClientEvent("cookfirespit", source)  
end)

----Meant to be used with the locker system
RegisterServerEvent("RegisterUsableItem:tent")
AddEventHandler("RegisterUsableItem:tent", function(source)
    TriggerClientEvent("lockertent", source)    
end)

RegisterServerEvent("RegisterUsableItem:petitbois")
AddEventHandler("RegisterUsableItem:petitbois", function(source)
	local _source = tonumber(source)
	TriggerEvent("redemrp_inventory:getData", function(Inventory)
		local ItemData = Inventory.getItem(_source, "petitbois")
		if ItemData.RemoveItem(5) then
			local ItemDatagive = data.getItem(_source, "spit")
			ItemDatagive.AddItem(1)
		end
	end)
end)

--- GOURDE ---- 
RegisterServerEvent("RegisterUsableItem:gourde")
AddEventHandler("RegisterUsableItem:gourde", function(source, _data)
	local _source = source
    local water = _data.meta.water
	local meta = data.meta
	TriggerClientEvent("dust_camp:getgourde", _source, water, meta)
end)