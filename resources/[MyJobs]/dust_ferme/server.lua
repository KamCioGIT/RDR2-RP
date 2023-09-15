RedEM = exports["redem_roleplay"]:RedEM()


data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('fermier:askjob')
AddEventHandler('fermier:askjob', function()
	local _source = source
	local job = RedEM.GetPlayer(_source).job
	local jobgrade = RedEM.GetPlayer(_source).jobgrade
	TriggerClientEvent("fermier:CheckPlayerJob", _source, job, jobgrade)
end)

RegisterServerEvent('fermier:addble')
AddEventHandler('fermier:addble', function() 
	local _source = source
	local ItemData = data.getItem(_source, 'ble')
	local amount = math.random(4)
	ItemData.AddItem(amount)
end)


RegisterServerEvent("fermier:depStash", function()
    local _source = source
	if RedEM.GetPlayer(source).job == "fermier" then
        TriggerClientEvent("redemrp_inventory:OpenStash", _source, "dep_fermier", 3000.0)
    end
end)


RegisterServerEvent("fermier:retStash", function()
    local _source = source
	if RedEM.GetPlayer(source).jobgrade > 1 then
        TriggerClientEvent("redemrp_inventory:OpenStash", _source, "ret_fermier", 3000.0)
    end
end)


RegisterServerEvent("CheckStash", function()
	local depstashW = exports.redemrp_inventory.GetStashWeight(source, "dep_fermier")
	local retstashW = exports.redemrp_inventory.GetStashWeight(source, "ret_fermier")
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstash", "ble", 2, {}, "dep_fermier","farine", 1, {}, "ret_fermier")
	end
end)


RegisterServerEvent("fermier:RequestBossMenu", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)

	if user.job == "fermier" and user.jobgrade > 2 then
		TriggerClientEvent("fermier:OpenBossMenu", _source)	
	end
end)
