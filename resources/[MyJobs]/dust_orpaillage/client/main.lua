math.randomseed(GetGameTimer())
local CancelPrompt
local PanPrompt
local GoldPanning = false
local SearchingForGold = false
local Prop = nil
local spawnramp = false
local isInteracting = false

local GoldPanPromptGroup = GetRandomIntInRange(0, 0xffffff)
local GoldPanningPromptName = CreateVarString(10, "LITERAL_STRING", "Bâtée")

Citizen.CreateThread(function()
    local str = 'Prospecter'
    PanPrompt = PromptRegisterBegin()
    PromptSetControlAction(PanPrompt, 0x5181713D)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(PanPrompt, str)
    PromptSetEnabled(PanPrompt, true)
    PromptSetVisible(PanPrompt, true)
    PromptSetHoldMode(PanPrompt, false)
    PromptSetGroup(PanPrompt, GoldPanPromptGroup)
    PromptRegisterEnd(PanPrompt)

    str = 'Ranger'
    CancelPrompt = PromptRegisterBegin()
    PromptSetControlAction(CancelPrompt, 0x8E90C7BB)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(CancelPrompt, str)
    PromptSetEnabled(CancelPrompt, true)
    PromptSetVisible(CancelPrompt, true)
    PromptSetHoldMode(CancelPrompt, true)
    PromptSetGroup(CancelPrompt, GoldPanPromptGroup)
    PromptRegisterEnd(CancelPrompt)
end)

local RampPromptGroup = GetRandomIntInRange(0, 0xffffff)
local RampPromptName = CreateVarString(10, "LITERAL_STRING", "Rampe de lavage")
local LeavePrompt
local RampPrompt
Citizen.CreateThread(function()
    local str = 'Laver'
    RampPrompt = PromptRegisterBegin()
    PromptSetControlAction(RampPrompt, 0x5181713D)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(RampPrompt, str)
    PromptSetEnabled(RampPrompt, true)
    PromptSetVisible(RampPrompt, true)
    PromptSetHoldMode(RampPrompt, false)
    PromptSetGroup(RampPrompt, RampPromptGroup)
    PromptRegisterEnd(RampPrompt)

    str = 'Démonter'
    LeavePrompt = PromptRegisterBegin()
    PromptSetControlAction(LeavePrompt, 0x8E90C7BB)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(LeavePrompt, str)
    PromptSetEnabled(LeavePrompt, true)
    PromptSetVisible(LeavePrompt, true)
    PromptSetHoldMode(LeavePrompt, true)
    PromptSetGroup(LeavePrompt, RampPromptGroup)
    PromptRegisterEnd(LeavePrompt)
end)

Citizen.CreateThread(function()
    while true do
        Citzen.Wait(0)
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed), true
        local goldramp = GetClosestObjectOfType(pos, 2.0, Config.GoldRamp, false, false, false)
        if goldramp ~= 0 then
            local objectPos = GetEntityCoords(goldramp)
            if #(pos - objectPos) < 2.5 and not isInteracting then
            PromptSetActiveGroupThisFrame(RampPromptGroup, RampPromptName)
            if IsControlJustReleased(0, 0x5181713D) then
                isInteracting = true
                local playerPed = PlayerPedId()
                FreezeEntityPosition(playerPed, true)
                TriggerServerEvent('dust-or:server:ramp', source)
            end
            if PromptHasHoldModeCompleted(CancelPrompt) and not isInteracting then
                local playerPed = PlayerPedId()
                SetEntityAsMissionEntity(goldramp)
                DeleteObject(goldramp)
                goldramp = 0
                spawnramp = false
            end
        end
    end
end)




RegisterNetEvent("EnablePanningMode", function()
    GoldPanning = true
    SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
    if not Prop then
        local playerPed = PlayerPedId()
        local pc = GetEntityCoords(playerPed)
        local pname = 's_miningpan01x'
        RequestAnimDict("SCRIPT_RE@GOLD_PANNER@GOLD_SUCCESS")
        while not HasAnimDictLoaded("SCRIPT_RE@GOLD_PANNER@GOLD_SUCCESS") do
            Citizen.Wait(50)
        end
        if IsPedMale(playerPed) then
            Prop = CreateObject(GetHashKey(pname), pc.x, pc.y, pc.z + 0.2, true, true, true)
            AttachEntityToEntity(Prop, playerPed, GetEntityBoneIndexByName(playerPed, "SKEL_R_Finger12"), 0.150, -0.03, 0.010, 90.0, -60.0, -30.0, true, true, false, true, 1, true)
        else
            Prop = CreateObject(GetHashKey(pname), pc.x, pc.y, pc.z + 0.2, true, true, true)
            AttachEntityToEntity(Prop, playerPed, 387, 0.150, -0.03, 0.010, 90.0, -60.0, -30.0, true, true, false, true, 1, true)
        end
    end
end)

function StartGoldpan()
    SearchingForGold = true
    local success = lib.skillCheck({'easy', 'medium'})
    if not success then IsActive = false ; SearchingForGold = false ; return end
   
    IsActive = true
    local playerPed = PlayerPedId()
    for k,v in pairs(Config.GoldPanAnimations) do
        TaskPlayAnim(playerPed, "SCRIPT_RE@GOLD_PANNER@GOLD_SUCCESS", v, 8.0, -8.0, -1, 1, 0, true)
        Citizen.Wait(3000)
    end
    ClearPedTasks(playerPed)
    local x, y, z =  table.unpack(GetEntityCoords(playerPed))

    local current_river = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, 3)
    local current_creek = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, 7)
    print (current_river)
    print (current_creek)
    if current_river then
        if Config.RiverChances[current_river] then
            if not Config.RiverChances[current_river].chanceToGet then
            else
                TriggerServerEvent("dust-or:server:récolte", Config.RiverChances[current_river].chanceToGet, Config.RiverChances[current_river].chanceOfTwo)
            end
        end
    elseif current_creek then
        if Config.RiverChances[current_creek] then
            if not Config.RiverChances[current_creek].chanceToGet then
            else
                TriggerServerEvent("dust-or:server:récolte", Config.RiverChances[current_creek].chanceToGet, Config.RiverChances[current_creek].chanceOfTwo)
            end
        end

    end
    IsActive = false

    SearchingForGold = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GoldPanning then
            PromptSetActiveGroupThisFrame(GoldPanPromptGroup, GoldPanningPromptName)
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
            RemoveAllPedWeapons(PlayerPedId(), true)

            if IsControlJustReleased(0, 0x5181713D) and not SearchingForGold then
                if IsEntityInWater(PlayerPedId()) then
                    StartGoldpan()
                end
            end

            if PromptHasHoldModeCompleted(CancelPrompt) and not SearchingForGold then
                GoldPanning = false
                DeleteEntity(Prop)
                Prop = nil
            end
        end
    end
end)

---------------- RAMP ------------------
RegisterNetEvent('goldramp')
AddEventHandler('goldramp', function() 
    if spawnramp == false then
        if goldramp ~= 0 then
            SetEntityAsMissionEntity(goldramp)
            DeleteObject(goldramp)
            goldramp = 0
        end
        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
        local ramp = CreateObject(Config.GoldRamp, x, y, z, true, false, true)
        SetEntityHeading(ramp, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(ramp)
        goldramp = ramp
        spawnramp = true
    else return end
end, false)

RegisterNetEvent("dust-or:server:rampanim")
AddEventHandler("dust-or:server:rampanim", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    FreezeEntityPosition(playerPed, true)
    isInteracting = true
    RequestAnimDict(Config.AnimDict)
    while not HasAnimDictLoaded(Config.AnimDict) do
        Citizen.Wait(50)
    end
    for k,v in pairs(Config.CraftAnim) do
        TaskPlayAnim(playerPed, Config.AnimDict, v, 8.0, -8.0, -1, 1, 0, true)
            Citizen.Wait(3000)
        end
    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true

    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        ClearPedTasksImmediately(PlayerPedId())
        FreezeEntityPosition(playerPed, false)
        isInteracting = false
    end)    
end)



AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if Prop then if DoesEntityExist(Prop) then DeleteEntity(Prop) end end
    PromptDelete(PanPrompt)
    PromptDelete(CancelPrompt)
end)