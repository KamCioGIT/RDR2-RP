RedEM = exports["redem_roleplay"]:RedEM()

RegisterServerEvent('rdr_clothes_store:Save')
AddEventHandler('rdr_clothes_store:Save', function(Clothes, price)
    local _source = source
    local numBase0 = math.random(100, 999)
    local numBase1 = math.random(0, 999)
    local _Name = string.format("%03d%04d", numBase0, numBase1)
    local encode = json.encode(Clothes)
    local user = RedEM.GetPlayer(_source)
    local identifier = user.identifier
    local charid = user.charid
    local currentMoney = user.GetMoney()
    if currentMoney >= price then
        user.RemoveMoney(price)
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
        TriggerEvent("redemrp_inventory:createclothes", _source, _Name)

    else
        TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
    end
end)

RegisterServerEvent('rdr_clothes_store:LoadClothes')
AddEventHandler('rdr_clothes_store:LoadClothes', function(value, id, target)
    local _value = value
    local _source = source
    local _clothes = nil
    if id then 
        user = RedEM.GetPlayer(id)
    else
        user = RedEM.GetPlayer(_source)
    end
    if user then
        local identifier = user.identifier
        local charid = user.charid

        MySQL.query('SELECT * FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {
            identifier = identifier,
            charid = charid
        }, function(_clothes)
            if _clothes[1] then
                _clothes = json.decode(_clothes[1].clothes)
            else
                _clothes = {}
            end
            if _clothes ~= nil then
                if _value == 1 then
                    TriggerClientEvent("rdr_clothes_store:ApplyClothes", _source, _clothes)
                elseif _value == 2 then
                    TriggerClientEvent("rdr_clothes_store:OpenClothingMenu", _source, _clothes)
                elseif _value == 3 then
                    TriggerClientEvent("rdr_clothes_store:OpenHatMenu", _source, _clothes)
                elseif _value == 4 then
                    TriggerClientEvent("rdr_clothes_store:OpenMaskMenu", _source, _clothes)
                elseif _value == 5 then
                    for k, v in pairs(Config.Medic) do
                        if v == RedEM.GetPlayer(_source).job then
                            TriggerClientEvent("rdr_clothes_store:OpenEyesMenu", _source, _clothes, target)
                        end
                    end
                elseif _value == 6 then
                    for k, v in pairs(Config.Bijoutier) do
                        if v == RedEM.GetPlayer(_source).job then
                            TriggerClientEvent("rdr_clothes_store:OpenDBaguesMenu", _source, _clothes, target)
                            TriggerClientEvent("dust_craft_clothes:getcache", 2, _clothes)
                        end
                    end
                elseif _value == 7 then
                    for k, v in pairs(Config.Bijoutier) do
                        if v == RedEM.GetPlayer(_source).job then
                            TriggerClientEvent("rdr_clothes_store:OpenGBaguesMenu", _source, _clothes, target)
                        end
                    end
                elseif _value == 8 then
                    for k, v in pairs(Config.Bijoutier) do
                        if v == RedEM.GetPlayer(_source).job then
                            TriggerClientEvent("rdr_clothes_store:OpenAccBottesMenu", _source, _clothes, target)
                        end
                    end
                end
            end
        end)
    end
end)

RegisterServerEvent("RegisterUsableItem:clothes")
AddEventHandler("RegisterUsableItem:clothes", function(source, _data)
	local _source = source
    local id = _data.meta.id
    local user = RedEM.GetPlayer(_source)
    local identifier = user.identifier
    local charid = user.charid
    TriggerEvent('rdr_clothes_store:retrieveOutfitsclothes', id, function(call)
        if call then
            MySQL.update("UPDATE clothes SET `clothes`=@call WHERE `identifier`=@identifier AND `charid`=@charid", {
                call = call,
                identifier = identifier,
                charid = charid
            }, function(done)
            end)
            local _clothes = json.decode(call)
            TriggerClientEvent("rdr_clothes_store:clotheitem", _source, _clothes)
        end
    end)
end)


RegisterServerEvent('rdr_clothes_store:SetOutfits')
AddEventHandler('rdr_clothes_store:SetOutfits', function(name)
    local _source = source
    local _name = name
    local user = RedEM.GetPlayer(_source)
    local identifier = user.identifier
    local charid = user.charid
    TriggerEvent('rdr_clothes_store:retrieveOutfits', identifier, charid, _name, function(call)
        if call then
            MySQL.update("UPDATE clothes SET `clothes`=@call WHERE `identifier`=@identifier AND `charid`=@charid", {
                call = call,
                identifier = identifier,
                charid = charid
            }, function(done)
            end)
            TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
            TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
        end
    end)
end)
RegisterServerEvent('rdr_clothes_store:DeleteOutfit')
AddEventHandler('rdr_clothes_store:DeleteOutfit', function(name)
    local _source = source
    local _name = name
    local user = RedEM.GetPlayer(_source)
    local identifier = user.identifier
    local charid = user.charid
    MySQL.query(
        'DELETE FROM outfits  WHERE `identifier`=@identifier AND `charid`=@charid AND`name`=@name;', {
            identifier = identifier,
            charid = charid,
            name = _name
        }, function(result)
        end)
end)

RegisterServerEvent('rdr_clothes_store:getOutfits')
AddEventHandler('rdr_clothes_store:getOutfits', function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local identifier = user.identifier
    local charid = user.charid
    TriggerEvent('redemrp_db:getOutfits', identifier, charid, function(call)
        if call then
            TriggerClientEvent('rdr_clothes_store:putInTable', _source, call)
        end
    end)
end)

AddEventHandler('redemrp_db:getOutfits', function(identifier, charid, callback)
    local Callback = callback
    MySQL.query('SELECT * FROM outfits WHERE `identifier`=@identifier AND `charid`=@charid;', {
        identifier = identifier,
        charid = charid
    }, function(outfits)
        if outfits[1] then
            Callback(outfits)
        else
            Callback(false)
        end
    end)
end)

AddEventHandler('rdr_clothes_store:retrieveClothes', function(identifier, charid, callback)
    local Callback = callback
    MySQL.query('SELECT * FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {
        identifier = identifier,
        charid = charid
    }, function(clothes)
        if clothes[1] then
            Callback(clothes[1])
        else
            Callback(false)
        end
    end)
end)

AddEventHandler('rdr_clothes_store:retrieveOutfits', function(identifier, charid, name, callback)
    local Callback = callback
    MySQL.query('SELECT * FROM outfits WHERE `identifier`=@identifier AND `charid`=@charid AND `name`=@name;',
        {
            identifier = identifier,
            charid = charid,
            name = name
        }, function(clothes)
            if clothes[1] then
                Callback(clothes[1]["clothes"])
            else
                Callback(false)
            end
        end)
end)

AddEventHandler('rdr_clothes_store:retrieveOutfitsclothes', function(name, callback)
    local Callback = callback
    MySQL.query('SELECT * FROM outfits WHERE `name`=@name;',
        {
            name = name
        }, function(clothes)
            if clothes[1] then
                Callback(clothes[1]["clothes"])
            else
                Callback(false)
            end
        end)
end)

RegisterServerEvent("rdr_clothes_store:deleteClothes")
AddEventHandler("rdr_clothes_store:deleteClothes", function(charid, Callback)
    local _source = source
    local id
    for k, v in ipairs(GetPlayerIdentifiers(_source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            id = v
            break
        end
    end

    local Callback = callback
    MySQL.query('DELETE FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {
        identifier = id,
        charid = charid
    }, function(result)
        if result then
        else
        end
    end)
    MySQL.query('DELETE FROM outfits WHERE `identifier`=@identifier AND `charid`=@charid;', {
        identifier = id,
        charid = charid
    }, function(result)
        if result then
        else
        end
    end)
end)

--- chapeau
RegisterServerEvent('rdr_clothes_store:GiveHat')
AddEventHandler('rdr_clothes_store:GiveHat', function(info, price)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local currentMoney = user.GetMoney()
    if currentMoney >= price then
        user.RemoveMoney(price)
        TriggerEvent("redemrp_inventory:chapeau", _source, info)

    else
        TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
    end
end)

RegisterServerEvent("RegisterUsableItem:chapeau")
AddEventHandler("RegisterUsableItem:chapeau", function(source, _data)
	local _source = source
    local model = _data.meta.model
    local texture = _data.meta.texture
    TriggerClientEvent("redemrp_clothes_store:puthat", _source, model, texture)
end)


--- masques

RegisterServerEvent('rdr_clothes_store:GiveMask')
AddEventHandler('rdr_clothes_store:GiveMask', function(info, price)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local currentMoney = user.GetMoney()
    if currentMoney >= price then
        user.RemoveMoney(price)
        TriggerEvent("redemrp_inventory:masque", _source, info)

    else
        TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
    end
end)

RegisterServerEvent("RegisterUsableItem:masque")
AddEventHandler("RegisterUsableItem:masque", function(source, _data)
	local _source = source
    local model = _data.meta.model
    local texture = _data.meta.texture
    TriggerClientEvent("redemrp_clothes_store:putMask", _source, model, texture)
end)

--- eyes

RegisterServerEvent('rdr_clothes_store:GiveEyes')
AddEventHandler('rdr_clothes_store:GiveEyes', function(info, price)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local currentMoney = user.GetMoney()
    if currentMoney >= price then
        user.RemoveMoney(price)
        TriggerEvent("redemrp_inventory:lunettes", _source, info)

    else
        TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
    end
end)

RegisterServerEvent("RegisterUsableItem:lunettes")
AddEventHandler("RegisterUsableItem:lunettes", function(source, _data)
	local _source = source
    local model = _data.meta.model
    local texture = _data.meta.texture
    TriggerClientEvent("redemrp_clothes_store:putEyes", _source, model, texture)
end)

--- bijoux D

RegisterServerEvent('rdr_clothes_store:GiveDBagues')
AddEventHandler('rdr_clothes_store:GiveDBagues', function(info, price)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local currentMoney = user.GetMoney()
    if currentMoney >= price then
        user.RemoveMoney(price)
        TriggerEvent("redemrp_inventory:DBagues", _source, info)

    else
        TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
    end
end)

RegisterServerEvent("RegisterUsableItem:DBagues")
AddEventHandler("RegisterUsableItem:DBagues", function(source, _data)
	local _source = source
    local model = _data.meta.model
    local texture = _data.meta.texture
    TriggerClientEvent("redemrp_clothes_store:putDBagues", _source, model, texture)
end)

--- bijoux G

RegisterServerEvent('rdr_clothes_store:GiveGBagues')
AddEventHandler('rdr_clothes_store:GiveGBagues', function(info, price)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local currentMoney = user.GetMoney()
    if currentMoney >= price then
        user.RemoveMoney(price)
        TriggerEvent("redemrp_inventory:GBagues", _source, info)

    else
        TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
    end
end)

RegisterServerEvent("RegisterUsableItem:GBagues")
AddEventHandler("RegisterUsableItem:GBagues", function(source, _data)
	local _source = source
    local model = _data.meta.model
    local texture = _data.meta.texture
    TriggerClientEvent("redemrp_clothes_store:putGBagues", _source, model, texture)
end)


--- acc bottes

RegisterServerEvent('rdr_clothes_store:GiveAccBottes')
AddEventHandler('rdr_clothes_store:GiveAccBottes', function(info, price)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local currentMoney = user.GetMoney()
    if currentMoney >= price then
        user.RemoveMoney(price)
        TriggerEvent("redemrp_inventory:accbottes", _source, info)

    else
        TriggerClientEvent("redemrp_skin:LoadSkinClient", _source)
    end
end)

RegisterServerEvent("RegisterUsableItem:accbottes")
AddEventHandler("RegisterUsableItem:accbottes", function(source, _data)
	local _source = source
    local model = _data.meta.model
    local texture = _data.meta.texture
    TriggerClientEvent("redemrp_clothes_store:putAccBottes", _source, model, texture)
end)




RegisterServerEvent("dust_craft_clothes:askprevisu", function(value, type, target)
    TriggerClientEvent("dust_craft_clothes:previsu", 2, value, type, target)
end)