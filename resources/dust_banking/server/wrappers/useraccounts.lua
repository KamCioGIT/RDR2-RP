RedEM = exports["redem_roleplay"]:RedEM()

function generateCurrent(cid)
    local self = {}
    self.charid = cid
    self.source = -1
    local processed = false

    local bankStatement = MySQL.query.await('SELECT * FROM bank_statements WHERE account = ? AND citizenid = ? ORDER BY record_id DESC LIMIT 30', { 'Savings', self.charid })
    if bankStatement[1] ~= nil then
        self.bankStatement = bankStatement
    else
        self.bankStatement = {}
    end
    processed = true
    repeat Wait(0) until processed == true
    processed = false

    self.saveAccount = function()
        local success
        local processed = false
        MySQL.query("UPDATE `bank_accounts` SET `amount` = ? WHERE `citizenid` = ? ", { self.balance, self.charid }, function(success1)
            if success1 > 0 then
                success = true
            else
                success = false
            end
            processed = true
        end)
        repeat Wait(0) until processed == true
        return success
    end

    local rTable = {}

    rTable.GetBalance = function()
        return self.balance
    end


    rTable.updateSource = function(src)
        if src ~= nil and type(src) == "number" then
            self.source = src
        else
            self.source = -1
        end
    end

    rTable.GetStatement = function()
        return self.bankStatement
    end

    rTable.GetAccountNo = function()
        return self.account
    end

    rTable.GetSortCode = function()
        return self.sortcode
    end

    rTable.AddMoney = function(amt, text)
        local success
        local Addprocessed = false
        if type(amt) == "number" and text then
            self.balance = self.balance + amt
            local successBank = self.saveAccount()
            if successBank then
                local time = os.date("%Y-%m-%d %H:%M:%S")
                -- TODO: The nil value might not be accepted by the sql handler here
                MySQL.insert.await("INSERT INTO `bank_statements` (`account`, `citizenid`, `deposited`, `withdraw`, `balance`, `date`, `type`) VALUES (?, ?, ?, ?, ?, ?, ?)", {
                    "Savings",
                    self.charid,
                    amt,
                    nil,
                    self.balance,
                    time,
                    text
                }, function(statementUpdated)
                    if statementUpdated > 0 then
                        local statementTable = {['withdraw'] = nil, ['deposited'] = amt, ['type'] = text, ['sort_code'] = self.sortcode, ['date'] = time, ['balance'] = self.balance, ['account'] = "Current", ['record_id'] = statementUpdated, ['account_number'] = self.account, ['character_id'] = self.charid }
                        table.insert(self.bankStatement, statementTable)

                        if self.source ~= -1 then
                            TriggerClientEvent('pw:updateBank', self.source, self.amount)
                        end
                        success = true
                    else
                        success = false
                    end
                    Addprocessed = true
                end)
                local statementTable = {['withdraw'] = nil, ['deposited'] = amt, ['type'] = text, ['sort_code'] = self.sortcode, ['date'] = time, ['balance'] = self.balance, ['account'] = "Current", ['record_id'] = statementUpdated, ['account_number'] = self.account, ['character_id'] = self.charid }
                table.insert(self.bankStatement, statementTable)

                if self.source ~= -1 then
                    TriggerClientEvent('pw:updateBank', self.source, self.amount)
                end
            else
                success = false
                self.balance = self.balance - amt
                Addprocessed = true
            end
        end
        repeat Wait(0) until Addprocessed == true
        return success
    end

    rTable.RemoveMoney = function(amt, text)
        local successOri
        local Reprocessed = false
        if type(amt) == "number" and text then
            if amt <= self.balance then
                self.balance = self.balance - amt
                local successBank = self.saveAccount()

                if successBank then
                    local time = os.date("%Y-%m-%d %H:%M:%S")
                    -- TODO: The nil value might not be accepted by the sql handler here
                    MySQL.insert.await("INSERT INTO `bank_statements` (`account`, `character_id`, `account_number`, `sort_code`, `deposited`, `withdraw`, `balance`, `date`, `type`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", {
                        "Current",
                        self.charid,
                        self.account,
                        self.sortcode,
                        nil,
                        amt,
                        self.balance,
                        time,
                        text
                    }, function(statementUpdated)
                        if statementUpdated > 0 then
                            successOri = true
                            local statementTable = {['withdraw'] = amt, ['deposited'] = nil, ['type'] = text, ['sort_code'] = self.sortcode, ['date'] = time, ['balance'] = self.balance, ['account'] = "Current", ['record_id'] = statementUpdated, ['account_number'] = self.account, ['character_id'] = self.charid }
                            table.insert(self.bankStatement, statementTable)

                            if self.source ~= -1 then
                                TriggerClientEvent('pw:updateBank', self.source, self.amount)
                            end
                            Reprocessed = true
                        else
                            successOri = false
                            Reprocessed = true
                        end
                    end)
                else
                    successOri = false
                    self.balance = self.balance + amt
                    Reprocessed = true
                end
            end
        end
        repeat Wait(0) until Reprocessed == true
        return successOri
    end

    return rTable
end



RegisterServerEvent('qbr-banking:server:registerCurrentAccount')
AddEventHandler('qbr-banking:server:registerCurrentAccount', function(cid)
    if not currentAccounts[cid] then
        currentAccounts[cid] = generateCurrent(cid)
    end
end)

function generateSavings(cid)
    local self  = {}
    self.charid = cid
    self.source = -1
    local getSavingsAccount = MySQL.query.await('SELECT * FROM bank_accounts WHERE citizenid = ? AND account_type = ?', { self.charid, 'Savings' })
    if getSavingsAccount[1] ~= nil then
        self.aid = getSavingsAccount[1].record_id
        self.balance = getSavingsAccount[1].amount
    end
    local stats = MySQL.query.await('SELECT * FROM bank_statements WHERE type = ? AND citizenid = ? ORDER BY record_id DESC LIMIT 30', { 'Savings', self.charid })
    self.bankStatement = stats

    self.saveAccount = function()
        MySQL.query('UPDATE bank_accounts SET amount = ? WHERE citizenid = ? AND record_id = ?', { self.balance, self.charid, self.aid }, function(success)
            if success then
                return true
            else
                return false
            end
        end)
    end

    local rTable = {}

    rTable.GetBalance = function()
        return self.balance
    end

    rTable.getStatement = function()
        return self.bankStatement
    end

    rTable.getAccount = function()
        local returnTable = { ['account'] = self.account, ['sortcode'] = self.sortcode }
        return returnTable
    end

    rTable.updateSource = function(src)
        if src ~= nil and type(src) == "number" then
            self.source = src
        else
            self.source = -1
        end
    end

    rTable.AddMoney = function(amt, text)
        if type(amt) == "number" and text then
            print 'olé'
            self.balance = self.balance + amt
            local success = self.saveAccount()
            local time = os.date("%Y-%m-%d %H:%M:%S")
            MySQL.insert.await('INSERT INTO bank_statements (citizenid, account, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                self.charid,
                'Savings',
                amt,
                0,
                self.balance,
                time,
                text
            })
            local statementTable = {['withdraw'] = nil, ['deposited'] = amt, ['type'] = text,  ['date'] = time, ['balance'] = self.balance, ['account'] = "Savings", ['record_id'] = statementUpdate, ['character_id'] = self.charid }
            table.insert(self.bankStatement, statementTable)
            return true
        end
    end

    rTable.RemoveMoney = function(amt, text)
        if type(amt) == "number" and text then
            if amt <= self.balance then
                self.balance = self.balance - amt
                local success = self.saveAccount()
                local time = os.date("%Y-%m-%d %H:%M:%S")
                MySQL.insert.await('INSERT INTO bank_statements (citizenid, account, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                    self.charid,
                    'Saving',
                    0,
                    amt,
                    self.balance,
                    time,
                    text
                })
                local statementTable = {['withdraw'] = amt, ['deposited'] = nil, ['type'] = text,  ['date'] = time, ['balance'] = self.balance, ['account'] = "Savings", ['record_id'] = statementUpdate, ['character_id'] = self.charid }
                table.insert(self.bankStatement, statementTable)
                return true
            end
        end
    end

    return rTable
end

RegisterServerEvent('qbr-banking:server:registerSavingsAccount')
AddEventHandler('qbr-banking:server:registerSavingsAccount', function(cid)
    if not savingsAccounts[cid] then
        savingsAccounts[cid] = generateSavings(cid)
    end
end)

function createSavingsAccount(cid)
    local completed = false
    local success = false
    local getSavingsAccount = MySQL.query.await('SELECT * FROM bank_accounts WHERE citizenid = ? AND account_type = ? ', { cid, "Savings" })
    if getSavingsAccount[1] == nil then
        local accountno = math.random(100000, 999999)
        MySQL.insert.await('INSERT INTO bank_accounts (citizenid, balance, account_type, accountid) VALUES (?, ?, ?, ?)', { cid, 0, 'Savings', accountno}, function(result)
            savingsAccounts[cid] = generateSavings(cid)
            success = true
            completed = true
        end)
        repeat Wait(0) until completed == true
        return success
    end
end

exports('createSavingsAccount', function(cid)
    return createSavingsAccount(cid)
end)
