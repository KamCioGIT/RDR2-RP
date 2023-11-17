RedEM = exports["redem_roleplay"]:RedEM()


data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

-- make bait useable
RegisterServerEvent("RegisterUsableItem:p_baitBread01x", function(source)
    print "get"
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_baitBread01x")
end)

RegisterServerEvent("RegisterUsableItem:p_baitCorn01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_baitCorn01x")
end)

RegisterServerEvent("RegisterUsableItem:p_baitCheese01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_baitCheese01x")
end)

RegisterServerEvent("RegisterUsableItem:p_baitWorm01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_baitworm01x")
end)

RegisterServerEvent("RegisterUsableItem:p_baitCricket01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_baitCricket01x")
end)

RegisterServerEvent("RegisterUsableItem:p_crawdad01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_crawdad01x")
end)

RegisterServerEvent("RegisterUsableItem:p_finishedragonfly01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_finishedragonfly01x")
end)

RegisterServerEvent("RegisterUsableItem:p_finisdfishlure01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_finisdfishlure01x")
end)

RegisterServerEvent("RegisterUsableItem:p_finishdcrawd01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_finishdcrawd01x")
end)

RegisterServerEvent("RegisterUsableItem:p_finishedragonflylegendary01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_finishedragonflylegendary01x")
end)

RegisterServerEvent("RegisterUsableItem:p_finisdfishlurelegendary01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_finisdfishlurelegendary01x")
end)

RegisterServerEvent("RegisterUsableItem:p_finishdcrawdlegendary01x", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_finishdcrawdlegendary01x")
end)

RegisterServerEvent("RegisterUsableItem:p_lgoc_spinner_v4", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_lgoc_spinner_v4")
end)

RegisterServerEvent("RegisterUsableItem:p_lgoc_spinner_v6", function(source)
    TriggerClientEvent("dust-fishing:client:usebait", source, "p_lgoc_spinner_v6")
end)
-- end of make bait useable

-- remove bait when used on fishing rod
RegisterServerEvent('dust-fishing:server:removeBaitItem')
AddEventHandler('dust-fishing:server:removeBaitItem', function(item)
    local src = source
    local Player = RedEM.GetPlayer(src)
    local itemData = data.getItem(src, item)
    itemData.RemoveItem(1)
end)

local fishEntity = {
    [`A_C_FISHBLUEGIL_01_MS`]        = "a_c_fishbluegil_01_ms",
    [`A_C_FISHBLUEGIL_01_SM`]        = "a_c_fishbluegil_01_sm",
    [`A_C_FISHBULLHEADCAT_01_MS`]    = "a_c_fishbullheadcat_01_ms",
    [`A_C_FISHBULLHEADCAT_01_SM`]    = "a_c_fishbullheadcat_01_sm",
    [`A_C_FISHCHAINPICKEREL_01_MS`]  = "a_c_fishchainpickerel_01_ms",
    [`A_C_FISHCHAINPICKEREL_01_SM`]  = "a_c_fishchainpickerel_01_sm",
    [`A_C_FISHCHANNELCATFISH_01_LG`] = "a_c_fishchannelcatfish_01_lg",
    [`A_C_FISHCHANNELCATFISH_01_XL`] = "a_c_fishchannelcatfish_01_xl",
    [`A_C_FISHLAKESTURGEON_01_LG`]   = "a_c_fishlakesturgeon_01_lg",
    [`A_C_FISHLARGEMOUTHBASS_01_LG`] = "a_c_fishlargemouthbass_01_lg",
    [`A_C_FISHLARGEMOUTHBASS_01_MS`] = "a_c_fishlargemouthbass_01_ms",
    [`A_C_FISHLONGNOSEGAR_01_LG`]    = "a_c_fishlongnosegar_01_lg",
    [`A_C_FISHMUSKIE_01_LG`]         = "a_c_fishmuskie_01_lg",
    [`A_C_FISHNORTHERNPIKE_01_LG`]   = "a_c_fishnorthernpike_01_lg",
    [`A_C_FISHPERCH_01_MS`]          = "a_c_fishperch_01_ms",
    [`A_C_FISHPERCH_01_SM`]          = "a_c_fishperch_01_sm",
    [`A_C_FISHRAINBOWTROUT_01_LG`]   = "a_c_fishrainbowtrout_01_lg",
    [`A_C_FISHRAINBOWTROUT_01_MS`]   = "a_c_fishrainbowtrout_01_ms",
    [`A_C_FISHREDFINPICKEREL_01_MS`] = "a_c_fishredfinpickerel_01_ms",
    [`A_C_FISHREDFINPICKEREL_01_SM`] = "a_c_fishredfinpickerel_01_sm",
    [`A_C_FISHROCKBASS_01_MS`]       = "a_c_fishrockbass_01_ms",
    [`A_C_FISHROCKBASS_01_SM`]       = "a_c_fishrockbass_01_sm",
    [`A_C_FISHSALMONSOCKEYE_01_LG`]  = "a_c_fishsalmonsockeye_01_lg",
    [`A_C_FISHSALMONSOCKEYE_01_ML`]  = "a_c_fishsalmonsockeye_01_ml",
    [`A_C_FISHSALMONSOCKEYE_01_MS`]  = "a_c_fishsalmonsockeye_01_ms",
    [`A_C_FISHSMALLMOUTHBASS_01_LG`] = "a_c_fishsmallmouthbass_01_lg",
    [`A_C_FISHSMALLMOUTHBASS_01_MS`] = "a_c_fishsmallmouthbass_01_ms",
}

local fishNames = {
    [`A_C_FISHBLUEGIL_01_MS`]        = Config.fishData.A_C_FISHBLUEGIL_01_MS[1],
    [`A_C_FISHBLUEGIL_01_SM`]        = Config.fishData.A_C_FISHBLUEGIL_01_SM[1],
    [`A_C_FISHBULLHEADCAT_01_MS`]    = Config.fishData.A_C_FISHBULLHEADCAT_01_MS[1],
    [`A_C_FISHBULLHEADCAT_01_SM`]    = Config.fishData.A_C_FISHBULLHEADCAT_01_SM[1],
    [`A_C_FISHCHAINPICKEREL_01_MS`]  = Config.fishData.A_C_FISHCHAINPICKEREL_01_MS[1],
    [`A_C_FISHCHAINPICKEREL_01_SM`]  = Config.fishData.A_C_FISHCHAINPICKEREL_01_SM[1],
    [`A_C_FISHCHANNELCATFISH_01_LG`] = Config.fishData.A_C_FISHCHANNELCATFISH_01_LG[1],
    [`A_C_FISHCHANNELCATFISH_01_XL`] = Config.fishData.A_C_FISHCHANNELCATFISH_01_XL[1],
    [`A_C_FISHLAKESTURGEON_01_LG`]   = Config.fishData.A_C_FISHLAKESTURGEON_01_LG[1],
    [`A_C_FISHLARGEMOUTHBASS_01_LG`] = Config.fishData.A_C_FISHLARGEMOUTHBASS_01_LG[1],
    [`A_C_FISHLARGEMOUTHBASS_01_MS`] = Config.fishData.A_C_FISHLARGEMOUTHBASS_01_MS[1],
    [`A_C_FISHLONGNOSEGAR_01_LG`]    = Config.fishData.A_C_FISHLONGNOSEGAR_01_LG[1],
    [`A_C_FISHMUSKIE_01_LG`]         = Config.fishData.A_C_FISHMUSKIE_01_LG[1],
    [`A_C_FISHNORTHERNPIKE_01_LG`]   = Config.fishData.A_C_FISHNORTHERNPIKE_01_LG[1],
    [`A_C_FISHPERCH_01_MS`]          = Config.fishData.A_C_FISHPERCH_01_MS[1],
    [`A_C_FISHPERCH_01_SM`]          = Config.fishData.A_C_FISHPERCH_01_SM[1],
    [`A_C_FISHRAINBOWTROUT_01_LG`]   = Config.fishData.A_C_FISHRAINBOWTROUT_01_LG[1],
    [`A_C_FISHRAINBOWTROUT_01_MS`]   = Config.fishData.A_C_FISHRAINBOWTROUT_01_MS[1],
    [`A_C_FISHREDFINPICKEREL_01_MS`] = Config.fishData.A_C_FISHREDFINPICKEREL_01_MS[1],
    [`A_C_FISHREDFINPICKEREL_01_SM`] = Config.fishData.A_C_FISHREDFINPICKEREL_01_SM[1],
    [`A_C_FISHROCKBASS_01_MS`]       = Config.fishData.A_C_FISHROCKBASS_01_MS[1],
    [`A_C_FISHROCKBASS_01_SM`]       = Config.fishData.A_C_FISHROCKBASS_01_SM[1],
    [`A_C_FISHSALMONSOCKEYE_01_LG`]  = Config.fishData.A_C_FISHSALMONSOCKEYE_01_LG[1],
    [`A_C_FISHSALMONSOCKEYE_01_ML`]  = Config.fishData.A_C_FISHSALMONSOCKEYE_01_ML[1],
    [`A_C_FISHSALMONSOCKEYE_01_MS`]  = Config.fishData.A_C_FISHSALMONSOCKEYE_01_MS[1],
    [`A_C_FISHSMALLMOUTHBASS_01_LG`] = Config.fishData.A_C_FISHSMALLMOUTHBASS_01_LG[1],
    [`A_C_FISHSMALLMOUTHBASS_01_MS`] = Config.fishData.A_C_FISHSMALLMOUTHBASS_01_MS[1],
}

-- add fish caught to inventory
RegisterServerEvent('dust-fishing:FishToInventory')
AddEventHandler("dust-fishing:FishToInventory", function(fishModel)
    local src = source
    local Player = RedEM.GetPlayer(src)
    local fish = fishEntity[fishModel]
    local itemData = data.getItem(src, fish)
    itemData.AddItem(1)
end)


---- poissonerie 

RegisterServerEvent("peche:RequestCampMenu", function(menutype)
    local _source = tonumber(source)
    local craftingtable = {} 
	for k, v in pairs(Config.CraftingsReceipe) do
		if v.type == menutype then
			if v.Itemtocraft == 1 then
				local ItemData = data.getItem(_source, v.ItemReceipe1Name)
				local rItem1Amount = tonumber(ItemData.ItemAmount - v.ItemReceipe1Amount)
				if rItem1Amount >= 0 then
					craftingtable[k] = v
				end
			end
			if v.Itemtocraft == 2 then
				local ItemData = data.getItem(_source, v.ItemReceipe1Name)
				local ItemData2 = data.getItem(_source, v.ItemReceipe2Name)
				local rItem1Amount = tonumber(ItemData.ItemAmount - v.ItemReceipe1Amount)
				local rItem2Amount = tonumber(ItemData2.ItemAmount - v.ItemReceipe2Amount)
				if rItem1Amount >= 0 and rItem2Amount >= 0 then
					craftingtable[k] = v
				end
			end
			if v.Itemtocraft == 3 then
				local ItemData = data.getItem(_source, v.ItemReceipe1Name)
				local ItemData2 = data.getItem(_source, v.ItemReceipe2Name)
				local ItemData3 = data.getItem(_source, v.ItemReceipe3Name)
				local rItem1Amount = tonumber(ItemData.ItemAmount - v.ItemReceipe1Amount)
				local rItem2Amount = tonumber(ItemData2.ItemAmount - v.ItemReceipe2Amount)
				local rItem3Amount = tonumber(ItemData3.ItemAmount - v.ItemReceipe3Amount)
				if rItem1Amount >= 0 and rItem2Amount >= 0 and rItem3Amount >= 0 then
					craftingtable[k] = v
				end
			end
		end
	end

	TriggerClientEvent("peche:OpenCampMenu", _source, craftingtable, menutype)
end)

RegisterServerEvent('peche:CraftItem')
AddEventHandler('peche:CraftItem', function(itemNameStr, playerPedId)
	-- local _source = source
	-- TriggerEvent("redemrp_inventory:server:craftUsine", _source, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Name, Config.CraftingsReceipe[itemNameStr].ItemReceipe1Amount, {}, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Name, Config.CraftingsReceipe[itemNameStr].ItemReceipe2Amount, {}, playerPedId, Config.CraftingsReceipe[itemNameStr].WorkingTime, Config.CraftingsReceipe[itemNameStr].ItemToGive, Config.CraftingsReceipe[itemNameStr].Amount, {})                                                      
	local _source = tonumber(source)
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
end)