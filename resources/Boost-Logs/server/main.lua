function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }
    identifiers.discord = RedEM.Functions.GetIdentifier(src, "discord")
    identifiers.steam = RedEM.Functions.GetIdentifier(src, "steam")
    identifiers.ip = RedEM.Functions.GetIdentifier(src, "ip")
    identifiers.license = RedEM.Functions.GetIdentifier(src, "license")

    return identifiers
end

function GenerateEmbed(source,data)
    local _source
    if data['Player'] ~= nil then
        _source = data['Player']
    else
        _source = source
    end
    local embed = {}
    if data['Target'] ~= nil then
        local srcIds = ExtractIdentifiers(_source)
        local trgIds = ExtractIdentifiers(data['Target'])
        local srcSteamSub = srcIds.steam:gsub("steam:", "")
        local trgSteamSub = trgIds.steam:gsub("steam:", "")
        local srcSteam = tostring(tonumber(srcSteamSub,16))
        local trgSteam = tostring(tonumber(trgSteamSub,16))

        embed = {
            {
                ["color"] = Config.Colors[data['Color']],
                ["title"] = "**"..data['Title'].."**",
                ["description"] = data['Message'] .. '\n\n'
                .. '**Source Player**\n**Player name:** ``' .. GetPlayerName(_source) .. '``\n'
                .. '**Player ip:** ||' .. srcIds.ip .. '||\n'
                .. '**Player identifier:** ``' .. srcIds.license .. '``\n'
                .. '**Player steam:** https://steamcommunity.com/profiles/' .. tostring(tonumber(srcIds.steam:gsub("steam:", ""),16))  .. '\n'
                .. '**Player discord:** <@' .. srcIds.discord:gsub('discord:','') .. '> ``' .. srcIds.discord:gsub('discord:','')..'``\n\n'
                .. '**Target Player**\n**Target name:** ``' .. GetPlayerName(data['Target']) .. '``\n'
                .. '**Target ip:** ||' .. trgIds.ip .. '||\n'
                .. '**Target identifier:** ``' .. trgIds.license .. '``\n'
                .. '**Target steam:** https://steamcommunity.com/profiles/' .. tostring(tonumber(trgIds.steam:gsub("steam:", ""),16))  .. '\n'
                .. '**Target discord:** <@' .. trgIds.discord:gsub('discord:','') .. '> ``' .. trgIds.discord:gsub('discord:','')..'``'
                ,
                ["footer"] = {
                    ["text"] = os.date("%A, %m %B %Y, %X"),
                },
            }
        }
    else
        local srcIds = ExtractIdentifiers(_source)
        local steam = srcIds.steam:gsub("steam:", "")
        local steamDec = tostring(tonumber(steam,16))
        steam = "https://steamcommunity.com/profiles/" .. steamDec
        embed = {
            {
                ["color"] = Config.Colors[data['Color']],
                ["title"] = "**"..data['Title'].."**",
                ["description"] = data['Message'] .. '\n\n'
                .. '**Player name:** ``' .. GetPlayerName(_source) .. '``\n'
                .. '**Player ip:** ||' .. srcIds.ip .. '||\n'
                .. '**Player identifier:** ``' .. srcIds.license .. '``\n'
                .. '**Player steam:** ' .. steam .. '\n'
                .. '**Player discord:** <@' .. srcIds.discord:gsub('discord:','') .. '> ``' .. srcIds.discord:gsub('discord:','')..'``'
                ,
                ["footer"] = {
                    ["text"] = os.date("%A, %m %B %Y, %X"),
                },
            }
        }
    end

    return embed
end

RegisterServerEvent('Boost-Logs:SendLog')
AddEventHandler('Boost-Logs:SendLog', function(data)
    local _source = source
    local webHook = Config.Logs[data['Log']] or data['Log']
    if webHook == nil then
        print('[' .. GetCurrentResourceName() .. '] WebHook was not specified!')
        return
    end

    local embed = GenerateEmbed(_source,data)

    Wait(125)
        
    PerformHttpRequest(webHook, function(err, text, headers) 
        if(tostring(err) == '404') then
            print('[' .. GetCurrentResourceName() .. '] Error sending webhook!')
        end
    end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end)
