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



RegisterServerEvent("dust_armurier:server:RequestJob", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    if user then
        TriggerClientEvent("dust_armurier:client:ReceiveJob", _source, user.GetJob(), user.GetJobGrade())
    end
end)

AddEventHandler("redemrp:playerLoaded", function(source, user)
    TriggerClientEvent("dust_armurier:client:ReceiveJob", source, user.GetJob(), user.GetJobGrade())
end)

RegisterServerEvent("testjob", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    if user then
        TriggerClientEvent("dust_armurier:client:ReceiveJob", _source, user.GetJob(), user.GetJobGrade())
    end
end)