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


    repeat Wait(0) until ready == 5
    local totalAccounts = (buis + cur + sav + gang)
end)



-- RegisterServerEvent('qbr-banking:server:modifyBank')
-- AddEventHandler('qbr-banking:server:modifyBank', function(bank, k, v)
--     if banks[tonumber(bank)] then
--         banks[tonumber(bank)][k] = v
--         TriggerClientEvent('qbr-banking:client:syncBanks', -1, banks)
--     end
-- end)

-- exports('modifyBank', function(bank, k, v)
--     TriggerEvent('qbr-banking:server:modifyBank', bank, k, v)
-- end)

-- exports('registerAccount', function(cid)
--     local _cid = tonumber(cid)
--     currentAccounts[_cid] = generateCurrent(_cid)
-- end)

-- exports('business', function(acctType, bid)
--     if businessAccounts[acctType] then
--         if businessAccounts[acctType][tonumber(bid)] then
--             return businessAccounts[acctType][tonumber(bid)]
--         end
--     end
-- end)


-- exports('savings', function(cid)
--     if savingsAccounts[cid] then
--         return savingsAccounts[cid]
--     end
-- end)


-- function checkAccountExists(acct, sc)
--     local success
--     local cid
--     local actype
--     local processed = false
--     local exists = MySQL.query.await('SELECT * FROM bank_accounts WHERE account_number = ? AND sort_code = ?', { acct, sc })
--     if exists[1] ~= nil then
--         success = true
--         cid = exists[1].character_id
--         actype = exists[1].account_type
--     else
--         success = false
--         cid = false
--         actype = false
--     end
--     processed = true
--     repeat Wait(0) until processed == true
--     return success, cid, actype
-- end


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
        MySQL.query('SELECT * FROM bank_accounts WHERE citizenid = ? AND account_type = ?', { xPlayer.citizenid, 'Savings' }, function(result)
            if #result ~= 0 then
                local accountid = result[1].accountid
                local balance = result[1].balance
                local stats = MySQL.query.await('SELECT * FROM bank_statements WHERE accountid = ? AND citizenid = ? ORDER BY record_id DESC LIMIT 30', { accountid, xPlayer.citizenid })
                local banking = {
                    ['name'] = xPlayer.firstname .. ' ' .. xPlayer.lastname,
                    ['bankbalance'] = '$'.. format_int(balance),
                    ['cash'] = '$'.. format_int(xPlayer.money),
                    ['accountinfo'] = 'N°'..tostring(accountid),
                    ['statement'] = stats
                }
                cb(banking)
            else
                cb(nil)
            end
        end)
    else
        cb(nil)
    end
end)

RedEM.RegisterCallback('qbr-banking:getBusinessInformation', function(source, cb)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    if (xPlayer) then
        if xPlayer.jobgrade >= 3 then
            MySQL.query('SELECT * FROM bank_accounts WHERE job = ? AND account_type = ?', { xPlayer.job, 'Business' }, function(result)
                if #result ~= 0 then
                    local accountid = result[1].accountid
                    local banking = {
                        ['name'] = xPlayer.firstname .. ' ' .. xPlayer.lastname,
                        ['bankbalance'] = '$'.. format_int(xPlayer.bankmoney),
                        ['cash'] = '$'.. format_int(xPlayer.money),
                        ['accountinfo'] = 'N°'..tostring(accountid),
                    }
                    cb(banking)
                else
                    cb(nil)
                end
            end)
        else
            cb(nil)
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
        local result = MySQL.query.await('SELECT * FROM bank_accounts WHERE account_type = ? AND citizenid = ?', { 'Savings', xPlayer.citizenid })
        if result[1] ~= nil then
            accid = result[1].accountid
            bankbalance = result[1].balance
        end
        xPlayer.RemoveMoney(tonumber(amount))
        AddToBank(accid, tonumber(amount))
        local time = os.date("%d-%m")
        MySQL.insert.await('INSERT INTO bank_statements (citizenid, accountid, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            xPlayer.citizenid,
            accid,
            tonumber(amount),
            0,
            bankbalance + tonumber(amount),
            time,
            'Dépot'
        })
        TriggerClientEvent('qbr-banking:openBankScreen', src)
        TriggerClientEvent('qbr-banking:successAlert', src, 'Vous avez déposé $'..amount..' dans votre compte.')
    end
end)

RegisterServerEvent('qbr-banking:doQuickWithdraw')
AddEventHandler('qbr-banking:doQuickWithdraw', function(amount, branch)
    local src = source
    local xPlayer = RedEM.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local result = MySQL.query.await('SELECT * FROM bank_accounts WHERE account_type = ? AND citizenid = ?', { 'Savings', xPlayer.citizenid })
    if result[1] ~= nil then
        accid = result[1].accountid
        currentCash = result[1].balance
    end
    if tonumber(amount) <= currentCash then
        RemoveFromBank(accid, tonumber(amount))
        xPlayer.AddMoney(tonumber(amount))
        local time = os.date("%d-%m")
        MySQL.insert.await('INSERT INTO bank_statements (citizenid, accountid, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            xPlayer.citizenid,
            accid,
            0,
            tonumber(amount),
            currentCash - tonumber(amount),
            time,
            'Retrait'
        })
        TriggerClientEvent('qbr-banking:openBankScreen', src)
        TriggerClientEvent('qbr-banking:successAlert', src, 'Vous avez retiré $'..amount..' de votre compte.')
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
    print (amount, targetaccid)
    while xPlayer == nil do Wait(0) end
    local result = MySQL.query.await('SELECT * FROM bank_accounts WHERE account_type = ? AND citizenid = ?', { 'Savings', xPlayer.citizenid })
    if result[1] ~= nil then
        accid = result[1].accountid
        currentCash = result[1].balance
    end
    if tonumber(amount) <= currentCash then
        local _result = MySQL.query.await('SELECT * FROM bank_accounts WHERE accountid = ?', { targetaccid })
        if _result[1] ~= nil then
            _currentcash = _result[1].balance
            RemoveFromBank(accid, tonumber(amount))
            AddToBank(targetaccid, tonumber(amount))
            local time = os.date("%d-%m")
            ---- Historique de l'envoyeur
            MySQL.insert.await('INSERT INTO bank_statements (citizenid, accountid, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                xPlayer.citizenid,
                accid,
                0,
                tonumber(amount),
                currentCash - tonumber(amount),
                time,
                'Transfert sortant N° '..targetaccid..''
            })

            ---- historique du destinataire
            MySQL.insert.await('INSERT INTO bank_statements (citizenid, accountid, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                xPlayer.citizenid,
                accid,
                tonumber(amount),
                0,
                _currentcash + tonumber(amount),
                time,
                'Transfert entrant N° '..accid..''
            })
            TriggerClientEvent('qbr-banking:openBankScreen', src)
            TriggerClientEvent('qbr-banking:successAlert', src, 'Vous avez transféré $'..amount..' au compte N°'..targetaccid..'.')
        else
            TriggerClientEvent('qbr-banking:openBankScreen', src)
            TriggerClientEvent('qbr-banking:successAlert', src, "Le numéro de compte indiqué n'existe pas.")
        end
    end
end)


function RemoveFromBank(accountid, amount)
    local result = MySQL.query.await('SELECT * FROM bank_accounts WHERE accountid = ?', { accountid })
    if result[1] ~= nil then
        bankbalance = result[1].balance
    end
    if tonumber(bankbalance) >= tonumber(amount) then
        local newbalance = tonumber(bankbalance) - tonumber(amount)
        MySQL.query("UPDATE `bank_accounts` SET `balance` = ? WHERE `accountid` = ? ", { newbalance, accountid})
    end
end

function AddToBank(accountid, amount)
    local result = MySQL.query.await('SELECT * FROM bank_accounts WHERE accountid = ?', { accountid })
    if result[1] ~= nil then
        bankbalance = result[1].balance
    end
    if tonumber(amount) >= 0 then
        if bankbalance == nil then
            newbalance = tonumber(amount)
        else
            newbalance = tonumber(bankbalance) + tonumber(amount)
            
        end
        print (newbalance, type(newbalance), accountid)
        MySQL.query("UPDATE `bank_accounts` SET `balance` = ? WHERE `accountid` = ? ", { newbalance, accountid})
    end
end