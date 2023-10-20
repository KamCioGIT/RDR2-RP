RedEM = exports["redem_roleplay"]:RedEM()


data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


RegisterServerEvent("RegisterUsableItem:tenueevent")
AddEventHandler("RegisterUsableItem:tenueevent", function(source, data)
	local _source = source
	local id = data.meta.id
	TriggerClientEvent("dust_event:clothes", _source, id)
end)