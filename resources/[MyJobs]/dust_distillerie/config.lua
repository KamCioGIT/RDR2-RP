Config = {}

Config.Jobs = {
    [1] = "distillerie",
}

Config.WorkingTime = 5000
Config.DistanceToInteract = 2.0

Config.Atelier = vector3(1459.212, -1577.677, 71.01608) -- Creer toutes les balles
Config.AtelierFree = vector3(1461.639, -1591.756, 70.81068) -- Creer toutes les balles
Config.Dep = {vector3(1471.082, -1582.883, 71.18633)}
Config.Ret = {vector3(1466.216, -1581.007, 70.91117)}
Config.AnimDict = "amb_work@world_human_hammer@table@male_a@trans"
Config.CraftAnim = {
    "base_trans_base",
}

Config.GatherDict = 'mech_pickup@plant@milkweed'
Config.GatherAnim = 'stn_pick'

Config.PointSprite = 2033377404



Config.CraftingsReceipe = {
    ['moutwhisky'] = {
        type = 'distillerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'orge',
        ItemReceipe1Amount = 4,
        ItemToGive = 'moutwhisky',
        Amount = 1,
        WorkingTime = 1,
        label = "Moût",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/wheatseed.png', text = "Orge",count = "x4"}}
    },
    ['moutwhiskybon'] = {
        type = 'distillerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'orge',
        ItemReceipe1Amount = 8,
        ItemToGive = 'moutwhiskybon',
        Amount = 1,
        WorkingTime = 1,
        label = "Moût gustatif",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/wheatseed.png', text = "Orge",count = "x8"}}
    },
    ['moutgin'] = {
        type = 'distillerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'myrtille',
        ItemReceipe1Amount = 3,
        ItemToGive = 'moutgin',
        Amount = 1,
        WorkingTime = 1,
        label = "Moût de baie",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_red_raspberry.png', text = "Myrtille",count = "x3"}}
    },
    -----

    ['moutwhisky2'] = {
        type = 'distillerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'mixturedistillerie',
        ItemReceipe1Amount = 1,
        ItemToGive = 'moutwhisky',
        Amount = 1,
        WorkingTime = 1,
        label = "Alternatif - Moût",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_oat_cakes.png', text = "Mixture à base de céréales",count = "x1"}}
    },
    ['moutwhiskybon2'] = {
        type = 'distillerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'mixturedistillerie',
        ItemReceipe1Amount = 2,
        ItemToGive = 'moutwhiskybon',
        Amount = 1,
        WorkingTime = 1,
        label = "Alternatif - Moût gustatif",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_oat_cakes.png', text = "Mixture à base de céréales",count = "x2"}}
    },

    ['tonneaumout'] = {
        type = 'distilleriefree',
        Itemtocraft = 2,
        ItemReceipe1Name = 'orge',
        ItemReceipe1Amount = 40,
        ItemReceipe2Name = 'tonneau',
        ItemReceipe2Amount = 1,
        ItemToGive = 'tonneaumout',
        Amount = 1,
        WorkingTime = 1,
        label = "Préparation à base de céréales",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/wheatseed.png', text = "Orge",count = "x40"}, {src = 'nui://redemrp_inventory/html/items/moonshine_barrel.png', text = "Tonneau",count = "x1"}}
    },
    ['tonneau'] = {
        type = 'distilleriefree',
        Itemtocraft = 1,
        ItemReceipe1Name = 'bois',
        ItemReceipe1Amount = 7,
        ItemToGive = 'tonneau',
        Amount = 1,
        WorkingTime = 1,
        label = "Tonneau",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/wood.png', text = "Bois",count = "x7"}}
    },
}

Config.RessourcesPoints = 
{
    vector3(1440.117, -1641.965, 66.24236),
    vector3(1441.83, -1638.788, 66.18483),
    vector3(1443.776, -1635.695, 66.06882),
    vector3(1446.954, -1634.716, 65.88695),
    vector3(1445.336, -1637.616, 65.87473),
    vector3(1443.832, -1639.893, 66.059),
    vector3(1442.414, -1641.954, 66.13309),
    vector3(1443.256, -1644.323, 65.99229),
    vector3(1445.368, -1641.11, 65.96061),
    vector3(1446.381, -1639.675, 65.89868),
    vector3(1448.341, -1636.668, 65.85789),
    vector3(1450.124, -1637.102, 65.75085),
    vector3(1448.166, -1640.264, 65.82561),
    vector3(1446.336, -1643.401, 65.81113),
    vector3(1446.655, -1646.342, 65.77454),
    vector3(1448.501, -1643.311, 65.62744),
    vector3(1450.325, -1640.321, 65.73907),
    vector3(1451.903, -1637.758, 65.81654),
    vector3(1454.179, -1638.295, 65.88095),
    vector3(1452.347, -1641.179, 65.75407),
    vector3(1450.733, -1643.402, 65.68649),
    vector3(1448.825, -1646.258, 65.66165),
}

Config.ImportPoint = {
    [1]= vector3(2669.003, -1522.059, 45.96976), --- st denis
    [2]= vector3(-825.8802, -1241.919, 43.53639), -- bla
}

Config.Import = {
    ["sucre"] = {label= "Sucre", price = 0.05},
}

Config.Sell = {
    ["tonneaumout"] = {label= "Préparation à base de céréales", pricelow = 50, pricehigh = 70}, ---- EN CENTS
}

Config.Buy = {
    ["mixturedistillerie"] = {label= "Mixture à base de céréales", price= 0.07},
}

Config.SellNPC = {
    ["Rhodes"] = {heading = 227.0 , coords = vector3(1457.226, -1585.349, 70.84256), interact = vector3(1457.794, -1585.972, 70.84254)},
}

Config.Blips = {
    {name = "Champs d'orge", sprite = 1391579593, x = 1446.225, y = -1640.192, z = 65.90211, color = 'BLIP_MODIFIER_HOSTILITY_COLOR_2'},
    {name = "Atelier Distillerie", sprite = 1391579593, x = 1461.334, y = -1591.338, z = 70.88576, color = 'BLIP_MODIFIER_HOSTILITY_COLOR_2'},
}

Config.BuyingPoint = { vector3(1459.384, -1583.644, 70.84251)}