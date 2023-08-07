RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('mineur:checkjob')
AddEventHandler('mineur:checkjob',function()
    if RedEM.GetPlayer(source).job == "mineur" then
        TriggerClientEvent("startMission", source)
		if RedEM.GetPlayer(source).jobgrade > 1 then
			TriggerClientEvent("mineur:contremaitre", source)
		end
    end
end)

RegisterServerEvent('mineur:addferbrut')
AddEventHandler('mineur:addferbrut', function() 
	local _source = source
	local ItemData = data.getItem(_source, 'ferbrut')
	ItemData.AddItem(1)
end)


RegisterServerEvent('mineur:addplombbrut')
AddEventHandler('mineur:addplombbrut', function() 
	local _source = source
	local ItemData = data.getItem(_source, 'plombbrut')
	ItemData.AddItem(1)
end)

RegisterServerEvent('mineur:addcuivrebrut')
AddEventHandler('mineur:addcuivrebrut', function() 
	local _source = source
	local ItemData = data.getItem(_source, 'cuivrebrut')
	ItemData.AddItem(1)
end)

RegisterServerEvent('mineur:addcharbon')
AddEventHandler('mineur:addcharbon', function() 
	local _source = source
	local ItemData = data.getItem(_source, 'charbon')
	ItemData.AddItem(1)
end)
