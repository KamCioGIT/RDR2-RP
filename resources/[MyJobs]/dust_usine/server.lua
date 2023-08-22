RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('usine:CraftItem')
AddEventHandler('usine:CraftItem', function(itemNameStr, menu, amount)
	local _source = tonumber(source)
	TriggerEvent("redemrp_inventory:getData", function(Inventory)
	local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
	local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
	
	for i = 1, amount, 1
	do
		if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) then
			print("Item removed " .. i)
			Citizen.CreateThread(function()
				TriggerClientEvent("usine:CraftingAction", _source)
				Citizen.Wait(Config.WorkingTime)
				local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
				ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
			end)
		else 
			RedEM.Functions.NotifyRight( _source, "Vous n'avez pas les ressources nécessaire pour fabriquer cet objet", 3000)
		end
	end
	end)
end)

RegisterServerEvent("usine:RequestBossMenu", function(menutype)
    local _source = source
    local user = RedEM.GetPlayer(_source)

	if user.job == "usine" then
		TriggerClientEvent("usine:OpenBossMenu", _source, menutype)
	else
		RedEM.Functions.NotifyRight( _source, "Your job rank is invalid, contact staff!", 3000)
	end
end)

RegisterServerEvent("usine:MaxRessourcesAmount", function(dataType)
    local _source = tonumber(source)
    local maxCraftingItemNbr = 0
    
    local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
    local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe2Name)
    
    local rItem1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
    local rItem2Amount = tonumber(ItemData2.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe2Amount)
    
	if rItem1Amount >= rItem2Amount then
		hAmount = rItem1Amount
		lAmount = rItem2Amount
	else
		lAmount = rItem1Amount
		hAmount = rItem2Amount
	end

	if hAmount >= 1 and lAmount >= 1 then
		TriggerClientEvent("usine:client:SetMaxAmount", _source, math.floor(lAmount))
	else 
		print("Not the necessary items")
		TriggerClientEvent("usine:client:SetMaxAmount", _source, 0)
	end
end)

