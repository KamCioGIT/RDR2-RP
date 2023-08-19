RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent("dust-or:server:récolte", function(riverdrop, riverdrop2)
    local Player = RedEM.GetPlayer(source)
    if Player then
        local roll = math.random(1, 100)
        if roll <= riverdrop then
            local roll2 = math.random(1,100)
            local amount = 1
            if roll2 <= riverdrop2 then                
                amount = 2
            end

            local ItemData = data.getItem(source, 'pepiteor')
	        ItemData.AddItem(amount)
        end
    end
end)

RegisterServerEvent("RegisterUsableItem:goldramp")
AddEventHandler("RegisterUsableItem:goldramp", function(source)
    TriggerClientEvent("cookfirecauldron", source)    
end)