RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


RegisterServerEvent("boucher:serveur:giveitem")
AddEventHandler("boucher:serveur:giveitem", function(item, amount)
	local _source = source
	local ItemData = data.getItem(_source, item)
    ItemData.AddItem(amount)               
end)