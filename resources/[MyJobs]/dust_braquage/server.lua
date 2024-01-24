RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

local 

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
        TriggerClientEvent('dust_braquage:poserdynamite', _source, doorid)
    end
end)

