local gumCore = {}

TriggerEvent("getCore",function(core)
	gumCore = core
end)

Inventory = exports.gum_inventory:gum_inventoryApi()
gum = exports.gum_core:gumAPI()

RegisterServerEvent('gum_notepad:get_notepad')
AddEventHandler('gum_notepad:get_notepad', function()
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local u_charid = Character.charIdentifier
	exports.ghmattimysql:execute('SELECT id,charid,notepad FROM notepad WHERE charid=@charid' , {['charid']=u_charid}, function(result)
		if result ~= nil then
			TriggerClientEvent("gum_notepad:get_notepad", _source, result)
		end
	end)
end)
RegisterServerEvent('gum_notepad:save_new')
AddEventHandler('gum_notepad:save_new', function(save)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local u_charid = Character.charIdentifier

	exports.ghmattimysql:execute("INSERT notepad SET charid=@charid,notepad=@notepad", {['charid']=u_charid,['notepad']=save},
	function (result)
		TriggerClientEvent("gum_notify:notify", _source, "Blok", "Vytvořil jsi novou stránku", "note", 2000)
	end)
end)

RegisterServerEvent('gum_notepad:save')
AddEventHandler('gum_notepad:save', function(id, save)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	exports.ghmattimysql:execute("UPDATE notepad SET notepad=@notepad WHERE id = @id", {['id']=tonumber(id),['notepad']=save},
	function (result)
		TriggerClientEvent("gum_notify:notify", _source, "Blok", "Uložil jsi blok", "note", 2000)
	end)
end)


RegisterServerEvent('gum_notepad:delete')
AddEventHandler('gum_notepad:delete', function(id)
	local _source = source
	exports.ghmattimysql:execute("DELETE FROM notepad WHERE id=@id;", {["id"]=tonumber(id)}, function()
		TriggerClientEvent("gum_notify:notify", _source, "Blok", "Smazal jsi zprávu", "note", 2000)
	end)
end)

RegisterServerEvent('gum_notepad:send')
AddEventHandler('gum_notepad:send', function(id, save)
	local _source = source
	local User = gumCore.getUser(tonumber(id))
	if User ~= nil then
		local Character = User.getUsedCharacter
		local u_charid = Character.charIdentifier

		exports.ghmattimysql:execute("INSERT notepad SET charid=@charid,notepad=@notepad", {['charid']=u_charid,['notepad']=save},
		function (result)
			TriggerClientEvent("gum_notify:notify", _source, "Blok", "Poslal jsi zprávu", "note", 2000)
		end)
	else
		TriggerClientEvent("gum_notify:notify", _source, "Blok", "Tento hráč neexistuje", "note", 2000)
	end
end)
-- exports.ghmattimysql:execute("INSERT mdt_wanted SET name=@name,price=@price,photo=@photo,player=@player,npc=@npc", {['name']=""..firstname.." "..lastname.."",['price']=price,['photo']=image,['player']=0,['npc']=npc_count},
-- function (result)

-- end)

-- exports.ghmattimysql:execute("UPDATE mdt SET name=@name,adress=@adress,info=@info,photo=@photo,jailed=@jailed WHERE name = @name", {['name']=name,['adress']=adress,['info']=info,['photo']=photo},
-- function (result)

-- end)