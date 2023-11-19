RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


local localisation = nil
RegisterServerEvent("dust_transport:chekitem", function(type)
    local _source = tonumber(source)
    local selltable = {} 
	localisation = type
	for k, v in pairs(Config.PriceExport[localisation]) do
        local ItemData = data.getItem(_source, k)
        local ItemAmount = tonumber(ItemData.ItemAmount)
        if ItemAmount >= 1 then
            selltable[k] = v
        end
	end

	TriggerClientEvent("dust_transport:OpenExportMenu", _source, selltable)
end)

RegisterServerEvent("dust_transport:MaxRessourcesAmount", function(dataType)
    local _source = tonumber(source)
    local ItemData = data.getItem(_source, dataType)
    local ItemAmount = tonumber(ItemData.ItemAmount)
	if ItemAmount >= 1 then
		TriggerClientEvent("dust_transport:client:SetMaxAmount", _source, math.floor(ItemAmount))
	else 
		TriggerClientEvent("dust_transport:client:SetMaxAmount", _source, 0)
	end
end)

RegisterServerEvent('dust_transport:SellItem')
AddEventHandler('dust_transport:SellItem', function(itemNameStr, menu, amount)
	local _source = tonumber(source)
    local user = RedEM.GetPlayer(_source)
    local ItemData = data.getItem(_source, itemNameStr)
    local currentRealTime = os.date("*t")

    -- Vérifier si l'heure réelle est entre 19h et 01h
    if currentRealTime.hour >= 19 or currentRealTime.hour < 1 then
        if ItemData.RemoveItem(amount) then
            user.AddMoney(Config.Export[localisation][itemNameStr].price * amount)
        end
    else
        TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Exportateur", "Personne n'a l'air intéressé à cette heure...", "scoretimer_textures", "scoretimer_generic_cross", 4000)
    end
end)