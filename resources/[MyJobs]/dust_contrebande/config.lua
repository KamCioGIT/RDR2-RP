Config = {}


Config.WorkingTime = 3000

Config.DistanceToInteract = 1.1

Config.AtelierMoonshine = {
    vector3(-628.4146, -68.25435, 81.90664), --- king
    vector3(196.1077, 987.0225, 189.2271), -- guilde
    vector3(2369.202, -859.8773, 42.02306), -- lachance
}

Config.AlambicMoonshine = {
    [1] = {input = vector3(-632.175, -72.09554, 81.85616), output = vector3(-630.7334, -70.84539, 81.85616), name = "king"},
    [2] = {input = vector3(197.9031, 984.4139, 189.2446), output = vector3(196.5248, 984.0315, 189.2431), name = "guilde"}, --- guilde
    [3] = {input = vector3(2369.991, -859.4161, 42.0398), output = vector3(2372.015, -860.1348, 42.0222), name = "lachance"}, --- lachance
}

Config.AtelierOpium = {
    vector3(-1055.804, -2505.994, 74.5), --- test
    vector3(-1676.222, -340.8342, 169.7878) ---- warder

}


Config.AnimDict = "amb_work@world_human_hammer@table@male_a@trans"
Config.CraftAnim = "base_trans_base"




Config.CraftingsReceipe = {
    
['moutpatate'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'patate',
    ItemReceipe1Amount = 2,
    ItemReceipe2Name = 'graisse',
    ItemReceipe2Amount = 1,
    ItemToGive = 'mout',
    Amount = 1,
    WorkingTime = 5,
    label = 'Moût',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x2"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}}
},
['moutmais'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'Corn',
    ItemReceipe1Amount = 2,
    ItemReceipe2Name = 'graisse',
    ItemReceipe2Amount = 1,
    ItemToGive = 'mout',
    Amount = 1,
    WorkingTime = 5,
    label = 'Moût',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/corn.png', text = "Maïs",count = "x2"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}}
},
['moutorge'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'mixturedistillerie',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'graisse',
    ItemReceipe2Amount = 1,
    ItemToGive = 'mout',
    Amount = 1,
    WorkingTime = 5,
    label = 'Moût',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/Mixture à base de céréales.png', text = "Mixture à base de céréales",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}}
},
['aromebayou'] = {
    type = 'moonshine',
    Itemtocraft = 3,
    ItemReceipe1Name = 'carapace',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'crocdecroco',
    ItemReceipe2Amount = 2,
    ItemReceipe3Name = 'mout',
    ItemReceipe3Amount = 1,
    ItemToGive = 'aromebayou',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Bayou',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_trinket_turtle_shell.png', text = "Carapace",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_tooth.png', text = "Dent de crocodile",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/moonshine_base.png', text = "Moût",count = "x1"}}
},
['arometrappeur'] = {
    type = 'moonshine',
    Itemtocraft = 3,
    ItemReceipe1Name = 'queuedecastor',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'patteours',
    ItemReceipe2Amount = 1,
    ItemReceipe3Name = 'mout',
    ItemReceipe3Amount = 1,
    ItemToGive = 'arometrappeur',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Trappeur',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_beaver_tail.png', text = "Queue de castor",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_lions_paw.png', text = "Patte d'ours",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/moonshine_base.png', text = "Moût",count = "x1"}}
},
['aromecueilleur'] = {
    type = 'moonshine',
    Itemtocraft = 3,
    ItemReceipe1Name = 'myrtille',
    ItemReceipe1Amount = 3,
    ItemReceipe2Name = 'menthesauvage',
    ItemReceipe2Amount = 3,
    ItemReceipe3Name = 'mout',
    ItemReceipe3Amount = 1,
    ItemToGive = 'aromecueilleur',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Cueilleur',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_red_raspberry.png', text = "Myrtille",count = "x2"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_mint.png', text = "Menthe Sauvage",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/moonshine_base.png', text = "Moût",count = "x1"}}
},
['aromeforet'] = {
    type = 'moonshine',
    Itemtocraft = 3,
    ItemReceipe1Name = 'baiedegaultherie',
    ItemReceipe1Amount = 2,
    ItemReceipe2Name = 'ginseng',
    ItemReceipe2Amount = 2,
    ItemReceipe3Name = 'mout',
    ItemReceipe3Amount = 1,
    ItemToGive = 'aromeforet',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme de la Forêt',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_wintergreen_berry.png', text = "Baie de Gaultherie",count = "x2"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_american_ginseng.png', text = "Ginseng",count = "x2"}, {src = 'nui://redemrp_inventory/html/items/moonshine_base.png', text = "Moût",count = "x1"}}
},
['aromefongique'] = {
    type = 'moonshine',
    Itemtocraft = 3,
    ItemReceipe1Name = 'coulemelle',
    ItemReceipe1Amount = 3,
    ItemReceipe2Name = 'boletbai',
    ItemReceipe2Amount = 3,
    ItemReceipe3Name = 'mout',
    ItemReceipe3Amount = 1,
    ItemToGive = 'aromefongique',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme Fongique',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_parasol_mushroom.png', text = "Coulemelle",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_bay_bolete.png', text = "Bolet-Baï",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/moonshine_base.png', text = "Moût",count = "x1"}}
},
['aromecitadin'] = {
    type = 'moonshine',
    Itemtocraft = 3,
    ItemReceipe1Name = 'dentrongeur',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'bec',
    ItemReceipe2Amount = 1,
    ItemReceipe3Name = 'mout',
    ItemReceipe3Amount = 1,
    ItemToGive = 'aromecitadin',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Citadin',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_arrowhead_chipped.png', text = "Dent de rongeur",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_beak.png', text = "Bec",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/moonshine_base.png', text = "Moût",count = "x1"}}
},
['aromepeignecul'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'camomillesauvage',
    ItemReceipe1Amount = 5,
    ItemReceipe2Name = 'mout',
    ItemReceipe2Amount = 1,
    ItemToGive = 'aromepeignecul',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Peigne-cul',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_feverfew.png', text = "Camomille sauvage",count = "x5"}, {src = 'nui://redemrp_inventory/html/items/moonshine_base.png', text = "Moût",count = "x1"}}
},
['aromemexicain'] = {
    type = 'moonshine',
    Itemtocraft = 3,
    ItemReceipe1Name = 'glandevenin',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'peauserpent',
    ItemReceipe2Amount = 1,
    ItemReceipe3Name = 'mout',
    ItemReceipe3Amount = 1,
    ItemToGive = 'aromemexicain',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme mexicain',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_panther_eye.png', text = "Glande à venin",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_snake_skin.png', text = "Peau de serpent",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/moonshine_base.png', text = "Moût",count = "x1"}}
},
['morphine'] = {
    type = 'opium',
    Itemtocraft = 2,
    ItemReceipe1Name = 'resinepavot',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'chaux',
    ItemReceipe2Amount = 1,
    ItemToGive = 'morphine',
    Amount = 1,
    WorkingTime = 5,
    label = 'Morphine',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/opium_smokable.png', text = "Résine de pavot",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/ore_coal.png', text = "Chaux",count = "x1"}}
},
['chaux'] = {
    type = 'opium',
    Itemtocraft = 3,
    ItemReceipe1Name = 'boiscerf',
    ItemReceipe1Amount = 2,
    ItemReceipe2Name = 'souffre',
    ItemReceipe2Amount = 1,
    ItemReceipe3Name = 'charbon',
    ItemReceipe3Amount = 1,
    ItemToGive = 'chaux',
    Amount = 1,
    WorkingTime = 5,
    label = 'Chaux',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_buck_antlers.png', text = "Bois de cerf",count = "x2"}, {src = 'nui://redemrp_inventory/html/items/collector_fossil_stone.png', text = "Souffre",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
},
['chauxdeux'] = {
    type = 'opium',
    Itemtocraft = 3,
    ItemReceipe1Name = 'corne',
    ItemReceipe1Amount = 2,
    ItemReceipe2Name = 'souffre',
    ItemReceipe2Amount = 1,
    ItemReceipe3Name = 'charbon',
    ItemReceipe3Amount = 1,
    ItemToGive = 'chaux',
    Amount = 1,
    WorkingTime = 5,
    label = 'Chaux',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/generic_animal_horn.png', text = "Corne",count = "x2"}, {src = 'nui://redemrp_inventory/html/items/collector_fossil_stone.png', text = "Souffre",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
},
['chauxtrois'] = {
    type = 'opium',
    Itemtocraft = 3,
    ItemReceipe1Name = 'croc',
    ItemReceipe1Amount = 4,
    ItemReceipe2Name = 'souffre',
    ItemReceipe2Amount = 1,
    ItemReceipe3Name = 'charbon',
    ItemReceipe3Amount = 1,
    ItemToGive = 'chaux',
    Amount = 1,
    WorkingTime = 5,
    label = 'Chaux',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_cougar_fang.png', text = "Croc de loup",count = "x4"}, {src = 'nui://redemrp_inventory/html/items/collector_fossil_stone.png', text = "Souffre",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
},
['chauxquatre'] = {
    type = 'opium',
    Itemtocraft = 3,
    ItemReceipe1Name = 'griffe',
    ItemReceipe1Amount = 3,
    ItemReceipe2Name = 'souffre',
    ItemReceipe2Amount = 1,
    ItemReceipe3Name = 'charbon',
    ItemReceipe3Amount = 1,
    ItemToGive = 'chaux',
    Amount = 1,
    WorkingTime = 5,
    label = 'Chaux',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_bobcat_claws.png', text = "Griffe",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/collector_fossil_stone.png', text = "Souffre",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
},
['chauxcinq'] = {
    type = 'opium',
    Itemtocraft = 3,
    ItemReceipe1Name = 'bec',
    ItemReceipe1Amount = 5,
    ItemReceipe2Name = 'souffre',
    ItemReceipe2Amount = 1,
    ItemReceipe3Name = 'charbon',
    ItemReceipe3Amount = 1,
    ItemToGive = 'chaux',
    Amount = 1,
    WorkingTime = 5,
    label = 'Chaux',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/generic_animal_beak.png', text = "Bec",count = "x5"}, {src = 'nui://redemrp_inventory/html/items/collector_fossil_stone.png', text = "Souffre",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
},
['antibiotic'] = {
    type = 'opium',
    Itemtocraft = 4,
    ItemReceipe1Name = 'camomillesauvage',
    ItemReceipe1Amount = 3,
    ItemReceipe2Name = 'ginseng',
    ItemReceipe2Amount = 3,
    ItemReceipe3Name = 'millefeuille',
    ItemReceipe3Amount = 3,
    ItemReceipe4Name = 'achillevisqueuse',
    ItemReceipe4Amount = 3,
    ItemToGive = 'antibiotic',
    Amount = 1,
    WorkingTime = 5,
    label = 'Remède Goodwin',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_feverfew.png', text = "Camomille sauvage",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_american_ginseng.png', text = "Ginseng",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_yarrow.png', text = "Millefeuille",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_english_mace.png', text = "Achillé Visqueuse",count = "x3"}}
},

}

Config.PavotNPC = {
    ["blackwater"] = {heading = 235.0 , coords = vector3(-2378.053, -1588.341, 153.2766), model = "cs_aberdeenpigfarmer", interact = vector3(-2377.442, -1588.972, 153.2849), stash = "pavot_bla"},
    ["stdenis"] = {heading = 121.0 , coords = vector3(1390.748, -2084.257, 51.5663), model = "a_m_m_sdchinatown_01", interact = vector3(1389.717, -2084.683, 51.5663), stash = "pavot_stdenis"},
    ["newaustin"] = {heading = 126.0 , coords = vector3(-2022.976, -3032.937, -10.64834), model = "mp_u_m_m_dockrecipients_01", interact = vector3(-2023.947, -3033.62, -10.64834), stash = "contrebande_newaustin"},
}

Config.ContrebandePrice = {
    ["grainepavot"] = {label = "Graine de pavot" , price = 0.4},
    ["cigar"] = {label = "Cigare" , price = 0.3},
    ["cigarettes"] = {label = "Cigarettes" , price = 0.1},
    ["sucre"] = {label = "Sucre" , price = 0.05},
    ["ferpepite"] = {label = "Pépite de fer" , price = 0.07},
    ["rhum"] = {label = "Rhum" , price = 0.1},
    ["tequila"] = {label = "Tequila" , price = 0.2},
    ["mezcal"] = {label = "Mezcal" , price = 0.3},
}
