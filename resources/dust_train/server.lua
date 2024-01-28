local gumCore = {}
TriggerEvent("getCore",function(core)
	gumCore = core
end)
	
data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

gum = exports.gum_core:gumAPI()


local station_table = {}
local trainId = {}
local stationTrain = {}
RegisterServerEvent('gum_train:set_station')
AddEventHandler('gum_train:set_station', function(table, route)
	local _source = source
	print("CREATE : ", route, table)
	station_table[tonumber(route)] = table
end)

RegisterServerEvent('gum_train:check')
AddEventHandler('gum_train:check', function()
	local _source = source
	TriggerClientEvent('gum_train:send_route', tonumber(_source), station_table)
end)

RegisterServerEvent("gum_station:train_start")
AddEventHandler("gum_station:train_start", function(route, train)
	local _source = source
	if station_table[route] == nil then
		stationTrain[_source] = route 
		TriggerClientEvent("gum_station:train_start", _source, route, price)
	end
end)

RegisterServerEvent("gum_station:train_clean")
AddEventHandler("gum_station:train_clean", function(route)
	local _source = source
	stationTrain[_source] = nil 
	station_table[route] = nil
end)


RegisterServerEvent('gum_train:openMenu')
AddEventHandler('gum_train:openMenu', function()
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local job = Character.job
	if job == "TrainDriver" then
		TriggerClientEvent("gum_train:openMenu", _source)
	else
		TriggerClientEvent("gum_notify:notify", _source, "Vlaky", "Správu vlaků může otevřít pouze strojvedoucí.", "train", 3000)
	end
end)

RegisterServerEvent('gum_train:give_money')
AddEventHandler('gum_train:give_money', function(money)
	local _source = source
	local User = gumCore.getUser(source)
	local Character = User.getUsedCharacter
    Character.addCurrency(tonumber(_source), 0, tonumber(money))
	TriggerClientEvent("gum_notify:notify", _source, "Vlaky", "Za tuhle zastávku jsi dostal : "..money.."$", "train", 3000)
end)

RegisterServerEvent('gum_train:giveBackTrain')
AddEventHandler('gum_train:giveBackTrain', function(state)
	local _source = source
	TriggerClientEvent('gum_train:giveBackTrain', -1, state)
end)
RegisterServerEvent('gum_station:train_id')
AddEventHandler('gum_station:train_id', function(entity)
	trainId[source] = entity
end)

AddEventHandler('playerDropped', function (reason)
	if trainId[source] ~= nil then
		DeleteEntity(NetworkGetEntityFromNetworkId(trainId[source]))
		trainId[source] = nil
		station_table[stationTrain[source]] = nil
	end
end)