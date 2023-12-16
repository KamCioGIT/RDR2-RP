RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('tabac:CraftItem')
AddEventHandler('tabac:CraftItem', function(itemNameStr, menu, amount)
	local _source = tonumber(source)
	
	for i = 1, amount, 1 do
		TriggerEvent("redemrp_inventory:getData", function(Inventory)
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 1 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 2 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 3 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
				local ItemData3 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe3Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) and ItemData3.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe3Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 4 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
				local ItemData3 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe3Name)
				local ItemData4 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe4Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) and ItemData3.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe3Amount) and ItemData4.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe4Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 5 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
				local ItemData3 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe3Name)
				local ItemData4 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe4Name)
				local ItemData5 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe5Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) and ItemData3.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe3Amount) and ItemData4.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe4Amount) and ItemData5.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe5Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
		end)
		TriggerClientEvent("tabac:CraftingAction", _source)

		Citizen.Wait(Config.WorkingTime)
	end
end)

RegisterServerEvent('tabac:AddItem')
AddEventHandler('tabac:AddItem', function(item, amount)
	print (item, amount)
	local _source = tonumber(source)
	local ItemData = data.getItem(_source, item)
	ItemData.AddItem(amount)

end)


RegisterServerEvent("tabac:MaxRessourcesAmount", function(dataType)
    local _source = tonumber(source)
    
	if Config.CraftingsReceipe[dataType].Itemtocraft == 1 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		
		local rItem1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		
		if rItem1Amount >= 1 then
			TriggerClientEvent("tabac:client:SetMaxAmount", _source, math.floor(rItem1Amount))
		else 
			TriggerClientEvent("tabac:client:SetMaxAmount", _source, 0)
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
			TriggerClientEvent("tabac:client:SetMaxAmount", _source, math.floor(lAmount))
		else 
			TriggerClientEvent("tabac:client:SetMaxAmount", _source, 0)
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
			TriggerClientEvent("tabac:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("tabac:client:SetMaxAmount", _source, 0)
		end
	elseif Config.CraftingsReceipe[dataType].Itemtocraft == 4 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe2Name)
		local ItemData3 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe3Name)
		local ItemData4 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe4Name)
		
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
			TriggerClientEvent("tabac:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("tabac:client:SetMaxAmount", _source, 0)
		end
	end

end)




local pricetable = {}

Citizen.CreateThread(function()
	for item, v in pairs(Config.Sell) do
		pricetable[item] = math.random(v.pricelow ,v.pricehigh)/100
	end
	while true do
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstash", "tabachumide", 1, {},"dep_tabac","tabacsec", 1, {}, "ret_tabac")
	end
end)

RegisterServerEvent('tabac:askpricetable')
AddEventHandler('tabac:askpricetable', function() 
	local _source = source
	Wait(1000)
	TriggerClientEvent("tabac:getpricetable", _source, pricetable)
end)



RegisterServerEvent('tabac:addtabac')
AddEventHandler('tabac:addtabac', function() 
	local _source = source
	local ItemData = data.getItem(_source, 'tabachumide')
	local amount = math.random(2)
	ItemData.AddItem(amount)
end)

RegisterServerEvent("tabac:MaxSellingAmount", function(dataType)
    local _source = tonumber(source)
    local ItemData = data.getItem(_source, dataType)
    local ItemAmount = tonumber(ItemData.ItemAmount)
	if ItemAmount >= 1 then
		TriggerClientEvent("tabac:client:SetMaxAmount", _source, math.floor(ItemAmount))
	else 
		TriggerClientEvent("tabac:client:SetMaxAmount", _source, 0)
	end
end)

RegisterServerEvent('tabac:SellItem')
AddEventHandler('tabac:SellItem', function(itemNameStr, menu, amount, localisation)
	local _source = tonumber(source)
    local user = RedEM.GetPlayer(_source)
    local ItemData = data.getItem(_source, itemNameStr)
	if ItemData.RemoveItem(amount) then
		user.AddMoney(pricetable[itemNameStr] * amount)
		TriggerEvent("redemrp_inventory:server:additemstash", itemNameStr, amount, {}, "npc_tabac")
	end
end)



--- achat

RegisterServerEvent("tabac:checkstash", function(item, menudata, stash)
	local _source = source
	local ItemData = data.getItemStash(_source, stash, item)
	local ItemAmount = tonumber(ItemData.ItemAmount)
	TriggerClientEvent("tabac:client:SetMaxAmount", _source, ItemAmount)
	-- Wait(500)
	-- TriggerClientEvent("tabac:SelectBuyingAmount", item, menudata, stash)
end)

RegisterServerEvent("tabac:checksellingstash", function(stash)
	local _source = source
	local sellingtable = {} 
	for k, v in pairs (Config.Buy) do
		local ItemData = data.getItemStash(_source, stash, k)
		local ItemAmount = tonumber(ItemData.ItemAmount)
		if ItemAmount >= 1 then
			sellingtable[k] = v
		end
	end
	TriggerClientEvent("tabac:OpenBuyingMenu", _source, sellingtable, stash)
end)

--- acheter
RegisterServerEvent("tabac:buyItem", function(item, amount, stash)
	local currentRealTime = os.date("*t")

    -- Vérifier si l'heure réelle est entre 19h et 01h
	local stashw = exports.redemrp_inventory.GetStashWeight(source, stash)
	local _source = tonumber(source)
	local user = RedEM.GetPlayer(_source)
	local ItemData = data.getItem(_source, item)
	local weight = ItemData.ItemInfo.weight 
	local money = user.money
	local itemprice = Config.Buy[item].price * amount
	if stashw >= weight * amount then
		if money >= itemprice then
			user.RemoveMoney(itemprice)
			ItemData.AddItem(amount)
			TriggerEvent("redemrp_inventory:server:removefromstash", item, amount, {}, stash)
		end
		
	end
end)
