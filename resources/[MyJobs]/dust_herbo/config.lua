Config = {}

Config.Jobs = {
    [1] = "herbo_est",
    [2] = "herbo_ouest",
}

Config.WorkingTime = 5000
Config.DistanceToInteract = 2.0

Config.Atelier = {
    vector3(1865.117, 588.5373, 112.9373), --- est
}

Config.AnimDict = "amb_work@prop_human_seat_chair@mortar_pestle@mortar@female_a@base"
Config.CraftAnim = {
    "base",
}


Config.CraftingsReceipe = {
    ['herbesaromatiques'] = {
        type = 'herboetabli',
        Itemtocraft = 3,
        ItemReceipe1Name = 'jonccommun',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'menthesauvage',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'saugeducolibri',
        ItemReceipe3Amount = 1,
        ItemToGive = 'herbesaromatiques',
        Amount = 1,
        WorkingTime = 5,
        label = 'Herbes Aromatiques',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_common_bulrush.png', text = "Jonc Commun",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_mint.png', text = "Menthe Sauvage",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_hummingbird_sage.png', text = "Sauge du Colibri",count = "x1"}}
    },
}



Config.Blips = true

Config.MsgInteract = "Appuyez sur Entrée"
Config.DistanceToInteract = 2.2


Config.Relais = 
{    
    vector3(1867.686, 584.9928, 112.849),-- emerald
}

