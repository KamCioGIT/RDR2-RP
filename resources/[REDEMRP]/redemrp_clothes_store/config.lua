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
	vector3(-181.8676, 624.49322, 114.08956), -- VALENTINE
	vector3(1225.331, -1247.26, 74.15482), -- RHODES
	vector3(2550.81,-1166.28,53.68), -- SAINT DENIS
	vector3(-767.94,-1294.95,43.84), -- BLACK WATER
	vector3(-1794.89,-385.22,160.33), -- STRAWBERRY
	vector3(-3731.783, -2610.405, -12.9377), -- Armadillo
	vector3(2927.3571, 1271.6688, 44.652835), -- Annesburg
	vector3(-5484.658, -2961.321, -1.745089), -- Tumbleweed
}

Config.Cloakroom = {
	vector3(-171.7564, 638.16632, 114.08965), -- VALENTINE
	vector3(-1816.561, -367.8912, 163.29634), -- STRAWBERRY
	vector3(-767.4958, -1291.484, 43.83496), -- BLACKWATER
	vector3(1216.392, -1256.645, 75.06288), -- RHODES
	vector3(2556.49,-1160.14,53.74), -- SAINT DENIS
	vector3(-3727.226, -2610.616, -12.93387), -- Armadillo
	vector3(-5508.13, -2913.663, -1.751304), -- Tumbleweed
	vector3(2002.7088, -5505.448, 44.389133), -- Guarma Wedding 1
	vector3(1976.2947, -5511.198, 42.824645), -- Guarma Wedding 2
}

Config.Hat = {
	[1] = vector3(2555.037, -1171.738, 53.6835), -- SAINT DENIS
}

Config.Mask = {
	[1] = vector3(2825.81, -1229.961, 47.59823), -- SAINT DENIS
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
    ["boot_accessories"] = 4,
    ["pants"] = 2,
    ["cloaks"] = 4,
    ["hats"] = 2,
    ["vests"] = 2,
    ["chaps"] = 2,
    ["shirts_full"] = 2,
    ["badges"] = 10,
    ["masks"] = 5,
    ["spats"] = 3,
    ["neckwear"] = 2,
    ["boots"] = 2,
    ["accessories"] = 5,
    ["jewelry_rings_right"] = 10,
    ["jewelry_rings_left"] = 10,
    ["jewelry_bracelets"] = 6,
    ["gauntlets"] = 3,
    ["neckties"] = 3,
    ["holsters_knife"] = 3,
    ["talisman_holster"] = 3,
    ["loadouts"] = 5,
    ["suspenders"] = 3,
    ["talisman_satchel"] = 3,
    ["satchels"] = 3,
    ["gunbelts"] = 3,
    ["belts"] = 2,
    ["belt_buckles"] = 6,
    ["holsters_left"] = 5,
    ["holsters_right"] = 5,
    ["talisman_wrist"] = 5,
    ["coats"] = 5,
    ["coats_closed"] = 5,
    ["ponchos"] = 3,
    ["eyewear"] = 5,
    ["gloves"] = 3,
    ["holsters_crossdraw"] = 4,
    ["aprons"] = 4,
    ["skirts"] = 2,
    ["hair_accessories"] = 2,
	["dresses"] = 1,  
	["armor"] = 20,    	
}

Config.MenuElements = {
	["head"] = {
		label = "Tête",
		category = {
			-- "hats",
			"eyewear",
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

