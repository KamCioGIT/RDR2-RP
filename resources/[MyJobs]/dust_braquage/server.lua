RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


RegisterNetEvent("dust_braquage:askdynamite", function(doorid)
    local _source = source
    if Config.Doors[doorid].started ~= true then
        local ItemData = data.getItem(_source, "dynamite")
        local count = ItemData.ItemAmount 
        local need = Config.Doors[doorid].dynamite

        if count >= need then
            Config.Doors[doorid].started = true
            ItemData.RemoveItem(need)
            TriggerClientEvent('dust_braquage:poserdynamite', _source, doorid)
        end
    end
end)

RegisterNetEvent("dust_braquage:askgrille", function(doorid)
    local _source = source
    if Config.Doors[doorid].started ~= true then
        Config.Doors[doorid].started = true
        TriggerClientEvent('dust_braquage:ouvrirgrille', _source, doorid)
    end
end)

RegisterNetEvent("dust_braquage:asklockpick", function(vault, difficulty)
    local _source = source
    if difficulty == "simple" then
        if Config.Vault[vault].opened ~= true then
            local ItemData = data.getItem(_source, "lockpick")
            local count = ItemData.ItemAmount 

            if count >= 1 then
                ItemData.RemoveItem(1)
                TriggerClientEvent('dust_braquage:dolockpick', _source, vault, difficulty, false)
            end
        else
            TriggerClientEvent('dust_braquage:dolockpick', _source, vault, difficulty, true)
        end
    elseif difficulty == "hard" then
        if Config.Vault[vault].opened ~= true then
            TriggerClientEvent('dust_braquage:dolockpick', _source, vault, difficulty, false)
        else
            TriggerClientEvent('dust_braquage:dolockpick', _source, vault, difficulty, true)
        end
    end
end)

RegisterNetEvent("dust_braquage:isopen", function(vault)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local reward = math.random(Config.Vault[vault].cashmin, Config.Vault[vault].cashmax)
    user.AddMoney(reward)
    Config.Vault[vault].opened = true
end)


---- roll du loot à chaque reboot

Citizen.CreateThread(function()
    for k, v in pairs(Config.Vault) do 
        TriggerEvent("redemrp_inventory:server:wipestash", "braquage_"..k)
        Wait(500)
        for item, properties in pairs(v.items) do
            local chance = math.random(100)
            if chance <= properties.chance then
                TriggerEvent("redemrp_inventory:server:additemstash", item, poperties.amount, {}, "braquage_"..k)
            end
            Wait(100)
        end
    end
end)