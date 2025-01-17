RedEM = exports["redem_roleplay"]:RedEM()

RegisterNetEvent("dust_rumors:server:SendRumor")
AddEventHandler("dust_rumors:server:SendRumor", function(rumorText)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local nameStr = user.firstname .. " " .. user.lastname
    local currentMoney = user.money
    local removeMoney = Config.RumorPrice
    if currentMoney >= removeMoney then
        user.removeMoney(removeMoney)
        MySQL.update(
            'INSERT INTO rumors (name, rumorText, date) VALUES (@name, @rumorText, @date);',
            {
                name = nameStr,
                rumorText = rumorText,
                date = os.date("%Y-%m-%d %H:%M:%S")
            }, function(rowsChanged)
        end)
    end
end)

RegisterNetEvent("dust_rumors:server:askRumor")
AddEventHandler("dust_rumors:server:askRumor", function()
    local _source = source
    rumorsTable = {}
    MySQL.query('SELECT * FROM rumors;', {}, function(result)
        if #result ~= 0 then
            for i = 1, #result do
                local rumorText = result[i].rumorText
                local cd = os.time()
                local savedDate = result[i].date
                local formatdate = savedDate / 1000 
                local timeDifference = os.difftime(cd, formatdate)
                local dateisvalid = tonumber(60 * Config.Rumorstime)
                if timeDifference <= dateisvalid then
                    table.insert(rumorsTable, tostring(rumorText))
                else
                    MySQL.query('DELETE FROM rumors WHERE `rumorText` = @rumorText AND `date` = @date;', {rumorText = rumorText, date = os.date("%Y-%m-%d %H:%M:%S", formatdate)})
                end
			end
            TriggerClientEvent("dust_rumors:client:getRumor", _source, rumorsTable)
            rumorsTable = {}
        end
    end)
end)