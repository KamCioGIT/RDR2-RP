Config = {}

Config.Jobs = {
    [1] = "fermier",
}

Config.FarmerDepositPos = { vector3(-1605.754, -1374.691, 82.95718)} -- 
Config.FarmerWithdrawalPos = { vector3(-1608.229, -1368.804, 82.98436)}

Config.PointSprite = 2033377404
Config.CoordsPuit = vector3(-1650.112548828125, -1396.508544921875, 82.43363189697266)

Config.GatherDict = 'mech_pickup@plant@milkweed'
Config.GatherAnim = 'stn_pick'


Config.WorkingTime = 5000

Config.ShowBlips = true

Config.RessourcesPoints = 
{
    vector3(-1615.878, -1426.288, 81.88916),
	vector3(-1617.427, -1435.034, 81.96293),
    vector3(-1621.828, -1440.985, 82.34075),
    vector3(-1622.169, -1433.59, 82.2501),
    vector3(-1624.659, -1426.977, 82.23602),
    vector3(-1626.601, -1433.14, 82.36633),
    vector3(-1630.822, -1439.332, 82.69156),
	vector3(-1632.205, -1433.772, 82.54325),
	vector3(-1632.592, -1426.442, 82.48561),
	vector3(-1634.623, -1423.012, 82.55132),
	vector3(-1635.463, -1430.553, 82.56765),
	vector3(-1637.581, -1435.817, 82.71082),
	vector3(-1638.695, -1425.392, 82.65939),
	vector3(-1641.995, -1433.702, 82.89939),
	vector3(-1644.237, -1434.741, 82.9072),
	vector3(-1642.702, -1422.851, 82.93333),
}

Config.Buycattle = {
	Blackwater = {
		pos = vector3(-957.5659, -1324.978, 52.04538),
		name = 'Achat',
		stable= 'Blackwater',
		blip= 423351566,
	},
}

Config.Cattle = {
	bull= {
		model = "a_c_bull_01",
		name = "Taureau",
		desc = "$15 - Un gros morceau de viande",
		price = 5,
    },
	cow= {
		model = "a_c_cow",
		name = "Vache",
		desc = "$5 - Pour faire du bon lait",
		price = 3,
    },
}

Config.FarmStables = {
	Blackwater = {
		pos = vector3(-977.5865, -1337.164, 52.59379),
		name = 'Blackwater',
    },
	Ferme = {
		pos = vector3(-1587.07, -1424.411, 81.33995),
		name = 'Ferme',
    },
	Boucherie = {
		pos = vector3(2162.463, -1307.915, 42.45642),
		name = 'Boucherie',
    },
}

Config.Certif = {
	vector3(-1596.721, -1410.823, 82.06824), --- ferme
}

Config.Paturages = {
    [1] = {
		pos = vector3(-1081.22, -734.3133, 64.80408),
    },
    [2] = {
		pos = vector3(-1772.972, 423.2609, 111.9745),
    },
	[3] = {
		pos = vector3(-2031.971, -2482.823, 63.84556),
    },
	

}

Config.BlipSprite = -675651933
Config.blipRadius = 50.0
Config.radiusStyle = -1559907306



Config.Boucherie = {
	[1] = {pos= vector3(2150.772, -1296.647, 42.75868), blip = -1665418949},
}

Config.RewardBoucherie = {
	["a_c_cow"] = {
		[0] = {viande = 'viandebovine', viandeamount = 1, cuir = 'cuir', cuiramount = 2, graisseamount = 2},
		[1] = {viande = 'viandebovine', viandeamount = 3, cuir = 'cuir', cuiramount = 4, graisseamount = 4},
		[2] = {viande = 'viandebovine', viandeamount = 5, cuir = 'cuir', cuiramount = 6, graisseamount = 6},
		[3] = {viande = 'viandebovine', viandeamount = 7, cuir = 'cuir', cuiramount = 8, graisseamount = 8},
		[4] = {viande = 'viandebovine', viandeamount = 9, cuir = 'cuir', cuiramount = 10, graisseamount = 10},
		[5] = {viande = 'viandebovine', viandeamount = 10, cuir = 'cuir', cuiramount = 12, graisseamount = 12},
	},
	["a_c_bull_01"] = {
		[0] = {viande = 'viandebovine', viandeamount = 4, cuir = 'cuir',  cuiramount = 4, graisseamount = 4},
		[1] = {viande = 'viandebovine', viandeamount = 8, cuir = 'cuir',  cuiramount = 8, graisseamount = 8},
		[2] = {viande = 'viandebovine', viandeamount = 12, cuir = 'cuir',  cuiramount = 12, graisseamount = 12},
		[3] = {viande = 'viandebovine', viandeamount = 16, cuir = 'cuir',  cuiramount = 16, graisseamount = 16},
		[4] = {viande = 'viandebovine', viandeamount = 20, cuir = 'cuir',  cuiramount = 20, graisseamount = 20},
		[5] = {viande = 'viandebovine', viandeamount = 24, cuir = 'cuir',  cuiramount = 24, graisseamount = 24},
	},

}

Config.Lait = {
	[1] = {
		pos = vector3(-1601.804, -1411.454, 81.94773),
    },
}


Config.PedMilkingDict = "mech_milking"
Config.PedMilkingAnim = "milking_loop_player"

Config.WorkingTime = 5000
Config.DistanceToInteract = 1.5

Config.Atelier = vector3(-1643.041, -1350.916, 84.40321)

Config.AnimDict = "amb_work@world_human_hammer@table@male_a@trans"
Config.CraftAnim = {
    "base_trans_base",
}

Config.CraftingsReceipe = {
	['bouteillelait'] = {
		type = 'cuisineferme',
		Itemtocraft = 1,
		ItemReceipe1Name = 'sceaulait',
		ItemReceipe1Amount = 1,
		ItemToGive = 'bouteillelait',
		Amount = 5,
		WorkingTime = 10,
		label = 'Bouteille de lait',
		descriptionimages = {{src = 'nui://redemrp_inventory/html/items/moonshine_pot.png', text = "Jarre de lait",count = "x1"}}
	},
	['soupe'] = {
		type = 'cuisineferme',
		Itemtocraft = 4,
		ItemReceipe1Name = 'Corn_Seed',
		ItemReceipe1Amount = 1,
		ItemReceipe2Name = 'patate',
		ItemReceipe2Amount = 1,
		ItemReceipe3Name = 'saugeducolibri',
		ItemReceipe3Amount = 1,
		ItemReceipe4Name = 'charbon',
		ItemReceipe4Amount = 1,
		ItemToGive = 'soupe',
		Amount = 1,
		WorkingTime = 5,
		label = 'Soupe de légume',
		descriptionimages = {{src = 'nui://redemrp_inventory/html/items/corn.png', text = "Maïs",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_hummingbird_sage.png', text = "Sauge du Colibri",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
	},
    ['ragoutviande'] = {
        type = 'cuisineferme',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viandehachee',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'patate',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'ragoutviande',
        Amount = 1,
        WorkingTime = 5,
        label = 'Ragoût',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_rc_quartz_chunk.png', text = "Viande Hâchée",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['viandehacheevolaille'] = {
        type = 'cuisineferme',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandevolaille',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_gamey_bird.png', text = "Volaille",count = "x1"}}
    },
	['viandehachee'] = {
        type = 'cuisineferme',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viande',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Viande crue",count = "x1"}}
    },
    ['viandehacheegibier'] = {
        type = 'cuisineferme',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandegibier',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_mature_venison.png', text = "Venaison",count = "x1"}}
    },
    ['viandehacheepetitgibier'] = {
        type = 'cuisineferme',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandepetitmamifere',
        ItemReceipe1Amount = 2,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_exotic_bird.png', text = "Viande de petit gibier",count = "x2"}}
    },
    ['viandehacheereptile'] = {
        type = 'cuisineferme',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandereptile',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_stringy.png', text = "Viande de reptile",count = "x1"}}
    },
	
    
    
}

Config.ImportPoint = {
    [1]= vector3(2669.003, -1522.059, 45.96976), --- st denis
    [2]= vector3(-825.8802, -1241.919, 43.53639), -- bla
}


Config.Import = {
    ["Corn_Seed"] = {label= "Graine de Maïs", price = 0.03},
	["Potato_Seed"] = {label= "Patate germée", price = 0.03},
}