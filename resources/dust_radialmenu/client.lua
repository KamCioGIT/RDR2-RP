RedEM = exports["redem_roleplay"]:RedEM()

local Ragdoll = false


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local Player = PlayerPedId()
        
        if not CanPedRagdoll(Player) or IsEntityDead(Player)then
            Ragdoll = false
        end

        if IsControlJustReleased(0, Config.RagdollKey) then
            if Ragdoll or not CanPedRagdoll(Player) or IsEntityDead(Player) then
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

local HandsUp = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local Player = PlayerPedId()

        if IsControlJustReleased(0, Config.HandsUpKey) then
            if HandsUp then
                ClearPedTasks(Player)
                HandsUp = false
            else
                playAnimation()
                HandsUp = true
            end
        end
            
    end
end)

function playAnimation()
    key = math.random(1, #Config.HandsUpAnim)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), Config.HandsUpAnim[key].dict, Config.HandsUpAnim[key].anim, 1.0, -1.0, -1, -1, 0, true, 0, false, 0, false)
end