Config = {}

Config.Jobs = {
    [1] = "distillerie",
}

Config.WorkingTime = 5000
Config.DistanceToInteract = 2.0

Config.Atelier = vector3(1461.654, -1591.384, 70.90051) -- Creer toutes les balles
Config.Dep = vector3(1471.082, -1582.883, 71.18633)
Config.Ret = vector3(1466.216, -1581.007, 70.91117)
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
        ItemReceipe1Amount = 5,
        ItemToGive = 'moutwhisky',
        Amount = 1,
        WorkingTime = 1,
        label = "Moût",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/wheatseed.png', text = "Orge",count = "x5"}}
    },
    ['moutwhiskybon'] = {
        type = 'distillerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'orge',
        ItemReceipe1Amount = 10,
        ItemToGive = 'moutwhisky',
        Amount = 1,
        WorkingTime = 1,
        label = "Moût gustatif",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/wheatseed.png', text = "Orge",count = "x10"}}
    },
}