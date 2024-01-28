RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)


RegisterServerEvent("RegisterUsableItem:notepad")
AddEventHandler("RegisterUsableItem:notepad", function(source, _data)
	local _source = source
	local data = _data
    local bookid = data.meta.bookid
	if bookid == nil then
		TriggerEvent("redemrp_inventory:createnotepad", _source)

	end
	Wait(1000)
	MySQL.query('SELECT * FROM notepad WHERE bookid=@bookid' , {['bookid']=bookid}, function(result)
		if result ~= nil then
			TriggerClientEvent("dust_notepad:get_notepad", _source, result)
		end
	end)
end)

-- RegisterServerEvent('dust_notepad:get_notepad')
-- AddEventHandler('dust_notepad:get_notepad', function()
-- 	local _source = source
-- 	local User = dustCore.getUser(_source)
-- 	local Character = User.getUsedCharacter
-- 	local u_bookid = Character.bookidentifier
-- 	exports.ghmattimysql:execute('SELECT id,bookid,notepad FROM notepad WHERE bookid=@bookid' , {['bookid']=u_bookid}, function(result)
-- 		if result ~= nil then
-- 			TriggerClientEvent("dust_notepad:get_notepad", _source, result)
-- 		end
-- 	end)
-- end)

RegisterServerEvent('dust_notepad:save_new')
AddEventHandler('dust_notepad:save_new', function(save)
	local _source = source
	local User = dustCore.getUser(_source)
	local Character = User.getUsedCharacter
	local u_bookid = Character.bookidentifier

	exports.ghmattimysql:execute("INSERT notepad SET bookid=@bookid,notepad=@notepad", {['bookid']=u_bookid,['notepad']=save},
	function (result)
		TriggerClientEvent("dust_notify:notify", _source, "Blok", "Vytvořil jsi novou stránku", "note", 2000)
	end)
end)

RegisterServerEvent('dust_notepad:save')
AddEventHandler('dust_notepad:save', function(id, save)
	local _source = source
	local User = dustCore.getUser(_source)
	local Character = User.getUsedCharacter
	exports.ghmattimysql:execute("UPDATE notepad SET notepad=@notepad WHERE id = @id", {['id']=tonumber(id),['notepad']=save},
	function (result)
		TriggerClientEvent("dust_notify:notify", _source, "Blok", "Uložil jsi blok", "note", 2000)
	end)
end)


RegisterServerEvent('dust_notepad:delete')
AddEventHandler('dust_notepad:delete', function(id)
	local _source = source
	exports.ghmattimysql:execute("DELETE FROM notepad WHERE id=@id;", {["id"]=tonumber(id)}, function()
		TriggerClientEvent("dust_notify:notify", _source, "Blok", "Smazal jsi zprávu", "note", 2000)
	end)
end)

RegisterServerEvent('dust_notepad:send')
AddEventHandler('dust_notepad:send', function(id, save)
	local _source = source
	local User = dustCore.getUser(tonumber(id))
	if User ~= nil then
		local Character = User.getUsedCharacter
		local u_bookid = Character.bookidentifier

		exports.ghmattimysql:execute("INSERT notepad SET bookid=@bookid,notepad=@notepad", {['bookid']=u_bookid,['notepad']=save},
		function (result)
			TriggerClientEvent("dust_notify:notify", _source, "Blok", "Poslal jsi zprávu", "note", 2000)
		end)
	else
		TriggerClientEvent("dust_notify:notify", _source, "Blok", "Tento hráč neexistuje", "note", 2000)
	end
end)
-- exports.ghmattimysql:execute("INSERT mdt_wanted SET name=@name,price=@price,photo=@photo,player=@player,npc=@npc", {['name']=""..firstname.." "..lastname.."",['price']=price,['photo']=image,['player']=0,['npc']=npc_count},
-- function (result)

-- end)

-- exports.ghmattimysql:execute("UPDATE mdt SET name=@name,adress=@adress,info=@info,photo=@photo,jailed=@jailed WHERE name = @name", {['name']=name,['adress']=adress,['info']=info,['photo']=photo},
-- function (result)

-- end)