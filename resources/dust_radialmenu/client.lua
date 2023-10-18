RedEM = exports["redem_roleplay"]:RedEM()


---- Ragdoll

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


---- Lever les mains ----- 

local HandsUp = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local Player = PlayerPedId()
        if IsControlJustReleased(0, Config.HandsUpKey) then
            if HandsUp then
                ClearPedTasks(Player)
                Entity(Player).state:set('handsup', false, true)
                HandsUp = false
            else
                HandsUpAnim()
                Entity(Player).state:set('handsup', true, true)
                HandsUp = true
            end
        end
    end
end)

function HandsUpAnim()
    key = math.random(1, #Config.HandsUpAnim)
    RequestAnimDict(Config.HandsUpAnim[key].dict)
    while not HasAnimDictLoaded(Config.HandsUpAnim[key].dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), Config.HandsUpAnim[key].dict, Config.HandsUpAnim[key].anim, 1.0, -1.0, -1, 25, 0, true, 0, false, 0, false)
end

----- Fouiller ------ 
RegisterCommand("fouiller", function()
    TriggerEvent("redemrp_inventory:SearchPlayer")
end)



--- donner l'argent



---- menu 
exports('settingsRadialHandler', function(menu, item)
    if menu == 'interactions' and item == 1 then
        TriggerEvent("redemrp_inventory:SearchPlayer")
    elseif menu == 'interactions' and item == 2 then
        print 'give money'
    elseif menu == 'interactions' and item == 3 then
        print 'craft'
    end
end)


lib.addRadialItem({
    id = 'interactions',
    items = {
        {
            label = 'Fouiller',
            icon = 'magnifying-glass',
            onSelect = 'settingsRadialHandler'
        },
        {
            label = "Donner de l'argent",
            icon = 'money-bill-transfer',
            onSelect = 'settingsRadialHandler'
        },
        {
            label = 'Fabriquer',
            icon = 'people-hammer',
            onSelect = 'settingsRadialHandler'
        },
    }
})


lib.disableRadial(false)

