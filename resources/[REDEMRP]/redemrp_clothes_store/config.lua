Config = {}
Config.Shoptext = 'Press ~INPUT_JUMP~ to access Clothing Store' -- Text to open the clothing shop
Config.Cloakroomtext = 'Press ~INPUT_JUMP~ to change your Outfit' -- Text to open the clothing shop
Config.BlipName = 'Tailleur' -- Blip Name Showed on map
Config.BlipNameCloakRoom = 'Wardrobe' -- Blip Name Showed on map
Config.EnableCommand = false -- Enable/Disable /clothing command
Config.BlipSprite = 1195729388	 -- Clothing shop sprite
Config.BlipSpriteCloakRoom = 1496995379	 -- Clothing shop sprite
Config.BlipScale = 0.2 -- Blip scale
Config.OpenKey = 0x760A9C6F -- Opening key hash
Config.Zones = {
	-- vector3(-181.8676, 624.49322, 114.08956), -- VALENTINE
	-- vector3(1225.331, -1247.26, 74.15482), -- RHODES
	vector3(2550.81,-1166.28,53.68), -- SAINT DENIS
	vector3(-764.4633, -1291.577, 43.83503), -- BLACK WATER
	-- vector3(-1794.89,-385.22,160.33), -- STRAWBERRY
	-- vector3(-3731.783, -2610.405, -12.9377), -- Armadillo
	-- vector3(2927.3571, 1271.6688, 44.652835), -- Annesburg
	-- vector3(-5484.658, -2961.321, -1.745089), -- Tumbleweed
}

Config.Cloakroom = {
	-- vector3(-171.7564, 638.16632, 114.08965), -- VALENTINE
	-- vector3(-1816.561, -367.8912, 163.29634), -- STRAWBERRY
	-- vector3(-767.4958, -1291.484, 43.83496), -- BLACKWATER
	-- vector3(1216.392, -1256.645, 75.06288), -- RHODES
	-- vector3(2556.49,-1160.14,53.74), -- SAINT DENIS
	-- vector3(-3727.226, -2610.616, -12.93387), -- Armadillo
	-- vector3(-5508.13, -2913.663, -1.751304), -- Tumbleweed
	-- vector3(2002.7088, -5505.448, 44.389133), -- Guarma Wedding 1
	-- vector3(1976.2947, -5511.198, 42.824645), -- Guarma Wedding 2
}

Config.Hat = {
	[1] = vector3(2555.037, -1171.738, 53.6835), -- SAINT DENIS
	[2] = vector3(-759.6125, -1293.875, 43.83521), --- blackwater
}

Config.Mask = {
	[1] = vector3(2825.81, -1229.961, 47.59823), -- SAINT DENIS
	[2] = vector3(-847.2916, -1180.989, 43.55643) ---- Blackwater 
}

Config.Eyes = {
	[1] = vector3(2722.853, -1233.676, 49.36834), -- SAINT DENIS
	[2] = vector3(-787.3041, -1302.636, 42.79637) ---- Blackwater 
}
Config.Medic = { 'doctor', 'doctor_stdenis', 'doctor_bla', 'doctor_DM', 'doctor_CG', 'doctor_NC', 'doctor_AL', 'doctor_CP', 'doctor_GB'}


Config.Bijoutier = {"bijoutier"}
Config.BaguesD = {
	[1] = vector3(2583.126, -1008.285, 44.24374), -- SAINT DENIS
}
Config.BaguesG = {
	[1] = vector3(2584.049, -1009.915, 44.25625), -- SAINT DENIS
}

Config.AccBottes = {
	[1] = vector3(2588.614, -1012.273, 44.2585), -- SAINT DENIS
}


Config.Label = {
	["boot_accessories"] = "Accessoire de bottes",
	["pants"] = "Pantalon",            	
	["cloaks"] = "Cape",            	
	["hats"] = "Chapeau",             	
	["vests"] = "Veste",            	
	["chaps"] = "Chaps",             	
	["shirts_full"] = "Chemise",       	
	["badges"] = "Badge",           	
	["masks"] = "Masque",            	
	["spats"] = "Guêtres",           	
	["neckwear"] = "Cou",         	
	["boots"] = "Bottes",            	
	["accessories"] = "Accessoires",      	
	["jewelry_rings_right"] = "Anneau droit",
	["jewelry_rings_left"]	= "Anneau gauche",
	["jewelry_bracelets"] = "Bracelets",	
	["gauntlets"] = "Gantelets",        	
	["neckties"] = "Cravates",        	
	["holsters_knife"] = "Étui à couteau",   	
	["talisman_holster"] = "Porte talisman",
	["loadouts"] = "Cartouchière",          	
	["suspenders"] = "Bretelles",      	
	["talisman_satchel"] = "Sacoche - Talisman", 	
	["satchels"] = "Sacoches",         	
	["gunbelts"] = "Holster",          	
	["belts"] = "Ceinture",            	
	["belt_buckles"] = "Boucle de ceinture",     	
	["holsters_left"] = "Holster Gauche",    	
	["holsters_right"] = "Holster Droite",   	
	["talisman_wrist"] = "Talisman Poignée",   	
	["coats"] = "Manteau",            	
	["coats_closed"] = "Manteau fermé",     	
	["ponchos"] = "Poncho",           	
	["eyewear"] = "Lunettes",          	
	["gloves"] = "Gants",           	
	["holsters_crossdraw"] = "Holster main faible", 	
	["aprons"] = "Tablier",			
	["skirts"] = "Jupe",
	["hair_accessories"] = "Accessoire tête",
	["dresses"] = "Robe",  
	["armor"] = "Armure",
	["save"] = "Valider",    	
}


Config.Price = {
    ["boot_accessories"] = 5,
    ["pants"] = 1,
    ["cloaks"] = 2,
    ["hats"] = 2,
    ["vests"] = 1,
    ["chaps"] = 2,
    ["shirts_full"] = 1,
    ["badges"] = 10,
    ["masks"] = 5,
    ["spats"] = 3,
    ["neckwear"] = 0.5,
    ["boots"] = 1,
    ["accessories"] = 2,
    ["jewelry_rings_right"] = 10,
    ["jewelry_rings_left"] = 10,
    ["jewelry_bracelets"] = 6,
    ["gauntlets"] = 2,
    ["neckties"] = 0.5,
    ["holsters_knife"] = 1,
    ["talisman_holster"] = 1,
    ["loadouts"] = 10,
    ["suspenders"] = 1,
    ["talisman_satchel"] = 1,
    ["satchels"] = 1,
    ["gunbelts"] = 2,
    ["belts"] = 1,
    ["belt_buckles"] = 5,
    ["holsters_left"] = 2,
    ["holsters_right"] = 2,
    ["talisman_wrist"] = 2,
    ["coats"] = 2,
    ["coats_closed"] = 2,
    ["ponchos"] = 1,
    ["eyewear"] = 2,
    ["gloves"] = 0.5,
    ["holsters_crossdraw"] = 2,
    ["aprons"] = 3,
    ["skirts"] = 1,
    ["hair_accessories"] = 1,
	["dresses"] = 1,  
	["armor"] = 20,    	
}

Config.MenuElements = {
	["head"] = {
		label = "Tête",
		category = {
			-- "hats",
			-- "eyewear",
			-- "masks",
			"neckwear",
			"neckties",
		}
	},
	["torso"] = {
		label = "Torse",
		category = {
			"cloaks",
			"vests",
			"shirts_full",
			"holsters_knife",
			"loadouts",
			"suspenders",
			"gunbelts",
			"belts",
			"holsters_left",
			"holsters_right",
			"coats",
			"coats_closed",
			"ponchos",
			"dresses",			
		}
	},
	["legs"] = {
		label = "Jambes",
		category = {
			"pants",
			"chaps",
			"skirts",
		}
	},
	["foot"] = {
		label = "Bottes",
		category = {
			"boots",
			"spats",
			"boot_accessories",
		}
	},
	["hands"] = {
		label = "Mains",
		category = {
			-- "jewelry_rings_right",
			-- "jewelry_rings_left",
			-- "jewelry_bracelets",
			"gauntlets",
			"gloves",
		}
	},
	["accessories"] = {
		label = "Accessoires",
		category = {
			"accessories",
			"talisman_wrist",
			"talisman_holster",
			"belt_buckles",
			-- "satchels",
			"holsters_crossdraw",
			"aprons",
			"bows",
			-- "armor",
			-- "badges",
			"hair_accessories",
		}
	},
}

