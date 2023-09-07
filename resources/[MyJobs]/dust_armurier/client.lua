RedEM = exports["redem_roleplay"]:RedEM()

RegisterNetEvent("dust_armurier:addammotoweapon", function (weapon, ammo)
    SetPedAmmo(PlayerPedId(), weapon, ammo)
end)

function inspect()
    local actshort = GetHashKey("SHORTARM_HOLD_ENTER")
    local actlong = GetHashKey("LONGARM_HOLD_ENTER")
    local PropId = GetHashKey("CLOTH")
    local Cloth= CreateObject(GetHashKey('s_balledragcloth01x'), GetEntityCoords(PlayerPedId()), false, true, false, false, true)
    Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), 1242464081, Cloth, PropId, actshort, 1, 0, -1.0)   
end