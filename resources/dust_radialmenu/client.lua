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
local CurrentJob = { name = nil, rank = nil, duty = false }

--
-- Main radial menus that are available to everyone.
--

exports('settingsRadialHandler', function(menu, item)
    if menu == 'minimap_menu' and item == 1 then
        ExecuteCommand('minimap')
    elseif menu == 'minimap_menu' and item == 2 then
        ExecuteCommand('minimap zoomin')
    elseif menu == 'minimap_menu' and item == 3 then
        ExecuteCommand('minimap zoomout')
    end
end)

lib.registerRadial({
    id = 'settings_menu',
    items = 
        {
            label = 'Minimap',
            icon = 'map',
            menu = 'minimap_menu'
        },
})

lib.registerRadial({
    id = 'minimap_menu',
    items = {
        {
            label = 'Toggle Mode',
            icon = 'map',
            onSelect = 'settingsRadialHandler',
        },
        {
            label = 'Zoom In',
            icon = 'search-plus',
            onSelect = 'settingsRadialHandler',
        },
        {
            label = 'Zoom Out',
            icon = 'search-minus',
            onSelect = 'settingsRadialHandler'
        },
    }
})

lib.registerRadial({
    id = 'interaction_menu',
    items = {
        {
            label = 'Search Person',
            icon = 'magnifying-glass',
            onSelect = 'settingsRadialHandler'
        },
        {
            label = 'Drag Person',
            icon = 'people-pulling',
            onSelect = 'settingsRadialHandler'
        },
    }
})

lib.addRadialItem({
    {
        id = 'interactions',
        label = 'Interactions',
        icon = 'user-gear',
        menu = 'interaction_menu'
    },
})
  
lib.addRadialItem({
    {
        id = 'settings',
        label = 'Settings',
        icon = 'cog',
        menu = 'settings_menu'
    },
})
  
lib.disableRadial(false)

