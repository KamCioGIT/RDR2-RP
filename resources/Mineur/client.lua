RedEM = exports["redem_roleplay"]:RedEM()
local PlayerJob = nil
local PlayerJobgrade = nil
local isMining = false
local isDeposit = false


--- Définir si le joueur est mineur 
Citizen.CreateThread(function()
    while RedEM.GetPlayerData().isLoggedIn ~= true do 
        Wait(750)
        if RedEM.GetPlayerData().isLoggedIn then 
            TriggerServerEvent('mineur:checkjob') 
        end
    end
    if RedEM.GetPlayerData().isLoggedIn then 
        TriggerServerEvent('mineur:checkjob') 
    end
end)


-- VA MINER   
RegisterNetEvent("startMission")
AddEventHandler("startMission",function()
    if Config.ShowBlips then
        for k, v in ipairs(Config.RessourcesPoints) do
            Citizen.InvokeNative(0x554d9d53f696d002, Config.PointSprite, v.x, v.y, v.z)
        end
    else end
    Citizen.CreateThread(function() --- MINERAI
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())
            for k, v in ipairs(Config.RessourcesPoints) do
                if #(playerPos - v) < 6.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract and not isMining then
                    DrawTxt(Config.MsgGathering, 0.50, 0.90, 0.45, 0.45, true, 255, 255, 255, 255, true)
                    if IsControlJustPressed(2, 0x4AF4D473) and not isMining then 
                        StartMining()
                    end
                else end
            end
        end
    end)
    Citizen.CreateThread(function() --- CHARBON
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())
            for k, v in ipairs(Config.MinerJobCoalPos) do
                if #(playerPos - v) < 6.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract and not isMining then
                    DrawTxt(Config.MsgGathering, 0.50, 0.90, 0.45, 0.45, true, 255, 255, 255, 255, true)
                    if IsControlJustPressed(2, 0x4AF4D473) and not isMining then 
                        StartMiningCoal()
                    end
                else end
            end
        end
    end)
    Citizen.CreateThread(function() --- DEPOT
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())
            for k, v in ipairs(Config.MinerJobDepositPos) do
                if #(playerPos - v) < 6.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract then
                    DrawTxt(Config.MsgDeposit, 0.50, 0.90, 0.45, 0.45, true, 255, 255, 255, 255, true)
                    if IsControlJustPressed(2, 0x4AF4D473) then 
                        Print ("Dépot")
                    end
                else end
            end
        end
    end)
    Citizen.CreateThread(function() --- RETRAIT
        while true do
            Wait(0)
            local playerPos = GetEntityCoords(PlayerPedId())
            for k, v in ipairs(Config.MinerJobWithdrawalPos) do
                if #(playerPos - v) < 6.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarker
                end
                if #(playerPos - v) < Config.DistanceToInteract then
                    DrawTxt(Config.MsgRetrieve, 0.50, 0.90, 0.45, 0.45, true, 255, 255, 255, 255, true)
                    if IsControlJustPressed(2, 0x4AF4D473) then 
                        Print ("Retrait")
                    end
                else end
            end
        end
    end)
end)

-- ACTION DE MINER
function StartMining()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    started = false
    pressing = false
    FreezeEntityPosition(playerPed, true)
    TaskStartScenarioInPlace(playerPed, GetHashKey(Config.MiningAnim), Config.WorkingTime, true, false, false, false)
    local timer = GetGameTimer() + Config.WorkingTime
    isMining = true
    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
            DrawTxt(Config.TimerMsg .. " " .. tonumber(string.format("%.0f", (((GetGameTimer() - timer) * -1)/1000))), 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
        end
        ClearPedTasksImmediately(PlayerPedId())
		FreezeEntityPosition(playerPed, false)
        isMining = false
        GivePlayerRessource()
    end)
end

---- RECOLTE CHARBON
function StartMiningCoal()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    started = false
    pressing = false
    FreezeEntityPosition(playerPed, true)
    TaskStartScenarioInPlace(playerPed, GetHashKey(Config.MiningAnim), Config.WorkingTimeCoal, true, false, false, false)
    local timer = GetGameTimer() + Config.WorkingTimeCoal
    isMining = true
    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
            DrawTxt(Config.TimerMsg .. " " .. tonumber(string.format("%.0f", (((GetGameTimer() - timer) * -1)/1000))), 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
        end
        ClearPedTasksImmediately(PlayerPedId())
		FreezeEntityPosition(playerPed, false)
        isMining = false
        GivePlayerCharbon()
    end)
end


function GivePlayerRessource()
    local rand = math.random(1,100)
    if rand > 70 then
        TriggerServerEvent('mineur:addferbrut')
    elseif rand <= 35 then
        TriggerServerEvent('mineur:addcuivrebrut')
    else
        TriggerServerEvent('mineur:addplombbrut')
    end
end

function GivePlayerCharbon()
    TriggerServerEvent('mineur:addcharbon')
end

-- DRAW TEXT ON SCREEEN w/ BACKGROUND
function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1); -- Font
    DisplayText(str, x, y)

    local lineLength = string.len(str) / 50 * 0.66
    DrawTexture("boot_flow", "selection_box_bg_1d", x, y, lineLength, 0.3, 0, 0, 0, 0, 200)
end


function DrawTexture(textureStreamed,textureName,x, y, width, height,rotation,r, g, b, a, p11)
    if not HasStreamedTextureDictLoaded(textureStreamed) then
       RequestStreamedTextureDict(textureStreamed, false);
    else
        DrawSprite(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11);
    end
end
