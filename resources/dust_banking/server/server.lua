RedEM = exports["redem_roleplay"]:RedEM()

Citizen.CreateThread(function()
    local ready = 0
    local buis = 0
    local cur = 0
    local sav = 0
    local gang = 0

    local accts = MySQL.query.await('SELECT * FROM bank_accounts WHERE account_type = ?', { 'Business' })
    buis = #accts
    if accts[1] ~= nil then
        for k, v in pairs(accts) do
            local acctType = v.business
            if businessAccounts[acctType] == nil then
                businessAccounts[acctType] = {}
            end
            businessAccounts[acctType][tonumber(v.businessid)] = generatebusinessAccount(tonumber(v.business), tonumber(v.businessid))
            while businessAccounts[acctType][tonumber(v.businessid)] == nil do Wait(0) end
        end
    end
    ready = ready + 1

    local savings = MySQL.query.await('SELECT * FROM bank_accounts WHERE account_type = ?', { 'Savings' })
    sav = #savings
    if savings[1] ~= nil then
        for k, v in pairs(savings) do
            savingsAccounts[v.citizenid] = generateSavings(v.citizenid)
        end
    end
    ready = ready + 1

    local gangs = MySQL.query.await('SELECT * FROM bank_accounts WHERE account_type = ?', { 'Gang' })
    gang = #gangs
    if gangs[1] ~= nil then
        for k, v in pairs(gangs) do
            gangAccounts[v.gangid] = loadGangAccount(v.gangid)
        end
    end
    ready = ready + 1

    repeat Wait(0) until ready == 5
    local totalAccounts = (buis + cur + sav + gang)
end)

exports('business', function(acctType, bid)
    if businessAccounts[acctType] then
        if businessAccounts[acctType][tonumber(bid)] then
            return businessAccounts[acctType][tonumber(bid)]
        end
    end
end)

RegisterServerEvent('qbr-banking:server:modifyBank')
AddEventHandler('qbr-banking:server:modifyBank', function(bank, k, v)
    if banks[tonumber(bank)] then
        banks[tonumber(bank)][k] = v
        TriggerClientEvent('qbr-banking:client:syncBanks', -1, banks)
    end
end)

exports('modifyBank', function(bank, k, v)
    TriggerEvent('qbr-banking:server:modifyBank', bank, k, v)
end)

exports('registerAccount', function(cid)
    local _cid = tonumber(cid)
    currentAccounts[_cid] = generateCurrent(_cid)
end)

exports('current', function(cid)
    if currentAccounts[cid] then
        return currentAccounts[cid]
    end
end)

exports('savings', function(cid)
    if savingsAccounts[cid] then
        return savingsAccounts[cid]
    end
end)

exports('gang', function(gid)
    if gangAccounts[cid] then
        return gangAccounts[cid]
    end
end)

function checkAccountExists(acct, sc)
    local success
    local cid
    local actype
    local processed = false
    local exists = MySQL.query.await('SELECT * FROM bank_accounts WHERE account_number = ? AND sort_code = ?', { acct, sc })
    if exists[1] ~= nil then
        success = true
        cid = exists[1].character_id
        actype = exists[1].account_type
    else
        success = false
        cid = false
        actype = false
    end
    processed = true
    repeat Wait(0) until processed == true
    return success, cid, actype
end

RegisterServerEvent('qbr-base:itemUsed')
AddEventHandler('qbr-base:itemUsed', function(_src, data)
    if data.item == "moneybag" then
        TriggerClientEvent('qbr-banking:client:usedMoneyBag', _src, data)
    end
end)

RegisterServerEvent('qbr-banking:server:unpackMoneyBag')
AddEventHandler('qbr-banking:server:unpackMoneyBag', function(item)
    local _src = source
    if item ~= nil then
        local xPlayer = RedEm.GetPlayer(_src)
        local xPlayerCID = xPlayer.citizenid
        local decode = json.decode(item.metapublic)
    end
end)

function getCharacterName(cid)
    local src = source
    local player = RedEM.GetPlayer(src)
    local name = player.name
end

function format_int(number)
    local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
    int = int:reverse():gsub("(%d%d%d)", "%1,")
    return minus .. int:reverse():gsub("^,", "") .. fraction
end

RedEM.RegisterCallback('qbr-banking:getBankingInformation', function(source, cb)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
        if (xPlayer) then
            local banking = {
                    ['name'] = xPlayer.firstname .. ' ' .. xPlayer.lastname,
                    ['bankbalance'] = '$'.. format_int(xPlayer.bankmoney),
                    ['cash'] = '$'.. format_int(xPlayer.money),
                    ['accountinfo'] = 'N°'..tostring(xPlayer.pobox),
                }
                --[[
                if savingsAccounts[xPlayer.PlayerData.citizenid] then
                    local cid = xPlayer.PlayerData.citizenid
                    banking['savings'] = {
                        ['amount'] = savingsAccounts[cid].GetBalance(),
                        ['details'] = savingsAccounts[cid].getAccount(),
                        ['statement'] = savingsAccounts[cid].getStatement(),
                    }
                end
                ]]
                cb(banking)
        else
            cb(nil)
        end
end)

RedEM.RegisterCallback('qbr-banking:getBusinessInformation', function(source, cb)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    local job = xPlayer.job
    while xPlayer == nil do Wait(0) end
        local accts = MySQL.query.await('SELECT * FROM bank_accounts WHERE business = ?', { job })
        buis = #accts
        if accts[1] ~= nil then
            for k, v in pairs(accts) do
                local businessinfo = {
                        ['name'] = xPlayer.firstname .. ' ' .. xPlayer.lastname,
                        ['bankbalance'] = '$'.. format_int(v.amount),
                        ['cash'] = '$'.. format_int(xPlayer.money),
                        ['accountinfo'] = 'N°'..tostring(xPlayer.businessid),
                    }
                    --[[
                    if savingsAccounts[xPlayer.PlayerData.citizenid] then
                        local cid = xPlayer.PlayerData.citizenid
                        banking['savings'] = {
                            ['amount'] = savingsAccounts[cid].GetBalance(),
                            ['details'] = savingsAccounts[cid].getAccount(),
                            ['statement'] = savingsAccounts[cid].getStatement(),
                        }
                    end
                    ]]
                    cb(businessinfo)
            end
        else
            cb(nil)
        end
end)

RegisterServerEvent('qbr-banking:doQuickDeposit')
AddEventHandler('qbr-banking:doQuickDeposit', function(amount)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentCash = xPlayer.GetMoney()

    if tonumber(amount) <= currentCash then
        local cash = xPlayer.RemoveMoney(tonumber(amount), 'banking-quick-depo')
        local bank = xPlayer.AddBankMoney(tonumber(amount), 'banking-quick-depo')
        if bank then
            TriggerClientEvent('qbr-banking:openBankScreen', src)
            TriggerClientEvent('qbr-banking:successAlert', src, 'You made a cash deposit of $'..amount..' successfully.')
            -- TriggerEvent('qbr-log:server:CreateLog', 'banking', 'Banking', 'lightgreen', "**"..GetPlayerName(xPlayer.PlayerData.source) .. " (citizenid: "..xPlayer.PlayerData.citizenid.." | id: "..xPlayer.PlayerData.source..")** made a cash deposit of $"..amount.." successfully.")
        end
    end
end)

RegisterServerEvent('qbr-banking:doQuickWithdraw')
AddEventHandler('qbr-banking:doQuickWithdraw', function(amount, branch)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentCash = xPlayer.GetBankMoney()

    if tonumber(amount) <= currentCash then
        local cash = xPlayer.RemoveBankMoney(tonumber(amount), 'banking-quick-withdraw')
        local bank = xPlayer.AddMoney(tonumber(amount), 'banking-quick-withdraw')
        if cash then
            TriggerClientEvent('qbr-banking:openBankScreen', src)
            TriggerClientEvent('qbr-banking:successAlert', src, 'You made a cash withdrawal of $'..amount..' successfully.')
            -- TriggerEvent('qbr-log:server:CreateLog', 'banking', 'Banking', 'red', "**"..GetPlayerName(xPlayer.PlayerData.source) .. " (citizenid: "..xPlayer.PlayerData.citizenid.." | id: "..xPlayer.PlayerData.source..")** made a cash withdrawal of $"..amount.." successfully.")
        end
    end
end)

RegisterServerEvent('qbr-banking:savingsDeposit')
AddEventHandler('qbr-banking:savingsDeposit', function(amount)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentBank = xPlayer.GetBankMoney

    if tonumber(amount) <= currentBank then
        local bank = xPlayer.RemoveBankMoney(tonumber(amount))
        local savings = savingsAccounts[xPlayer.citizenid].AddMoney(tonumber(amount), 'Current Account to Savings Transfer')
        while bank == nil do Wait(0) end
        while savings == nil do Wait(0) end
        TriggerClientEvent('qbr-banking:openBankScreen', src)
        TriggerClientEvent('qbr-banking:successAlert', src, 'You made a savings deposit of $'..tostring(amount)..' successfully.')
        -- TriggerEvent('qbr-log:server:CreateLog', 'banking', 'Banking', 'lightgreen', "**"..GetPlayerName(xPlayer.PlayerData.source) .. " (citizenid: "..xPlayer.PlayerData.citizenid.." | id: "..xPlayer.PlayerData.source..")** made a savings deposit of $"..tostring(amount).." successfully..")
    end
end)

RegisterServerEvent('qbr-banking:savingsWithdraw')
AddEventHandler('qbr-banking:savingsWithdraw', function(amount)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentSavings = savingsAccounts[xPlayer.citizenid].GetBalance()

    if tonumber(amount) <= currentSavings then
        local savings = savingsAccounts[xPlayer.citizenid].RemoveMoney(tonumber(amount), 'Savings to Current Account Transfer')
        local bank = xPlayer.AddBankMoney(tonumber(amount), 'banking-quick-withdraw')
        while bank == nil do Wait(0) end
        while savings == nil do Wait(0) end
        TriggerClientEvent('qbr-banking:openBankScreen', src)
        TriggerClientEvent('qbr-banking:successAlert', src, 'You made a savings withdrawal of $'..tostring(amount)..' successfully.')
        -- TriggerEvent('qbr-log:server:CreateLog', 'banking', 'Banking', 'red', "**"..GetPlayerName(xPlayer.PlayerData.source) .. " (citizenid: "..xPlayer.PlayerData.citizenid.." | id: "..xPlayer.PlayerData.source..")** made a savings withdrawal of $"..tostring(amount).." successfully.")
    end
end)

RegisterServerEvent('qbr-banking:createSavingsAccount')
AddEventHandler('qbr-banking:createSavingsAccount', function()
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    local success = createSavingsAccount(xPlayer.citizenid)

    repeat Wait(0) until success ~= nil
    TriggerClientEvent('qbr-banking:openBankScreen', src)
end)

RegisterServerEvent('qbr-banking:createBusinessAccount')
AddEventHandler('qbr-banking:createBusinessAccount', function()
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    local job = xPlayer.job
    local jobgrade = xPlayer.jobgrade
    if jobgrade == 3 then
        print 'create'
        local success = createbusinessAccount(job)
        repeat Wait(0) until success ~= nil
        TriggerClientEvent('qbr-banking:openBankScreen', src)
    end
end)

