RedEM = exports["redem_roleplay"]:RedEM()

local ressourcePointIndexForMining = nil

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, v in ipairs(Config.Boucher) do
            if #(playerPos - v) < 6.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 2.2, 2.2, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarke
                if #(playerPos - v) < 2.2 then
                    DrawTxt(Config.MsgInteract, 0.50, 0.90, 0.45, 0.45, true, 255, 255, 255, 255, true)
                    if IsControlJustPressed(2, 0xC7B5340A) then 
                        depviande()
                    end
                end
            end  
        end       
    end
end)

function depviande() -- Carcasse into viande
    local playerPed = PlayerPedId()
    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local hold = GetPedType(holding)
    local quality = Citizen.InvokeNative(0x88EFFED5FE8B0B4A, holding) -- Native pour l'état de la carcasse
    local model = GetEntityModel(holding)
    print (model)
    print (quality)
    if holding ~= false then
        for i, row in pairs(Config.Animal) do
            if hold == 28 then
                if model == Config.Animal[i]["model"] then
                    if quality == false then
                        local deleted = DeleteThis(holding)
                        if deleted then
                            TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["viande"], 1)
                        end
                    elseif quality ~= false then                   
                        local deleted = DeleteThis(holding)
                        if deleted then
                            TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["viande"], (quality + 1))
                        end
                    end
                end
            end
        end
    else
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, v in ipairs(Config.Craftcuir) do
            if #(playerPos - v) < 6.0 then
                Citizen.InvokeNative(0x2A32FAA57B937173,-1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 2.2, 2.2, 0.1, 128, 64, 0, 64, 0, 0, 2, 0, 0, 0, 0) --DrawMarke
                if #(playerPos - v) < 2.2 then
                    DrawTxt(Config.MsgInteract, 0.50, 0.90, 0.45, 0.45, true, 255, 255, 255, 255, true)
                    if IsControlJustPressed(2, 0xC7B5340A) then 
                        deppeau()
                    end
                end
            end  
        end       
    end
end)

function deppeau() -- Peau into cuir
    local playerPed = PlayerPedId()
    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, holding) -- Native pour l'état de la peau
    local model = GetEntityModel(holding)
    local hold = GetPedType(holding)
    if holding ~= false then
        for i, row in pairs(Config.Animal) do
            if quality ~= false then
                if quality == Config.Animal[i]["poor"] then
                    local deleted = DeleteThis(holding)
                    if deleted then
                        TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["peau"], 1)
                    end
                elseif quality == Config.Animal[i]["good"] then
                    local deleted = DeleteThis(holding)   
                    if deleted then
                        TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["peau"], 2)
                    end
                elseif quality == Config.Animal[i]["perfect"] then
                    local deleted = DeleteThis(holding)   
                    if deleted then
                        TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["peau"], 3)
                    end
                end
            end
        end
    else
    end
end

function DeleteThis(holding) -- Delete carcasse
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

-- DRAW TEXT ON SCREEEN w/ BACKGROUND
function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1); -- Font
    DisplayText(str, x, y)

    local lineLength = string.len(str) / 100 * 0.70
    DrawTexture("boot_flow", "selection_box_bg_1d", x, y + 0.018, lineLength, 0.07, 0, 0, 0, 0, 200)
end


function DrawTexture(textureStreamed,textureName,x, y, width, height,rotation,r, g, b, a, p11)
    if not HasStreamedTextureDictLoaded(textureStreamed) then
       RequestStreamedTextureDict(textureStreamed, false);
    else
        DrawSprite(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11);
    end
end


RegisterCommand('cart', function()
    huntcart()
end)

local huntingwagonstash = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
    [4] = nil,
    [5] = nil,
    [6] = nil,
    [7] = nil,
    [8] = nil,
    [9] = nil,
    [10] = nil
}

function huntcart()
    local playerPed = PlayerPedId() -- get the local player ped
    local pos = GetEntityCoords(playerPed) -- get the position of the local player ped
    
    if not HasModelLoaded(-1698498246) then
        RequestModel(-1698498246)
        while not HasModelLoaded(-1698498246) do
            Citizen.Wait(10)
        end
    end
    wagon = CreateVehicle(-1698498246, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
    if not Citizen.InvokeNative(0x48A88FC684C55FDC, GetHashKey("pg_mp005_huntingWagonTarp01")) then
        Citizen.InvokeNative(0xF3DE57A46D5585E9, GetHashKey("pg_mp005_huntingWagonTarp01"))
    end
    SetIgnoreVehicleOwnershipForStowing(0) -- Donne l'accès à l'arrière à tout les joueurs
    Citizen.InvokeNative(0x75F90E4051CC084C, wagon, GetHashKey("pg_mp005_huntingWagonTarp01"))
    Citizen.Wait(500)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(0.0), true)-- Gère la hauteur du drap
    Citizen.Wait(2000)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(0.5), true)
    Citizen.Wait(2000)
    Citizen.InvokeNative(0x31F343383F19C987, wagon, tonumber(1.0), true)
end