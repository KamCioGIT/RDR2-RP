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

RegisterNetEvent("dust_braquage:asklockpick", function(vault)
    local _source = source
    if Config.Vault[vault].opened ~= true then
        local ItemData = data.getItem(_source, "lockpick")
        local count = ItemData.ItemAmount 

        if count >= 1 then
            ItemData.RemoveItem(1)
            TriggerClientEvent('dust_braquage:dolockpick', _source, vault, false)
        end
    else
        TriggerClientEvent('dust_braquage:dolockpick', _source, vault, true)
    end
end)

RegisterNetEvent("dust_braquage:isopen", function(vault)
    Config.Vault[vault].opened = true
end)


---- remplir les vault s'ils sont vide

