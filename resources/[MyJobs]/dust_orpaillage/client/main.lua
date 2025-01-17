math.randomseed(GetGameTimer())
local CancelPrompt
local PanPrompt
local GoldPanning = false
local SearchingForGold = false
local Prop = nil
local spawnramp = false
local isInteracting = false
local transform = false

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
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        local goldramp = GetClosestObjectOfType(pos, 1.5, Config.GoldRamp, false, false, false)
        if goldramp ~= 0 then
            local objectPos = GetEntityCoords(goldramp)
            if #(pos - objectPos) < 1.5 and not isInteracting then
                PromptSetActiveGroupThisFrame(RampPromptGroup, RampPromptName)
            end
            if IsControlJustReleased(0, 0x5181713D) and not isInteracting then
                isInteracting = true
                transform = true
                local playerPed = PlayerPedId()
                TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CLEAN_TABLE'), -1, true, false, false, false) 
                local Position = GetEntityCoords(playerPed)
                while true do
                    Citizen.Wait(Config.WorkingTime)
                    if #(Position - GetEntityCoords(PlayerPedId())) < 1.0  and not SearchingForGold then
                        TriggerServerEvent('dust-or:server:ramp')
                    else
                        isInteracting = false
                        break
                    end
                end
            end
            if PromptHasHoldModeCompleted(LeavePrompt) and not isInteracting then
                local playerPed = PlayerPedId()
                RequestAnimDict(Config.RampInDict)
                while not HasAnimDictLoaded(Config.RampInDict) do
                    Citizen.Wait(50)
                end
                for k,v in pairs(Config.RampInAnim) do
                    TaskPlayAnim(playerPed, Config.RampInDict, v, 8.0, -8.0, -1, 2, 0, true)
                end
                Citizen.Wait(3000)
                RequestAnimDict(Config.RampOutDict)
                while not HasAnimDictLoaded(Config.RampOutDict) do
                    Citizen.Wait(50)
                end
                for k,v in pairs(Config.RampOutAnim) do
                    TaskPlayAnim(playerPed, Config.RampOutDict, v, 8.0, -8.0, -1, 0, 0, true)
                    Citizen.Wait(1000)
                end
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
        RequestAnimDict(Config.RampInDict)
        while not HasAnimDictLoaded(Config.RampInDict) do
            Citizen.Wait(50)
        end
        for k,v in pairs(Config.RampInAnim) do
            TaskPlayAnim(playerPed, Config.RampInDict, v, 8.0, -8.0, -1, 2, 0, true)
        end
        Citizen.Wait(3000)
        RequestAnimDict(Config.RampOutDict)
        while not HasAnimDictLoaded(Config.RampOutDict) do
            Citizen.Wait(50)
        end
        for k,v in pairs(Config.RampOutAnim) do
            TaskPlayAnim(playerPed, Config.RampOutDict, v, 8.0, -8.0, -1, 0, 0, true)
            Citizen.Wait(1000)
        end
        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.5, -1.55))
        local ramp = CreateObject(Config.GoldRamp, x, y, z, true, false, true)
        SetEntityHeading(ramp, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(ramp)
        goldramp = ramp
        spawnramp = true
    else return end
end, false)


AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if Prop then if DoesEntityExist(Prop) then DeleteEntity(Prop) end end
    if goldramp then if DoesEntityExist(goldramp) then DeleteEntity(goldramp) end end
    PromptDelete(PanPrompt)
    PromptDelete(CancelPrompt)
    PromptDelete(RampPrompt)
    PromptDelete(LeavePrompt)
end)

RegisterNetEvent("dust-or:server:notinteracting", function()
    local playerPed = PlayerPedId()
    ClearPedTasks(playerPed)
    isInteracting = false 
end)