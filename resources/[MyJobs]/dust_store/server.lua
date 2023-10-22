RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('store:CraftItem')
AddEventHandler('store:CraftItem', function(itemNameStr, menu, amount)
	local _source = tonumber(source)
	local ItemData = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
	local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
	
	for i = 1, amount, 1
	do
		if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) then
			print("Item removed " .. i)
			Citizen.CreateThread(function()
				TriggerClientEvent("store:CraftingAction", _source)
				local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
				ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
			end)
		end

		Citizen.Wait(Config.WorkingTime)
	end
end)

RegisterServerEvent('store:AddItem')
AddEventHandler('store:AddItem', function(item, amount)
	local _source = tonumber(source)
	local ItemData = data.getItem(_source, item)
	ItemData.AddItem(amount)

end)


RegisterServerEvent("store:MaxRessourcesAmount", function(dataType)
    local _source = tonumber(source)
    
	if Config.CraftingsReceipe[dataType].Itemtocraft == 1 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		
		local rItem1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		
		if rItem1Amount >= 1 then
			TriggerClientEvent("store:client:SetMaxAmount", _source, math.floor(rItem1Amount))
		else 
			TriggerClientEvent("store:client:SetMaxAmount", _source, 0)
		end
	elseif Config.CraftingsReceipe[dataType].Itemtocraft == 2 then
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
			TriggerClientEvent("store:client:SetMaxAmount", _source, math.floor(lAmount))
		else 
			TriggerClientEvent("store:client:SetMaxAmount", _source, 0)
		end
	elseif Config.CraftingsReceipe[dataType].Itemtocraft == 3 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe2Name)
		local ItemData3 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe3Name)
		
		local Item1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		local Item2Amount = tonumber(ItemData2.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe2Amount)
		local Item3Amount = tonumber(ItemData3.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe3Amount)

		local lAmount = Item1Amount
		if Item2Amount < lAmount then
			lAmount = Item2Amount
		end
		if Item3Amount < lAmount then
			lAmount = Item3Amount
		end
		if Item1Amount >= 1 and Item2Amount >= 1 and Item3Amount >= 1 then
			TriggerClientEvent("store:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("store:client:SetMaxAmount", _source, 0)
		end
	elseif Config.CraftingsReceipe[dataType].Itemtocraft == 4 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe2Name)
		local ItemData3 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe3Name)
		local ItemData4 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe3Name)
		
		local Item1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		local Item2Amount = tonumber(ItemData2.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe2Amount)
		local Item3Amount = tonumber(ItemData3.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe3Amount)
		local Item4Amount = tonumber(ItemData4.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe4Amount)

		local lAmount = Item1Amount
		if Item2Amount < lAmount then
			lAmount = Item2Amount
		end
		if Item3Amount < lAmount then
			lAmount = Item3Amount
		end
		if Item4Amount < lAmount then
			lAmount = Item4Amount
		end
		if Item1Amount >= 1 and Item2Amount >= 1 and Item3Amount >= 1 and Item4Amount >= 1 then
			TriggerClientEvent("store:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("store:client:SetMaxAmount", _source, 0)
		end
	end

end)


RegisterNetEvent("store:buypain", function(item, price)
	local _source = tonumber(source)
	local user = RedEM.GetPlayer(_source)
	local ItemData = data.getItem(_source, item)
	local money = user.money
	local itemprice = price
	if money >= itemprice then
		user.RemoveMoney(price)
		ItemData.AddItem(1)
	end
end)

