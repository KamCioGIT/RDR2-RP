RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


Locations = {
    vector3(1290.0882568359, -1312.4019775391, 76.039939880371),
}


RegisterNetEvent("mushy_robbery:startrobbery")
AddEventHandler("mushy_robbery:startrobbery", function(robtime)
    local _source = source
    local ItemData = data.getItem(_source, "dynamite")
    local count = ItemData.ItemAmount 

    if count >= 1 then      
        ItemData.RemoveItem(1)
        isRobbing = false
        TriggerClientEvent('mushy_robbery:startAnimation2', _source)
    end     
end)

RegisterServerEvent('mushy_robbery:loot')
AddEventHandler('mushy_robbery:loot', function()
    local _source = source
    Blowedynamite = Blowedynamite    
        
    if Blowedynamite == true then
    end        
    TriggerClientEvent('mushy_robbery:loot2', _source)    
end)

RegisterNetEvent("mushy_robbery:payout")
AddEventHandler("mushy_robbery:payout", function()
    TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user
       -- randommoney = math.random(10,20)
        ritem = math.random(5,5)
        local randomitempull = math.random(1, #Config.Items)
        local itemName = Config.Items[randomitempull]
           VORP.addItem(_source, itemName, ritem)
    end)
        --iggerClientEvent("vorp:TipBottom", _source, 'You Got The Loot', 5000)
end)



RegisterNetEvent("policenotify")
AddEventHandler("policenotify", function(players, coords, alert)
    local Character = VorpCore.getUser(source).getUsedCharacter
    for each, player in ipairs(players) do
        if Character ~= nil then
			if Character.job == 'police' or Character.job == 'marshal' or Character.job == 'sheriff' then
				TriggerClientEvent("Witness:ToggleNotification2", player, coords, alert)
			end
        end
    end
end)