RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

RegisterServerEvent('rdr_marechal:save')
AddEventHandler('rdr_marechal:save', function(comp, horseid)
    local _horseid= horseid
    print (comp)
    local _comp = json.encode(comp)
    TriggerEvent("rdr_marechal:retrievecomp", _horseid, function(call)
        if call then
            MySQL.update("UPDATE stable SET `components`=@_comp WHERE `horseid`=@_horseid", {
                _comp = _comp,
                _horseid = _horseid
            }, function(done)
            end)
        else
            MySQL.update(
                'INSERT INTO stable (`components`) VALUES (@_comp);',
                {
                    _comp = _comp,
                    _horseid = _horseid
                }, function(rowsChanged)
                end)
        end
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
        if _comp ~= nil then
            if _value == 1 then
                TriggerClientEvent("rdr_marechal:ApplyComp", _source, _comp, horse)
            elseif _value == 2 then
                TriggerClientEvent("rdr_marechal:OpenCustomMenu", _source, _comp, horse)
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