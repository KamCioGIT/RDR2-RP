if Config.AnonymousNames then
    -- Set player's prompt names to anonymous (not their player name)
    CreateThread(function()
        while true do
            Wait(5000)
            for _, player in ipairs(GetActivePlayers()) do
                local ped = GetPlayerPed(player)
                SetPedPromptName(ped, "Inconnu(e)")
            end
        end
    end)
end

if Config.DisableChallengeNotifications then
    -- Disable challenge notifications
    CreateThread(function()
        while true do
            Wait(10)
            local size = GetNumberOfEvents(0)   
            if size > 0 then
                for i = 0, size - 1 do
                    local eventAtIndex = GetEventAtIndex(0, i)
                    if eventAtIndex == GetHashKey("EVENT_CHALLENGE_GOAL_COMPLETE") or eventAtIndex == GetHashKey("EVENT_CHALLENGE_REWARD") or eventAtIndex == GetHashKey("EVENT_DAILY_CHALLENGE_STREAK_COMPLETED") then 
                        Citizen.InvokeNative(0x6035E8FBCA32AC5E)
                    end
                end
            end
        end
    end)
end

if Config.DisableSpaceInWeaponWheel then
    -- Disable space in weapon wheel soft locking the game
    disabledControl = {
        0x7DA48D2A,
        0x9CC7A1A4
    }
    CreateThread(function()
        while true do
            Wait(1)            
            for k,v in pairs(disabledControl) do
                DisableControlAction(0 --[[ integer ]], v --[[ Hash ]], true --[[ boolean ]])        
            end
        end
    end)
end

if Config.MapCrossName then
    -- Set the BLIP_NAME when a player is hovered over on the map
    CreateThread(function()
        local MapFocus = DatabindingAddUiItemListFromPath("", "MapFocus")
        local HoveredName = DatabindingAddDataString(MapFocus, "HoveredName", "")
        DatabindingWriteDataString(HoveredName, Config.MapCrossName)
    end)
end

if Config.DisableLootBoxes then
    -- Disable random loot boxes
    CreateThread(function()
        while true do
            Wait(0)
            Citizen.InvokeNative(0xFC094EF26DD153FA, 2)   -- _UIPROMPT_DISABLE_PROMPT_TYPE_THIS_FRAME, disable "open\close drawer\clipboard\cabinet\etc" prompt types.
        end
    end)
end

if Config.DisableAimAssist then
    -- Disable aim assist on controllers
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            SetPlayerTargetingMode(3) -- or Citizen Native : Citizen.InvokeNative(0xD66A941F401E7302, 3)
        end
    end)
end


----- boats

local boatsInvincible = false -- Sets all boats to be invincible
local noSinkZone = true -- Stops boats from sinking when past the sink zone border
local infSwim = true -- Allows infinite swimming, similar to GTA 5 swimming
local StaminaLevel = 10 -- stamina level you want to keep while swimming recommended value is - 10 otherwhise players can just get max stam core if they swim.

function CheckPlayerWaterStatus()
    if IsPedSwimming(PlayerPedId()) and infSwim then
        local stam = GetAttributeCoreValue(PlayerPedId(), 1)
        if stam < StaminaLevel then
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, StaminaLevel)
        end
    end
end

function StopBoatFromSinking()
    local ped = PlayerPedId()
    if IsPedInAnyBoat(ped) then
        local veh = GetVehiclePedIsIn(ped, false)
        SetEntityInvincible(veh, boatsInvincible)
    end
end

function ApplySinkZone()
    if noSinkZone then
        Citizen.InvokeNative(0xC1E8A365BF3B29F2, PlayerPedId(), 364, 1) -- Stop boat from sinking past sink zones
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        CheckPlayerWaterStatus()
        ApplySinkZone()
        StopBoatFromSinking()
    end
end)