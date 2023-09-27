local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local propAnim = nil
local propAnim2 = nil
local filtered = {}
local active = false
local lying = false
local menu_opened = false
local openTimer = 0
local ifShared = false
local animations = {}
local filteredProps = {}
local myJob = ""
local propTable = {}
local favoriteAnim = {}
local haveIcon = {}
local lastWalk = ""
local api
TriggerEvent("getApi",function(gumApi)
    api = gumApi
end)

RegisterNUICallback('exit', function(data, cb)
    SendNUIMessage({type = "animClose"})
    SetNuiFocus(false, false)
    menu_opened = false
    openTimer = 0
end)

RegisterCommand(""..Config.AnimCallCommand.."", function(source, args, rawCommand)
    local arguments = args[1]
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, true, true)
    if propAnim ~= nil then
        DeleteEntity(propAnim)
        propAnim = nil
    end
    if propAnim2 ~= nil then
        DeleteEntity(propAnim2)
        propAnim2 = nil
    end
    local ped = PlayerPedId()
    for k,v in pairs(Config.Prop) do
        for a,b in pairs(animations) do
            if b.text == v.name and b.command == arguments then
                if propTable[b.text] == nil then
                    local bone = 0
                    local x,y,z,rx,ry,rz = 0.0,0.0,0.0,0.0,0.0,0.0
                    local jobLock = {}
                    local prop = ""

                    prop = v.prop
                    bone = v.bone
                    x,y,z,rx,ry,rz = v.parameter[1],v.parameter[2],v.parameter[3],v.parameter[4],v.parameter[5],v.parameter[6]
                    jobLock = v.jobLock
                    while not HasModelLoaded(GetHashKey(prop)) do
                        Wait(0)
                        ModelRequest( GetHashKey(prop) )
                    end
                    local coords = GetEntityCoords(PlayerPedId())
                    local propEntity = CreateObject(GetHashKey(prop), coords.x, coords.y, coords.z,  true,  true, false)
                    AttachEntityToEntity(propEntity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), bone), x, y, z, rx, ry, rz, true, true, false, true, 1, true)
                    propTable[b.text] = propEntity
                    TriggerServerEvent("gum_animmenu:props", NetworkGetNetworkIdFromEntity(propEntity))
                else
                    TriggerServerEvent("gum_animmenu:deleteProp", NetworkGetNetworkIdFromEntity(propTable[b.text]))
                    DeleteEntity(propTable[b.text])
                    propTable[b.text] = nil
                end
            end
        end
    end
    for k,v in pairs(Config.Anim) do
        for a,b in pairs(animations) do
            if b.text == v.name and b.command == arguments then
                if v.itsAnimation == "animWithProp" then
                    playAnimationProp(v.anim[1], v.anim[2], v.time, v.flag, v.props)
                elseif v.itsAnimation == "walkingStyle" then
                    Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), lastWalk,0,-1)
                    Citizen.Wait(100)
                    lastWalk = v.walkAnim
                    Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), v.walkAnim,1,-1)
                elseif v.itsAnimation == "animNorm" then
                    playAnimation(v.anim[1], v.anim[2], v.time, v.flag)
                elseif v.itsAnimation == "emote" then
                    Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, GetHashKey(v.emote), 1, 1, 0, 0, 0)
                elseif v.itsAnimation == "command" then
                    ExecuteCommand(v.command)
                elseif v.itsAnimation == "scenario" then
                    TaskStartScenarioInPlace(ped, GetHashKey(v.scenario), -1)
                elseif v.itsAnimation == "lying" then
                    if lying == true then
                        lying = false
                    else
                        playAnimationLying("mech_crawl@base", "idle_intro", -1, 17);
                        lying = true
                    end
                elseif v.itsAnimation == "animShared" then
                    local closestPlayer, closestDistance, playerid, tgt1 = getClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 2.0 then
                        ifShared = true
                        TriggerServerEvent("gum_animmenu:sendShared", playerid, v.name)
                        attachToPlayer(PlayerPedId(), tgt1, v.offset)
                        Citizen.Wait(150)
                        playAnimation(v.anim[1], v.anim[2], v.time, v.flag)
                    else
                        print("No near player")
                    end
                end
            end
            if b.text == "clear" then
                if ifShared == true then
                    local closestPlayer, closestDistance, playerid, tgt1 = getClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 2.0 then
                        SetEntityCollision(PlayerPedId(), true, true)
                        FreezeEntityPosition(PlayerPedId(), false)
                        TriggerServerEvent("gum_animmenu:clearShared", playerid)
                    end
                end
                ifShared = false
                lying = false
                ClearPedTasks(PlayerPedId())
            end
        end
    end
end)

RegisterNUICallback('useFavorite', function(data, cb)
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, true, true)
    if propAnim ~= nil then
        DeleteEntity(propAnim)
        propAnim = nil
    end
    if propAnim2 ~= nil then
        DeleteEntity(propAnim2)
        propAnim2 = nil
    end
    local ped = PlayerPedId()
    for k,v in pairs(Config.Anim) do
        if favoriteAnim["favorite"..data.number] == v.name then
            if v.itsAnimation == "animWithProp" then
                playAnimationProp(v.anim[1], v.anim[2], v.time, v.flag, v.props)
            elseif v.itsAnimation == "animNorm" then
                playAnimation(v.anim[1], v.anim[2], v.time, v.flag)
            elseif v.itsAnimation == "walkingStyle" then
                Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), lastWalk,0,-1)
                Citizen.Wait(100)
                lastWalk = v.walkAnim
                Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), v.walkAnim,1,-1)
            elseif v.itsAnimation == "emote" then
                Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, GetHashKey(v.emote), 1, 1, 0, 0, 0)
            elseif v.itsAnimation == "command" then
                ExecuteCommand(v.command)
            elseif v.itsAnimation == "scenario" then
                TaskStartScenarioInPlace(ped, GetHashKey(v.scenario), -1)
            elseif v.itsAnimation == "lying" then
                if lying == true then
                    lying = false
                else
                    playAnimationLying("mech_crawl@base", "idle_intro", -1, 17);
                    lying = true
                end
            elseif v.itsAnimation == "animShared" then
                local closestPlayer, closestDistance, playerid, tgt1 = getClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 2.0 then
                    ifShared = true
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetEntityCollision(PlayerPedId(), false, false)
                    TriggerServerEvent("gum_animmenu:sendShared", playerid, v.name)
                    attachToPlayer(PlayerPedId(), tgt1, v.offset)
                    Citizen.Wait(150)
                    playAnimation(v.animDict, v.animName, v.time, v.flag)
                else
                    print("No near player")
                end
            end
        end
    end
    if favoriteAnim["favorite"..data.number] == "clear" then
        if ifShared == true then
            local closestPlayer, closestDistance, playerid, tgt1 = getClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 2.0 then
                TriggerServerEvent("gum_animmenu:clearShared", playerid)
                FreezeEntityPosition(PlayerPedId(), false)
                SetEntityCollision(PlayerPedId(), true, true)
            end
        end
        ifShared = false
        lying = false
        ClearPedTasks(PlayerPedId())
    end
end)

RegisterNUICallback('useToFavorite', function(data, cb)
    api.getInput( ""..Config.Language[11].."", ""..Config.Language[12]..""..data.text.." ", function(cb)
        local num = tonumber(cb)
        if num ~= nil and num ~= 'close' then
            favoriteAnim["favorite"..num] = data.text
            SendNUIMessage({type = "rewriteFavorite", id="favorite"..num, text=data.text})
            TriggerServerEvent("gum_animmenu:rewriteFavorite", favoriteAnim)
        end
    end)
end)
RegisterNUICallback('cleanFavorite', function(data, cb)
    favoriteAnim["favorite"..data.number] = ""
    TriggerServerEvent("gum_animmenu:rewriteFavorite", favoriteAnim)
end)



RegisterNUICallback('makeFavorite', function(data, cb)
    SendNUIMessage({type = "animClose"})
    SetNuiFocus(false, false)
    menu_opened = false
    openTimer = 0
    api.getInput( ""..Config.Language[11].."", ""..Config.Language[13].."", function(cb)
        local command = cb
        if command ~= nil and command ~= 'close' then
            table.insert(animations, {command=command,text=data.text})
            TriggerServerEvent("gum_animmenu:createCommand", animations)
        end
    end)
end)


RegisterNUICallback('deleteAnim', function(data, cb)
    SendNUIMessage({type = "animClose"})
    SetNuiFocus(false, false)
    menu_opened = false
    openTimer = 0
    api.getAnswer( ""..Config.Language[14].."", ""..Config.Language[15].."", ""..Config.Language[16].."", function(cb)
        local answer = cb
        if answer == true then
            for a,b in pairs(animations) do
                if b.text == data.text then
                    table.remove(animations, a)
                    TriggerServerEvent("gum_animmenu:deleteCommand", animations)
                    return false
                end
            end
        else
            api.getInput( ""..Config.Language[11].."", ""..Config.Language[12]..""..data.text.." ", function(cb)
                local num = tonumber(cb)
                if num ~= nil and num ~= 'close' then
                    favoriteAnim["favorite"..num] = data.text
                    SendNUIMessage({type = "rewriteFavorite", id="favorite"..num, text=data.text})
                    TriggerServerEvent("gum_animmenu:rewriteFavorite", favoriteAnim)
                end
            end)
        end
    end)
end)

RegisterNetEvent("gum_animmenu:animations")
AddEventHandler("gum_animmenu:animations", function(anim, job, favorite)
    animations = anim
    myJob = job
    favoriteAnim = favorite
    Citizen.Wait(2000)
    loadAll()
end)

RegisterNetEvent("gum_animmenu:sendShared")
AddEventHandler("gum_animmenu:sendShared", function(name)
    for k,v in pairs(Config.Anim) do
        if name == v.name then
            local closestPlayer, closestDistance, playerid, tgt1 = getClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 2.0 then
                ifShared = true
                playAnimation(v.animDict2, v.animName2, v.time, v.flag)
            end
        end
    end
end)

RegisterNetEvent("gum_animmenu:clearShared")
AddEventHandler("gum_animmenu:clearShared", function(name)
    isShared = false
    Citizen.Wait(150)
    ClearPedTasks(PlayerPedId())
end)


RegisterNUICallback('createProp', function(data, cb)
    if data.text == 'clear' then
        for a,b in pairs(propTable) do
            DeleteEntity(b)
            propTable[a] = nil
        end
        TriggerServerEvent("gum_animmenu:clearProp", propTable)
        return false
    end
    if data.text == "Aligator tooth" then
        Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), tonumber(0x9EF4CEFA))
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), false, true, true, true, false)
    elseif data.text == "Bear Claw" then
        Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), tonumber(0xB5DD13B8))
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), false, true, true, true, false)
    elseif data.text == "Boar Tusk" then
        Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), tonumber(0x7943D997))
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), false, true, true, true, false)
    elseif data.text == "Buffalo horn" then
        Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), tonumber(0x96B481A2))
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), false, true, true, true, false)
    elseif data.text == "Eagle talon" then
        Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), tonumber(0xF49206A6))
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), false, true, true, true, false)
    else
        if propTable[data.text] == nil then
            local bone = 0
            local x,y,z,rx,ry,rz = 0.0,0.0,0.0,0.0,0.0,0.0
            local jobLock = {}
            local prop = ""
            for a,b in pairs(Config.Prop) do
                if b.name == data.text then
                    prop = b.prop
                    bone = b.bone
                    x,y,z,rx,ry,rz = b.parameter[1],b.parameter[2],b.parameter[3],b.parameter[4],b.parameter[5],b.parameter[6]
                    jobLock = b.jobLock
                end
            end
            while not HasModelLoaded(GetHashKey(prop)) do
                Wait(0)
                ModelRequest( GetHashKey(prop) )
            end
            local coords = GetEntityCoords(PlayerPedId())
            local propEntity = CreateObject(GetHashKey(prop), coords.x, coords.y, coords.z,  true,  true, false)
            AttachEntityToEntity(propEntity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), bone), x, y, z, rx, ry, rz, true, true, false, true, 1, true)
            propTable[data.text] = propEntity
            TriggerServerEvent("gum_animmenu:props", NetworkGetNetworkIdFromEntity(propEntity))
        else
            TriggerServerEvent("gum_animmenu:deleteProp", NetworkGetNetworkIdFromEntity(propTable[data.text]))
            DeleteEntity(propTable[data.text])
            propTable[data.text] = nil
        end
    end
end)

RegisterNUICallback('playAnim', function(data, cb)
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, true, true)
    if propAnim ~= nil then
        DeleteEntity(propAnim)
        propAnim = nil
    end
    if propAnim2 ~= nil then
        DeleteEntity(propAnim2)
        propAnim2 = nil
    end
    local ped = PlayerPedId()
    for k,v in pairs(Config.Anim) do
        if data.text == v.name then
            if v.itsAnimation == "animWithProp" then
                playAnimationProp(v.anim[1], v.anim[2], v.time, v.flag, v.props)
            elseif v.itsAnimation == "animNorm" then
                playAnimation(v.anim[1], v.anim[2], v.time, v.flag)
            elseif v.itsAnimation == "emote" then
                Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, GetHashKey(v.emote), 1, 1, 0, 0, 0)
            elseif v.itsAnimation == "walkingStyle" then
                Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), lastWalk,0,-1)
                Citizen.Wait(100)
                lastWalk = v.walkAnim
                Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), v.walkAnim,1,-1)
            elseif v.itsAnimation == "command" then
                ExecuteCommand(v.command)
            elseif v.itsAnimation == "scenario" then
                TaskStartScenarioInPlace(ped, GetHashKey(v.scenario), -1)
            elseif v.itsAnimation == "lying" then
                if lying == true then
                    lying = false
                else
                    playAnimationLying("mech_crawl@base", "idle_intro", -1, 17);
                    lying = true
                end
            elseif v.itsAnimation == "animShared" then
                local closestPlayer, closestDistance, playerid, tgt1 = getClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 2.0 then
                    ifShared = true
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetEntityCollision(PlayerPedId(), false, false)
                    Citizen.Wait(0)
                    TriggerServerEvent("gum_animmenu:sendShared", playerid, v.name)
                    attachToPlayer(PlayerPedId(), tgt1, v.offset)
                    Citizen.Wait(200)
                    playAnimation(v.animDict, v.animName, v.time, v.flag)
                else
                    print("No near player")
                end
            end
        end
    end
    if data.text == "clear" then
        if ifShared == true then
            local closestPlayer, closestDistance, playerid, tgt1 = getClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 2.0 then
                TriggerServerEvent("gum_animmenu:clearShared", playerid)
                FreezeEntityPosition(PlayerPedId(), false)
                SetEntityCollision(PlayerPedId(), true, true)
            end
        end
        ifShared = false
        lying = false
        ClearPedTasks(PlayerPedId())
    end
end)

function attachToPlayer(ped, partner, offset)
	local partnerPos = GetEntityCoords(partner)
	local partnerHeading = GetEntityHeading(partner)

	local r = math.rad(partnerHeading)
	local cosr = math.cos(r)
	local sinr = math.sin(r)

	local x = offset.x * cosr - offset.y * sinr + partnerPos.x
	local y = offset.y * cosr + offset.x * sinr + partnerPos.y
	local z = offset.z + partnerPos.z
	local h = offset.w + partnerHeading

	SetEntityCoordsNoOffset(ped, x, y, z)
	SetEntityHeading(ped, h)
end

Citizen.CreateThread(function()
    Citizen.Wait(3000)
    buttonPrompt()
    while true do
        local optimize = 500
        if lying == true then
            optimize = api.fpsTimer()
            if active == false then
                local item_name = CreateVarString(10, 'LITERAL_STRING', ""..Config.Language[5].."")
                PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
            end
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x339F3730) then
                playAnimationLying("mech_crawl@base", "idle_intro", -1, 17)
            end
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x8FD015D8) then
                playAnimationLying("mech_crawl@base", "walk", -1, 17)
            end	
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x7C0162C0) then
                playAnimationLying("mech_crawl@base", "run", -1, 17)
            end	
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0xAEB4B1DE) then
                playAnimationLying("mech_crawl@base", "onfront_bwd", -1, 17)
            end 
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x39336A4F) then
                playAnimationLying("mech_loco_m@character@arthur@crouch@unarmed@idle_knee", "idle", -1, 17)
            end 
        end
        Citizen.Wait(optimize)
    end
end)

if Config.OpenMenuCommandEnable then
    RegisterCommand(""..Config.OpenMenuCommand.."", function(source, args, rawCommand)
        if menu_opened == false then
            for a,b in pairs(favoriteAnim) do
                if b ~= "" then
                    SendNUIMessage({type = "rewriteFavorite", id=a, text=b})
                end
            end
            DisableControlAction(0, Config.AnimMenuKey, true)
            menu_opened = true
            openTimer = 0
            SendNUIMessage({type = "animMenu", anims=filtered, props=filteredProps, myAnims=animations})
            SetNuiFocus(true, true)
        end
    end)
end

if Config.AnimMenuKeyPress then
    Citizen.CreateThread(function()
        while true do
            local optimize = api.fpsTimer()
            if Config.AllowKeybind then
                for k,v in pairs(Config.Keybind) do
                    DisableControlAction(0, v, true)
                    if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, v) then
                        useFavorite(k)
                    end
                end
            end
            if not IsPedOnMount(PlayerPedId()) and not IsEntityDead(PlayerPedId()) then
                if Config.NotHoldKeye then
                    if IsControlJustReleased(0, Config.AnimMenuKey) then
                        if menu_opened == false then
                            for a,b in pairs(favoriteAnim) do
                                if b ~= "" then
                                    SendNUIMessage({type = "rewriteFavorite", id=a, text=b})
                                end
                            end
                            DisableControlAction(0, Config.AnimMenuKey, true)
                            menu_opened = true
                            openTimer = 0
                            SendNUIMessage({type = "animMenu", anims=filtered, props=filteredProps, myAnims=animations})
                            SetNuiFocus(true, true)
                        end
                    end 
                else
                    if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, Config.AnimMenuKey) then
                        if menu_opened == false then
                            for a,b in pairs(favoriteAnim) do
                                if b ~= "" then
                                    SendNUIMessage({type = "rewriteFavorite", id=a, text=b})
                                end
                            end
                            DisableControlAction(0, Config.AnimMenuKey, true)
                            menu_opened = true
                            openTimer = 0
                            SendNUIMessage({type = "animMenu", anims=filtered, props=filteredProps, myAnims=animations})
                            SetNuiFocus(true, true)
                        end
                    end 
                end
            end
            Citizen.Wait(optimize)
        end
    end)
end


function useFavorite(num)
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, true, true)
    if propAnim ~= nil then
        DeleteEntity(propAnim)
        propAnim = nil
    end
    if propAnim2 ~= nil then
        DeleteEntity(propAnim2)
        propAnim2 = nil
    end
    local ped = PlayerPedId()
    for k,v in pairs(Config.Anim) do
        if favoriteAnim["favorite"..num] == v.name then
            if v.itsAnimation == "animWithProp" then
                playAnimationProp(v.anim[1], v.anim[2], v.time, v.flag, v.props)
            elseif v.itsAnimation == "animNorm" then
                playAnimation(v.anim[1], v.anim[2], v.time, v.flag)
            elseif v.itsAnimation == "emote" then
                Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, GetHashKey(v.emote), 1, 1, 0, 0, 0)
            elseif v.itsAnimation == "walkingStyle" then
                Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), v.walkAnim,0,-1)
                Citizen.Wait(100)
                Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), v.walkAnim,1,-1)
            elseif v.itsAnimation == "command" then
                ExecuteCommand(v.command)
            elseif v.itsAnimation == "scenario" then
                TaskStartScenarioInPlace(ped, GetHashKey(v.scenario), -1)
            elseif v.itsAnimation == "lying" then
                if lying == true then
                    lying = false
                else
                    playAnimationLying("mech_crawl@base", "idle_intro", -1, 17);
                    lying = true
                end
            elseif v.itsAnimation == "animShared" then
                local closestPlayer, closestDistance, playerid, tgt1 = getClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 2.0 then
                    ifShared = true
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetEntityCollision(PlayerPedId(), false, false)
                    TriggerServerEvent("gum_animmenu:sendShared", playerid, v.name)
                    attachToPlayer(PlayerPedId(), tgt1, v.offset)
                    Citizen.Wait(150)
                    playAnimation(v.animDict, v.animName, v.time, v.flag)
                else
                    print("No near player")
                end
            end
        end
    end
    if favoriteAnim["favorite"..num] == "clear" then
        if ifShared == true then
            local closestPlayer, closestDistance, playerid, tgt1 = getClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 2.0 then
                TriggerServerEvent("gum_animmenu:clearShared", playerid)
                FreezeEntityPosition(PlayerPedId(), false)
                SetEntityCollision(PlayerPedId(), true, true)
            end
        end
        ifShared = false
        lying = false
        ClearPedTasks(PlayerPedId())
    end
end

RegisterNetEvent("gum_animmenu:updateAnimations")
AddEventHandler("gum_animmenu:updateAnimations", function(anim, job)
    animations = anim
    myJob = job
    loadAll()
    Citizen.Wait(100)
    SetNuiFocus(true, true)
    SendNUIMessage({type = "animMenu", anims=filtered, props=filteredProps, myAnims=animations})
end)



function loadAll()
    filteredProps = {}
    for k,v in pairs(Config.Prop) do
        local haveData = false
        for a,b in pairs(v.jobLock) do
            haveData = true
        end
        if haveData == false then
            table.insert(filteredProps, {name=v.name})
        else
            for a,b in pairs(v.jobLock) do
                if type(myJob) == "table" then
                    for c,d in pairs(myJob) do
                        if b == d.job then
                            table.insert(filteredProps, {name=v.name})
                        end
                    end
                else
                    if myJob == b then
                        table.insert(filteredProps, {name=v.name})
                    end
                end
            end
        end
    end
    if type(myJob) == "table" then
        for c,d in pairs(myJob) do
            if "Native" == d.job then
                if myJob == "Native" then
                    table.insert(filteredProps, {name="Aligator tooth"})
                    table.insert(filteredProps, {name="Bear Claw"})
                    table.insert(filteredProps, {name="Boar Tusk"})
                    table.insert(filteredProps, {name="Buffalo horn"})
                    table.insert(filteredProps, {name="Eagle talon"})
                end
            end
        end
    else
        if myJob == "Native" then
            table.insert(filteredProps, {name="Aligator tooth"})
            table.insert(filteredProps, {name="Bear Claw"})
            table.insert(filteredProps, {name="Boar Tusk"})
            table.insert(filteredProps, {name="Buffalo horn"})
            table.insert(filteredProps, {name="Eagle talon"})
        end
    end

    filtered = {}
    for k,v in pairs(Config.Anim) do
        if v.iconRadial then
            haveIcon[v.name] = true
        end
        if v.itsAnimation == "command" then
            if IsPedMale(PlayerPedId()) then
                table.insert(filtered, {name=v.name})
            end
            if not IsPedMale(PlayerPedId()) then
                if v.female == true then
                    table.insert(filtered, {name=v.name})
                end
            end
        end
    end
    for k,v in pairs(Config.Anim) do
        if v.itsAnimation == "emote" then
            if IsPedMale(PlayerPedId()) then
                table.insert(filtered, {name=v.name})
            end
            if not IsPedMale(PlayerPedId()) then
                if v.female == true then
                    table.insert(filtered, {name=v.name})
                end
            end
        end
    end
    for k,v in pairs(Config.Anim) do
        if v.itsAnimation == "scenario" then
            if IsPedMale(PlayerPedId()) then
                table.insert(filtered, {name=v.name})
            end
            if not IsPedMale(PlayerPedId()) then
                if v.female == true then
                    table.insert(filtered, {name=v.name})
                end
            end
        end
    end
    for k,v in pairs(Config.Anim) do
        if v.itsAnimation == "animNorm" then
            if IsPedMale(PlayerPedId()) then
                table.insert(filtered, {name=v.name})
            end
            if not IsPedMale(PlayerPedId()) then
                if v.female == true then
                    table.insert(filtered, {name=v.name})
                end
            end
        end
    end
    for k,v in pairs(Config.Anim) do
        if v.itsAnimation == "animShared" then
            if IsPedMale(PlayerPedId()) then
                table.insert(filtered, {name=v.name})
            end
            if not IsPedMale(PlayerPedId()) then
                if v.female == true then
                    table.insert(filtered, {name=v.name})
                end
            end
        end
    end
    for k,v in pairs(Config.Anim) do
        if v.itsAnimation == "animWithProp" then
            if IsPedMale(PlayerPedId()) then
                table.insert(filtered, {name=v.name})
            end
            if not IsPedMale(PlayerPedId()) then
                if v.female == true then
                    table.insert(filtered, {name=v.name})
                end
            end
        end
    end
    for k,v in pairs(Config.Anim) do
        if v.itsAnimation == "walkingStyle" then
            if IsPedMale(PlayerPedId()) then
                table.insert(filtered, {name=v.name})
            end
            if not IsPedMale(PlayerPedId()) then
                if v.female == true then
                    table.insert(filtered, {name=v.name})
                end
            end
        end
    end
end


function getClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
    
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])
        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
                playerid = GetPlayerServerId(players[i])
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return closestPlayer, closestDistance,  playerid, tgt1
end


function playAnimation(dict, name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.0, -1.0, time, flag, 0, true, 0, false, 0, false)
end

function playAnimationLying(dict, name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 2.0, -2.0, time, flag, 0, true, 0, false, 0, false)
end

function playAnimationProp(dict, name, time, flag, setup)
    if dict ~= "" then
        playAnimation(dict, name, time, flag)
    end
    Citizen.Wait(900)
    local pos = GetEntityCoords(PlayerPedId())
    if propAnim == nil then
        while not HasModelLoaded(GetHashKey(setup[1])) do
            Wait(0)
            ModelRequest( GetHashKey(setup[1]) )
        end
        propAnim = CreateObject(setup[1], pos.x, pos.y, pos.z, true, true, false)
        AttachEntityToEntity(propAnim, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), setup[2]), setup[3], setup[4], setup[5], setup[6], setup[7], setup[8], false, false, true, false, 0, true, false, false)
        SetEntityCollision(propAnim, false, true)
    end
end

function buttonPrompt()
	Citizen.CreateThread(function()
		local str = ""..Config.Language[6]..""
		Anim1Prompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(Anim1Prompt, 0x339F3730)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(Anim1Prompt, str)
		PromptSetEnabled(Anim1Prompt, true)
		PromptSetVisible(Anim1Prompt, true)
		PromptSetHoldMode(Anim1Prompt, true)
		PromptSetGroup(Anim1Prompt, buttons_prompt)
		PromptRegisterEnd(Anim1Prompt)
	end)
	Citizen.CreateThread(function()
		local str = ""..Config.Language[7]..""
		Anim2Prompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(Anim2Prompt, 0x8FD015D8)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(Anim2Prompt, str)
		PromptSetEnabled(Anim2Prompt, true)
		PromptSetVisible(Anim2Prompt, true)
		PromptSetHoldMode(Anim2Prompt, true)
		PromptSetGroup(Anim2Prompt, buttons_prompt)
		PromptRegisterEnd(Anim2Prompt)
	end)
	Citizen.CreateThread(function()
		local str = ""..Config.Language[8]..""
		Anim3Prompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(Anim3Prompt, 0x7C0162C0)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(Anim3Prompt, str)
		PromptSetEnabled(Anim3Prompt, true)
		PromptSetVisible(Anim3Prompt, true)
		PromptSetHoldMode(Anim3Prompt, true)
		PromptSetGroup(Anim3Prompt, buttons_prompt)
		PromptRegisterEnd(Anim3Prompt)
	end)
	Citizen.CreateThread(function()
		local str = ""..Config.Language[9]..""
		Anim4Prompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(Anim4Prompt, 0xD27782E3)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(Anim4Prompt, str)
		PromptSetEnabled(Anim4Prompt, true)
		PromptSetVisible(Anim4Prompt, true)
		PromptSetHoldMode(Anim4Prompt, true)
		PromptSetGroup(Anim4Prompt, buttons_prompt)
		PromptRegisterEnd(Anim4Prompt)
	end)
    Citizen.CreateThread(function()
		local str = ""..Config.Language[10]..""
		Anim5Prompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(Anim5Prompt, 0x39336A4F)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(Anim5Prompt, str)
		PromptSetEnabled(Anim5Prompt, true)
		PromptSetVisible(Anim5Prompt, true)
		PromptSetHoldMode(Anim5Prompt, true)
		PromptSetGroup(Anim5Prompt, buttons_prompt)
		PromptRegisterEnd(Anim5Prompt)
	end)
end
function ModelRequest(model)
    Citizen.CreateThread(function()
        RequestModel(model)
    end)
end
