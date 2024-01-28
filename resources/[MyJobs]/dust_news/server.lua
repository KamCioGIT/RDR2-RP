RedEM = exports["redem_roleplay"]:RedEM()
local data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
	data = call
end)


for k,v in pairs(Config.Newspapers2) do
	RegisterServerEvent("RegisterUsableItem:"..k.."")
	AddEventHandler("RegisterUsableItem:"..k.."", function(source)
		local _source = source
		TriggerClientEvent('redemrp_inventory:close_inventory', _source) 
		Citizen.Wait(0)
		TriggerClientEvent("dust_newspapers:newspapers", _source, v)
	end)
end


local newsid = nil
RegisterServerEvent("RegisterUsableItem:newspaper")
AddEventHandler("RegisterUsableItem:newspaper", function(source, _data)
	local _source = source
	local data = _data
    newsid = data.meta.newsid
	print (newsid)
	MySQL.query('SELECT * FROM newspaper WHERE newsid=@newsid' , {['newsid']=newsid}, function(result)
		if result ~= nil then
			local link = result[1].link
			TriggerClientEvent("dust_newspaper:get_newspaper", _source, link)
		end
	end)
end)
RegisterServerEvent("RegisterUsableItem:tract")
AddEventHandler("RegisterUsableItem:tract", function(source, _data)
	local _source = source
	local data = _data
    newsid = data.meta.newsid
	print (newsid)
	MySQL.query('SELECT * FROM newspaper WHERE newsid=@newsid' , {['newsid']=newsid}, function(result)
		if result ~= nil then
			local link = result[1].link
			TriggerClientEvent("dust_newspaper:get_newspaper", _source, link)
		end
	end)
end)


RegisterServerEvent('dust_newspaper:new')
AddEventHandler('dust_newspaper:new', function(type, link, amt, title)
	local _source = source
	local User = RedEM.GetPlayer(_source)
	if type == "journal" then
		local currentMoney = User.money
		local removeMoney = amt * Config.PriceJournal
		if currentMoney >= removeMoney then
			local numBase0 = math.random(100, 999)
			local numBase1 = math.random(0, 9999)
			newsid = string.format("%03d%04d", numBase0, numBase1)
			MySQL.execute("INSERT INTO newspaper (`newsid`, `link`) VALUES (@newsid, @link)", {link = link, newsid = newsid},
			function (result)
			end)
			local amount = tonumber(amt)
			User.removeMoney(removeMoney)
			while amount > 0 do
				if amount > 0 then
					TriggerEvent("redemrp_inventory:createnewspaper", _source, newsid, link, title)
					amount = amount - 1
				end
			end
		end
	end

	if type == "impression" then
		local currentMoney = User.money
		local removeMoney = amt * Config.PriceTract
		if currentMoney >= removeMoney then
			local numBase0 = math.random(100, 999)
			local numBase1 = math.random(0, 9999)
			newsid = string.format("%03d%04d", numBase0, numBase1)
			MySQL.execute("INSERT INTO newspaper (`newsid`, `link`) VALUES (@newsid, @link)", {link = link, newsid = newsid},
			function (result)
			end)
			local amount = tonumber(amt)
			User.removeMoney(removeMoney)
			while amount > 0 do
				if amount > 0 then
					TriggerEvent("redemrp_inventory:createtract", _source, newsid, link, title)
					amount = amount - 1
				end
			end
		end
	end
end)
