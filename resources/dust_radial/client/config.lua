Config = {}

Config.RagdollKey = 0xF3830D8E 
Config.HandsUpKey = 0x8CC9CD42 -- x 
Config.MenuKey = 0xCEE12B50 -- O

Config.HandsUpAnim = {
[1] = 	{dict= "mech_loco_f@generic@reaction@handsup@unarmed@normal", anim = "loop"},
[2] = 	{dict= "mech_loco_f@generic@reaction@handsup@unarmed@tough", anim = "loop"},
[3] = 	{dict= "mech_loco_m@generic@reaction@handsup@unarmed@normal", anim = "loop"},
[4] = 	{dict= "mech_loco_m@generic@reaction@handsup@unarmed@tough", anim = "loop"},
[5] = 	{dict= "script_common@other@unapproved", anim = "guard_handsup_loop"},
[6] = 	{dict= "script_proc@robberies@shop@strgen", anim ="handsup_register"},
}

Config.AnimDict = "mech_inventory@crafting@fallbacks@modify_bullets"
Config.CraftAnim = {
    "loop",
}

Config.ClothesMenu = {
    -- [1] = {label ="Echarpes", value ="echarpes", desc="echarpes"},
    [2] = {label ="Bandana", value ="dust:bandana", desc="bandana"},
    [3] = {label ="Manches", value ="dust:sleeves", desc="chemises"},
    -- [5] = {label ="Gilets", value ="gilets", desc="gilets"},
    [6] = {label ="Manteau", value ="dust:coats", desc="manteaux"},
    -- [7] = {label ="Ponchos", value ="ponchos", desc="ponchos"},
    -- [8] = {label ="Gants", value ="gants", desc="gants"},
    -- [9] = {label ="Holsters", value ="holsters", desc="holsters"},
    -- [10] = {label ="Ceinture", value ="ceinture", desc="ceinture"},

    [11] = {label ="Pantalons", value ="dust:pants", desc="pantalons"},
    -- [12] = {label ="Holsters", value ="holsters", desc="holsters"},
    -- [13] = {label ="Ceinture", value ="ceinture", desc="ceinture"},

    [14] = {label ="Bottes", value ="dust:boots", desc="bottes"},
    -- [15] = {label ="Accessoires", value ="accessoires", desc="accessoires"},
}

Config.CraftingsReceipe = {
    ['bow'] = {
        Itemtocraft = 2,
        label = "Arc",
        desc = "1 Petit Bois + 1 Fil",
        ItemReceipe1Name = 'petitbois',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'fil',
        ItemReceipe2Amount = 1,
        ItemToGive = 'WEAPON_BOW',
        Amount = 1,
        WorkingTime = 5,
    },
    ['arrow'] = {
        Itemtocraft = 2,
        label = "10 Flèches",
        desc = "1 Petit Bois + 1 silex",
        ItemReceipe1Name = 'petitbois',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'silex',
        ItemReceipe2Amount = 1,
        ItemToGive = 'ammo_arrow',
        Amount = 10,
        WorkingTime = 5,
    },
    ['spit'] = {
        Itemtocraft = 2,
        label = "Feu de camp",
        desc = "3 Petits Bois + 3 Silex",
        ItemReceipe1Name = 'petitbois',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'silex',
        ItemReceipe2Amount = 3,
        ItemToGive = 'spit',
        Amount = 1,
        WorkingTime = 5,
    },

    --- peche

    ['WEAPON_FISHINGROD'] = {
        Itemtocraft = 2,
        label = "Canne à pêche",
        desc = "3 Petits Bois + 3 Fils",
        ItemReceipe1Name = 'petitbois',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'fil',
        ItemReceipe2Amount = 3,
        ItemToGive = 'WEAPON_FISHINGROD',
        Amount = 1,
        WorkingTime = 5,
    },

    ['p_baitBread01x'] = {
        Itemtocraft = 1,
        label = "Bout de pain",
        desc = "1 Pain",
        ItemReceipe1Name = 'bread',
        ItemReceipe1Amount = 1,
        ItemToGive = 'p_baitBread01x',
        Amount = 5,
        WorkingTime = 5,
    },
    
    ['p_baitCorn01x'] = {
        Itemtocraft = 1,
        label = "Bout de Maïs",
        desc = "1 Maïs",
        ItemReceipe1Name = 'Corn',
        ItemReceipe1Amount = 1,
        ItemToGive = 'p_baitBread01x',
        Amount = 3,
        WorkingTime = 5,
    },
}

Config.WorkingTime = 5000
Config.BlipSprite = -2039778370

Config.PetitBois = {
    [1] = vector3(1378.687, -987.7832, 50.89909), --- Rhodes 
    [2] = vector3(1876.99, -63.12452, 54.71591), --- emerald
    [3] = vector3(-1918.058, -1195.498, 79.22073), --- bw
    [4] = vector3(-1372.065, 552.1296, 106.9494), --- straw

}

Config.Silex = {
    [1] = vector3(717.4515, -763.868, 45.52427), --- rhodes
    [2] = vector3(1281.436, 858.6588, 102.7366), --- emerald
    [3] = vector3(-1384.463, -756.5168, 93.43803), --- bw
    [4] = vector3(-1570.97, 789.9352, 140.7988), --- straw
}

Config.Fil = {
    [1] = vector3(-758.3597, -1241.219, 46.1843), --- bw
    [2] = vector3(1404.149, -1303.683, 77.80862), --- Rhodes
}

Config.Bois = {
    [1] = vector3(-1833.874, -1786.273, 106.6543), --- bla
    [2] = vector3(1198.268, -125.9232, 100.224), --- emerald

}

Config.Vers = {
    [1] = vector3(-1252.472, -1951.456, 41.87669), --- bla
    [2] = vector3(2170.909, -568.7137, 40.86307), --- lagras

}

Config.SellDict = "script_common@mth_generic_enters@give_item_satchel@rhand@generic@in_place"
Config.SellAnim = "enter_rf"


Config.SellTime = 10000

Config.Cooldown = 60000

Config.Price = {
    [GetHashKey("Blackwater")] = {
        ["moonshine"] = {label="Moonshine", price = 1},
        ["moonshinemexicaine"] = {label="Moonshine Mexicaine", price = 3},
        ["moonshinebayou"] = {label="Moonshine du Bayou", price = 2.3},
        ["moonshinecueilleur"] = {label="Moonshine du Cueilleur", price = 2.2},
        ["moonshineforet"] = {label="Moonshine de la Forêt", price = 2.4},
        ["moonshinefongique"] = {label="Moonshine Fongique", price = 1.6},
        ["moonshinecitadin"] = {label="Moonshine du Citadin", price = 2.6},
        ["moonshinepeignecul"] = {label="Moonshine du Peigne cul", price = 1.6},
        ["laitpavot"] = {label="Lait de Pavot", price = 1.4},
        ["pipeopium"] = {label="Pipe d'opium", price = 1},
        ["cigaretteopium"] = {label="Cigarette d'opium", price = 1.2},
        ["cigarettechanvre"] = {label="Cigarette d'opium", price = 1.2},
        ["pavot"] = {label="Pavot", price = 0.4},
        ["morphine"] = {label="Morphine", price = 2.8},
        ["heroine"] = {label="Héroïne", price = 3.9},
        ["laudanum"] = {label= "Laudanum", price= 2.4},
        ["cuir"] = {label="Cuir", price = 0.08},
        ["pepiteor"] = {label="Pépite d'or", price = 0.08},
        ["corne"] = {label="Corne", price = 0.08},
        ["graisse"] = {label="Morceau de gras", price = 0.09},
        ["petitefourrure"] = {label="Petite fourrure", price = 0.08},
        ["peauecailles"] = {label="Peau à écailles", price = 0.08},
        ["plume"] = {label="Plume", price = 0.08},
        ["petitefourure"] = {label="Petite fourrure", price = 0.08},
        ["griffe"] = {label="Griffe", price = 0.08},
        ["bec"] = {label="Bec", price = 0.12},
        ["pincecrabe"] = {label="Pince de crabe", price = 0.10},
        ["serre"] = {label="Serre", price = 0.10},
        ["boiscerf"] = {label="Bois de cerf", price = 0.10},
        ["queuerenard"] = {label="Queue de renard", price = 0.25},
        ["peauvisqueuse"] = {label="Peau visqueuse", price = 0.08},
        ["dentrongeur"] = {label="Dent de rongeur", price = 0.08},
        ["defense"] = {label="Défense", price = 0.08},
        ["queuedecastor"] = {label="Queue de castor", price = 0.35},
        ["patteours"] = {label="Patte d'ours", price = 0.8},
        ["crocdecroco"] = {label="Dent de crocodile", price = 0.15},
        ["carapace"] = {label="Carapace", price = 0.10},
        ["peauserpent"] = {label="Peau de serpent", price = 0.15},
        ["croc"] = {label="Croc de loup", price = 0.1},
        ["concoctionendurance"] = {label="Essence de térébenthine", price = 1},
        ["concoctionanesthesiante"] = {label="Emulsion Anesthésiante", price = 1},
        ["concoctioncoagulation"] = {label="Solution Coagulante", price = 1},
        ["semencedetoreau"] = {label="Semence bovine", price = 0.3},
        ["patate"] = {label="Patate", price = 0.12},
        ["Corn"] = {label="Maïs", price = 0.12},
        ["filetpoisson"] = {label="Filet de poisson", price = 0.08},
        ["dirty_whiskey"] = {label="Mauvais Whisky", price = 0.14},
        ["good_whisky"] = {label="Whisky", price = 0.32},
        ["epismaisgrille"] = {label="Epis de maïs grillé", price = 0.40},
        ["soupe"] = {label="Ragoût de viande", price = 0.35},
        ["ragoutviande"] = {label="Ragoût de viande", price = 0.40},
        ["ragoutpoisson"] = {label="Ragoût de poisson", price = 0.40},
        ["bouteillelait"] = {label="Epis de maïs grillé", price = 0.25},
        ["tourteviande"] = {label="Tourte à la viande", price = 0.6},
        ["tourtepoisson"] = {label="Tourte au poisson", price = 0.6},
        ["soupechampignon"] = {label="Soupe aux Champignons", price = 0.5},
        ["caisseviande"] = {label= "Caisse de viande", price= 0.8},
        ["caissepoisson"] = {label= "Caisse de poisson", price= 0.8},     
    },
    [GetHashKey("StDenis")] = {
        ["moonshine"] = {label="Moonshine", price = 1},
        ["moonshinemexicaine"] = {label="Moonshine Mexicaine", price = 3},
        ["moonshinebayou"] = {label="Moonshine du Bayou", price = 2.3},
        ["moonshinecueilleur"] = {label="Moonshine du Cueilleur", price = 2.2},
        ["moonshineforet"] = {label="Moonshine de la Forêt", price = 2.4},
        ["moonshinefongique"] = {label="Moonshine Fongique", price = 1.6},
        ["moonshinecitadin"] = {label="Moonshine du Citadin", price = 2.6},
        ["moonshinepeignecul"] = {label="Moonshine du Peigne cul", price = 1.6},
        ["laitpavot"] = {label="Lait de Pavot", price = 1.4},
        ["pipeopium"] = {label="Pipe d'opium", price = 1},
        ["cigaretteopium"] = {label="Cigarette d'opium", price = 1.2},
        ["cigarettechanvre"] = {label="Cigarette d'opium", price = 1.2},
        ["pavot"] = {label="Pavot", price = 0.4},
        ["morphine"] = {label="Morphine", price = 2.8},
        ["heroine"] = {label="Héroïne", price = 3.9},
        ["laudanum"] = {label= "Laudanum", price= 2.4},
        ["cuir"] = {label="Cuir", price = 0.08},
        ["pepiteor"] = {label="Pépite d'or", price = 0.08},
        ["corne"] = {label="Corne", price = 0.08},
        ["graisse"] = {label="Morceau de gras", price = 0.09},
        ["petitefourrure"] = {label="Petite fourrure", price = 0.08},
        ["peauecailles"] = {label="Peau à écailles", price = 0.08},
        ["plume"] = {label="Plume", price = 0.08},
        ["petitefourure"] = {label="Petite fourrure", price = 0.08},
        ["griffe"] = {label="Griffe", price = 0.08},
        ["bec"] = {label="Bec", price = 0.12},
        ["pincecrabe"] = {label="Pince de crabe", price = 0.10},
        ["serre"] = {label="Serre", price = 0.10},
        ["boiscerf"] = {label="Bois de cerf", price = 0.10},
        ["queuerenard"] = {label="Queue de renard", price = 0.25},
        ["peauvisqueuse"] = {label="Peau visqueuse", price = 0.08},
        ["dentrongeur"] = {label="Dent de rongeur", price = 0.08},
        ["defense"] = {label="Défense", price = 0.08},
        ["queuedecastor"] = {label="Queue de castor", price = 0.35},
        ["patteours"] = {label="Patte d'ours", price = 0.8},
        ["crocdecroco"] = {label="Dent de crocodile", price = 0.15},
        ["carapace"] = {label="Carapace", price = 0.10},
        ["peauserpent"] = {label="Peau de serpent", price = 0.15},
        ["croc"] = {label="Croc de loup", price = 0.1},
        ["concoctionendurance"] = {label="Essence de térébenthine", price = 1},
        ["concoctionanesthesiante"] = {label="Emulsion Anesthésiante", price = 1},
        ["concoctioncoagulation"] = {label="Solution Coagulante", price = 1},
        ["semencedetoreau"] = {label="Semence bovine", price = 0.3},
        ["patate"] = {label="Patate", price = 0.12},
        ["Corn"] = {label="Maïs", price = 0.12},
        ["filetpoisson"] = {label="Filet de poisson", price = 0.08},
        ["dirty_whiskey"] = {label="Mauvais Whisky", price = 0.14},
        ["good_whisky"] = {label="Whisky", price = 0.32},
        ["epismaisgrille"] = {label="Epis de maïs grillé", price = 0.40},
        ["soupe"] = {label="Ragoût de viande", price = 0.35},
        ["ragoutviande"] = {label="Ragoût de viande", price = 0.40},
        ["ragoutpoisson"] = {label="Ragoût de poisson", price = 0.40},
        ["bouteillelait"] = {label="Epis de maïs grillé", price = 0.25},
        ["tourteviande"] = {label="Tourte à la viande", price = 0.6},
        ["tourtepoisson"] = {label="Tourte au poisson", price = 0.6},
        ["soupechampignon"] = {label="Soupe aux Champignons", price = 0.5},
        ["caisseviande"] = {label= "Caisse de viande", price= 0.8},
        ["caissepoisson"] = {label= "Caisse de poisson", price= 0.8},     
    },
}

