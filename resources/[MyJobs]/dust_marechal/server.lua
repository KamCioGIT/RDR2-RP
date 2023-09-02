RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

RegisterServerEvent('rdr_marechal:save')
AddEventHandler('rdr_marechal:save', function(comp, id)
    local horseid = id
    local components = json.encode(comp)
    MySQL.update("UPDATE stable SET `components`=@components WHERE `horseid`=@horseid", {
        components = components,
        horseid = horseid
    }, function(done)
    end)
end)

RegisterServerEvent('rdr_marechal:loadcomp')
AddEventHandler('rdr_marechal:loadcomp', function(value, horseid, horse)
    local _value = value
    local _source = source
    local _horseid = horseid

    MySQL.query('SELECT * FROM stable WHERE `horseid`=@horseid;', {
        horseid = _horseid
    }, function(_comp)
        if _comp[1] then
            _comp = json.decode(_comp[1].components)
        else
            _comp = {}
        end
        if #_comp ~= 0 then
            for i = 1, #_comp do
                _model = _comp[i].model
            end
        end
        if _comp ~= nil then
            if _value == 1 then
                print (model)
                TriggerClientEvent("rdr_marechal:OpenCustomMenu", _source, _value, _comp, horse, _horseid, _model)
            elseif _value == 2 then
                TriggerClientEvent("rdr_marechal:OpenCustomMenu", _source, _value, _comp, horse, _horseid)
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