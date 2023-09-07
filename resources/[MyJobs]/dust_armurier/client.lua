RedEM = exports["redem_roleplay"]:RedEM()

RegisterNetEvent("dust_armurier:addammotoweapon", function (weapon, ammo)
    SetPedAmmo(PlayerPedId(), weapon, ammo)
end)