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
    ['caissedeviande'] = {
        type ='herboetabli',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viandehachee',
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'bois',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'sel',
        ItemReceipe4Amount = 3,
        ItemToGive = 'caisseviande',
        Amount = 1,
        WorkingTime = 1,
        label = 'Caisse de viande',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_rc_quartz_chunk.png', text = "Viande hâchée",count = "x10"}, {src = 'nui://redemrp_inventory/html/items/wood.png', text = "Bois",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/saltpeter.png', text = "Sac de sel",count = "x3"}}
    },
}



Config.Blips = true

Config.MsgInteract = "Appuyez sur Entrée"
Config.DistanceToInteract = 2.2


Config.Relais = 
{    
    vector3(1867.686, 584.9928, 112.849),-- emerald
}

