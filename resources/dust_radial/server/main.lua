RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterNetEvent('dust_radial:givemoney', function(target, amount)
    local _source = source
    local User = RedEM.GetPlayer(_source)
    local Target = RedEM.GetPlayer(target)
    local currentMoney = User.money
    local removeMoney = tonumber(amount)
    if currentMoney >= removeMoney then
        User.removeMoney(removeMoney)
        Target.addMoney(removeMoney)
		local data = {
		['Player'] = User.firstname .. ' ' .. User.lastname,
		['Log'] = 'money',
		['Title'] = "Don d'argent",
		['Message'] = 'Le joueur a donné à ``' .. Target.firstname .. ' ' .. Target.lastname .. '``\nAmount: ``' .. amount .. '``'
		}

		TriggerEvent('Boost-Logs:SendLog', _source, data)
    else
    end
end)

RegisterServerEvent("dust_radial:MaxRessourcesAmount", function(dataType)
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
		TriggerClientEvent("dust_radial:client:SetMaxAmount", _source, math.floor(lAmount))
	else 
		TriggerClientEvent("dust_radial:client:SetMaxAmount", _source, 0)
	end
end)

RegisterServerEvent('dust_radial:CraftItem')
AddEventHandler('dust_radial:CraftItem', function(itemNameStr, menu, amount)
	local _source = tonumber(source)
	local ItemData = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
	local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
	
	for i = 1, amount, 1
	do
		if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) then
			print("Item removed " .. i)
			Citizen.CreateThread(function()
				TriggerClientEvent("dust_radial:CraftingAction", _source)
				local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
				ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
			end)
		end

		Citizen.Wait(Config.WorkingTime)
	end
end)


RegisterServerEvent('dust_radial:AddItem')
AddEventHandler('dust_radial:AddItem', function(item, amount)
	print (item, amount)
	local _source = tonumber(source)
	local ItemData = data.getItem(_source, item)
	ItemData.AddItem(amount)

end)
