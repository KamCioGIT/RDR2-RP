RedEM = exports["redem_roleplay"]:RedEM()

businessAccounts = {}
currentAccounts = {}
savingsAccounts = {}
gangAccounts = {}
bankCards = {}

function generatebusiness(job)
    local self  = {}
    self.jobid = job
    self.source = -1
    local getbusinessAccount = MySQL.query.await('SELECT * FROM bank_accounts WHERE job = ? AND account_type = ?', { self.jobid, 'Business' })
    if getbusinessAccount[1] ~= nil then
        self.aid = getbusinessAccount[1].accountid
        self.balance = getbusinessAccount[1].balance
    end
    local stats = MySQL.query.await('SELECT * FROM bank_statements WHERE accountid = ? AND job = ? ORDER BY record_id DESC LIMIT 30', { self.aid, self.jobid })
    self.bankStatement = stats

    self.saveAccount = function()
        MySQL.query('UPDATE bank_accounts SET balance = ? WHERE job = ? AND accountid = ?', { self.balance, self.jobid, self.aid }, function(success)
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
    --         MySQL.insert.await('INSERT INTO bank_statements (job, account, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
    --             self.jobid,
    --             'business',
    --             amt,
    --             0,
    --             self.balance,
    --             time,
    --             text
    --         })
    --         local statementTable = {['withdraw'] = nil, ['deposited'] = amt, ['type'] = text,  ['date'] = time, ['balance'] = self.balance, ['account'] = "business", ['record_id'] = statementUpdate, ['character_id'] = self.jobid }
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
    --             MySQL.insert.await('INSERT INTO bank_statements (job, account, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
    --                 self.jobid,
    --                 'Saving',
    --                 0,
    --                 amt,
    --                 self.balance,
    --                 time,
    --                 text
    --             })
    --             local statementTable = {['withdraw'] = amt, ['deposited'] = nil, ['type'] = text,  ['date'] = time, ['balance'] = self.balance, ['account'] = "business", ['record_id'] = statementUpdate, ['character_id'] = self.jobid }
    --             table.insert(self.bankStatement, statementTable)
    --             return true
    --         end
    --     end
    -- end

    rTable.WithdrawStatement = function(amt)
        local time = os.date("%Y-%m-%d %H:%M:%S")
        MySQL.insert.await('INSERT INTO bank_statements (job, accountid, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            self.jobid,
            self.aid,
            amt,
            0,
            self.balance,
            time,
            'Retrait'
        })
        local statementTable = {['withdraw'] = amt, ['deposited'] = nil, ['type'] = 'Retrait',  ['date'] = time, ['balance'] = self.balance, ['accountid'] = self.aid, ['record_id'] = statementUpdate, ['job'] = self.jobid }
        table.insert(self.bankStatement, statementTable)
        return true
    end

    rTable.DepositStatement = function(amt, text)
        local time = os.date("%Y-%m-%d %H:%M:%S")
        MySQL.insert.await('INSERT INTO bank_statements (job, accountid, deposited, withdraw, balance, date, type) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            self.jobid,
            self.aid,
            0,
            amt,
            self.balance,
            time,
            'Dépot'
        })
        local statementTable = {['withdraw'] = nil, ['deposited'] = amt, ['type'] = 'Dépot',  ['date'] = time, ['balance'] = self.balance, ['accountid'] = self.aid, ['record_id'] = statementUpdate, ['job'] = self.jobid }
        table.insert(self.bankStatement, statementTable)
        return true
    end

    return rTable
end

RegisterServerEvent('qbr-banking:server:registerbusinessAccount')
AddEventHandler('qbr-banking:server:registerbusinessAccount', function(job)
    if not businessAccounts[job] then
        businessAccounts[job] = generatebusiness(job)
    end
end)

function createbusinessAccount(job)
    local completed = false
    local success = false
    local getbusinessAccount = MySQL.query.await('SELECT * FROM bank_accounts WHERE job = ? AND account_type = ? ', { job, "Business" })
    if getbusinessAccount[1] == nil then
        local accountno = math.random(100000, 999999)
        MySQL.insert.await('INSERT INTO bank_accounts (job, balance, account_type, accountid) VALUES (?, ?, ?, ?)', { job, 0, 'Business', accountno}, function(result)
            businessAccounts[job] = generatebusiness(job)
            success = true
            completed = true
        end)
        repeat Wait(0) until completed == true
        return success
    end
end

exports('createbusinessAccount', function(job)
    return createbusinessAccount(job)
end)
