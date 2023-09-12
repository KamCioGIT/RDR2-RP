RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


RegisterServerEvent("RegisterUsableItem:repairkitweapon")
AddEventHandler("RegisterUsableItem:repairkitweapon", function(source)
 local _source = source
		   	local itemData = data.getItem(_source, "repairkitweapon")
	itemData.RemoveItem(1)
	TriggerClientEvent('dust_armurier:repairkitweapon', _source)
end)

RegisterServerEvent("dust_armurier:savecomp")
AddEventHandler("dust_armurier:savecomp", function()

end)

RegisterServerEvent("dust_armurier:loadweapon")
AddEventHandler("dust_armurier:loadweapon", function()

end)