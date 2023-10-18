RedEM = exports["redem_roleplay"]:RedEM()

RegisterNetEvent('dust_radial:givemoney', function(target, amount)
    local _source = source
    local User = RedEM.GetPlayer(_source)
    local Target = RedEM.GetPlayer(target)
    local currentMoney = User.money
    local removeMoney = amount
    if currentMoney >= removeMoney then
        User.removeMoney(removeMoney)
        Target.addMoney(removeMoney)
    else
    end
end)