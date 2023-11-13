RedEM = exports["redem_roleplay"]:RedEM()

RegisterServerEvent('rdr_creator:SaveSkin', function(skin)
    local _source = source
    local encode = json.encode(skin)
    local user = RedEM.GetPlayer(_source)
    if user then
        MySQL.query("SELECT * FROM skins WHERE `identifier`=@identifier AND `charid`=@charid;", {identifier = user.identifier, charid = user.charid}, function(skins)
            if skins[1] then
                MySQL.update("UPDATE skins SET `skin`=@skin WHERE `identifier`=@identifier AND `charid`=@charid", {skin = encode, identifier = user.identifier, charid = user.charid})
            else
                MySQL.update("INSERT INTO skins (`identifier`, `charid`, `skin`) VALUES (@identifier, @charid, @skin);", { identifier = user.identifier, charid = user.charid, skin = encode })
            end
        end)
    end
end)

RegisterServerEvent("rdr_creator:server:TryCreator", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)    
    if user then
        if user.money >= 30 then
            user.RemoveMoney(30)
            TriggerClientEvent("rdr_creator:OpenCreator",_source)
        end
    end
end)

RegisterServerEvent('rdr_creator:SaveHair', function(cache)
    local _source = source
    local user = RedEM.GetPlayer(_source)    
    if user then
        MySQL.query("SELECT * FROM skins WHERE `identifier`=@identifier AND `charid`=@charid;", {identifier = user.identifier, charid = user.charid}, function(skins)
            if skins[1] then
                local skin = skins[1].skin
                if skin then
                    local decoded = json.decode(skin)
                    decoded.hair = cache.hair
                    decoded.beard = cache.beard
                    decoded.shadows_t = cache.shadows_t
                    decoded.shadows_op = cache.shadows_op
                    decoded.shadows_id = cache.shadows_id
                    decoded.shadows_c1 = cache.shadows_c1
                    decoded.blush_t = cache.blush_t
                    decoded.blush_op = cache.blush_op
                    decoded.blush_id = cache.blush_id
                    decoded.blush_c1 = cache.blush_c1
                    decoded.lipsticks_t = cache.lipsticks_t
                    decoded.lipsticks_op = cache.lipsticks_op
                    decoded.lipsticks_id = cache.lipsticks_id
                    decoded.lipsticks_c1 = cache.lipsticks_c1
                    decoded.lipsticks_c2 = cache.lipsticks_c2
                    decoded.eyeliners_t = cache.eyeliners_t
                    decoded.eyeliners_op = cache.eyeliners_op
                    decoded.eyeliners_id = cache.eyeliners_id
                    decoded.eyeliners_c1 = cache.eyeliners_c1
                    MySQL.update("UPDATE skins SET `skin`=@skin WHERE `identifier`=@identifier AND `charid`=@charid", {skin = json.encode(decoded), identifier = user.identifier, charid = user.charid})
                end
            end
        end)
    end
end)

RegisterServerEvent('RedEM:server:LoadSkin', function(isCommand)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    if user then
        MySQL.query("SELECT * FROM skins WHERE `identifier`=@identifier AND `charid`=@charid;", {identifier = user.identifier, charid = user.charid}, function(skins)
            if skins[1] then
                local skin = skins[1].skin
                local decoded = json.decode(skin)
                if isCommand then
                    TriggerClientEvent("RedEM:client:ApplySkinCommand", _source, decoded)
                else
                    TriggerClientEvent("RedEM:client:ApplySkin", _source, decoded)
                end
            else
                TriggerClientEvent("rdr_creator:OpenCreator",_source)
            end
        end)
    end
end)

RegisterServerEvent('rdr_creator:SetPlayerBucket', function(b)
    SetPlayerRoutingBucket(source, b)
end)

RegisterServerEvent("RedEM:server:DeleteSkin", function(charid)
    local _source = source
    local id = RedEM.Functions.GetIdentifier(_source, "steam")
    MySQL.query("DELETE FROM skins WHERE `identifier`=@identifier AND `charid`=@charid;", {identifier = id, charid = charid})
end)
