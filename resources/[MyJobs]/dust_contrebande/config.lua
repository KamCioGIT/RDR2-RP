Config = {}


Config.WorkingTime = 3000

Config.DistanceToInteract = 1.5

Config.AtelierMoonshine = {
    vector3(3311.525, 12.06422, 54.69889),
}

Config.AlambicMoonshine = {
    [1] = {input = vector3(2949.503, 542.4907, 48.48363), output = vector3(2946.402, 542.6058, 48.44593), name = "test"},
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
    ItemReceipe1Amount = 3,
    ItemReceipe2Name = 'graisse',
    ItemReceipe2Amount = 1,
    ItemToGive = 'mout',
    Amount = 1,
    WorkingTime = 5,
    label = 'Moût',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}}
},
['moutmais'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'Corn',
    ItemReceipe1Amount = 3,
    ItemReceipe2Name = 'graisse',
    ItemReceipe2Amount = 1,
    ItemToGive = 'mout',
    Amount = 1,
    WorkingTime = 5,
    label = 'Moût',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/corn.png', text = "Maïs",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}}
},
['moutorge'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'orge',
    ItemReceipe1Amount = 5,
    ItemReceipe2Name = 'graisse',
    ItemReceipe2Amount = 1,
    ItemToGive = 'mout',
    Amount = 1,
    WorkingTime = 5,
    label = 'Moût',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/wheatseed.png', text = "Orge",count = "x5"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}}
},
['aromebayou'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'carapace',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'crocdecroco',
    ItemReceipe2Amount = 1,
    ItemToGive = 'aromebayou',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Bayou',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_trinket_turtle_shell.png', text = "Carapace",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_tooth.png', text = "Dent de crocodile",count = "x1"}}
},
['arometrappeur'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'queuedecastor',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'patteours',
    ItemReceipe2Amount = 1,
    ItemToGive = 'arometrappeur',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Trappeur',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_beaver_tail.png', text = "Queue de castor",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_lions_paw.png', text = "Patte d'ours",count = "x1"}}
},
['aromecueilleur'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'myrtille',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'menthesauvage',
    ItemReceipe2Amount = 1,
    ItemToGive = 'aromecueilleur',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Cueilleur',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_red_raspberry.png', text = "Myrtille",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_mint.png', text = "Menthe Sauvage",count = "x1"}}
},
['aromeforet'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'baiedegaultherie',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'ginseng',
    ItemReceipe2Amount = 1,
    ItemToGive = 'aromeforet',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme de la Forêt',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_wintergreen_berry.png', text = "Baie de Gaultherie",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_american_ginseng.png', text = "Ginseng",count = "x1"}}
},
['aromefongique'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'coulemelle',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'boletbai',
    ItemReceipe2Amount = 1,
    ItemToGive = 'aromefongique',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme Fongique',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_parasol_mushroom.png', text = "Coulemelle",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_bay_bolete.png', text = "Bolet-Baï",count = "x1"}}
},
['aromecitadin'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'dentrongeur',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'bec',
    ItemReceipe2Amount = 1,
    ItemToGive = 'aromecitadin',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Citadin',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_arrowhead_chipped.png', text = "Dent de rongeur",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_beak.png', text = "Bec",count = "x1"}}
},
['aromepeignecul'] = {
    type = 'moonshine',
    Itemtocraft = 1,
    ItemReceipe1Name = 'camomillesauvage',
    ItemReceipe1Amount = 5,
    ItemToGive = 'aromepeignecul',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme du Peigne-cul',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_feverfew.png', text = "Camomille sauvage",count = "x5"}}
},
['aromemexicain'] = {
    type = 'moonshine',
    Itemtocraft = 2,
    ItemReceipe1Name = 'glandevenin',
    ItemReceipe1Amount = 1,
    ItemReceipe2Name = 'peauserpent',
    ItemReceipe2Amount = 1,
    ItemToGive = 'aromemexicain',
    Amount = 1,
    WorkingTime = 5,
    label = 'Arôme mexicain',
    descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_panther_eye.png', text = "Glande à venin",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_snake_skin.png', text = "Peau de serpent",count = "x1"}}
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