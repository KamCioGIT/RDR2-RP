RedEM = exports["redem_roleplay"]:RedEM()

SettingGrade = {}
Duty = {}
JobLedgers = {}
DutyCommandTimer = {}

Citizen.CreateThread(function()
    while true do
        Wait(900000) -- 15 minutes
        DoPay()
    end
end)

AddEventHandler("redemrp:playerLoaded", function(source, user)
    TriggerClientEvent("redemrp_bossmenu:client:ReceiveJob", source, user.GetJob(), user.GetJobGrade())
end)

function DoPay()
    for _,playerId in ipairs(GetPlayers()) do
        local id = tonumber(playerId)
        if Duty[id] then
            local user = RedEM.GetPlayer(id)
            if user then
                local job, grade = user.getJob(), user.getJobgrade()
                if Config.Jobs[job] then
                    if Config.Jobs[job].Grades[grade] then
                        if Config.Jobs[job].Grades[grade].Pay then
                            local pay = Config.Jobs[job].Grades[grade].Pay
                            TriggerClientEvent("RedEM:client:PlaySound", id, 1)
                            user.AddMoney(pay)
                        end
                    end
                end
            end
        end
    end
end


AddEventHandler('playerDropped', function(reason)
    local _source = source
    if Duty[_source] then
        Duty[_source] = nil
    end
end)

RegisterCommand("getjob", function(source, args, rawCommand)
    local user = RedEM.GetPlayer(source)
    if user.GetGroup() == "admin" or user.GetGroup() == "superadmin" then
        if args[1] ~= nil then
            local tuser = RedEM.GetPlayer(args[1])
            if tuser then
                local gradename = tuser.jobgrade
                if Config.Jobs[tuser.job] then
                    if Config.Jobs[tuser.job].Grades[tuser.jobgrade] then
                        if Config.Jobs[tuser.job].Grades[tuser.jobgrade].Name then
                            gradename = Config.Jobs[tuser.job].Grades[tuser.jobgrade].Name .. " ("..tuser.jobgrade..")"
                        end
                    end
                end
                local jobname = tuser.job
                if Config.Jobs[tuser.job] then
                    if Config.Jobs[tuser.job].Name then
                        jobname = Config.Jobs[tuser.job].Name
                    end
                end
                if Duty[source] then
                    RedEM.Functions.NotifyRight( source, "<br/><strong>Current Job for "..tuser.GetName().."</strong><br/>"..jobname.." ("..tuser.job..")<br/>"..gradename.." [ON DUTY]", 5000)
                else
                    RedEM.Functions.NotifyRight( source, "<br/><strong>Current Job for "..tuser.GetName().."</strong><br/>"..jobname.." ("..tuser.job..")<br/>"..gradename.." [OFF DUTY]", 5000)
                end
            end
        else
            RedEM.Functions.NotifyRight( source, "/getjob [Player ID]", 3000)
        end
    else
        RedEM.Functions.NotifyRight( source, "Insufficient permissions.", 3000)
    end
end, false)

function GetJobDuty(playerId)
    if Duty[playerId] then
        return true
    else return false end
end
exports("GetJobDuty", GetJobDuty)

-- RegisterCommand("job", function(source, args)
--     local user = RedEM.GetPlayer(source)
--     local job = user.job
--     if job == "unemployed" then
--         RedEM.Functions.NotifyRight( source, "You are unemployed!", 3000)
--     else
--         local gradename = "Rank UNKNOWN (".. user.jobgrade..")"
--         if type(grade) == "string" then grade = tonumber(grade) end
--         if Config.Jobs[user.job] then
--             if Config.Jobs[user.job].Grades[user.jobgrade] then
--                 if Config.Jobs[user.job].Grades[user.jobgrade].Name then
--                     gradename = Config.Jobs[user.job].Grades[user.jobgrade].Name .. " ("..user.jobgrade..")"
--                 end
--             end
--         end

--         local jobname = user.job
--         if Config.Jobs[user.job] then
--             if Config.Jobs[user.job].Name then
--                 jobname = Config.Jobs[user.job].Name
--             end
--         end
--         if Duty[source] then
--             RedEM.Functions.NotifyRight( source, "<br/><strong>Current Job</strong><br/>"..jobname.." ("..user.job..")<br/>"..gradename.." [ON DUTY]", 5000)
--         else
--             RedEM.Functions.NotifyRight( source, "<br/><strong>Current Job</strong><br/>"..jobname.." ("..user.job..")<br/>"..gradename.." [OFF DUTY]", 5000)
--         end
--     end
-- end)

RegisterServerEvent("redemrp_bossmenu:server:RequestJob", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    if user then
        TriggerClientEvent("redemrp_bossmenu:client:ReceiveJob", _source, user.GetJob(), user.GetJobGrade())
    end
end)

RegisterServerEvent("redemrp_bossmenu:server:LogoutOffDuty", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job = user.getJob()
    if Duty[_source] then
        if job == "police" or job == "police2" or job == "police3" or job == "police4" or job == "police5" or job == "marshal" or job == "court" or job == "ranger" then
            Duty[_source] = false
            TriggerEvent("redemrp_dutybot:server:toggleDuty", _source)
        end
    end
end)

RegisterServerEvent("redemrp_bossmenu:server:ToggleDuty", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job = user.GetJob()
    if not Duty[_source] then
        Duty[_source] = true
        -- TriggerEvent('redemrp_log:server:CreateLog', 'bossmenu', 'Job Duty', 'lightgreen', 
        --         "[".._source.."] **"..user.GetFirstName().." "..user.GetLastName().. "** (serverid: ".._source.." | name: ".. GetPlayerName(_source).." | steamid: "..user.GetIdentifier().." | characterid: "..user.GetActiveCharacter()..")" .. " went **ON** duty for job "..user.getJob())
        RedEM.Functions.NotifyRight( source, "Vous êtes en service!", 3000)
        if job == "police" or job == "police2" or job == "police3" or job == "police4" or job == "police5" or job == "marshal" or job == "court" or job == "ranger" then
            TriggerEvent("redemrp_dutybot:server:toggleDuty", _source)
        end
    else
        -- TriggerEvent('redemrp_log:server:CreateLog', 'bossmenu', 'Job Duty', 'red', 
        --     "[".._source.."] **"..user.GetFirstName().." "..user.GetLastName().. "** (serverid: ".._source.." | name: ".. GetPlayerName(_source).." | steamid: "..user.GetIdentifier().." | characterid: "..user.GetActiveCharacter()..")" .. " went **OFF** duty for job "..user.getJob())
        Duty[_source] = false
        RedEM.Functions.NotifyRight( source, "Vous n'êtes plus en service!", 3000)
        if job == "police" or job == "police2" or job == "police3" or job == "police4" or job == "police5" or job == "marshal" or job == "court" or job == "ranger" then
            TriggerEvent("redemrp_dutybot:server:toggleDuty", _source)
        end
    end
end)

RegisterServerEvent("redemrp_bossmenu:server:RequestBossMenu", function() ---- garde
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job, grade = user.GetJob(), user.GetJobGrade()
    if Config.Jobs[job] then
        if Config.Jobs[job].Grades[grade] then
            TriggerClientEvent("redemrp_bossmenu:client:OpenBossMenu", _source, JobLedgers[job])
        else
            -- RedEM.Functions.NotifyRight( _source, "Your job rank is invalid, contact staff!", 3000)
        end
    end
end)

RegisterServerEvent("redemrp_bossmenu:server:HireMember", function(targetId)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job, grade = user.GetJob(), user.GetJobGrade()
    local _target = targetId
    if Config.Jobs[job] then
        if Config.Jobs[job].Grades[grade].Personnel then
            local targetUser = RedEM.GetPlayer(_target)
            if targetUser then
                local targetJob = targetUser.GetJob()
                targetUser.SetJob(job)
                targetUser.SetJobGrade(1)
                -- TriggerEvent('redemrp_log:server:CreateLog', 'bossmenu', 'Hired Employee', 'lightgreen', 
                --     "[".._source.."] **"..user.GetFirstName().." "..user.GetLastName().. "** (serverid: ".._source.." | name: ".. GetPlayerName(_source).." | steamid: "..user.GetIdentifier().." | characterid: "..user.GetActiveCharacter()..")" .. " hired "..
                --     "["..targetId.."] **"..targetUser.GetFirstName().." "..targetUser.GetLastName().. "** (serverid: "..targetId.." | name: ".. GetPlayerName(targetId).." | steamid: "..targetUser.GetIdentifier().." | characterid: "..targetUser.GetActiveCharacter()..") into job "..job)
                TriggerEvent("redemrp_bossmenu:server:RequestJob", _target)
                -- RedEM.Functions.NotifyLeft(_source, "Employé embauché!", "menu_icon_tick", 3000)
                TriggerClientEvent("redemrp_bossmenu:client:OpenBossMenu", _source, JobLedgers[job])
            end
        end
    end
end)

RegisterServerEvent("redemrp_bossmenu:server:GetFireList", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job, grade = user.GetJob(), user.GetJobGrade()
    if Config.Jobs[job] then
        if Config.Jobs[job].Grades[grade].Personnel then
            local FireList = {}
            for _,targetId in ipairs(GetPlayers()) do
                local targetUser = RedEM.GetPlayer(targetId)
                if targetUser then
                    local targetJob = targetUser.GetJob()
                    if targetJob == job then
                        local targetName = targetUser.GetFirstName() .. " " .. targetUser.GetLastName()
                        local serverName = GetPlayerName(tonumber(targetId))
                        table.insert(FireList, {char = targetName, name = serverName, id = tonumber(targetId)})
                    end
                end
            end
            TriggerClientEvent("redemrp_bossmenu:client:ViewFireList", _source, FireList)
        else
            RedEM.Functions.NotifyLeft(_source, "No access!", "You don't have personnel access!", "menu_textures", "menu_icon_alert", 3000)
        end
    end
end)
RegisterServerEvent("redemrp_bossmenu:server:GetGradeList", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job, grade = user.GetJob(), user.GetJobGrade()
    if Config.Jobs[job] then
        if Config.Jobs[job].Grades[grade].Personnel then
            local GradeList = {}
            for _,targetId in ipairs(GetPlayers()) do
                local targetUser = RedEM.GetPlayer(targetId)
                if targetUser then
                    local targetJob = targetUser.GetJob()
                    local targetGrade = targetUser.GetJobGrade()
                    if targetJob == job and tonumber(targetGrade) < tonumber(grade) then
                        local targetName = targetUser.GetFirstName() .. " " .. targetUser.GetLastName()
                        local serverName = GetPlayerName(tonumber(targetId))
                        table.insert(GradeList, {char = targetName, name = serverName, id = tonumber(targetId)})
                    end
                end
            end
            TriggerClientEvent("redemrp_bossmenu:client:ViewGradeList", _source, GradeList)
        else
            RedEM.Functions.NotifyLeft(_source, "No access!", "You don't have personnel access!", "menu_textures", "menu_icon_alert", 3000)
        end
    end
end)

RegisterServerEvent("redemrp_bossmenu:server:GetOfflineFireList", function() ---- garde
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job, grade = user.GetJob(), user.GetJobGrade()


    if Config.Jobs[job] then
        if Config.Jobs[job].Grades[grade].Personnel then
            local FireList = {}
            local Employees = MySQL.query.await("SELECT * FROM characters WHERE job = :job", { job = job })
            for _,Employee in pairs(Employees) do
                table.insert(FireList, {char = Employee.firstname.." "..Employee.lastname, name = "OFFLINE", id = Employee.identifier, charid = Employee.characterid})
            end
            TriggerClientEvent("redemrp_bossmenu:client:ViewOfflineFireList", _source, FireList)
        else
            RedEM.Functions.NotifyLeft(_source, "No access!", "You don't have personnel access!", "menu_textures", "menu_icon_alert", 3000)
        end
    end
end)

RegisterServerEvent("redemrp_bossmenu:server:FireMemberOffline", function(id, charid)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job, grade = user.GetJob(), user.GetJobGrade()
    local FireList = {}
    for _,targetId in ipairs(GetPlayers()) do
        local targetUser = RedEM.GetPlayer(targetId)
        if targetUser then
            local targetJob = targetUser.GetJob()
            if targetJob == job then
                local targetName = targetUser.GetFirstName() .. " " .. targetUser.GetLastName()
                local serverName = GetPlayerName(tonumber(targetId))
                local characterid = targetUser.charid
                local identifier = targetUser.identifier
                table.insert(FireList, {char = targetName,  charid = characterid , steam = identifier, id = tonumber(targetId)})
            end
        end
    end
    if Config.Jobs[job] then
        if Config.Jobs[job].Grades[grade].Personnel then
            local Employee = MySQL.query.await("SELECT * FROM characters WHERE identifier = :identifier AND characterid = :charid", { identifier = id, charid = charid })
            if Employee[1] then
                Employee = Employee[1]
                if Employee.identifier == id and Employee.characterid == charid then
                    MySQL.query.await("UPDATE characters SET job = 'unemployed', jobgrade = 0 WHERE identifier = :identifier AND characterid = :charid", { identifier = id, charid = charid })
                    TriggerClientEvent("redemrp_bossmenu:client:OpenBossMenu", _source, JobLedgers[job])
                end
                for k, v in pairs(FireList) do
                    if v.steam == id and v.charid == charid then
                        local trgtuser = RedEM.GetPlayer(v.id)
                        local sourcetrgt = v.id
                        trgtuser.SetJob("unemployed")
                        trgtuser.SetJobGrade(0)
                        TriggerEvent("redemrp_bossmenu:server:RequestJob", sourcetrgt)
                    end
                end
            end
        else
            RedEM.Functions.NotifyLeft(_source, "No access!", "You don't have personnel access!", "menu_textures", "menu_icon_alert", 3000)
        end
    end
end)


RegisterServerEvent("redemrp_bossmenu:server:FireMember", function(targetId)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job, grade = user.GetJob(), user.GetJobGrade()
    if Config.Jobs[job] then
        if Config.Jobs[job].Grades[grade].Personnel then
            local targetUser = RedEM.GetPlayer(targetId)
            local targetJob = targetUser.GetJob()
            if targetUser.identifier == user.identifier then
                TriggerClientEvent("redemrp_bossmenu:client:OpenBossMenu", _source)
                return
            end
            if targetJob == job then
                if targetUser.jobgrade >= grade then
                    TriggerClientEvent("redemrp_bossmenu:client:OpenBossMenu", _source)
                    return
                end
                targetUser.SetJob("unemployed")
                targetUser.SetJobGrade(0)
                TriggerEvent("redemrp_bossmenu:server:RequestJob", _source)
                RedEM.Functions.NotifyLeft(_source, "Employee fired!", "You fired "..targetUser.GetFirstName().." "..targetUser.GetLastName().."!", "menu_textures", "menu_icon_tick", 3000)
                TriggerEvent('redemrp_log:server:CreateLog', 'bossmenu', 'Fired Employee', 'red', 
                        "[".._source.."] **"..user.GetFirstName().." "..user.GetLastName().. "** (serverid: ".._source.." | name: ".. GetPlayerName(_source).." | steamid: "..user.GetIdentifier().." | characterid: "..user.GetActiveCharacter()..")" .. " fired "..
                        "["..targetId.."] **"..targetUser.GetFirstName().." "..targetUser.GetLastName().. "** (serverid: "..targetId.." | name: ".. GetPlayerName(targetId).." | steamid: "..targetUser.GetIdentifier().." | characterid: "..targetUser.GetActiveCharacter()..") from job "..job)
                TriggerClientEvent("redemrp_bossmenu:client:ViewGradeList", _source, GradeList)
            end
        end
    end
end)



RegisterNetEvent("redemrp_bossmenu:server:SetGrade", function(targetId, gradeId)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job, grade = user.GetJob(), user.GetJobGrade()
    if tonumber(targetId) == tonumber(_source) then
        return
    end
    if Config.Jobs[job] then
        if Config.Jobs[job].Grades[grade].Personnel then
            if targetId then
                local targetUser = RedEM.GetPlayer(targetId)
                local targetJob = targetUser.getJob()
                if targetJob == job and gradeId <= grade then
                    if Config.Jobs[job].Grades[tonumber(gradeId)] then
                        targetUser.SetJobGrade(tonumber(gradeId))
                        TriggerEvent('redemrp_log:server:CreateLog', 'bossmenu', 'Grade Set', 'lightgreen', 
                        "[".._source.."] **"..user.GetFirstName().." "..user.GetLastName().. "** (serverid: ".._source.." | name: ".. GetPlayerName(_source).." | steamid: "..user.GetIdentifier().." | characterid: "..user.GetActiveCharacter()..")" .. " set "..
                        "["..targetId.."] **"..targetUser.GetFirstName().." "..targetUser.GetLastName().. "** (serverid: "..targetId.." | name: ".. GetPlayerName(targetId).." | steamid: "..targetUser.GetIdentifier().." | characterid: "..targetUser.GetActiveCharacter()..") job grade to: "..job.." grade "..gradeId)
                        RedEM.Functions.NotifyLeft(_source, "Grade set!", "You set "..targetUser.GetFirstName().." "..targetUser.GetLastName().."'s grade to "..gradeId.."!", "menu_textures", "menu_icon_tick", 3000)
                        RedEM.Functions.NotifyLeft(targetId, "Grade set!", "Your job grade was to "..Config.Jobs[job].Grades[tonumber(gradeId)].Name.." ("..gradeId..")!", "menu_textures", "menu_icon_tick", 3000)
                        TriggerClientEvent("redemrp_bossmenu:client:OpenBossMenu", _source, JobLedgers[job])
                        TriggerClientEvent("redem_roleplay:JobChange", tonumber(targetId), job, gradeId)
                    else
                        RedEM.Functions.NotifyLeft(_source, "Invalid grade!", "That grade doesn't exist!", "menu_textures", "menu_icon_alert", 3000)
                    end
                else
                    RedEM.Functions.NotifyLeft(_source, "Not your employee!", "This player doesn't work for you or cannot be set to this grade!", "menu_textures", "menu_icon_alert", 3000)
                end
            end
        else
            RedEM.Functions.NotifyLeft(_source, "No access!", "You don't have personnel access!", "menu_textures", "menu_icon_alert", 3000)
        end
    end
end)

RegisterServerEvent("redemrp_bossmenu:server:RequestBossStash", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    local job, grade = user.GetJob(), user.GetJobGrade()
    if Config.Jobs[job] then
        if Config.Jobs[job].Grades[grade].StorageAccess then
            TriggerClientEvent("redemrp_inventory:OpenStash", _source, "bossstash_"..job, 100.0)
        else
            RedEM.Functions.NotifyLeft(_source, "No access!", "You don't have storage access!", "menu_textures", "menu_icon_alert", 3000)
        end
    end
end)



AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
			SaveResourceFile(GetCurrentResourceName(), "ledgers.json", json.encode(JobLedgers), -1)
        end
    end
)

AddEventHandler('txAdmin:events:serverShuttingDown', function(eventData)
    CreateThread(function()
        print("^4[DB]^0 5 seconds before restart... saving all ledgers!")
        SaveResourceFile(GetCurrentResourceName(), "ledgers.json", json.encode(JobLedgers), -1)
    end)
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        CreateThread(function()
            print("60 seconds before restart... saving all ledgers!")
            SaveResourceFile(GetCurrentResourceName(), "ledgers.json", json.encode(JobLedgers), -1)
        end)
    end
end)

AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
			SaveResourceFile(GetCurrentResourceName(), "ledgers.json", json.encode(JobLedgers), -1)
        end
    end
)