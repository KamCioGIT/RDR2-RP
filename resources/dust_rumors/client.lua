local closestPed = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3500)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 5.0, itemSet, 1, Citizen.ResultAsInteger())
        -- number xPos, number yPox, number zPos, float distance, int itemSet, int entityType

        print(size)

        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet)
                local entityPos = GetEntityCoords(entity)
                
                -- if entityPos == GetEntityCoords(PlayerPedId()) then -- Si c'est le joueur
                --     return 
                -- end
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end

    end
end)