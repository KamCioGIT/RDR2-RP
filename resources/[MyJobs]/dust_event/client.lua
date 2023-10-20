RedEM = exports["redem_roleplay"]:RedEM()


Citizen.CreateThread(function()
    while true do
        Wait(60000)
        TriggerServerEvent('redemrp_status:server:AddHungerThirst', 100 , 100)
    end
end)



local tenueprompt = UipromptGroup:new("Tenue")
Uiprompt:new(0x760A9C6F, "Prendre une tenue", tenueprompt)
tenueprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPos = GetEntityCoords(PlayerPedId())
        for _, pos in pairs(Config.Vestiaire) do
            if #(playerPos - pos) < 10.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, pos, 0, 0, 0, 0, 0, 0, Config.DistanceToInteract, Config.DistanceToInteract, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
            end
            if #(playerPos - pos) < Config.DistanceToInteract and not isInteracting then
                tenueprompt:setActiveThisFrame(true)
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    TriggerServerEvent("dust_event:getevent")
                end
            end
        end
    end
end)

RegisterNetEvent("dust_event:clothes", function(id)
    if IsPedMale(PlayerPedId()) then
        TriggerEvent("redemrp_inventory:removeclothes")
        Wait(100)
        for k, v in pairs(Config.Tenue["male"][id]) do
         UpdateCustomClothes(PlayerPedId(), GetHashKey(v.drawable), GetHashKey(v.albedo), GetHashKey(v.normal), GetHashKey(v.material), GetHashKey(v.palette), tonumber(v.tint0), tonumber(v.tint1), tonumber(v.tint2))
        end
    else
    end
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
function UpdateShopItemWearableState(ped, shopItemHash, wearableStateHash, isMultiplayer)
    Citizen.InvokeNative(0x66B957AAC2EAAEAB, ped, shopItemHash, wearableStateHash, 0, isMultiplayer, 1)
end