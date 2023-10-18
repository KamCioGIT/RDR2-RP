RedEM = exports["redem_roleplay"]:RedEM()

local Ragdoll = false

Control = {
    Toggle = 0xF1301666, --X
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

        if IsControlJustReleased(0, Control.Toggle) then
            if Ragdoll or not CanPedRagdoll(Player) or IsEntityDead(Player) or IsPedInAnyVehicle(Player, false) then
                Ragdoll = false
            else
                Ragdoll = true
            end
        end

        if Ragdoll then
            SetPedToRagdoll(Player, 1000, 1000, RagdollType, false, false, false)
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Ragdoll then
            if Mode == 1 then
                RagdollType = 0
            elseif Mode == 2 then
                RagdollType = 1
            end
            if ToggleControl then
                if IsControlPressed(0, Control.Increase) then
                    if Speed ~= 200.0 then
                        Speed = Speed + 5.0
                        Wait(100)
                    else
                        Speed = 200.0
                    end
                end
                if IsControlPressed(0, Control.Decrease) then
                    if Speed ~= 0.0 then
                        Speed = Speed - 5.0
                        Wait(100)
                    else
                        Speed = 0.0
                    end
                end
            end
            if IsControlJustPressed(0, Control.Mode) then
                if Mode ~= 2 then
                    Mode = Mode + 1
                else
                    Mode = 1
                end
            end
        end
    end
end)

function DegToRad(Degree)
    return Degree * 3.1415927 / 180.0
end

function RotationToDirection(Rotation)
    Z = DegToRad(Rotation.z)
    X = DegToRad(Rotation.x)
    Number = math.abs(math.cos(X))
    X,Y,Z = -math.sin(Z) * Number, math.cos(Z) * Number, math.sin(X)
    return X,Y,Z
end

function RotationToSideDirection(Rotation)
    sZ = DegToRad(Rotation.z)
    sX = -DegToRad(Rotation.x)
    sNumber = math.abs(math.cos(sX))
    sX,sY,sZ = math.cos(sZ) * sNumber, math.sin(sZ) * Number, math.sin(sX)
    return sX,sY,sZ
end