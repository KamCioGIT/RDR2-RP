RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

RegisterServerEvent("Telegram:GetMessages")
AddEventHandler("Telegram:GetMessages", function(src)
	local _source
	
	if not src then 
		_source = source
	else 
		_source = src
	end
	local user = RedEM.GetPlayer(_source)
	local recipient = user.pobox
	
	MySQL.query("SELECT * FROM telegrams WHERE recipient=@recipient ORDER BY id DESC", { recipient = recipient }, function(result)
		TriggerClientEvent("Telegram:ReturnMessages", _source, result)
	end)
end)

RegisterServerEvent("Telegram:SendMessage")
AddEventHandler("Telegram:SendMessage", function(pobox, message, post)
	local _source = source
	local _pobox = pobox
	local _message = message
	local _post = post

	local user = RedEM.GetPlayer(_source)
	local sender = user.pobox

	-- get the steam and character id of the recipient
	MySQL.query("SELECT * FROM characters WHERE pobox=@pobox", { pobox = pobox}, function(result)
		if result[1] then 
			MySQL.update("INSERT INTO telegrams (sender, recipient, message, date, selected, post) VALUES (@sender, @recipient, @message, @date, @selected, @post)",
			{
				sender = sender,
				recipient = _pobox,
				message = _message,
				date = os.date("%Y-%m-%d %H:%M:%S"),
				selected = 0,
				post = _post
			}, function(count)
				----- Notif
				-- if count > 0 then 
				-- 	for k, v in pairs(players) do
				-- 		TriggerEvent('redemrp:getPlayerFromId', v, function(user)
				-- 			if user.getName() == firstname .. " " .. lastname then 
				-- 				TriggerClientEvent("redemrp_notification:start", v, "You've received a telegram.", 3)
				-- 			end
				-- 		end)
				-- 	end
				-- end
			end)

			TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Télégramme", "Votre télégramme va être envoyé !", "scoretimer_textures", "scoretimer_generic_tick", 4000)
		else 
			TriggerClientEvent("redem_roleplay:NotifyLeft", _source, "Télégramme", "Cette adresse postale n'existe pas !", "scoretimer_textures", "scoretimer_generic_cross", 4000)
		end
	end)
end)

RegisterServerEvent("Telegram:DeleteMessage")
AddEventHandler("Telegram:DeleteMessage", function(id)
	local _source = source

	MySQL.update("DELETE FROM telegrams WHERE id=@id",  { ['@id'] = id }, function(count)
		if count > 0 then 
			TriggerEvent("Telegram:GetMessages", _source)
		else
			TriggerClientEvent("redemrp_notification:start", _source, "We're unable to delete your Telegram right now. Please try again later.", 3)
		end
	end)
end)
