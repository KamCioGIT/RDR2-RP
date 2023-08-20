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
            local amount = 2
            if roll2 <= riverdrop2 then                
                amount = 4
            end

            local ItemData = data.getItem(source, 'cailloux')
	        ItemData.AddItem(amount)
        end
    end
end)

RegisterServerEvent('dust-or:server:ramp')
AddEventHandler('dust-or:server:ramp', function(playerPed)
	local _source = source
	local ItemData = data.getItem(_source, "cailloux")
    Citizen.CreateThread(function()
        while true do
            if ItemData then       
                Citizen.Wait(Config.WorkingTime)
                if ItemData.RemoveItem(2) then
                    local ItemDatagive = data.getItem(_source, "pepiteor")
                    ItemDatagive.AddItem(1)
                end
            else return end
        end
    end)
end)

RegisterServerEvent("RegisterUsableItem:goldramp")
AddEventHandler("RegisterUsableItem:goldramp", function(source)
    TriggerClientEvent("goldramp", source)    
end)

RegisterServerEvent("RegisterUsableItem:batée")
AddEventHandler("RegisterUsableItem:batée", function(source)
    TriggerClientEvent("EnablePanningMode", source)    
end)