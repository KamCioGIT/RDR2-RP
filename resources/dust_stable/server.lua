RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

----- Get Horse -----

RegisterNetEvent("dust_stable:server:askhorse")
AddEventHandler(
    "dust_stable:server:askhorse",
    function(stable)
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local identifier = user.identifier
		local charid = user.charid
		local job = user.job
		local jobgrade = user.jobrade
		local gang = user.gang
		local ganggrade = user.ganggrade
		MySQL.query('SELECT * FROM stable WHERE (`selected`=@selected AND `identifier`=@identifier AND `charid`=@charid AND `stable`=@stable) OR (`selected`=@selected AND `job`=@job AND `jobgrade`=@jobgrade AND `stable`=@stable) OR (`selected`=@selected AND `gang`=@gang AND `ganggrade`=@ganggrade AND `stable`=@stable);',
		{
			identifier = identifier,
			charid = charid,
			stable = stable,
			job = job,
			jobgrade = jobgrade,
			gang = gang,
			ganggrade = ganggrade,
			selected = 0

		}, function(result)
			if #result ~= 0 then
				for i = 1, #result do
					if result[i].selected == 0 then 
						local horseid = result[i].horseid
						local name = result[i].name
						local model = result[i].model
						TriggerClientEvent("dust_stable:server:gethorse", horseid, name, model)
					end
				end                    
			end
		end)
end)


RegisterNetEvent("dust_stable:server:askcomponents")
AddEventHandler(
    "dust_stable:server:askcomponents",
    function(horseid)
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local identifier = user.identifier
		local charid = user.charid
		MySQL.query('SELECT * IN stable WHERE `identifier`=@identifier, `charid`=@charid, `horseid`=@horseid;',
		{
			identifier = identifier,
			charid = charid,
			horseid = horseid
		}, function(result)
			if #result ~= 0 then
				for i = 1, #result do
					local components = json.encode(result[i].components)
					TriggerClientEvent("dust_stable:server:getcomponents", _source, horseid, components)
				end                    
			end
		end)
end)

---- Add Horse -----
RegisterNetEvent("dust_stable:server:add")
AddEventHandler(
    "dust_stable:server:add",
    function(name, horseid)
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local identifier = user.identifier
		local charid = user.charid
		MySQL.update('UPDATE stable SET `identifier`=@identifier, `charid`=@charid, `name`=@name WHERE `horseid`=@horseid;',
		{
			identifier = identifier,
			charid = charid,
			name = tostring(name),
			horseid = horseid
		}, function(rowsChanged)

		end)
end)

RegisterNetEvent("dust_stable:server:addjob")
AddEventHandler(
    "dust_stable:server:addjob",
    function(job, jobgrade, horseid)
        local _source = source
		MySQL.update('UPDATE stable SET `job`=@job, `jobgrade`=@jobgrade, `name`=@name  WHERE `horseid`=@horseid;',
		{
			job = job,
			jobgrade = jobgrade,
			horseid = horseid
		}, function(rowsChanged)

		end)
end)

RegisterNetEvent("dust_stable:server:removejob")
AddEventHandler(
    "dust_stable:server:removejob",
    function(horseid)
        local _source = source
		MySQL.update('UPDATE stable SET `job`=@job, `jobgrade`=@jobgrade, `name`=@name  WHERE `horseid`=@horseid;',
		{
			job = "x",
			jobgrade = 0,
			horseid = horseid
		}, function(rowsChanged)

		end)
end)

RegisterNetEvent("dust_stable:server:addgang")
AddEventHandler(
    "dust_stable:server:addgang",
    function(gang, ganggrade, horseid)
        local _source = source
		MySQL.update('UPDATE stable SET `gang`=@gang, `ganggrade`=@ganggrade, `name`=@name  WHERE `horseid`=@horseid;',
		{
			gang = gang,
			ganggrade = ganggrade,
			horseid = horseid
		}, function(rowsChanged)

		end)
end)

RegisterNetEvent("dust_stable:server:removegang")
AddEventHandler(
    "dust_stable:server:removegang",
    function(horseid)
        local _source = source
		MySQL.update('UPDATE stable SET `gang`=@gang, `ganggrade`=@ganggrade, `name`=@name  WHERE `horseid`=@horseid;',
		{
			gang = "x",
			ganggrade = 0,
			horseid = horseid
		}, function(rowsChanged)

		end)
end)

RegisterNetEvent("dust_stable:server:createhorse")
AddEventHandler(
    "dust_stable:server:createhorse",
    function(name, horseid, model, stable)
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local identifier = user.identifier
		local charid = user.charid
		print "mama"
		MySQL.update(
		'INSERT INTO stable (`identifier`, `charid`, `horseid`, `stable`, `model`, `name`) VALUES (@identifier, @charid, @horseid, @stable, @model, @name);',
		{
			identifier = identifier,
			charid = charid,
			name = tostring(name),
			horseid = horseid,
			model = model,
			stable = stable
		}, function(rowsChanged)

		end)
end)

------- ASK COMPONENTS -----
RegisterServerEvent("dust_stable:server:askcomponents")
AddEventHandler("dust_stable:server:askcomponents", function(horseid)
	local _source = source
	local user = RedEM.GetPlayer(_source)
	local identifier = user.identifier
	local charid = user.charid
	MySQL.query('SELECT * FROM stable WHERE `horseid`=@horseid;', {horseid = horseid}, function(result)
		if result[1] then
			components = json.decode(result[1].components)
		end
	end)
	TriggerClientEvent("dust_stable:server:getcomponents", _source, components)
end)

------ CHEVAL SORTI ----
RegisterServerEvent("dust_stable:server:horseout")
AddEventHandler("dust_stable:server:horseout", function (horseid)
	MySQL.update('UPDATE stable SET `selected`=@selected  WHERE `horseid`=@horseid;',
		{
			horseid = horseid,
			selected = 1
		}, function(rowsChanged)
	end)          
end)

---- RANGER LE CHEVAL ----

RegisterServerEvent("dust_stable:server:stockhorse") 
AddEventHandler("dust_stable:server:stockhorse", function(stable, horseid)
	local _source = source
	local user = RedEM.GetPlayer(_source)
	local identifier = user.identifier
	local charid = user.charid
	MySQL.query('SELECT * IN stable WHERE `identifier`=@identifier, `charid`=@charid, `horseid`=@horseid;',
		{
			identifier = identifier,
			charid = charid,
			horseid = horseid
		}, function(result)
			if #result ~= 0 then
				MySQL.update('UPDATE stable SET `stable`=@stable, `selected`=@selected  WHERE `horseid`=@horseid;',
					{
						stable = stable,
						selected = 0,
						horseid = horseid
					}, function(rowsChanged)
						TriggerClientEvent("dust_stable:server:horsestocked", _source)
				end)          
			end
		end)
end)



----- OBJET CONTRAT CHEVAL -----

RegisterServerEvent("RegisterUsableItem:createhorse")
AddEventHandler("RegisterUsableItem:createhorse", function(source)
	local _source = source
	local ItemData = data.getItem(_source, "createhorse")
	local horseid = ItemData.ItemMeta.horseid
	local model = ItemData.ItemMeta.model
	local _type = "create"
	TriggerClientEvent("dust_stable:server:choosename", _source, horseid, model, _type)
end)

RegisterServerEvent("RegisterUsableItem:transferhorse")
AddEventHandler("RegisterUsableItem:transferhorse", function(source)
	local _source = source
	local ItemData = data.getItem(_source, "transferhorse")
    local horseid = ItemData.ItemMeta.horseid
	local model = ItemData.ItemMeta.model
	local _type = "transfer"
	TriggerClientEvent("dust_stable:server:choosename", _source, horseid, model, _type)
end)

RegisterServerEvent("dust_stable:server:sellhorse")
AddEventHandler("dust_stable:server:sellhorse", function (horseid)
	local _source = source
	local user = RedEM.GetPlayer(_source)
	local identifier = user.identifier
	local charid = user.charid
	MySQL.query('SELECT * IN stable WHERE `identifier`=@identifier, `charid`=@charid, `horseid`=@horseid;',
		{
			identifier = identifier,
			charid = charid,
			horseid = horseid
		}, function(result)
			if #result ~= 0 then
				MySQL.update('UPDATE stable SET `identifier`=@identifier, `charid`=@charid, `job`=@job, `jobgrade`=@jobgrade,  `gang`=@gang, `ganggrade`=@ganggrade WHERE `horseid`=@horseid;',
					{
						identifier = identifier,
						charid = charid,
						job = "x",
						jobgrade = 0,
						gang = "x",
						ganggrade = 0
					}, function(rowsChanged)
						local ItemData = data.getItem(_source, "transferhorse")
						TriggerServerEvent("redemrp_inventory:transferhorse", horseid, model)
				end)          
			end
		end) 
end)