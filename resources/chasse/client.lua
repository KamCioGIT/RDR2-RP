RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

if Config.Blips == true then
    Citizen.CreateThread(function()
        for _, info in pairs(Config.Boucher) do
            local number = #blip + 1
            blip[number] = N_0x554d9d53f696d002(1664425300, info.coords.x, info.coords.y, info.coords.z)
            SetBlipSprite(blip[number], -1665418949, 1)
            SetBlipScale(blip[number], 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip[number], 'Boucher')
        end  
    end)
end

Citizen.CreateThread(function()
    while RedEM.GetPlayerData().isLoggedIn ~= true do
        Wait(750)
        boucherie()
    end
    if RedEM.GetPlayerData().isLoggedIn then
        Wait(750)
        boucherie()
    end
)

function DeleteThis(holding)
    NetworkRequestControlOfEntity(holding)
    SetEntityAsMissionEntity(holding, true, true)
    Wait(100)
    DeleteEntity(holding)
    Wait(500)
    local entitycheck = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local holdingcheck = GetPedType(entitycheck)
    if holdingcheck == 0 then
        return true
    else
        return false
    end
end

function boucherie()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    for k = 1, #Config.Boucher do 
        local distance = #(Config.Boucher[k]["coords"] - coords)
        if distance < 2.2 then
            DrawTxt(Config.MsgInteract, 0.50, 0.90, 0.45, 0.45, true, 255, 255, 255, 255, true)
            local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
            local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
            local model = GetEntityModel(holding)
            local hold = GetPedType(holding)
            if holding ~= false then
                if IsControlJustPressed(2, 0x4AF4D473) then
                    for i, row in pairs(Config.Animal) do
                        if hold == 28 then
                            if model == Config.Animal[i]["model"] then
                                local deleted = DeleteThis(holding)
                                if deleted then
                                    TriggerServerEvent("cryptos_butcher:giveitem", Config.Animal[i]["item"], 1)
                                end
                            end
                        end
                        if quality ~= false then
                            if quality == Config.Animal[i]["poor"] then
                                local deleted = DeleteThis(holding)
                
                                if deleted then
                                    TriggerServerEvent("cryptos_butcher:giveitem", Config.Animal[i]["item"], 1) 
                                end

                            elseif quality == Config.Animal[i]["good"] then
                                local deleted = DeleteThis(holding)
                                if deleted then
                                    TriggerServerEvent("cryptos_butcher:giveitem", Config.Animal[i]["item"], 2)
                                end

                            elseif quality == Config.Animal[i]["perfect"] then
                                local deleted = DeleteThis(holding)
                
                                if deleted then
                                    TriggerServerEvent("cryptos_butcher:giveitem", Config.Animal[i]["item"], 3)
                                
                                else
                            end
                        end
                    end
                end
            end
        end
    end
end