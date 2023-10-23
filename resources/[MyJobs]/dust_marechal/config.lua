Config = {}


Config.Jobs = {
    [1] = "marechal_stdenis",
	[2] = "marechal_bla",
}


Config.MenuElements = {
	["équipement"] = {
		label = "Selle",
		category = {
			"horse_saddles",
			"horse_bedrolls",
			"horse_blankets",
			"horse_bridles",
			"HORSE_SADDLEBAGS",
			"saddle_horns",
			"saddle_stirrups",
		}
	},
	["cheval"] = {
		label = "Cheval",
		category = {
			"HORSE_TAILS",
			"horse_accessories",
			"horse_manes",
	}
	}
}

Config.MenuCart = {
	["équipement"] = {
		label = "Modifications",
		category = {
			"tints",
			-- "propsets",
			"liveries",
		}
	},
	["extras"] = {
		label = "Extras",
		category = {
			"extras",
		}
	},
	["propsets"] = {
		label = "Props",
		category = {
			"propsets",
		}
	},
}

Config.Customzone = {
	vector3(2502.748, -1450.436, 46.31255), --- saint denis
}
Config.Customcart = {
	vector3(2500.031, -1419.292, 46.12471),
}

Config.OpenKey = "0x156F7119"

Config.Label = {
	["saddle_horns"] = "Pommeau",
	["horse_blankets"] = "Tapis de Selle",
	["horse_saddles"] = "Selle",
	["HORSE_SADDLEBAGS"] = "Sacoches",
	["saddle_stirrups"] = "Étriers",
	["horse_bedrolls"] = "Couchage",
	["horse_manes"] = "Crinière",
	["horse_bridles"] = "Rênes",
	["horse_accessories"] = "Masque",
	["HORSE_TAILS"] = "Queue",
}

Config.LabelCart = {
	["tints"] = "Couleurs",
	-- ["propsets"] = "Équipements",
	["liveries"] = "Peintures",
	["extras"] = "Ajouts",
}

Config.LabelPrice = {
	["saddle_horns"] = 4,
	["horse_blankets"] = 3,
	["horse_saddles"] = 5,
	["HORSE_SADDLEBAGS"] = 5,
	["saddle_stirrups"] = 2,
	["horse_bedrolls"] = 2,
	["horse_manes"] = 2,
	["horse_bridles"] = 2,
	["horse_accessories"] = 2,
	["HORSE_TAILS"] = 2,
	["tints"] = 3,
	["propsets"] = 4,
	["liveries"] = 4,
	["extras"] = 4,
}