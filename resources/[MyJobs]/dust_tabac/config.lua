Config = {}

Config.Jobs = {
    [1] = "tabac_rhodes",
}

Config.WorkingTime = 5000
Config.DistanceToInteract = 2.0

Config.Atelier = vector3(1132.733, -975.8073, 68.39375) -- Creer toutes les balles
Config.Dep = {vector3(-863.3729, -742.5676, 56.03781)}
Config.Ret = {vector3(-860.5767, -741.85, 56.27768)}
Config.AnimDict = "amb_work@prop_human_seat_chair@mortar_pestle@mortar@female_a@base"
Config.CraftAnim = {
    "base",
}
Config.GatherDict = 'mech_pickup@plant@milkweed'
Config.GatherAnim = 'stn_pick'

Config.PointSprite = 2033377404



Config.CraftingsReceipe = {
    ['tabacrouler'] = {
        type = 'tabac',
        Itemtocraft = 1,
        ItemReceipe1Name = 'tabacsec',
        ItemReceipe1Amount = 1,
        ItemToGive = 'tabacrouler',
        Amount = 1,
        WorkingTime = 1,
        label = "Tabac à rouler",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/szalwia.png', text = "Feuille de tabac sèche",count = "x1"}}
    },
    ['cigar'] = {
        type = 'tabac',
        Itemtocraft = 1,
        ItemReceipe1Name = 'tabacrouler',
        ItemReceipe1Amount = 3,
        ItemToGive = 'cigar',
        Amount = 1,
        WorkingTime = 1,
        label = "Cigare",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/tabacarouler.png', text = "Tabac à rouler",count = "x3"}}
    },
    ['cigarettes'] = {
        type = 'tabac',
        Itemtocraft = 1,
        ItemReceipe1Name = 'tabacrouler',
        ItemReceipe1Amount = 1,
        ItemToGive = 'cigarettes',
        Amount = 1,
        WorkingTime = 1,
        label = "Cigarette",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/tabacarouler.png', text = "Tabac à rouler",count = "x1"}}
    },
    ['tabacchiquer'] = {
        type = 'tabac',
        Itemtocraft = 1,
        ItemReceipe1Name = 'tabacrouler',
        ItemReceipe1Amount = 1,
        ItemToGive = 'tabacchiquer',
        Amount = 1,
        WorkingTime = 1,
        label = "Tabac à chiquer",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/tabacarouler.png', text = "Tabac à rouler",count = "x1"}}
    },
}

Config.RessourcesPoints = 
{
    vector3(1133.782, -956.7652, 67.55076),
    vector3(1129.399, -951.6478, 67.85186),
    vector3(1121.919, -943.8878, 67.77567),
    vector3(1125.394, -939.6705, 67.18135),
    vector3(1132.969, -946.3767, 67.57571),
    vector3(1140.655, -954.4439, 67.34454),
    vector3(1146.171, -952.8619, 67.34118),
    vector3(1141.208, -947.1807, 67.36861),
    vector3(1133.668, -940.3239, 67.16254),
    vector3(1127.883, -933.4817, 66.26767),
    vector3(1131.313, -927.491, 65.93847),
    vector3(1128.692, -927.7968, 65.75703),

}

Config.ImportPoint = {
    [1]= vector3(2669.003, -1522.059, 45.96976), --- st denis
    [2]= vector3(-825.8802, -1241.919, 43.53639), -- bla
}

Config.BuyingPoint = {
    [1]= vector3(1129.005, -973.5934, 67.80357),
}

Config.Import = {
    ["sucre"] = {label= "Sucre", price = 0.05},
}

Config.Sell = {
    ["tabacsec"] = {label= "Tabac Séché", price = 0.08},
}

Config.Buy = {
    ["tabacsec"] = {label= "Tabac Séché", price = 0.08},
}

Config.SellNPC = {
    ["Rhodes"] = {heading = 340.0 , coords = vector3(1125.133, -967.6902, 68.15412), interact = vector3(1125.588, -966.9926, 68.12099)},
}

Config.Blips = {
    {name = "Champs de tabac", sprite = -675651933, x = 1136.0, y = -947.0, z = 68.0, color = 'BLIP_MODIFIER_MP_COLOR_14'},
    {name = "Séchoir à tabac", sprite = -675651933, x = -861.0, y = -743.0, z = 56.0, color = 'BLIP_MODIFIER_MP_COLOR_14'},
}