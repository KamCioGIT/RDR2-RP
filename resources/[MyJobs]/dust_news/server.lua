
local data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
	data = call
end)

if Config.ImageUi then
	for k,v in pairs(Config.Newspapers) do
		RegisterServerEvent("RegisterUsableItem:"..k.."")
		AddEventHandler("RegisterUsableItem:"..k.."", function(source)
			local _source = source
			TriggerClientEvent('redemrp_inventory:close_inventory', _source) 
			Citizen.Wait(0)
			TriggerClientEvent('gum_newspapers:newspapers', _source, v) 
		end)
	end
end

if Config.LinkWebsite then
	for k,v in pairs(Config.Newspapers2) do
		RegisterServerEvent("RegisterUsableItem:"..k.."")
		AddEventHandler("RegisterUsableItem:"..k.."", function(source)
			local _source = source
			TriggerClientEvent('redemrp_inventory:close_inventory', _source) 
			Citizen.Wait(0)
			TriggerClientEvent("gum_newspapers:newspapers", _source, v)
		end)
	end
end
