RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('usine:CraftItem')
AddEventHandler('usine:CraftItem', function(itemNameStr, playerPedId, menu)
	local _source = tonumber(source)
	TriggerEvent("redemrp_inventory:getData", function(Inventory)
	local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
	local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
	if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) then
		Citizen.CreateThread( function()
			TriggerClientEvent("usine:CraftingAction", playerPedId)
			Citizen.Wait(Config.WorkingTime * 1000)
			local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
			ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
		end)
	else 
		RedEM.Functions.NotifyRight( _source, "Vous n'avez pas les ressources nécessaire pour fabriquer cet objet", 3000)
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
    print("oui")
    local _source = tonumber(source)
    local maxCraftingItemNbr = 0
    
    local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
    local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe2Name)
    
    local rItem1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
    local rItem2Amount = tonumber(ItemData2.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe2Amount)
    
    print(rItem1Amount)
    print(rItem2Amount)

    for i = 0, rItem1Amount, 1 do 
        if not rItem2Amount >= rItem1Amount then
            print("stop count")
            maxCraftingItemNbr = i
        end
    end
    
	print(maxCraftingItemNbr)
    return maxCraftingItemNbr
end)

