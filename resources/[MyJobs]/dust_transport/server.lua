RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)



RegisterServerEvent("dust_transport:chekitem", function(type)
    local _source = tonumber(source)
    local selltable = {} 
	for k, v in pairs(Config.PriceExport[type]) do
        local ItemData = data.getItem(_source, k)
        local ItemAmount = tonumber(ItemData.ItemAmount)
        if ItemAmount >= 1 then
            selltable[k] = v
        end
	end

	TriggerClientEvent("dust_transport:OpenExportMenu", _source, selltable)
end)