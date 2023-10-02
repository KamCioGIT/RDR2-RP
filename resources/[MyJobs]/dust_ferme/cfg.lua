Config = {}

Config.FarmerDepositPos = { vector3(-2584.335, 415.2029, 148.965)} -- 
Config.FarmerWithdrawalPos = { vector3(-2588.564, 417.783, 149.0052)}
Config.GetVirginContractPos = { vector3(-2592.237, 455.9889, 146.9973)}
Config.DistanceToInteract = 2.2

Config.PointSprite = 2033377404


Config.GatherDict = 'mech_pickup@plant@milkweed'
Config.GatherAnim = 'stn_pick'


Config.WorkingTime = 5000

Config.ShowBlips = true

Config.RessourcesPoints = 
{
    vector3(-2572.389, 551.3449, 141.3406),
    vector3(-2569.031, 546.512, 141.3784),
    vector3(-2563.755, 550.1628, 141.096),
    vector3(-2567.136, 556.5611, 141.2192),
    vector3(-2561.816, 561.8822, 140.8911),
    vector3(-2556.401, 556.0502, 141.0345),
    vector3(-2549.916, 560.5123, 140.7749)
}

Config.Buycattle = {
	Blackwater = {
		pos = vector3(-957.5659, -1324.978, 52.04538),
		name = 'Achat',
		stable= 'Blackwater',
	},
}

Config.Cattle = {
	bull= {
		model = "a_c_bull_01",
		name = "Taureau",
		desc = "$15 - Un gros morceau de viande",
		price = 15,
    },
	cow= {
		model = "a_c_cow",
		name = "Vache",
		desc = "$5 - Pour faire du bon lait",
		price = 5,
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


Config.Paturages = {
    [1] = {
		pos = vector3(-1795.694, -903.8077, 105.203),
    },
	[2] = {
		pos = vector3(-1846.719, 440.7046, 114.4896),
    },
    [3] = {
		pos = vector3(-959.0815, -1456.094, 52.35111),
    },

}

Config.BlipSprite = -675651933
Config.blipRadius = 50.0
Config.radiusStyle = 1673015813



Config.Boucherie = {
	[1] = {pos= vector3(2150.772, -1296.647, 42.75868)},
}

Config.RewardBoucherie = {
	["a_c_cow"] = {
		[0] = {viande = 'viandebovine', viandeamount = 1, cuir = 'cuirbovin', cuiramount = 4, graisseamount = 2},
		[1] = {viande = 'viandebovine', viandeamount = 2, cuir = 'cuirbovin', cuiramount = 8, graisseamount = 4},
		[2] = {viande = 'viandebovine', viandeamount = 3, cuir = 'cuirbovin', cuiramount = 12, graisseamount = 6},
		[3] = {viande = 'viandebovine', viandeamount = 4, cuir = 'cuirbovin', cuiramount = 16, graisseamount = 8},
		[4] = {viande = 'viandebovine', viandeamount = 5, cuir = 'cuirbovin', cuiramount = 20, graisseamount = 10},
		[5] = {viande = 'viandebovine', viandeamount = 6, cuir = 'cuirbovin', cuiramount = 24, graisseamount = 12},
	},
	["a_c_bull_01"] = {
		[0] = {viande = 'viandebovine', viandeamount = 2, cuir = 'cuirbovin',  cuiramount = 4, graisseamount = 4},
		[1] = {viande = 'viandebovine', viandeamount = 4, cuir = 'cuirbovin',  cuiramount = 8, graisseamount = 6},
		[2] = {viande = 'viandebovine', viandeamount = 6, cuir = 'cuirbovin',  cuiramount = 12, graisseamount = 8},
		[3] = {viande = 'viandebovine', viandeamount = 8, cuir = 'cuirbovin',  cuiramount = 16, graisseamount = 10},
		[4] = {viande = 'viandebovine', viandeamount = 10, cuir = 'cuirbovin',  cuiramount = 20, graisseamount = 12},
		[5] = {viande = 'viandebovine', viandeamount = 12, cuir = 'cuirbovin',  cuiramount = 24, graisseamount = 14},
	},

}

Config.Lait = {
	[1] = {
		pos = vector3(-1601.804, -1411.454, 81.94773),
    },
}


Config.PedMilkingDict = "mech_milking"
Config.PedMilkingAnim = "milking_loop_player"

