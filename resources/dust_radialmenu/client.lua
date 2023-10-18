RedEM = exports["redem_roleplay"]:RedEM()

local Ragdoll = false

Control = {
    Toggle = 0x8CC9CD42, --X
    Forward = 0x8FD015D8, -- W
    Backward = 0xD27782E3, -- S
    Left = 0x7065027D, -- A
    Right = 0xB4E465B4, -- D
    Up = 0xDE794E3E, -- Q
    Down = 0x26E9DC00, -- Z
    Increase = 0xE30CD707, -- R
    Decrease = 0xB2F377E8, -- F
    Mode = 0xCEFD9220, -- E
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local Player = PlayerPedId()
        
        if not CanPedRagdoll(Player) or IsEntityDead(Player) or IsPedInAnyVehicle(Player, true) then
            Ragdoll = false
        end

        if IsControlJustReleased(0, 0xA8E3F467) then
            if Ragdoll or not CanPedRagdoll(Player) or IsEntityDead(Player) or IsPedInAnyVehicle(Player, false) then
                Ragdoll = false
            else
                Ragdoll = true
            end
        end

        if Ragdoll then
            SetPedToRagdoll(Player, 1000, 1000, 0, false, false, false)
		end
    end
end)