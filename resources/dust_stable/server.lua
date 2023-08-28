RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)
------ JOB ET GANG -----
RegisterNetEvent("dust_stable:server:askjob")
AddEventHandler(
    "dust_stable:server:askjob",
    function()
	local _source = source     
	local user = RedEM.GetPlayer(_source)
	local job = user.job
	local jobgrade = user.jobrade
	local gang = user.gang
	local ganggrade = user.ganggrade
	TriggerClientEvent("dust_stable:server:getjob", _source, job, jobgrade, gang, ganggrade)
end)

----- Get Horse -----

RegisterNetEvent("dust_stable:server:askhorse")
AddEventHandler(
    "dust_stable:server:askhorse",
    function()
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local identifier = user.identifier
		local charid = user.charid
		local job = user.job
		local jobgrade = user.jobrade
		local gang = user.gang
		local ganggrade = user.ganggrade
		MySQL.query('SELECT * FROM stable WHERE (`selected`=@selected AND `identifier`=@identifier AND `charid`=@charid) OR (`selected`=@selected AND `job`=@job AND `jobgrade`=@jobgrade) OR (`selected`=@selected AND `gang`=@gang AND `ganggrade`=@ganggrade);',
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
				print "result"
				for i = 1, #result do
					if result[i].selected == 0 then 
						local horseid = result[i].horseid
						local name = result[i].name
						local model = result[i].model
						local stable = result[i].stable
						TriggerClientEvent("dust_stable:server:gethorse", _source, horseid, name, model, stable)
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
	MySQL.query('SELECT * FROM stable WHERE `identifier`=@identifier AND `charid`=@charid AND `horseid`=@horseid;',
		{
			identifier = identifier,
			charid = charid,
			horseid = horseid
		}, function(result)
			if #result ~= 0 then
				for i = 1, #result do
					local components = json.encode(result[i].components)
					TriggerClientEvent("dust_stable:server:getcomponents", _source, horseid, components, model)
				end                    
			end
		end)
end)

---- Add Horse -----
RegisterServerEvent("dust_stable:server:rename")
AddEventHandler(
    "dust_stable:server:rename",
    function(name, horseid)
		MySQL.update('UPDATE stable SET `name`=@name WHERE `horseid`=@horseid;',
		{
			name = name,
			horseid = horseid
		}, function(rowsChanged)

		end)
end)

RegisterNetEvent("dust_stable:server:addjob")
AddEventHandler(
    "dust_stable:server:addjob",
    function(job, jobgrade, horseid)
        local _source = source
		MySQL.update('UPDATE stable SET `job`=@job, `jobgrade`=@jobgrade WHERE `horseid`=@horseid;',
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
		MySQL.update('UPDATE stable SET `job`=@job, `jobgrade`=@jobgrade  WHERE `horseid`=@horseid;',
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
		MySQL.update('UPDATE stable SET `gang`=@gang, `ganggrade`=@ganggrade WHERE `horseid`=@horseid;',
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
		MySQL.update('UPDATE stable SET `gang`=@gang, `ganggrade`=@ganggrade WHERE `horseid`=@horseid;',
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
    function(alias, model, stable)
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local identifier = user.identifier
		local charid = user.charid
		local name = tostring(alias)
		local numBase0 = math.random(100, 999)
    	local numBase1 = math.random(0, 999)
    	local generetedhorseid = string.format("%03d%04d", numBase0, numBase1)
		local horseid = generetedhorseid
		print (identifier, charid, name, horseid, model, stable)
		MySQL.update(
		'INSERT INTO stable (`identifier`, `charid`, `horseid`, `stable`, `model`, `name`) VALUES (@identifier, @charid, @horseid, @stable, @model, @name);',
		{
			identifier = identifier,
			charid = charid,
			name = name,
			horseid = horseid,
			model = model,
			stable = stable
		}, function(rowsChanged)

		end)
		local ItemData = data.getItem(_source, "createhorse")
		ItemData.RemoveItem(1)
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
	MySQL.query('SELECT * FROM stable WHERE `identifier`=@identifier AND `charid`=@charid AND `horseid`=@horseid;',
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

RegisterServerEvent("RegisterUsableItem:transferhorse")
AddEventHandler("RegisterUsableItem:transferhorse", function(source, _data)
	local _source = source
    local horseid = _data.meta.horseid
	print (horseid)
	local user = RedEM.GetPlayer(_source)
	local identifier = user.identifier
	local charid = user.charid
	MySQL.update('UPDATE stable SET `identifier`=@identifier, `charid`=@charid WHERE `horseid`=@horseid;',
	{
		identifier = identifier,
		charid = charid,
		horseid = horseid
	}, function(rowsChanged)
		TriggerEvent("redemrp_inventory:removeitemfrommeta", _source, "transferhorse", 1, _data.meta)
	end)
end)

RegisterServerEvent("dust_stable:server:sellhorse")
AddEventHandler("dust_stable:server:sellhorse", function (horseid)
	local _source = source
	local user = RedEM.GetPlayer(_source)
	local identifier = user.identifier
	local charid = user.charid
	MySQL.query('SELECT * FROM stable WHERE `identifier`=@identifier AND `charid`=@charid AND `horseid`=@horseid;',
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
					TriggerEvent("redemrp_inventory:transferhorse", _source, horseid)
			end)          
		end
	end) 
end)