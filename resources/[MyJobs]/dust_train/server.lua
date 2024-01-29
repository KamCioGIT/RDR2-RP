RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

---- vendre 




RegisterServerEvent("dust_train:askitemneed", function()
    local _source = tonumber(source)
    local needtable = {} 
	for k, v in pairs(Config.Gare) do
		for item, properties in pairs(v.itemneeded) do
			needtable[k] = {[item] = properties}
        end
	end
	TriggerClientEvent("dust_train:sell:OpenNeedMenu", _source, needtable)
end)

local localisation = nil
RegisterServerEvent("dust_train:sell:chekitem", function(type)
    local _source = tonumber(source)
    local selltable = {} 
	localisation = type
	for k, v in pairs(Config.Gare[localisation].itemneeded) do
		print (k, v)
        local ItemData = data.getItem(_source, k)
        local ItemAmount = tonumber(ItemData.ItemAmount)
        if ItemAmount >= 1 then
            selltable[k] = v
        end
	end

	TriggerClientEvent("dust_train:sell:OpenExportMenu", _source, selltable)
end)

RegisterServerEvent("dust_train:sell:MaxRessourcesAmount", function(dataType)
    local _source = tonumber(source)
    local ItemData = data.getItem(_source, dataType)
    local ItemAmount = tonumber(ItemData.ItemAmount)
	if ItemAmount >= 1 then
		TriggerClientEvent("dust_train:sell:client:SetMaxAmount", _source, math.floor(ItemAmount))
	else 
		TriggerClientEvent("dust_train:sell:client:SetMaxAmount", _source, 0)
	end
end)

RegisterServerEvent('dust_train:sell:SellItem')
AddEventHandler('dust_train:sell:SellItem', function(itemNameStr, menu, amount)
	local _source = tonumber(source)
    local user = RedEM.GetPlayer(_source)
    local ItemData = data.getItem(_source, itemNameStr)
    local currentRealTime = os.date("*t")

    -- Vérifier si l'heure réelle est entre 19h et 01h
    if currentRealTime.hour >= 21 or currentRealTime.hour < 1 then
        if ItemData.RemoveItem(amount) then
            user.AddMoney(Config.Gare[localisation].need[itemNameStr].price * amount)
        end
    else
        TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Exportateur", "Personne n'a l'air intéressé à cette heure...", "scoretimer_textures", "scoretimer_generic_cross", 4000)
    end
end)

---- envoie des prix au client
RegisterServerEvent("dust_train:checksellingstash", function(gare)
	local _source = source
	local sellingtable = {}
	local stash = "gare_"..gare
	for k, v in pairs (Config.Gare[gare].sell) do
		local ItemData = data.getItemStash(_source, stash, k)
		local ItemAmount = tonumber(ItemData.ItemAmount)
		if ItemAmount >= 1 then
			sellingtable[k] = v
		end
	end
	TriggerClientEvent("dust_train:OpenImportMenu", _source, sellingtable, gare)
end)

RegisterServerEvent("dust_train:checkstash", function(item, menudata, gare)
	local _source = source
	local ItemData = data.getItemStash(_source, "gare_"..gare, item)
	local ItemAmount = tonumber(ItemData.ItemAmount)
	TriggerClientEvent("dust_train:SetMaxAmount", _source, ItemAmount)
end)

RegisterServerEvent("dust_train:buyItem", function(item, amount, gare)
	local currentRealTime = os.date("*t")

    -- Vérifier si l'heure réelle est entre 19h et 01h
    if currentRealTime.hour >= 21 or currentRealTime.hour < 23 then
		local stashw = exports.redemrp_inventory.GetStashWeight(source, "gare_"..gare)
		local _source = tonumber(source)
		local user = RedEM.GetPlayer(_source)
		local ItemData = data.getItem(_source, item)
		local weight = ItemData.ItemInfo.weight 
		local money = user.money
		local itemprice = Config.Gare[gare].sell[item].price * amount
		if stashw >= weight * amount then
			if money >= itemprice then
				user.RemoveMoney(itemprice)
				ItemData.AddItem(amount)
			end
			TriggerEvent("redemrp_inventory:server:removefromstash", item, amount, {}, "gare_"..gare)
		end
	end
end)

---- roll du loot et need à chaque reboot
Citizen.CreateThread(function()
    for k, v in pairs(Config.Gare) do 
        TriggerEvent("redemrp_inventory:server:wipestash", "gare_"..k)
        Wait(500)
        for item, properties in pairs(v.sell) do
            local chance = math.random(100)
            if chance <= properties.chance then
				local amount = math.random(properties.amountmin, properties.amountmax)
                TriggerEvent("redemrp_inventory:server:additemstash", item, amount, {}, "gare_"..k)
				local price = math.random(properties.pricemin, properties.pricemax)
				properties.price = price
            end
            Wait(100)
        end

		-- Obtenez toutes les clés de la table need
		local keys = {}
		for key, _ in pairs(v.need) do
			table.insert(keys, key)
		end

		-- Choisissez une clé aléatoire parmi les clés
		local randomKeyIndex = math.random(#keys)
		local randomKey = keys[randomKeyIndex]

		-- Utilisez la clé aléatoire pour accéder aux propriétés
		local item = v.need[randomKey]

		-- Choisissez un prix aléatoire entre pricemin et pricemax
		local randomPrice = math.random(item.pricemin, item.pricemax)
		Config.Gare[k].itemneeded = {[randomKey] = {price = randomPrice, label=item.label}}
    end
end)
