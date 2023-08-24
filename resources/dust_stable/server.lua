RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

------ Refresh DB stable ----

----- Get Horse -----

---- Add Horse -----
RegisterNetEvent("dust_stable:server:add")
AddEventHandler(
    "dust_stable:server:add",
    function(name, horseid)
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local identifier = user.identifier
		local charid = user.charid
		MySQL.update('UPDATE stable SET `identifier`=@identifier, `charid`=@charid, `name`=@name  WHERE `horseid`=@horseid;',
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

RegisterNetEvent("dust_stable:server:create")
AddEventHandler(
    "dust_stable:server:create",
    function(name, horseid)
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local identifier = user.identifier
		local charid = user.charid
		MySQL.update(
		'INSERT INTO vault (`identifier`, `charid`, `horseid`, `stable`, `model`, `name`) VALUES (@identifier, @charid, @horseid, @stable, @model, @name);',
		{
			identifier = identifier,
			charid = charid,
			name = tostring(name),
			horseid = horseid
		}, function(rowsChanged)

		end)
end)




----- OBJET CONTRAT CHEVAL -----
