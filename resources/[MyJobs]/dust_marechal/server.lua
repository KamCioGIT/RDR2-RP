RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

RegisterServerEvent('rdr_marechal:save')
AddEventHandler('rdr_marechal:save', function(comp, id, price)
    local horseid = id
    local components = json.encode(comp)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local money = user.money
    if money >= price then
        user.RemoveMoney(price)
        MySQL.update("UPDATE stable SET `components`=@components WHERE `horseid`=@horseid", {
            components = components,
            horseid = horseid
        }, function(done)
        end)
    end
end)

RegisterServerEvent('rdr_marechal:loadcomp')
AddEventHandler('rdr_marechal:loadcomp', function(value, horseid, horse)
    local _value = value
    local _source = source

    MySQL.query('SELECT * FROM stable WHERE `horseid`=@horseid;', {
        horseid = horseid
    }, function(_comp)
        if _comp[1] then
            print(_comp[1].model)
            _model = _comp[1].model
            _comp = json.decode(_comp[1].components)
        else
            _comp = {}
        end
        
        if _comp ~= nil then
            if _value == 1 then
                TriggerClientEvent("rdr_marechal:OpenCustomMenu", _source, _value, _comp, horse, horseid, _model)
            elseif _value == 2 then
                TriggerClientEvent("rdr_marechal:OpenCustomMenu", _source, _value, _comp, horse, horseid, _model)
            end
        end
    end)
end)

AddEventHandler('rdr_marechal:retrievecomp', function(horseid, callback)
    local Callback = callback
    MySQL.query('SELECT * FROM stable WHERE `horseid`=@horseid;', {
        horseid = horseid
    }, function(comp)
        if comp[1] then
            Callback(comp[1])
        else
            Callback(false)
        end
    end)
end)

RegisterNetEvent("marechal:buy", function(item, price)
	local _source = tonumber(source)
	local user = RedEM.GetPlayer(_source)
	local ItemData = data.getItem(_source, item)
	local money = user.money
	local itemprice = price
	if money >= itemprice then
		user.RemoveMoney(itemprice)
		ItemData.AddItem(1)
	end
end)
