RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

local message = {}

RegisterServerEvent("RegisterUsableItem:notepad")
AddEventHandler("RegisterUsableItem:notepad", function(source, _data)
    local _source = source
    local data = _data
	TriggerClientEvent('lto_notepad:open', data.meta.data)
end)


RegisterServerEvent("AddNote")
AddEventHandler("AddNote", function(msg, id)
  local _source = source
  local bookid = id ------ ID 
  local message = msg
  exports.ghmattimysql:execute('INSERT INTO notepad (`bookid`, `message`) VALUES (@bookid, @message);',
  {
	bookid = bookid,
	message = message,
  })
end)

RegisterServerEvent("LoadUserNote")
AddEventHandler("LoadUserNote", function(id)
	local _source = source
	local bookid = id
	local Parameters = { ['bookid'] = bookid }
	exports.ghmattimysql:execute( "SELECT * FROM notepad WHERE charidentifier = @charidentifier", Parameters, function(result)
		if result[1] ~= nil then 
			message = {}
			for i=1, #result, 1 do
				table.insert(message, result[i].message)
			end

			
			
		else
			message = {}

		end
		TriggerClientEvent("MessageHandler", _source, message)

			
	end)
	
end)

RegisterServerEvent("DeleteAll")
AddEventHandler("DeleteAll", function(id)
	local _source = source
	local bookid = id
	local Parameters = { ['bookid'] = bookid }
	exports.ghmattimysql:execute( "DELETE FROM notepad WHERE bookid = @bookid", Parameters, function(result)
			
	end)
end)