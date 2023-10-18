RedEM = exports["redem_roleplay"]:RedEM()

local Ragdoll = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local Player = PlayerPedId()
        
        if not CanPedRagdoll(Player) or IsEntityDead(Player) or IsPedInAnyVehicle(Player, true) then
            if IsControlJustReleased(0, 0xF3830D8E) then
                print 'miam'
                if Ragdoll then
                    Ragdoll = false
                else
                    Ragdoll = true
                end
            end
        end



        if Ragdoll then
            SetPedToRagdoll(Player, 1000, 1000, 0, false, false, false)
		end
    end
end)