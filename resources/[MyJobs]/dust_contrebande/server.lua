RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "mout", 1, {}, "dep_moo_king","moonshine", 1, {}, "ret_moo_king")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromebayou", 1, {},"dep_moo_king","moonshinebayou", 1, {}, "ret_moo_king")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "arometrappeur", 1, {},"dep_moo_king","moonshinetrappeur", 1, {}, "ret_moo_king")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromecueilleur", 1, {},"dep_moo_king","moonshinecueilleur", 1, {}, "ret_moo_king")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromeforet", 1, {},"dep_moo_king","moonshineforet", 1, {}, "ret_moo_king")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromefongique", 1, {},"dep_moo_king","moonshinefongique", 1, {}, "ret_moo_king")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromecitadin", 1, {},"dep_moo_king","moonshinecitadin", 1, {}, "ret_moo_king")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromepeignecul", 1, {},"dep_moo_king","moonshinepeignecul", 1, {}, "ret_moo_king")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromemexicain", 1, {},"dep_moo_king","moonshinemexicaine", 1, {}, "ret_moo_king")
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "mout", 1, {}, "dep_moo_guilde","moonshine", 1, {}, "ret_moo_guilde")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromebayou", 1, {},"dep_moo_guilde","moonshinebayou", 1, {}, "ret_moo_guilde")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "arometrappeur", 1, {},"dep_moo_guilde","moonshinetrappeur", 1, {}, "ret_moo_guilde")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromecueilleur", 1, {},"dep_moo_guilde","moonshinecueilleur", 1, {}, "ret_moo_guilde")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromeforet", 1, {},"dep_moo_guilde","moonshineforet", 1, {}, "ret_moo_guilde")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromefongique", 1, {},"dep_moo_guilde","moonshinefongique", 1, {}, "ret_moo_guilde")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromecitadin", 1, {},"dep_moo_guilde","moonshinecitadin", 1, {}, "ret_moo_guilde")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromepeignecul", 1, {},"dep_moo_guilde","moonshinepeignecul", 1, {}, "ret_moo_guilde")
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstashbis", "sucre", 1, {}, "aromemexicain", 1, {},"dep_moo_guilde","moonshinemexicaine", 1, {}, "ret_moo_guilde")
	end
end)


RegisterServerEvent("contrebande:RequestCampMenu", function(menutype)
    local _source = tonumber(source)
    local craftingtable = {} 
	for k, v in pairs(Config.CraftingsReceipe) do
		if v.type == menutype then
			if v.Itemtocraft == 1 then
				local ItemData = data.getItem(_source, v.ItemReceipe1Name)
				local rItem1Amount = tonumber(ItemData.ItemAmount - v.ItemReceipe1Amount)
				if rItem1Amount >= 0 then
					craftingtable[k] = v
				end
			end
			if v.Itemtocraft == 2 then
				local ItemData = data.getItem(_source, v.ItemReceipe1Name)
				local ItemData2 = data.getItem(_source, v.ItemReceipe2Name)
				local rItem1Amount = tonumber(ItemData.ItemAmount - v.ItemReceipe1Amount)
				local rItem2Amount = tonumber(ItemData2.ItemAmount - v.ItemReceipe2Amount)
				if rItem1Amount >= 0 and rItem2Amount >= 0 then
					craftingtable[k] = v
				end
			end
			if v.Itemtocraft == 3 then
				local ItemData = data.getItem(_source, v.ItemReceipe1Name)
				local ItemData2 = data.getItem(_source, v.ItemReceipe2Name)
				local ItemData3 = data.getItem(_source, v.ItemReceipe3Name)
				local rItem1Amount = tonumber(ItemData.ItemAmount - v.ItemReceipe1Amount)
				local rItem2Amount = tonumber(ItemData2.ItemAmount - v.ItemReceipe2Amount)
				local rItem3Amount = tonumber(ItemData3.ItemAmount - v.ItemReceipe3Amount)
				if rItem1Amount >= 0 and rItem2Amount >= 0 and rItem3Amount >= 0 then
					craftingtable[k] = v
				end
			end
			if v.Itemtocraft == 4 then
				local ItemData = data.getItem(_source, v.ItemReceipe1Name)
				local ItemData2 = data.getItem(_source, v.ItemReceipe2Name)
				local ItemData3 = data.getItem(_source, v.ItemReceipe3Name)
				local ItemData4 = data.getItem(_source, v.ItemReceipe4Name)
				local rItem1Amount = tonumber(ItemData.ItemAmount - v.ItemReceipe1Amount)
				local rItem2Amount = tonumber(ItemData2.ItemAmount - v.ItemReceipe2Amount)
				local rItem3Amount = tonumber(ItemData3.ItemAmount - v.ItemReceipe3Amount)
				local rItem4Amount = tonumber(ItemData3.ItemAmount - v.ItemReceipe4Amount)
				if rItem1Amount >= 0 and rItem2Amount >= 0 and rItem3Amount >= 0 and rItem4Amount >= 0 then
					craftingtable[k] = v
				end
			end
		end
	end

	TriggerClientEvent("contrebande:OpenCampMenu", _source, craftingtable, menutype)
end)

RegisterServerEvent('contrebande:CraftItem')
AddEventHandler('contrebande:CraftItem', function(itemNameStr, menu, amount)
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
				TriggerClientEvent("contrebande:CraftingAction", _source)

		Citizen.Wait(Config.WorkingTime)
	end
end)

RegisterServerEvent('contrebande:AddItem')
AddEventHandler('contrebande:AddItem', function(item, amount)
	print (item, amount)
	local _source = tonumber(source)
	local ItemData = data.getItem(_source, item)
	ItemData.AddItem(amount)

end)


RegisterServerEvent("contrebande:MaxRessourcesAmount", function(dataType)
    local _source = tonumber(source)
    
	if Config.CraftingsReceipe[dataType].Itemtocraft == 1 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		
		local rItem1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		
		if rItem1Amount >= 1 then
			TriggerClientEvent("contrebande:client:SetMaxAmount", _source, math.floor(rItem1Amount))
		else 
			TriggerClientEvent("contrebande:client:SetMaxAmount", _source, 0)
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
			TriggerClientEvent("contrebande:client:SetMaxAmount", _source, math.floor(lAmount))
		else 
			TriggerClientEvent("contrebande:client:SetMaxAmount", _source, 0)
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
			TriggerClientEvent("contrebande:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("contrebande:client:SetMaxAmount", _source, 0)
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
			TriggerClientEvent("contrebande:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("contrebande:client:SetMaxAmount", _source, 0)
		end
	end

end)



---- get le nb de graine dans le stash
RegisterServerEvent("pavot:checkstash", function(item, menudata, stash)
	local _source = source
	local ItemData = data.getItemStash(_source, stash, item)
	local ItemAmount = tonumber(ItemData.ItemAmount)
	TriggerClientEvent("pavot:client:SetMaxAmount", _source, ItemAmount)
	-- Wait(500)
	-- TriggerClientEvent("pavot:SelectBuyingAmount", item, menudata, stash)
end)

RegisterServerEvent("pavot:checksellingstash", function(stash)
	local _source = source
	local sellingtable = {} 
	for k, v in pairs (Config.ContrebandePrice) do
		local ItemData = data.getItemStash(_source, stash, k)
		local ItemAmount = tonumber(ItemData.ItemAmount)
		if ItemAmount >= 1 then
			sellingtable[k] = v
		end
	end
	TriggerClientEvent("pavot:OpenImportMenu", _source, sellingtable, stash)
end)

--- acheter
RegisterServerEvent("pavot:buyItem", function(item, amount, stash)
	local currentRealTime = os.date("*t")

    -- Vérifier si l'heure réelle est entre 19h et 01h
    if currentRealTime.hour >= 21 or currentRealTime.hour < 1 then
		local stashw = exports.redemrp_inventory.GetStashWeight(source, stash)
		local _source = tonumber(source)
		local user = RedEM.GetPlayer(_source)
		local ItemData = data.getItem(_source, item)
		local weight = ItemData.ItemInfo.weight 
		local money = user.money
		local itemprice = Config.ContrebandePrice[item].price * amount
		if stashw >= weight * amount then
			if money >= itemprice then
				user.RemoveMoney(itemprice)
				ItemData.AddItem(amount)
			end
			TriggerEvent("redemrp_inventory:server:removefromstash", item, amount, {}, stash)
		end
	end
end)
--- remove les graines

--- ajouter les graines