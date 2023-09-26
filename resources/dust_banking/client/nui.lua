RegisterNetEvent("hidemenu")
AddEventHandler("hidemenu", function()
    InBank = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = "closebank"
    })
end)

RegisterNUICallback("NUIFocusOff", function(data, cb)
    InBank = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = "closebank"
    })

    TriggerEvent("debug", 'Banking: Close UI', 2000, 0, 'hud_textures', 'check')
end)


RegisterNUICallback("createSavingsAccount", function(data, cb)
    TriggerServerEvent('qbr-banking:createSavingsAccount')
    TriggerEvent("debug", 'Banking: Create Savings Account', 2000, 0, 'hud_textures', 'check')
end)

RegisterNUICallback("createbusinessAccount", function(data, cb)
    TriggerServerEvent('qbr-banking:createbusinessAccount')
    TriggerEvent("debug", 'Banking: Create Business Account', 2000, 0, 'hud_textures', 'check')
end)

RegisterNUICallback("doDeposit", function(data, cb)
    if tonumber(data.amount) ~= nil and tonumber(data.amount) > 0 then
        TriggerEvent("debug", 'Banking: Deposit $' .. data.amount, 2000, 0, 'hud_textures', 'check')
        TriggerServerEvent('qbr-banking:doQuickDeposit', data.amount)
        openAccountScreen()
    end
end)

RegisterNUICallback("doWithdraw", function(data, cb)
    print (data.accid, data.type)
    if tonumber(data.amount) ~= nil and tonumber(data.amount) > 0 then
        TriggerEvent("debug", 'Banking: Withdraw $' .. data.amount, 2000, 0, 'hud_textures', 'check')
        TriggerServerEvent('qbr-banking:doQuickWithdraw', data.amount, true)
        openAccountScreen()
    end
end)



RegisterNUICallback("doTransfer", function(data, cb)
    if data ~= nil then
        TriggerServerEvent('qbr-banking:initiateTransfer', data)
    end
end)
