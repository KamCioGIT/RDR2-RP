local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt2 = GetRandomIntInRange(0, 0xffffff)
local active_knife = false
local knife_where = 0
local IsInPlayKnife = false


function Knife_Prompt()
	Citizen.CreateThread(function()
        local str = Config.Lang_1
        ChangeCharPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(ChangeCharPrompt, 0x52D29063)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(ChangeCharPrompt, str)
        PromptSetEnabled(ChangeCharPrompt, true)
        PromptSetVisible(ChangeCharPrompt, true)
        PromptSetHoldMode(ChangeCharPrompt, true)
        PromptSetGroup(ChangeCharPrompt, buttons_prompt)
        PromptRegisterEnd(ChangeCharPrompt)
	end)
    Citizen.CreateThread(function()
        local str = Config.Lang_2
        SelectPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(SelectPrompt, 0x1CE6D9EB)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SelectPrompt, str)
        PromptSetEnabled(SelectPrompt, true)
        PromptSetVisible(SelectPrompt, true)
        PromptSetHoldMode(SelectPrompt, true)
        PromptSetGroup(SelectPrompt, buttons_prompt)
        PromptRegisterEnd(SelectPrompt)
	end)
    Citizen.CreateThread(function()
        local str = Config.Lang_3
        SelectPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(SelectPrompt, 0x4F49CC4C)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SelectPrompt, str)
        PromptSetEnabled(SelectPrompt, true)
        PromptSetVisible(SelectPrompt, true)
        PromptSetHoldMode(SelectPrompt, true)
        PromptSetGroup(SelectPrompt, buttons_prompt)
        PromptRegisterEnd(SelectPrompt)
	end)
    Citizen.CreateThread(function()
        local str = Config.Lang_4
        SelectPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(SelectPrompt, 0x8F9F9E58)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SelectPrompt, str)
        PromptSetEnabled(SelectPrompt, true)
        PromptSetVisible(SelectPrompt, true)
        PromptSetHoldMode(SelectPrompt, true)
        PromptSetGroup(SelectPrompt, buttons_prompt)
        PromptRegisterEnd(SelectPrompt)
	end)
    Citizen.CreateThread(function()
        local str = Config.Lang_5
        SelectPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(SelectPrompt, 0xAB62E997)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SelectPrompt, str)
        PromptSetEnabled(SelectPrompt, true)
        PromptSetVisible(SelectPrompt, true)
        PromptSetHoldMode(SelectPrompt, true)
        PromptSetGroup(SelectPrompt, buttons_prompt)
        PromptRegisterEnd(SelectPrompt)
	end)
    Citizen.CreateThread(function()
        local str = Config.Lang_6
        SelectPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(SelectPrompt, 0xA1FDE2A6)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SelectPrompt, str)
        PromptSetEnabled(SelectPrompt, true)
        PromptSetVisible(SelectPrompt, true)
        PromptSetHoldMode(SelectPrompt, true)
        PromptSetGroup(SelectPrompt, buttons_prompt)
        PromptRegisterEnd(SelectPrompt)
	end)
    Citizen.CreateThread(function()
        local str = Config.Lang_13
        SelectPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(SelectPrompt, 0xB03A913B)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SelectPrompt, str)
        PromptSetEnabled(SelectPrompt, true)
        PromptSetVisible(SelectPrompt, true)
        PromptSetHoldMode(SelectPrompt, true)
        PromptSetGroup(SelectPrompt, buttons_prompt)
        PromptRegisterEnd(SelectPrompt)
	end)
end


function GetNearestTableFromPosition(radius)

    local playerPosition = GetEntityCoords(PlayerPedId())

    local position

    for _, model in pairs(Config.Tablemodels) do
        local entity = GetClosestObjectOfType(playerPosition, radius, GetHashKey(model), 0, 0, 0)
        if DoesEntityExist(entity) then
            position = GetEntityCoords(entity)
            break
        end
    end

    return position
end

RegisterNetEvent('dust_play')
AddEventHandler('dust_play', function(now)

    local isTableNearPlayer = GetNearestTableFromPosition(Config.RadiusInteraction) ~= nil

    if isTableNearPlayer then
    if now == 1 then
        print 'get'
        if not IsInPlayKnife then
            _, wepHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
            if GetHashKey('GROUP_MELEE') == GetWeapontypeGroup(wepHash) then
                IsInPlayKnife = true
                chair_props = CreateObject("p_chair11x", -304.67, 802.20, 117.98427032470703, true, true, true)
                AttachEntityToEntity(chair_props, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "MH_L_BeltFrontHolster"), 0.05, 0, -0.99, 0.0, 0.0, -178.0, true, true, true, true, 1, true)
                if IsPedMale(PlayerPedId()) then
                    playAnim("mini_games@fivefingerfillet", "base_01", -1, 2)
                else
                    playAnim("mini_games@fivefingerfillet_female", "base_01", -1, 2)
                end
            else
                --notif texte t'es pas au bon endroit
            end
        else
            DeleteObject(chair_props)
            IsInPlayKnife = false
            ClearPedTasks(PlayerPedId())
        end
    end 
end
       
end)


Citizen.CreateThread(function()
    while true do
        if IsInPlayKnife then
            if active_knife == false then
                local create_char = CreateVarString(10, 'LITERAL_STRING', Config.Lang_13)
                PromptSetActiveGroupThisFrame(buttons_prompt, create_char)
            end
        end
        Citizen.Wait(10)
    end
end)
Citizen.CreateThread(function()
    Knife_Prompt()
    while true do
        if IsInPlayKnife then
            opt = 6
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x52D29063) then--RESET STAB
                if IsPedMale(PlayerPedId()) then

                    if not knifing then
                        playAnim("mini_games@fivefingerfillet", "base_01", -1, 2)
                        knifing = true
                    end

                    if knife_where == 0 then
                        playAnim("mini_games@fivefingerfillet", "stab_1_to_0", -1, 2)
                    end

                    if knife_where == 1 and knifing then
                        knife_where = 0
                        playAnim("mini_games@fivefingerfillet", "stab_1_to_0", -1, 2)
                    elseif knife_where == 2 and knifing then
                        knife_where = 0
                        playAnim("mini_games@fivefingerfillet", "stab_2_to_0", -1, 2)
                    elseif knife_where == 3 and knifing then
                        knife_where = 0
                        playAnim("mini_games@fivefingerfillet", "stab_3_to_0", -1, 2)
                    elseif knife_where == 4 and knifing then
                        knife_where = 0
                        playAnim("mini_games@fivefingerfillet", "stab_4_to_0", -1, 2)
                    elseif knife_where == 5 and knifing then
                        knife_where = 0
                        playAnim("mini_games@fivefingerfillet", "stab_5_to_0", -1, 2)
                    elseif knife_where == 6  then
                        playAnim("mini_games@fivefingerfillet", "stab_4_to_spike_low", -1, 2)
                    end
                end
            end

            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x1CE6D9EB) then
                if IsPedMale(PlayerPedId()) then
                    if knife_where ~= 0 then
                        playAnim("mini_games@fivefingerfillet", "medium_fail_01", -1, 2)
                        Citizen.Wait(2000)
                        playAnim("mini_games@fivefingerfillet", "stab_1_to_0", -1, 2)
                        knife_where = 0
                    else
                        local skill = math.random( 1,100 )
                        if skill >= Config.Chance_1 then
                            playAnim("mini_games@fivefingerfillet", "stab_0_to_1", -1, 2)
                            Citizen.Wait(150)
                        else
                            playAnim("mini_games@fivefingerfillet", "flourish_0_to_1", -1, 2)
                            Citizen.Wait(700)
                        end
                        knife_where = 1
                    end
                else
                    playAnim("mini_games@fivefingerfillet_female", "stab_0_to_1", -1, 2)
                end
            end

            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x4F49CC4C) then
                if IsPedMale(PlayerPedId()) then
                    if knife_where ~= 0 then
                        playAnim("mini_games@fivefingerfillet", "medium_fail_02", -1, 2)
                        Citizen.Wait(2000)
                        playAnim("mini_games@fivefingerfillet", "stab_1_to_0", -1, 2)
                        knife_where = 0
                    else
                        local skill = math.random( 1,100 )
                        if skill >= Config.Chance_2 then
                            playAnim("mini_games@fivefingerfillet", "stab_0_to_2", -1, 2)
                            Citizen.Wait(150)
                        else
                            playAnim("mini_games@fivefingerfillet", "flourish_0_to_2", -1, 2)
                            Citizen.Wait(950)
                        end
                        knife_where = 2
                    end
                else
                    playAnim("mini_games@fivefingerfillet_female", "stab_0_to_2", -1, 2)
                end
            end

            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x8F9F9E58) then
                if IsPedMale(PlayerPedId()) then
                    if knife_where ~= 0 then
                        playAnim("mini_games@fivefingerfillet", "medium_fail_03", -1, 2)
                        Citizen.Wait(2000)
                        playAnim("mini_games@fivefingerfillet", "stab_1_to_0", -1, 2)
                        knife_where = 0
                    else
                        local skill = math.random( 1,100 )
                        if skill >= Config.Chance_3 then
                            playAnim("mini_games@fivefingerfillet", "stab_0_to_3", -1, 2)
                            Citizen.Wait(150)
                        else
                            playAnim("mini_games@fivefingerfillet", "flourish_0_to_3", -1, 2)
                            Citizen.Wait(950)
                        end
                        knife_where = 3
                    end
                else
                    playAnim("mini_games@fivefingerfillet_female", "stab_0_to_3", -1, 2)
                end
            end

            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0xAB62E997) then
                if IsPedMale(PlayerPedId()) then
                    if knife_where ~= 0 then
                        playAnim("mini_games@fivefingerfillet", "medium_fail_04", -1, 2)
                        Citizen.Wait(2000)
                        playAnim("mini_games@fivefingerfillet", "stab_1_to_0", -1, 2)
                        knife_where = 0
                    else
                        local skill = math.random( 1,100 )
                        if skill >= Config.Chance_4 then
                            playAnim("mini_games@fivefingerfillet", "stab_0_to_4", -1, 2)
                            Citizen.Wait(150)
                        else
                            Citizen.Wait(950)
                            playAnim("mini_games@fivefingerfillet", "flourish_0_to_4", -1, 2)
                        end
                        knife_where = 4
                    end
                else
                    playAnim("mini_games@fivefingerfillet_female", "stab_0_to_4", -1, 2)
                end
            end

            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0xA1FDE2A6) then
                if IsPedMale(PlayerPedId()) then
                    if knife_where ~= 0 then
                        playAnim("mini_games@fivefingerfillet", "medium_fail_05", -1, 2)
                        Citizen.Wait(2000)
                        playAnim("mini_games@fivefingerfillet", "stab_1_to_0", -1, 2)
                        knife_where = 0
                    else
                        local skill = math.random( 1,100 )
                        if skill >= Config.Chance_5 then
                            playAnim("mini_games@fivefingerfillet", "stab_0_to_5", -1, 2)
                            Citizen.Wait(150)
                        else
                            playAnim("mini_games@fivefingerfillet", "flourish_0_to_5", -1, 2)
                            Citizen.Wait(950)
                        end
                        knife_where = 5
                    end
                else
                    playAnim("mini_games@fivefingerfillet_female", "stab_0_to_5", -1, 2)
                end
            end
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0xB03A913B) then
                if IsPedMale(PlayerPedId()) then
                    if knife_where ~= 0 then
                        playAnim("mini_games@fivefingerfillet", "medium_fail_01", -1, 2)
                        Citizen.Wait(2000)
                        playAnim("mini_games@fivefingerfillet", "stab_1_to_0", -1, 2)
                        knife_where = 0
                    else
                        local skill = math.random( 1,100 )
                        if skill >= Config.Chance_6 then
                            playAnim("mini_games@fivefingerfillet", "stab_4_to_spike_low", -1, 2)
                            Citizen.Wait(150)
                        else
                            playAnim("mini_games@fivefingerfillet", "stab_4_to_spike_low", -1, 2)
                            Citizen.Wait(950)
                        end
                        knife_where = 0
                    end
                else
                    playAnim("mini_games@fivefingerfillet_female", "stab_0_to_5", -1, 2)
                end
            end
                if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x42385422) then
                    if IsPedMale(PlayerPedId()) then
                        if knife_where ~= 0 then
                            playAnim("mini_games@fivefingerfillet", "medium_fail_05", -1, 2)
                            Citizen.Wait(2000)
                            playAnim("mini_games@fivefingerfillet", "stab_1_to_0", -1, 2)
                            knife_where = 0
                        else
                            local skill = math.random( 1,100 )
                            if skill >= Config.Chance_7 then
                                playAnim("mini_games@fivefingerfillet", "win_01", -1, 2)
                                Citizen.Wait(150)
                            else
                                playAnim("mini_games@fivefingerfillet", "win_01", -1, 2)
                                Citizen.Wait(950)
                            end
                            knife_where = 0
                        end
                    else
                        playAnim("mini_games@fivefingerfillet_female", "stab_0_to_5", -1, 2)
                    end
                end 
            end   
        Citizen.Wait(5)
        
    end

end)

function playAnim(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 3.0, 3.0, time, flag, 0, false, 0, false, 0, false)  
end
function playAnim2(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.5, 1.5, time, flag, 0, false, 0, false, 0, false)  
end
