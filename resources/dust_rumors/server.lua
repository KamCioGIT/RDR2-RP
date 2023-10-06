RegisterNetEvent("dust_rumors:server:SendRumor")
AddEventHandler("dust_rumors:server:SendRumor", function(date, name, rumorText)
    print(date)
    print(name)
    print(rumorText)
    -- Save rumor in DB
end)
