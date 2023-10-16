RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)


RegisterServerEvent("scf_telegram:check_inbox")
AddEventHandler("scf_telegram:check_inbox", function()
    local _source = source
    local User = RedEM.GetPlayer(_source)
    local firstname = User.firstname
    local lastname = User.lastname
	local postbox = firstname .. " " .. lastname
    MySQL.query("SELECT * FROM telegrams WHERE recipient = @reci", { reci = postbox }, function(result)
        res = {}
        res['box'] = postbox
        res['firstname'] = firstname
        res['list'] = result
        if result ~= nil then
            print "get"
            TriggerClientEvent("inboxlist", _source, res)
            res = {}
        end
    end)
end)

RegisterServerEvent("scf_telegram:SendTelegram")
AddEventHandler("scf_telegram:SendTelegram", function(data)
    local _source = source
    local User = RedEM.GetPlayer(_source)
    local currentMoney = User.money
    local removeMoney = Config.Pay

    local sender = data.sender
    local recipientlastname = data.recipientlastname
    local recipientfirstname = data.recipientfirstname
    local recipient = recipientfirstname .. " " .. recipientlastname
    local subject = data.subject
    local message = data.message
    local postoffice = data.postoffice


    if currentMoney >= removeMoney then
        local sentDate = os.date("%Y-%m-%d %H:%M:%S")
        MySQL.query("SELECT * FROM characters WHERE lastname = @lastname AND firstname = @firstname",{firstname = recipientfirstname, lastname = recipientlastname}, function(result)
            if result[1] ~= nil then
                if recipientfirstname == nil or recipientfirstname == '' and recipientlastname == nil or recipientlastname == '' and subject == nil or subject == '' and sender == nil or sender == '' then
                    TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Télégramme", "Veuillez fournir toutes les informations !", "scoretimer_textures", "scoretimer_generic_cross", 4000)
                else
                    local Parameters = { ['recipient'] = recipient, ['sender'] = sender, ['subject'] = subject, ['sentTime'] = sentDate, ['message'] = message, ['postoffice'] = postoffice }
                    MySQL.update("INSERT INTO telegrams ( `recipient`,`sender`,`subject`,`sentTime`,`message`,`postoffice`) VALUES ( @recipient,@sender, @subject,@sentTime,@message,@postoffice )", Parameters)
                    User.removeMoney(removeMoney)
                    TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Télégramme", "Vous avez payé $" .. removeMoney .. "pour envoyer le télégramme", "scoretimer_textures", "scoretimer_generic_tick", 4000)
                end
            else
                TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Télégramme", "Le destinataire n'a pas été trouvé !", "scoretimer_textures", "scoretimer_generic_cross", 4000)
            end
        end)
    else
        TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Télégramme", "Vous n'avez pas assez d'argent !", "scoretimer_textures", "scoretimer_generic_cross", 4000)
    end
end)

RegisterServerEvent("scf_telegram:getTelegram")
AddEventHandler("scf_telegram:getTelegram", function(tid)
    local _source = source
    local User = RedEM.GetPlayer(_source)
    local telegram = {}
    Citizen.Wait(0)
    MySQL.query("SELECT * FROM telegrams WHERE id = @id", { ['@id'] = tid }, function(result)

        if result[1] ~= nil then
            telegram['recipient'] = User.firstname .. " " .. User.lastname
            telegram['sender'] = result[1]['sender']
            telegram['sentTime'] = result[1]['sentTime']
            telegram['subject'] = result[1]['subject']
            telegram['message'] = result[1]['message']
            telegram['postoffice'] = result[1]['postoffice']
            MySQL.update("UPDATE telegrams SET status = '1' WHERE id = @id", { ["@id"] = tid })
            TriggerEvent("redemrp_inventory:createtelegram", _source, telegram)
        end
    end)
end)

RegisterServerEvent("RegisterUsableItem:télégramme")
AddEventHandler("RegisterUsableItem:télégramme", function(source, _data)
    local data = _data
    TriggerClientEvent("messageData", _source, data)
end)

RegisterServerEvent("scf_telegram:DeleteTelegram")
AddEventHandler("scf_telegram:DeleteTelegram", function(tid)
	local _source = source

    Citizen.Wait(0)
   
    MySQL.query("SELECT * FROM telegrams WHERE id = @id", { ['@id'] = tid }, function(result)
        if result[1] ~= nil then
            MySQL.update("DELETE FROM telegrams WHERE id = @id", { ["@id"] = tid })
            TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Télégramme", "Télégramme supprimé !", "scoretimer_textures", "scoretimer_generic_tick", 4000)

        else
            TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Télégramme", "Impossible de supprimer", "scoretimer_textures", "scoretimer_generic_cross", 4000)
        end
    end)
    
end)