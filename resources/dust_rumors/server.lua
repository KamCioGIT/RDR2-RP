RegisterNetEvent("dust_rumors:server:SendRumor")
AddEventHandler("dust_rumors:server:SendRumor", function(name, rumorText)
    print(name)
    print(rumorText)

    MySQL.update(
        'INSERT INTO rumors (name, rumorText, date) VALUES (@name, @rumorText, @date);',
        {
            name = name,
            rumorText = rumorText,
            date = os.time(),
        },
        function(rowsChanged)
        end
    )

end)
