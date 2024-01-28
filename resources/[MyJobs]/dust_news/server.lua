
local data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
	data = call
end)

if Config.ImageUi then
	for k,v in pairs(Config.Newspapers) do
		RegisterServerEvent("RegisterUsableItem:"..k.."")
		AddEventHandler("RegisterUsableItem:"..k.."", function(source)
			local _source = source
			TriggerClientEvent('redemrp_inventory:close_inventory', _source) 
			Citizen.Wait(0)
			TriggerClientEvent('dust_newspapers:newspapers', _source, v) 
		end)
	end
end

if Config.LinkWebsite then
	for k,v in pairs(Config.Newspapers2) do
		RegisterServerEvent("RegisterUsableItem:"..k.."")
		AddEventHandler("RegisterUsableItem:"..k.."", function(source)
			local _source = source
			TriggerClientEvent('redemrp_inventory:close_inventory', _source) 
			Citizen.Wait(0)
			TriggerClientEvent("dust_newspapers:newspapers", _source, v)
		end)
	end
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


RegisterServerEvent('dust_newspaper:new')
AddEventHandler('dust_newspaper:new', function(link, amt, title)
    local _source = source
	local numBase0 = math.random(100, 999)
	local numBase1 = math.random(0, 9999)
	newsid = string.format("%03d%04d", numBase0, numBase1)
	print(tonumber(amt))
	TriggerEvent("redemrp_inventory:createnewspaper", _source, newsid, link, amt, title)
    MySQL.execute("INSERT INTO newspaper (`newsid`, `link`) VALUES (@newsid, @link)", {link = link, newsid = newsid},
    function (result)
    end)
end)
