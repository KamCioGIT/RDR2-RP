RedEM = exports["redem_roleplay"]:RedEM()

local tenueprompt = UipromptGroup:new("Tenue")
Uiprompt:new(0x760A9C6F, "Prendre une tenue", tenueprompt)
tenueprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPos = GetEntityCoords(PlayerPedId())

        if #(playerPos - Config.Vestiaire) < 10.0 then
            Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, Config.Vestiaire, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
        end
        if #(playerPos - Config.Vestiaire) < Config.DistanceToInteract and not isInteracting then
            tenueprompt:setActiveThisFrame(true)
            if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                TriggerServerEvent("redemrp_inventory:tenueevent", source)
            end
        end
    end
end)

RegisterNetEvent("dust_event:clothes", function(id)
    UpdateCustomClothes(PlayerPedId(), Config.Tenue[id].drawable, Config.Tenue[id].albedo, Config.Tenue[id].normal, Config.Tenue[id].material, Config.Tenue[id].palette, Config.Tenue[id].tint0, Config.Tenue[id].tint1, Config.Tenue[id].tint2)
end)

function UpdateCustomClothes(playerPed, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    while not NativeHasPedComponentLoaded(playerPed) do
        Wait(0)
    end
    local playerPed = PlayerPedId()
    local _drawable = drawable
    local _albedo = albedo
    local _normal = normal
    local _material = material
    local _palette = palette
    local _tint0 = tonumber(tint0)
    local _tint1 = tonumber(tint1)
    local _tint2 = tonumber(tint2)

    SetMetaPedTag(playerPed, _drawable, _albedo, _normal, _material, _palette, _tint0, _tint1, _tint2)
    UpdatePedVariation(playerPed)
end

function NativeHasPedComponentLoaded(ped)
    return Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ped)
end


function SetMetaPedTag(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    Citizen.InvokeNative(0xBC6DF00D7A4A6819, ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
end

function UpdatePedVariation(ped)
    Citizen.InvokeNative(0xAAB86462966168CE, ped, true) -- UNKNOWN "Fixes outfit"- always paired with _UPDATE_PED_VARIATION
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false) -- _UPDATE_PED_VARIATION
end