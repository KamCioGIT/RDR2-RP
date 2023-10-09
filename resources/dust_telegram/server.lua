

RegisterServerEvent("Telegram:GetMessages")
AddEventHandler("Telegram:GetMessages", function(src)
	local _source
	
	if not src then 
		_source = source
	else 
		_source = src
	end
		local user = RedEM.GetPlayer(_source)
		local recipient = user.identifer
		local recipientid = user.characterid
		
		MySQL.query("SELECT * FROM telegrams WHERE recipient=@recipient AND recipientid=@recipientid ORDER BY id DESC", { ['@recipient'] = recipient, ['@recipientid'] = recipientid }, function(result)
			TriggerClientEvent("Telegram:ReturnMessages", _source, result)
		end)
end)

RegisterServerEvent("Telegram:SendMessage")
AddEventHandler("Telegram:SendMessage", function(firstname, lastname, message, players)
	local _source = source

	TriggerEvent("redemrp:getPlayerFromId", _source, function(user)
		local sender = user.getName()

		-- get the steam and character id of the recipient
		MySQL.Async.fetchAll("SELECT identifier, characterid FROM characters WHERE firstname=@firstname AND lastname=@lastname", { ['@firstname'] = firstname, ['@lastname'] = lastname}, function(result)
			if result[1] then 
				local recipient = result[1].identifier 
				local recipientid = result[1].characterid

				local paramaters = { ['@sender'] = sender, ['@recipient'] = recipient, ['@recipientid'] = recipientid, ['@message'] = message }

				MySQL.Async.execute("INSERT INTO telegrams (sender, recipient, recipientid, message) VALUES (@sender, @recipient, @recipientid, @message)",  paramaters, function(count)
					if count > 0 then 
						for k, v in pairs(players) do
							TriggerEvent('redemrp:getPlayerFromId', v, function(user)
								if user.getName() == firstname .. " " .. lastname then 
									TriggerClientEvent("redemrp_notification:start", v, "You've received a telegram.", 3)
								end
							end)
						end
					else 
						TriggerClientEvent("redemrp_notification:start", _source, "We're unable to process your Telegram right now. Please try again later.", 3)
					end
				end)

				TriggerClientEvent("redemrp_notification:start", _source, "Your telegram has been posted", 3)
			else 
				TriggerClientEvent("redemrp_notification:start", _source, "Unable to process Telegram. Invalid first or lastname.", 3)
			end
		end)
	end)
end)

RegisterServerEvent("Telegram:DeleteMessage")
AddEventHandler("Telegram:DeleteMessage", function(id)
	local _source = source

	MySQL.Async.execute("DELETE FROM telegrams WHERE id=@id",  { ['@id'] = id }, function(count)
		if count > 0 then 
			TriggerEvent("Telegram:GetMessages", _source)
		else
			TriggerClientEvent("redemrp_notification:start", _source, "We're unable to delete your Telegram right now. Please try again later.", 3)
		end
	end)
end)
