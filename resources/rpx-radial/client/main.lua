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
    items = {
        {
            label = 'Minimap',
            icon = 'map',
            menu = 'minimap_menu'
        },
    }
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
