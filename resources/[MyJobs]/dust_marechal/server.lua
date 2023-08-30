RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

RegisterServerEvent('rdr_clothes_store:Save')
AddEventHandler('rdr_clothes_store:Save', function(comp, horseid, price)
    local _horseid= horseid
    local encode = json.encode(comp)
        TriggerEvent("rdr_clothes_store:retrieveClothes", identifier, charid, function(call)
            if call then
                MySQL.update("UPDATE clothes SET `clothes`=@encode WHERE `identifier`=@identifier AND `charid`=@charid", {
                    encode = encode,
                    identifier = identifier,
                    charid = charid
                }, function(done)
                end)
            else
                MySQL.update(
                    'INSERT INTO clothes (`identifier`, `charid`, `clothes`) VALUES (@identifier, @charid, @clothes);',
                    {
                        identifier = identifier,
                        charid = charid,
                        clothes = encode
                    }, function(rowsChanged)
                    end)
            end
        end)
        if _Name then
            TriggerEvent("rdr_clothes_store:retrieveOutfits", identifier, charid, _Name, function(call)
                if call then

                    MySQL.update("UPDATE outfits SET `clothes`=@encode WHERE `identifier`=@identifier AND `charid`=@charid AND `name`=@name",
                        {
                            encode = encode,
                            identifier = identifier,
                            charid = charid,
                            name = _Name
                        }, function(done)
                        end)
                else

                    MySQL.update(
                        'INSERT INTO outfits (`identifier`, `charid`, `clothes`, `name`) VALUES (@identifier, @charid, @clothes , @name);',
                        {
                            identifier = identifier,
                            charid = charid,
                            clothes = encode,
                            name = _Name
                        }, function(rowsChanged)
                        end)
                end
            end)
        end
    else
        TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
    end
end)

