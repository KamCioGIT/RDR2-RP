RedEM = exports["redem_roleplay"]:RedEM()

RegisterNetEvent("dust_rumors:server:SendRumor")
AddEventHandler("dust_rumors:server:SendRumor", function(rumorText)
    local _source = source
    print(rumorText)
    local user = RedEM.GetPlayer(_source)
    local nameStr = user.firstname .. " " .. user.lastname
    print(nameStr)

    MySQL.update(
        'INSERT INTO rumors (name, rumorText, date) VALUES (@name, @rumorText, @date);',
        {
            name = nameStr,
            rumorText = rumorText,
            date = os.date("%Y-%m-%d %H:%M:%S")
        }, function(rowsChanged)
    end)
end)

RegisterNetEvent("dust_rumors:server:ReceiveRumor")
AddEventHandler("dust_rumors:server:ReceiveRumor", function()
    MySQL.query('SELECT rumorText FROM rumor ORDER BY RAND() LIMIT 1;',
        {
            name = nameStr,
            rumorText = rumorText,
            date = os.date("%Y-%m-%d %H:%M:%S")
        }, function(rowsChanged)
    end)
end)
