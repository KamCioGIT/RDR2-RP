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
                        print "OKAY"
                        depviande()
                    else end
                end
            end  
        end       
    end
end)

function depviande()
    local quality = false
    local playerPed = PlayerPedId()
    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local hold = GetPedType(holding)
    local quality = Citizen.InvokeNative(0x88EFFED5FE8B0B4A, holding) -- Native pour l'état de la carcasse
    local model = GetEntityModel(holding)
    print (quality)
    if holding ~= false then
        for i, row in pairs(Config.Animal) do
            if hold == 28 then
                if model == Config.Animal[i]["model"] then
                    if quality == false then
                        local deleted = DeleteThis(holding)
                        if deleted then
                            TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["item"], 1)
                        end
                    elseif quality == 2 then
                        local deleted = DeleteThis(holding)   
                        if deleted then
                            TriggerServerEvent("boucher:serveur:giveitem", Config.Animal[i]["item"], 2)
                        end
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
