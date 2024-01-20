Entities = {}

LoadModel = function(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        
        Citizen.Wait(1)
    end
end

function SpawnNPC(hash, x, y, z)
    local hash = GetHashKey(hash)
    LoadModel(hash)
    local result = Citizen.InvokeNative(0xD49F9B0955C367DE, hash, x, y, z, 0, 0, 0, 0, Citizen.ResultAsInteger())
    Citizen.InvokeNative(0x1794B4FCC84D812F, result, 1) -- SetEntityVisible
    Citizen.InvokeNative(0x0DF7692B1D9E7BA7, result, 255, false) -- SetEntityAlpha
    Citizen.InvokeNative(0x283978A15512B2FE, result, true) -- Invisible without
    Citizen.InvokeNative(0x4AD96EF928BD4F9A, hash) -- SetModelAsNoLongerNeeded

    return result
end

RegisterNetEvent("redemrp:full_entity_list", function(entities)
    Entities = entities

    for k,v in pairs(entities)do
        if(v.type == "npc")then
            local newNPC = SpawnNPC(v.metadata.hash, v.location.x, v.location.y, v.location.z)

            FreezeEntityPosition(newNPC, true)

            Citizen.CreateThread(function()
                Citizen.Wait(2000)
                SetEntityAsMissionEntity(newNPC, 1, 1)
                DeletePed(newNPC)
                DeleteEntity(newNPC)
            end)
        end
    end
end)

RegisterNetEvent("redemrp:manual_entity_update", function()
    local p_coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("redemrp:request_entities", p_coords.x, p_coords.y)    
end)

Citizen.CreateThread(function()
    local vehiclePool = {}
    local wagon = 0
    local driver = 0
    local horse = 0
    while true do
        vehiclePool = GetGamePool('CVehicle') -- Get the list of vehicles (entities) from the pool
        for i = 1, #vehiclePool do -- loop through each vehicle (entity)
            wagon = vehiclePool[i]
            -- Is wagon stopped
            if IsEntityAVehicle(wagon) and IsVehicleStopped(wagon) then
                -- Get the horse
                horse = Citizen.InvokeNative(0xA8BA0BAE0173457B,wagon,0)
                -- If vehicle stopped but the horse walks = buggy wagon
                if IsPedWalking(horse) then
                    if not IsEntityAMissionEntity(wagon) then --if the wagon is not a mission entity. Peds spawned naturally by game return false, peds created by script return true by default preventing this from deleting entities intentionally spawned by scripts
                        -- Delete driver & wagon
                        driver = Citizen.InvokeNative(0x2963B5C1637E8A27,wagon)
                        if driver ~= PlayerPedId() then -- Ensure the driver is not a player
                            if driver then
                                DeleteEntity(driver) -- Delete driver from wagon if there is one
                            end
                            DeleteEntity(wagon) -- Delete buggy wagon
                        end
                    end
                end
            end
        end
        Citizen.Wait(1000)
    end
end)