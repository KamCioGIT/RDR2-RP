RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

local bookid = nil
RegisterServerEvent("RegisterUsableItem:notepad")
AddEventHandler("RegisterUsableItem:notepad", function(source, _data)
	local _source = source
	local data = _data
    bookid = data.meta.bookid
	print (bookid)
	if bookid == nil then
		local numBase0 = math.random(100, 999)
		local numBase1 = math.random(0, 9999)
		bookid = string.format("%03d%04d", numBase0, numBase1)
		TriggerEvent("redemrp_inventory:createnotepad", _source, bookid)
	end
	Wait(300)
	print (bookid)
	MySQL.query('SELECT * FROM notepad WHERE bookid=@bookid' , {['bookid']=bookid}, function(result)
		if result ~= nil then
			TriggerClientEvent("dust_notepad:get_notepad", _source, result)
		end
	end)
end)


RegisterServerEvent('dust_notepad:save_new')
AddEventHandler('dust_notepad:save_new', function(page, save)
    local _source = source
    MySQL.execute("INSERT INTO notepad (`bookid`, `notepad`, `page`) VALUES (@bookid, @notepad, @page)", {notepad = save, bookid = bookid, page = tonumber(page)},
    function (result)
    end)
end)


RegisterServerEvent('dust_notepad:save')
AddEventHandler('dust_notepad:save', function(page, save)
	local _source = source
	print(page, save, bookid)
	MySQL.update('UPDATE notepad SET `notepad`=@notepad WHERE `bookid`=@bookid AND `page`=@page',{notepad = save, bookid = bookid,page = tonumber(page)},
	function (result)
		-- TriggerClientEvent("dust_notify:notify", _source, "Blok", "Uložil jsi blok", "note", 2000)
	end)
end)


RegisterServerEvent('dust_notepad:delete')
AddEventHandler('dust_notepad:delete', function(page)
    local _source = source
    MySQL.execute("DELETE FROM notepad WHERE `page` = @page AND `bookid` = @bookid", {bookid = bookid, page = tonumber(page)}, function()

    end)
end)

