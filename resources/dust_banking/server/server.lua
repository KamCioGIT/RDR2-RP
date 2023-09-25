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
            savingsAccounts[v.accountid] = generateSavings(v.accountid)
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
            local getSavingsAccount = MySQL.query.await('SELECT * FROM bank_accounts WHERE citizenid = ? AND account_type = ?', { xPlayer.citizenid, 'Savings' })
            if getSavingsAccount[1] ~= nil then
                accountid = getSavingsAccount[1].accountid
            end
            local banking = {
                    ['name'] = xPlayer.firstname .. ' ' .. xPlayer.lastname,
                    ['bankbalance'] = '$'.. format_int(xPlayer.bankmoney),
                    ['cash'] = '$'.. format_int(xPlayer.money),
                    ['accountinfo'] = 'N°'..tostring(accountid),
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
        local result = MySQL.query.await('SELECT * FROM bank_accounts WHERE account = ? AND citizenid = ?', { 'Savings', xPlayer.citizenid })
        if result[1] ~= nil then
            accid = result[1].accountid
        end
        xPlayer.RemoveMoney(tonumber(amount), 'banking-quick-depo')
        AddToBank(acctid, tonumber(amount))
        TriggerClientEvent('qbr-banking:openBankScreen', src)
        TriggerClientEvent('qbr-banking:successAlert', src, 'You made a cash deposit of $'..amount..' successfully.')
    end
end)

RegisterServerEvent('qbr-banking:doQuickWithdraw')
AddEventHandler('qbr-banking:doQuickWithdraw', function(amount, branch)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local result = MySQL.query.await('SELECT * FROM bank_accounts WHERE account = ? AND citizenid = ?', { 'Savings', xPlayer.citizenid })
    if result[1] ~= nil then
        accid = result[1].accountid
        currentCash = result[1].amount
    end
    if tonumber(amount) <= currentCash then
        RemoveFromBank(accid, tonumber(amount))
        xPlayer.AddMoney(tonumber(amount), 'banking-quick-withdraw')
        TriggerClientEvent('qbr-banking:openBankScreen', src)
        TriggerClientEvent('qbr-banking:successAlert', src, 'You made a cash withdrawal of $'..amount..' successfully.')
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
        local success = createbusinessAccount(job)
        repeat Wait(0) until success ~= nil
        TriggerClientEvent('qbr-banking:openBankScreen', src)
    end
end)



RegisterServerEvent('qbr-banking:initiateTransfer')
AddEventHandler('qbr-banking:initiateTransfer', function(data)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    local amount = data.amount
    local targetaccid = data.account
    while xPlayer == nil do Wait(0) end
    local result = MySQL.query.await('SELECT * FROM bank_accounts WHERE account = ? AND citizenid = ?', { 'Savings', xPlayer.citizenid })
    if result[1] ~= nil then
        accid = result[1].accountid
        currentCash = result[1].amount
    end
    if tonumber(amount) <= currentCash then
        local result = MySQL.query.await('SELECT * FROM bank_accounts WHERE account = ? AND citizenid = ?', { 'Savings', xPlayer.citizenid })
        if result[1] ~= nil then
            accid = result[1].accountid
        end
        RemoveFromBank(accid, tonumber(amount))
        AddToBank(targetaccid, tonumber(amount))
        TriggerClientEvent('qbr-banking:openBankScreen', src)
        TriggerClientEvent('qbr-banking:successAlert', src, 'You made a cash withdrawal of $'..amount..' successfully.')
    end
end)


QBCore.Functions.CreateCallback("Renewed-Banking:server:transfer", function(source, data)
    local Player = RedEM.GetPlayer(source)
    local amount = tonumber(data.amount)
    if not amount or amount < 1 then
        -- QBCore.Functions.Notify(source, Lang:t("notify.invalid_amount",{type="transfer"}), 'error', 5000)
        return
    end
    if savingsAccounts[data.fromAccount] then
        if not data.comment or data.comment == "" then data.comment = Lang:t("notify.comp_transaction",{name = data.fromAccount, type="transfered", amount = amount}) end
        if savingsAccounts[data.stateid] then
            local canTransfer = removeAccountMoney(data.fromAccount, amount)
            if canTransfer then
                addAccountMoney(data.stateid, amount)
                local title = ("%s / %s"):format(cachedAccounts[data.fromAccount].name, data.fromAccount)
                local transaction = handleTransaction(data.fromAccount, title, amount, data.comment, cachedAccounts[data.fromAccount].name, cachedAccounts[data.stateid].name, "withdraw")
                handleTransaction(data.stateid, title, amount, data.comment, cachedAccounts[data.fromAccount].name, cachedAccounts[data.stateid].name, "deposit", transaction.trans_id)
            else
                TriggerClientEvent('Renewed-Banking:client:sendNotification', source, Lang:t("notify.not_enough_money"))
                cb(false)
                return
            end
        else
            local Player2 = getPlayerData(source, data.stateid)
            if not Player2 then
                TriggerClientEvent('Renewed-Banking:client:sendNotification', source, Lang:t("notify.fail_transfer"))
                cb(false)
                return
            end
            local canTransfer = removeAccountMoney(data.fromAccount, amount)
            if canTransfer then
                Player2.Functions.AddMoney('bank', amount, data.comment)
                local name = ("%s %s"):format(Player2.PlayerData.charinfo.firstname, Player2.PlayerData.charinfo.lastname)
                local transaction = handleTransaction(data.fromAccount, ("%s / %s"):format(cachedAccounts[data.fromAccount].name, data.fromAccount), amount, data.comment, cachedAccounts[data.fromAccount].name, name, "withdraw")
                handleTransaction(data.stateid, ("%s / %s"):format(cachedAccounts[data.fromAccount].name, data.fromAccount), amount, data.comment, cachedAccounts[data.fromAccount].name, name, "deposit", transaction.trans_id)
            else
                TriggerClientEvent('Renewed-Banking:client:sendNotification', source, Lang:t("notify.not_enough_money"))
                cb(false)
                return
            end
        end
    else
        local name = ("%s %s"):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname)
        if not data.comment or data.comment == "" then data.comment = Lang:t("notify.comp_transaction",{name = data.fromAccount, type="transfered", amount = amount}) end
        if cachedAccounts[data.stateid] then
            if Player.PlayerData.money.bank >= amount and Player.Functions.RemoveMoney('bank', amount, data.comment) then
                addAccountMoney(data.stateid, amount)
                local transaction = handleTransaction(data.fromAccount, Lang:t("ui.personal_acc") .. data.fromAccount, amount, data.comment, name, cachedAccounts[data.stateid].name, "withdraw")
                handleTransaction(data.stateid, Lang:t("ui.personal_acc") .. data.fromAccount, amount, data.comment, name, cachedAccounts[data.stateid].name, "deposit", transaction.trans_id)
            else
                TriggerClientEvent('Renewed-Banking:client:sendNotification', source, Lang:t("notify.not_enough_money"))
                cb(false)
                return
            end
        else
            local Player2 = getPlayerData(source, data.stateid)
            if not Player2 then
                TriggerClientEvent('Renewed-Banking:client:sendNotification', source, Lang:t("notify.fail_transfer"))
                cb(false)
                return
            end

            if Player.PlayerData.money.bank >= amount and Player.Functions.RemoveMoney('bank', amount, data.comment) then
                Player2.Functions.AddMoney('bank', amount, data.comment)
                local name2 = ("%s %s"):format(Player2.PlayerData.charinfo.firstname, Player2.PlayerData.charinfo.lastname)
                local transaction = handleTransaction(data.fromAccount, Lang:t("ui.personal_acc") .. data.fromAccount, amount, data.comment, name, name2, "withdraw")
                handleTransaction(data.stateid, Lang:t("ui.personal_acc") .. data.fromAccount, amount, data.comment, name, name2, "deposit", transaction.trans_id)
            else
                TriggerClientEvent('Renewed-Banking:client:sendNotification', source, Lang:t("notify.not_enough_money"))
                cb(false)
                return
            end
        end
    end
    local bankData = getBankData(source)
    cb(bankData)
end)



function RemoveFromBank(accountid, amount)
    local bankbalance = MySQL.query('SELECT * FROM bank_accounts WHERE accountid = ?', {accountid})
    if tonumber(bankbalance) >= tonumber(amount) then
        local newbalance = bankbalance - amount
        MySQL.query("UPDATE `bank_accounts` SET `amount` = ? WHERE `accountid` = ? ", { newbalance, accountid})
    end
end

function AddToBank(accountid, amount)
    local bankbalance = MySQL.query('SELECT * FROM bank_accounts WHERE accountid = ?', {accountid})
    if tonumber(amount) >= 0 then
        local newbalance = bankbalance + amount
        MySQL.query("UPDATE `bank_accounts` SET `amount` = ? WHERE `accountid` = ? ", { newbalance, accountid})
    end
end