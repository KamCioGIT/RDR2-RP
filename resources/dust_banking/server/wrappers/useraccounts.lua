RedEM = exports["redem_roleplay"]:RedEM()

function generateSavings(cid)
    local self  = {}
    self.charid = cid
    self.source = -1
    local getSavingsAccount = MySQL.query.await('SELECT * FROM bank_accounts WHERE citizenid = ? AND account_type = ?', { self.charid, 'Savings' })
    if getSavingsAccount[1] ~= nil then
        self.aid = getSavingsAccount[1].accountid
        self.balance = getSavingsAccount[1].balance
    end
    local stats = MySQL.query.await('SELECT * FROM bank_statements WHERE accountid = ? AND citizenid = ? ORDER BY record_id DESC LIMIT 30', { self.aid, self.charid })
    self.bankStatement = stats

    self.saveAccount = function()
        MySQL.query('UPDATE bank_accounts SET balance = ? WHERE citizenid = ? AND accountid = ?', { self.balance, self.charid, self.aid }, function(success)
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
        local returnTable = { ['account'] = self.accountid}
        return returnTable
    end

    rTable.updateSource = function(src)
        if src ~= nil and type(src) == "number" then
            self.source = src
        else
            self.source = -1
        end
    end

    -- rTable.AddMoney = function(amt, text)
    --     if type(amt) == "number" and text then
    --         self.balance = self.balance + amt
    --         local success = self.saveAccount()
    --         local time = os.date("%Y-%m-%d %H:%M:%S")
    --         MySQL.insert.await('INSERT INTO bank_statements (citizenid, account, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
    --             self.charid,
    --             'Savings',
    --             amt,
    --             0,
    --             self.balance,
    --             time,
    --             text
    --         })
    --         local statementTable = {['withdraw'] = nil, ['deposited'] = amt, ['type'] = text,  ['date'] = time, ['balance'] = self.balance, ['account'] = "Savings", ['record_id'] = statementUpdate, ['character_id'] = self.charid }
    --         table.insert(self.bankStatement, statementTable)
    --         return true
    --     end
    -- end

    -- rTable.RemoveMoney = function(amt, text)
    --     if type(amt) == "number" and text then
    --         if amt <= self.balance then
    --             self.balance = self.balance - amt
    --             local success = self.saveAccount()
    --             local time = os.date("%Y-%m-%d %H:%M:%S")
    --             MySQL.insert.await('INSERT INTO bank_statements (citizenid, account, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
    --                 self.charid,
    --                 'Saving',
    --                 0,
    --                 amt,
    --                 self.balance,
    --                 time,
    --                 text
    --             })
    --             local statementTable = {['withdraw'] = amt, ['deposited'] = nil, ['type'] = text,  ['date'] = time, ['balance'] = self.balance, ['account'] = "Savings", ['record_id'] = statementUpdate, ['character_id'] = self.charid }
    --             table.insert(self.bankStatement, statementTable)
    --             return true
    --         end
    --     end
    -- end

    rTable.WithdrawStatement = function(amt)
        local time = os.date("%Y-%m-%d %H:%M:%S")
        MySQL.insert.await('INSERT INTO bank_statements (citizenid, accountid, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            self.charid,
            self.aid,
            amt,
            0,
            self.balance,
            time,
            'Retrait'
        })
        local statementTable = {['withdraw'] = amt, ['deposited'] = nil, ['type'] = 'Retrait',  ['date'] = time, ['balance'] = self.balance, ['accountid'] = self.aid, ['record_id'] = statementUpdate, ['citizenid'] = self.charid }
        table.insert(self.bankStatement, statementTable)
        return true
    end

    rTable.DepositStatement = function(amt, text)
        local time = os.date("%Y-%m-%d %H:%M:%S")
        MySQL.insert.await('INSERT INTO bank_statements (citizenid, accountid, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            self.charid,
            self.aid,
            0,
            amt,
            self.balance,
            time,
            'Dépot'
        })
        local statementTable = {['withdraw'] = nil, ['deposited'] = amt, ['type'] = 'Dépot',  ['date'] = time, ['balance'] = self.balance, ['accountid'] = self.aid, ['record_id'] = statementUpdate, ['citizenid'] = self.charid }
        table.insert(self.bankStatement, statementTable)
        return true
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
