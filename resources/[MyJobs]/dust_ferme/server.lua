RedEM = exports["redem_roleplay"]:RedEM()


data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
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
	if tonumber(RedEM.GetPlayer(_source).jobgrade) > 1 then
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
				if timeDifference >= 86400 then
					if level < 5 then
						local newlevel = level + 1
						local model = result[i].model
						if model == "a_c_cow" then
							local milk = result[i].milk
							local newmilk = milk + 1
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
			stable = 'Boucherie'

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
		local identifier = user.identifier
		local charid = user.charid
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
								local amountgraisse = v.graisseamount
								local ItemData1 = data.getItem(_source, typeviande)
								local ItemData2 = data.getItem(_source, typecuir)
								local ItemData3 = data.getItem(_source, 'graisse')
								local weight1 = ItemData1.ItemInfo.weight * amountviande
								local weight2 = ItemData2.ItemInfo.weight * amountcuir
								local weight3 = ItemData3.ItemInfo.weight * amountgraisse
								local totalweight = weight1 + weight2 + weight3
								local weight = exports.redemrp_inventory.checkuserweight(_source, identifier, charid)
								if 45 - weight >= totalweight then
									if ItemData1.AddItem(amountviande) and ItemData2.AddItem(amountcuir) and ItemData3.AddItem(amountgraisse) then
										MySQL.query('DELETE FROM cattle WHERE `cowid` = @cowid;', {cowid = cowid})
									else return end
								else return end
							end
						end
					end
				end                    
			end
		end)
end)

RegisterServerEvent('cowstatebag', function(cow, id, name)
	Entity(cow).state:set('cowid', id, true)
	Entity(cow).state:set('name', name, true)
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


---- craft 

RegisterServerEvent('ferme:CraftItem')
AddEventHandler('ferme:CraftItem', function(itemNameStr, menu, amount)
	local _source = tonumber(source)
	
	for i = 1, amount, 1 do
		TriggerEvent("redemrp_inventory:getData", function(Inventory)
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 1 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 2 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 3 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
				local ItemData3 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe3Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) and ItemData3.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe3Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 4 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
				local ItemData3 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe3Name)
				local ItemData4 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe4Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) and ItemData3.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe3Amount) and ItemData4.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe4Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
			if Config.CraftingsReceipe[itemNameStr].Itemtocraft == 5 then
				local ItemData = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name)
				local ItemData2 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name)
				local ItemData3 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe3Name)
				local ItemData4 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe4Name)
				local ItemData5 = Inventory.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemReceipe5Name)
				if ItemData.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount) and ItemData2.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount) and ItemData3.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe3Amount) and ItemData4.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe4Amount) and ItemData5.RemoveItem(Config.CraftingsReceipe[itemNameStr].ItemReceipe5Amount) then
					local ItemDatagive = data.getItem(_source, Config.CraftingsReceipe[itemNameStr].ItemToGive)
					ItemDatagive.AddItem(Config.CraftingsReceipe[itemNameStr].Amount)
				end
			end
		end)
				TriggerClientEvent("ferme:CraftingAction", _source)

		Citizen.Wait(Config.WorkingTime)
	end
end)

RegisterServerEvent('ferme:AddItem')
AddEventHandler('ferme:AddItem', function(item, amount)
	print (item, amount)
	local _source = tonumber(source)
	local ItemData = data.getItem(_source, item)
	ItemData.AddItem(amount)

end)


RegisterServerEvent("ferme:MaxRessourcesAmount", function(dataType)
    local _source = tonumber(source)
    
	if Config.CraftingsReceipe[dataType].Itemtocraft == 1 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		
		local rItem1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		
		if rItem1Amount >= 1 then
			TriggerClientEvent("ferme:client:SetMaxAmount", _source, math.floor(rItem1Amount))
		else 
			TriggerClientEvent("ferme:client:SetMaxAmount", _source, 0)
		end
	elseif Config.CraftingsReceipe[dataType].Itemtocraft == 2 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe2Name)
		
		local rItem1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		local rItem2Amount = tonumber(ItemData2.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe2Amount)
		
		if rItem1Amount >= rItem2Amount then
			hAmount = rItem1Amount
			lAmount = rItem2Amount
		else
			lAmount = rItem1Amount
			hAmount = rItem2Amount
		end
	
		if hAmount >= 1 and lAmount >= 1 then
			TriggerClientEvent("ferme:client:SetMaxAmount", _source, math.floor(lAmount))
		else 
			TriggerClientEvent("ferme:client:SetMaxAmount", _source, 0)
		end
	elseif Config.CraftingsReceipe[dataType].Itemtocraft == 3 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe2Name)
		local ItemData3 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe3Name)
		
		local Item1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		local Item2Amount = tonumber(ItemData2.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe2Amount)
		local Item3Amount = tonumber(ItemData3.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe3Amount)

		local lAmount = Item1Amount
		if Item2Amount < lAmount then
			lAmount = Item2Amount
		end
		if Item3Amount < lAmount then
			lAmount = Item3Amount
		end
		if Item1Amount >= 1 and Item2Amount >= 1 and Item3Amount >= 1 then
			TriggerClientEvent("ferme:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("ferme:client:SetMaxAmount", _source, 0)
		end
	elseif Config.CraftingsReceipe[dataType].Itemtocraft == 4 then
		local ItemData = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe1Name)
		local ItemData2 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe2Name)
		local ItemData3 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe3Name)
		local ItemData4 = data.getItem(_source, Config.CraftingsReceipe[dataType].ItemReceipe4Name)
		
		local Item1Amount = tonumber(ItemData.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe1Amount)
		local Item2Amount = tonumber(ItemData2.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe2Amount)
		local Item3Amount = tonumber(ItemData3.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe3Amount)
		local Item4Amount = tonumber(ItemData4.ItemAmount / Config.CraftingsReceipe[dataType].ItemReceipe4Amount)

		local lAmount = Item1Amount
		if Item2Amount < lAmount then
			lAmount = Item2Amount
		end
		if Item3Amount < lAmount then
			lAmount = Item3Amount
		end
		if Item4Amount < lAmount then
			lAmount = Item4Amount
		end
		if Item1Amount >= 1 and Item2Amount >= 1 and Item3Amount >= 1 and Item4Amount >= 1 then
			TriggerClientEvent("ferme:client:SetMaxAmount", _source, math.floor(lAmount))
		else
			TriggerClientEvent("ferme:client:SetMaxAmount", _source, 0)
		end
	end

end)


RegisterNetEvent("fermier:buy", function(item, price)
	local _source = tonumber(source)
	local user = RedEM.GetPlayer(_source)
	local ItemData = data.getItem(_source, item)
	local money = user.money
	local itemprice = price
	if money >= itemprice then
		user.RemoveMoney(itemprice)
		ItemData.AddItem(1)
	end
end)


