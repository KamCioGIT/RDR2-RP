RedEM = exports["redem_roleplay"]:RedEM()


data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('mineur:additem')
AddEventHandler('mineur:additem', function(item, amount) 
	local _source = source
	local ItemData = data.getItem(_source, item)
	ItemData.AddItem(amount)
end)


RegisterServerEvent("mineur:server:mineur:depStash", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job = RedEM.GetPlayer(source).job
	if RedEM.GetPlayer(source).job == "mineur" then
        TriggerClientEvent("redemrp_inventory:OpenStash", _source, "dep_"..job, 3000.0)
    end
end)


RegisterServerEvent("mineur:server:mineur:retStash", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job = RedEM.GetPlayer(_source).job
	if tonumber(RedEM.GetPlayer(source).jobgrade) > 1 then
        TriggerClientEvent("redemrp_inventory:OpenStash", _source, "ret_"..job, 3000.0)
    end
end)



RegisterServerEvent("CheckStash", function()
	local depstashW = exports.redemrp_inventory.GetStashWeight(source, "dep_mineur")
	local retstashW = exports.redemrp_inventory.GetStashWeight(source, "ret_mineur")
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstash", "ferbrut", 1, {}, "dep_mineur","ferpepite", 3, {}, "ret_mineur")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstash", "cuivrebrut", 1, {}, "dep_mineur","cuivrepepite", 3, {}, "ret_mineur")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstash", "plombbrut", 1, {}, "dep_mineur","plombpepite", 3, {}, "ret_mineur")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstash", "zincbrut", 1, {}, "dep_mineur","zincpepite", 3, {}, "ret_mineur")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstash", "charbonbrut", 1, {}, "dep_mineur","charbon", 3, {}, "ret_mineur")
	end
end)


RegisterServerEvent("mineur:RequestBossMenu", function()
	print('RequestBossMenu')
    local _source = source
    local user = RedEM.GetPlayer(_source)

	if user.job == "mineur" and user.jobgrade > 2 then
		TriggerClientEvent("mineur:OpenBossMenu", _source)	
	else
		RedEM.Functions.NotifyRight( _source, "Your job rank is too low!", 3000)
	end
end)



RegisterServerEvent("mineur:MaxRessourcesAmount", function(dataType)
    local _source = tonumber(source)
    
	if Config.CraftingsReceipe[dataType].Itemtocraft == 1 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		
		local rItem1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		
		if rItem1Amount >= 1 then
			TriggerClientEvent("mineur:client:SetMaxAmount", _source, math.floor(rItem1Amount))
		else 
			TriggerClientEvent("mineur:client:SetMaxAmount", _source, 0)
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
			TriggerClientEvent("mineur:client:SetMaxAmount", _source, math.floor(lAmount))
		else 
			TriggerClientEvent("mineur:client:SetMaxAmount", _source, 0)
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
			TriggerClientEvent("mineur:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("mineur:client:SetMaxAmount", _source, 0)
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
			TriggerClientEvent("mineur:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("mineur:client:SetMaxAmount", _source, 0)
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
		TriggerEvent("redemrp_inventory:server:removeitemstash", "mineurhumide", 1, {},"dep_mineur","mineursec", 1, {}, "ret_mineur")
	end
end)

RegisterServerEvent('mineur:askpricetable')
AddEventHandler('mineur:askpricetable', function() 
	local _source = source
	Wait(1000)
	TriggerClientEvent("mineur:getpricetable", _source, pricetable)
end)



RegisterServerEvent('mineur:addmineur')
AddEventHandler('mineur:addmineur', function() 
	local _source = source
	local ItemData = data.getItem(_source, 'mineurhumide')
	local amount = math.random(2)
	ItemData.AddItem(amount)
end)

RegisterServerEvent("mineur:MaxSellingAmount", function(dataType)
    local _source = tonumber(source)
    local ItemData = data.getItem(_source, dataType)
    local ItemAmount = tonumber(ItemData.ItemAmount)
	if ItemAmount >= 1 then
		TriggerClientEvent("mineur:client:SetMaxAmount", _source, math.floor(ItemAmount))
	else 
		TriggerClientEvent("mineur:client:SetMaxAmount", _source, 0)
	end
end)

RegisterServerEvent('mineur:SellItem')
AddEventHandler('mineur:SellItem', function(itemNameStr, menu, amount, localisation)
	local _source = tonumber(source)
    local user = RedEM.GetPlayer(_source)
    local ItemData = data.getItem(_source, itemNameStr)
	if ItemData.RemoveItem(amount) then
		user.AddMoney(pricetable[itemNameStr] * amount)
		TriggerEvent("redemrp_inventory:server:additemstash", itemNameStr, amount, {}, "dep_mineur")
	end
end)



--- achat

RegisterServerEvent("mineur:checkstash", function(item, menudata, stash)
	local _source = source
	local ItemData = data.getItemStash(_source, stash, item)
	local ItemAmount = tonumber(ItemData.ItemAmount)
	TriggerClientEvent("mineur:client:SetMaxAmount", _source, ItemAmount)
	-- Wait(500)
	-- TriggerClientEvent("mineur:SelectBuyingAmount", item, menudata, stash)
end)

RegisterServerEvent("mineur:checksellingstash", function(stash)
	local _source = source
	local sellingtable = {} 
	for k, v in pairs (Config.Buy) do
		local ItemData = data.getItemStash(_source, stash, k)
		local ItemAmount = tonumber(ItemData.ItemAmount)
		if ItemAmount >= 1 then
			sellingtable[k] = v
		end
	end
	TriggerClientEvent("mineur:OpenBuyingMenu", _source, sellingtable, stash)
end)

--- acheter
RegisterServerEvent("mineur:buyItem", function(item, amount, stash)
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
			if ItemData.AddItem(amount) then
				user.RemoveMoney(itemprice)
				TriggerEvent("redemrp_inventory:server:removefromstash", item, amount, {}, stash)
			end
		end
		
	end
end)
