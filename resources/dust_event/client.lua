RedEM = exports["redem_roleplay"]:RedEM()

RegisterCommand("testevent", function()
    a = 0
    while true do
        if a < 10 then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local modelhash = GetHashKey("G_M_Y_UniExConfeds_01")
            while not HasModelLoaded(modelhash) do
                RequestModel(modelhash)
                
                Citizen.Wait(1)
            end
            local xOffset = math.random(1, 15)
            local yOffset = math.random(1, 15)
            local zOffset = math.random(1, 15)
            local newccords = {
                x = coords.x + xOffset,
                y = coords.y + yOffset,
                z = coords.z + zOffset
            }

            local enemy = Citizen.InvokeNative(0xD49F9B0955C367DE, modelhash, newccords, GetEntityHeading(ped), true, true)
            Citizen.InvokeNative(0x9F7794730795E019,enemy,116,true)
            Citizen.InvokeNative(0x1794B4FCC84D812F, enemy, 1) -- SetEntityVisible
            Citizen.InvokeNative(0x0DF7692B1D9E7BA7, enemy, 255, false) -- SetEntityAlpha
            Citizen.InvokeNative(0x283978A15512B2FE, enemy, true) -- Invisible without
            Citizen.InvokeNative(0x4AD96EF928BD4F9A, enemy) -- SetModelAsNoLongerNeeded
            a = a + 1
        else break end
    end
end)
