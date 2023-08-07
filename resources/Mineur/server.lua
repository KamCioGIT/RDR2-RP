RedEM = exports["redem_roleplay"]:RedEM()


data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

-- RegisterServerEvent('mineur:checkjob')
-- AddEventHandler('mineur:checkjob',function()
--     if RedEM.GetPlayer(source).job == "mineur" then
--         TriggerClientEvent("startMission", source)
-- 		if Player.jobgrade > 1 then
-- 			TriggerClientEvent("mineur:contremaitre", source)
-- 		end
--     end
-- end)

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

RegisterServerEvent("mineur:server:mineur:depStash", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job = RedEM.GetPlayer(source).job
	if RedEM.GetPlayer(source).job == "mineur" then
            TriggerClientEvent("redemrp_inventory:OpenStash", _source, "dep_"..job, 3000.0)
    end
end)


RegisterServerEvent("mineur:server:mineur:retStash", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job = RedEM.GetPlayer(source).job
	if RedEM.GetPlayer(source).jobgrade > "1" then
            TriggerClientEvent("redemrp_inventory:OpenStash", _source, "ret_"..job, 3000.0)
    end
end)


-- RegisterServerEvent("mineur:server:mineur:traitement", function()
-- 	for k,v in pairs(Config.Items) do
-- 		if string.find(k, args[1]) == "ferbrut" then
-- 			if string.find(k, args[]) == "ferbrut"

-- 	addItemStash(_source, "pepitefer", 1, data.meta, "dep_"..job)
-- 	removeItemStash(_source, "ferbrut", 2, data.meta, "ret_"..job)
-- end)