RedEM = exports["redem_roleplay"]:RedEM()


data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('fermier:askjob')
AddEventHandler('fermier:askjob', function()
	local _source = source
	local job = RedEM.GetPlayer(_source).job
	local jobgrade = RedEM.GetPlayer(_source).jobgrade
	TriggerClientEvent("fermier:CheckPlayerJob", _source, job, jobgrade)
end)

RegisterServerEvent('fermier:addble')
AddEventHandler('fermier:addble', function() 
	local _source = source
	local ItemData = data.getItem(_source, 'ble')
	local amount = math.random(4)
	ItemData.AddItem(amount)
end)


RegisterServerEvent("fermier:depStash", function()
    local _source = source
	if RedEM.GetPlayer(source).job == "fermier" then
        TriggerClientEvent("redemrp_inventory:OpenStash", _source, "dep_fermier", 3000.0)
    end
end)


RegisterServerEvent("fermier:retStash", function()
    local _source = source
	if RedEM.GetPlayer(source).jobgrade > 1 then
        TriggerClientEvent("redemrp_inventory:OpenStash", _source, "ret_fermier", 3000.0)
    end
end)


RegisterServerEvent("CheckStash", function()
	local depstashW = exports.redemrp_inventory.GetStashWeight(source, "dep_fermier")
	local retstashW = exports.redemrp_inventory.GetStashWeight(source, "ret_fermier")
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		TriggerEvent("redemrp_inventory:server:removeitemstash", "ble", 2, {}, "dep_fermier","farine", 1, {}, "ret_fermier")
	end
end)


RegisterServerEvent("fermier:RequestBossMenu", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)

	if user.job == "fermier" and user.jobgrade > 2 then
		TriggerClientEvent("fermier:OpenBossMenu", _source)	
	end
end)


------- ELEVAGE -------


-- ask bétail
RegisterNetEvent("dust_ferme:server:askcow")
AddEventHandler(
    "dust_ferme:server:askcow",
    function()
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local job = user.job
		MySQL.query('SELECT * FROM cattle WHERE (`selected`=@selected AND `job`=@job);',
		{
			job = job,
			selected = 0

		}, function(result)
			if #result ~= 0 then
				for i = 1, #result do
					if result[i].selected == 0 then 
						local cowid = result[i].cowid
						local name = result[i].name
						local model = result[i].model
						local stable = result[i].stable
						local race = result[i].race
						TriggerClientEvent("dust_ferme:getcow", _source, cowid, name, model, stable, race)
					end
				end                    
			end
		end)
end)

-- rename bétail
RegisterServerEvent("dust_ferme:server:rename")
AddEventHandler(
    "dust_ferme:server:rename",
    function(name, cowid)
		local _source = source     
		local user = RedEM.GetPlayer(_source)
		local job = user.job
		MySQL.update('UPDATE cattle SET `name`=@name WHERE `job`=@job AND `cowid`=@cowid;',
		{
			name = name,
			job = job,
			cowid = cowid
		}, function(rowsChanged)

		end)
end)



-- ranger le bétail
RegisterServerEvent("dust_ferme:server:stockcow") 
AddEventHandler("dust_ferme:server:stockcow", function(stable, cowid, entity)
	local _source = source
	local user = RedEM.GetPlayer(_source)
	local job = user.job
	MySQL.query('SELECT * FROM cattle WHERE `job`=@job AND `cowid`=@cowid;',
		{
			job = job,
			cowid = cowid
		}, function(result)
			if #result ~= 0 then
				MySQL.update('UPDATE cattle SET `stable`=@stable, `selected`=@selected WHERE `cowid`=@cowid;',
					{
						stable = stable,
						selected = 0,
						cowid = cowid
					}, function(rowsChanged)
						TriggerClientEvent("dust_ferme:cowstocked", _source, entity)
				end)          
			end
		end)
end)

--- achat 

RegisterServerEvent("dust_ferme:createcattle", function(name, model, stable, race, price)
	local _source = source     
		local user = RedEM.GetPlayer(_source)
		local job = user.job
		local numBase0 = math.random(100, 999)
    	local numBase1 = math.random(0, 999)
    	local generetedcowid = string.format("%03d%04d", numBase0, numBase1)
		local cowid = generetedcowid
		local money = user.money
		if money >= price then
			user.RemoveMoney(price)
			MySQL.update(
			'INSERT INTO cattle (`job`, `cowid`, `stable`, `model`, `name`, `race`, `milk`) VALUES (@job, @cowid, @stable, @model, @name, @race, @milk);',
			{
				job = job,
				name = name,
				cowid = cowid,
				model = model,
				stable = stable,
				race = race,
				milk = 0
			}, function(rowsChanged)

			end)
		end
end)

RegisterServerEvent("dust_ferme:server:cowout", function(id)
	local cowid = id
	MySQL.update('UPDATE cattle SET `selected`=@selected  WHERE `cowid`=@cowid;',
	{
		cowid = cowid,
		selected = 1
	}, function(rowsChanged)
end)     
end)

RegisterServerEvent('dust_ferme:server:resetcow', function()
	MySQL.query('SELECT * FROM cattle WHERE `selected`=@selected;',
	{
		selected = 1
	}, function(result)
		if #result ~= 0 then
			for i = 1, #result do
				local cowid = result[i].cowid
				MySQL.update('UPDATE cattle SET `selected`=@selected WHERE `cowid`=@cowid;',
					{
						selected = 0,
						cowid = cowid
					}, function(rowsChanged)
				end)  
			end
		end
	end)        
end)


RegisterServerEvent('dust_ferme:cowup', function(cowid)
	MySQL.query('SELECT * FROM cattle WHERE `cowid`=@cowid;',
	{
		cowid = cowid
	}, function(result)
		if #result ~= 0 then
			for i = 1, #result do
				local cd = os.time()
				local level = result[i].level
				local savedDate = result[i].date / 1000 -- Remplacez ceci par la date de votre base de données
				local timeDifference = os.difftime(cd, savedDate)
				print (timeDifference)
				if timeDifference >= 86400 then
					if level < 5 then
						local newlevel = level + 1
						local model = result[i].model
						if model == "a_c_cow" then
							local milk = result[i].milk
							local newmilk = milk + 1
							print (newlevel, cowid, newmilk, cd)
							MySQL.update('UPDATE cattle SET `level`=@level, `milk`=@milk, `date`=@date WHERE `cowid`=@cowid;',
								{
									level = newlevel,
									cowid = cowid,
									milk = newmilk,
									date = os.date("%Y-%m-%d %H:%M:%S")
								}, function(rowsChanged)
							end)
						else
							MySQL.update('UPDATE cattle SET `level`=@level,`date`=@date WHERE `cowid`=@cowid;',
							{
								level = newlevel,
								cowid = cowid,
								date = cd
							}, function(rowsChanged)
							end)
						end
					end
				end
			end
		end
	end)
end)

function parseDateTime(dateTimeStr)
    local year, month, day, hour, min, sec = dateTimeStr:match("(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
    return {
        year = tonumber(year),
        month = tonumber(month),
        day = tonumber(day),
        hour = tonumber(hour),
        min = tonumber(min),
        sec = tonumber(sec)
    }
end

function calculateTimeDifference(currentTime, savedTime)
    return os.difftime(currentTime) - os.time(savedTime)
end

RegisterServerEvent("dust_ferme:serveur:milking")
AddEventHandler("dust_ferme:serveur:milking", function(cowid)
	local _source = source
	MySQL.query('SELECT * FROM cattle WHERE `cowid`=@cowid;',
	{
		cowid = cowid
	}, function(result)
		if #result ~= 0 then
			for i = 1, #result do
				local milk = result[i].milk
				local model = result[i].model
				if model == "a_c_cow" then
					if milk >= 1 then
						local newmilk = milk - 1
						local ItemData = data.getItem(_source, "sceaulait")
						ItemData.AddItem(1)    
						MySQL.update('UPDATE cattle SET `milk`=@milk WHERE `cowid`=@cowid;',
							{
								milk = newmilk,
								cowid = cowid
							}, function(rowsChanged)
						end)  
					end
				elseif model == "a_c_bull_01" then
					local ItemData = data.getItem(_source, "foutrebovin")
					ItemData.AddItem(1)
				end
			end
		end
	end)  

end)


------ ask cow boucherie ------ 
RegisterNetEvent("dust_ferme:server:askcowboucherie")
AddEventHandler(
    "dust_ferme:server:askcowboucherie",
    function()
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local job = user.job
		MySQL.query('SELECT * FROM cattle WHERE (`selected`=@selected AND `job`=@job AND `stable`=@stable);',
		{
			job = job,
			selected = 0,
			stable = 'boucherie'

		}, function(result)
			if #result ~= 0 then
				for i = 1, #result do
					if result[i].selected == 0 then 
						local cowid = result[i].cowid
						local name = result[i].name
						local model = result[i].model
						local stable = result[i].stable
						local race = result[i].race
						TriggerClientEvent("dust_ferme:getcowboucherie", _source, cowid, name, model, stable, race)
					end
				end                    
			end
		end)
end)

RegisterNetEvent("dust_ferme:server:killcow")
AddEventHandler(
    "dust_ferme:server:killcow",
    function(cowid)
        local _source = source     
		local user = RedEM.GetPlayer(_source)
		local job = user.job
		MySQL.query('SELECT * FROM cattle WHERE (`cowid`=@cowid);',
		{
			cowid = cowid

		}, function(result)
			if #result ~= 0 then
				for i = 1, #result do
					if result[i].selected == 0 then 
						local model = result[i].model
						local level = result[i].level
						for k, v in pairs(Config.RewardBoucherie[model]) do
							if k == level then
								local typeviande = v.viande
								local amountviande = v.viandeamount
								local typecuir = v.cuir
								local amountcuir = v.cuiramount
								local ItemData1 = data.getItem(_source, typeviande)
								local ItemData2 = data.getItem(_source, typecuir)
								if ItemData1.AddItem(amountviande) and ItemData2.AddItem(amountcuir) then
									MySQL.query('DELETE FROM cattle WHERE `cowid` = @cowid;', {cowid = cowid})
								else return end
							end
						end
					end
				end                    
			end
		end)
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    TriggerEvent('dust_ferme:server:resetcow')
end)

AddEventHandler('txAdmin:events:scheduledRestart', function()
    TriggerEvent('dust_ferme:server:resetcow')
end)

AddEventHandler('txAdmin:events:serverShuttingDown', function()
    TriggerEvent('dust_ferme:server:resetcow')
end)
