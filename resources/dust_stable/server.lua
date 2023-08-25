RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

------ Refresh DB stable ----

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
		MySQL.query('SELECT * FROM stable WHERE (`identifier`=@identifier AND `charid`=@charid AND `stable`=@stable) OR (`job`=@job AND `jobgrade`=@jobgrade AND `stable`=@stable) OR (`gang`=@gang AND `ganggrade`=@ganggrade AND `stable`=@stable);',
		{
			identifier = identifier,
			charid = charid,
			stable = stable,
			job = job,
			jobgrade = jobgrade,
			gang = gang,
			ganggrade = ganggrade

		}, function(result)
			if #result ~= 0 then
				for i = 1, #result do
					local horseid = result[i].horseid
					local name = result[i].name
					local model = result[i].model
					TriggerClientEvent("dust_stable:server:gethorse", horseid, name, model)
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
		local job = nil
		local jobgrade = nil
		local gang = nil
		local ganggrade = nil
		MySQL.update('UPDATE stable SET `identifier`=@identifier, `charid`=@charid, `name`=@name, `job`=@job, `jobgrade`=@jobgrade, `gang`=@gang, `ganggrade`=@ganggrade WHERE `horseid`=@horseid;',
		{
			identifier = identifier,
			charid = charid,
			name = tostring(name),
			horseid = horseid,
			job = job,
			jobgrade = jobgrade,
			gang = gang,
			ganggrade = ganggrade
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
    "dust_stable:server:create",
    function(name, horseid)
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local identifier = user.identifier
		local charid = user.charid
		local numBase0 = math.random(100, 999)
    	local numBase1 = math.random(0, 9999)
    	local generetedhorseid = string.format("%03d%04d", numBase0, numBase1)
		MySQL.update(
		'INSERT INTO vault (`identifier`, `charid`, `horseid`, `stable`, `model`, `name`) VALUES (@identifier, @charid, @horseid, @stable, @model, @name);',
		{
			identifier = identifier,
			charid = charid,
			name = tostring(name),
			horseid = generetdhorseid
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
	MySQL.query('SELECT * FROM horses WHERE `horseid`=@horseid;', {horseid = horseid}, function(result)
		if result[1] then
			components = json.decode(result[1].components)
		end
	end)
	TriggerClientEvent("dust_stable:server:getcomponents", _source, components)
end)

----- OBJET CONTRAT CHEVAL -----
