Config = {}

Config.Jobs = {
    [1] = "forge",
}

Config.WorkingTime = 5000
Config.DistanceToInteract = 1.5

Config.Atelier = vector3(-866.9702, -1286.437, 43.10227) -- Creer toutes les balles
Config.Enclume = vector3(-870.0458, -1285.856, 43.10125)
Config.Forge = vector3(-866.8604, -1291.914, 43.10212)
Config.AnimDict = "amb_work@world_human_hammer@table@male_a@trans"
Config.CraftAnim = {
    "base_trans_base",
}


Config.CraftingsReceipe = {
    ['lingotfer'] = {
        type = 'forgeforge',
        Itemtocraft = 1,
        ItemReceipe1Name = 'ferpepite',
        ItemReceipe1Amount = 10,
        ItemToGive = 'lingotfer',
        Amount = 1,
        WorkingTime = 10,
        label = 'Lingot de fer',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/cannabis.png', text = "Pépite de fer",count = "x1"}}
    },
    ['lingotor'] = {
        type = 'forgeforge',
        Itemtocraft = 1,
        ItemReceipe1Name = 'pepiteor',
        ItemReceipe1Amount = 400,
        ItemToGive = 'lingotor',
        Amount = 1,
        WorkingTime = 30,
        label = "Lingot d'or",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/goldnugget.png', text = "Petite pépite d'or",count = "x1"}}
    },
    ['smallvault'] = {
        type = 'forgeetabli',
        Itemtocraft = 3,
        ItemReceipe1Name = 'lingotfer',
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'plombpepite',
        ItemReceipe2Amount = 30,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 10,
        ItemToGive = 'smallvault',
        Amount = 1,
        WorkingTime = 30,
        label = "Petit Coffre Fort",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_goldbar_small.png', text = "Lingot de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/silverore.png', text = "Pépite de plomb",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['mediumvault'] = {
        type = 'forgeetabli',
        Itemtocraft = 3,
        ItemReceipe1Name = 'lingotfer',
        ItemReceipe1Amount = 20,
        ItemReceipe2Name = 'plombpepite',
        ItemReceipe2Amount = 60,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 20,
        ItemToGive = 'mediumvault',
        Amount = 1,
        WorkingTime = 45,
        label = "Coffre Fort",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_goldbar_small.png', text = "Lingot de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/silverore.png', text = "Pépite de plomb",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['largevault'] = {
        type = 'forgeetabli',
        Itemtocraft = 3,
        ItemReceipe1Name = 'lingotfer',
        ItemReceipe1Amount = 40,
        ItemReceipe2Name = 'plombpepite',
        ItemReceipe2Amount = 100,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 30,
        ItemToGive = 'largevault',
        Amount = 1,
        WorkingTime = 60,
        label = "Grand Coffre Fort",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_goldbar_small.png', text = "Lingot de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/silverore.png', text = "Pépite de plomb",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['WEAPON_MELEE_HAMMER'] = {
        type = 'forgeenclume',
        Itemtocraft = 3,
        ItemReceipe1Name = 'lingotfer',
        ItemReceipe1Amount = 2,
        ItemReceipe2Name = 'cuir',
        ItemReceipe2Amount = 5,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 3,
        ItemToGive = 'WEAPON_MELEE_HAMMER',
        Amount = 1,
        WorkingTime = 30,
        label = "Marteau",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_goldbar_small.png', text = "Lingot de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_armadillo_skin.png', text = "Cuir",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['WEAPON_MELEE_HATCHET'] = {
        type = 'forgeenclume',
        Itemtocraft = 3,
        ItemReceipe1Name = 'lingotfer',
        ItemReceipe1Amount = 2,
        ItemReceipe2Name = 'cuir',
        ItemReceipe2Amount = 5,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 3,
        ItemToGive = 'WEAPON_MELEE_HATCHET',
        Amount = 1,
        WorkingTime = 30,
        label = "Hache",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_goldbar_small.png', text = "Lingot de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_armadillo_skin.png', text = "Cuir",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['WEAPON_MELEE_KNIFE'] = {
        type = 'forgeenclume',
        Itemtocraft = 3,
        ItemReceipe1Name = 'lingotfer',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'cuir',
        ItemReceipe2Amount = 2,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 3,
        ItemToGive = 'WEAPON_MELEE_KNIFE',
        Amount = 1,
        WorkingTime = 10,
        label = "Couteau de chasse",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_goldbar_small.png', text = "Lingot de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_armadillo_skin.png', text = "Cuir",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['WEAPON_MELEE_CLEAVER'] = {
        type = 'forgeenclume',
        Itemtocraft = 3,
        ItemReceipe1Name = 'lingotfer',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'cuir',
        ItemReceipe2Amount = 5,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 5,
        ItemToGive = 'WEAPON_MELEE_CLEAVER',
        Amount = 1,
        WorkingTime = 20,
        label = "Hachoir",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_goldbar_small.png', text = "Lingot de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_armadillo_skin.png', text = "Cuir",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['WEAPON_MELEE_MACHETE'] = {
        type = 'forgeenclume',
        Itemtocraft = 3,
        ItemReceipe1Name = 'lingotfer',
        ItemReceipe1Amount = 5,
        ItemReceipe2Name = 'cuir',
        ItemReceipe2Amount = 10,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 10,
        ItemToGive = 'WEAPON_MELEE_MACHETE',
        Amount = 1,
        WorkingTime = 30,
        label = "Machette",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_goldbar_small.png', text = "Lingot de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_armadillo_skin.png', text = "Cuir",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['goldramp'] = {
        type = 'forgeetabli',
        Itemtocraft = 4,
        ItemReceipe1Name = 'lingotfer',
        ItemReceipe1Amount = 2,
        ItemReceipe2Name = 'cuir',
        ItemReceipe2Amount = 5,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 5,
        ItemReceipe4Name = 'petitbois',
        ItemReceipe4Amount = 5,
        ItemToGive = 'goldramp',
        Amount = 1,
        WorkingTime = 20,
        label = "Rampe de lavage",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_goldbar_small.png', text = "Lingot de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_armadillo_skin.png', text = "Cuir",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de Gras",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/stick.png', text = "Petit Bois",count = "x1"}}
    },
    ['batée'] = {
        type = 'forgeenclume',
        Itemtocraft = 2,
        ItemReceipe1Name = 'ferpepite',
        ItemReceipe1Amount = 5,
        ItemReceipe2Name = 'charbon',
        ItemReceipe2Amount = 1,
        ItemToGive = 'batée',
        Amount = 1,
        WorkingTime = 10,
        label = "Bâtée",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/cannabis.png', text = "Pépite de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['Watering_Can'] = {
        type = 'forgeenclume',
        Itemtocraft = 2,
        ItemReceipe1Name = 'ferpepite',
        ItemReceipe1Amount = 5,
        ItemReceipe2Name = 'charbon',
        ItemReceipe2Amount = 1,
        ItemToGive = 'Watering_Can',
        Amount = 1,
        WorkingTime = 10,
        label = "Sceau",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/cannabis.png', text = "Pépite de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['Teapot_Can'] = {
        type = 'forgeenclume',
        Itemtocraft = 2,
        ItemReceipe1Name = 'ferpepite',
        ItemReceipe1Amount = 5,
        ItemReceipe2Name = 'charbon',
        ItemReceipe2Amount = 1,
        ItemToGive = 'Teapot_Can',
        Amount = 1,
        WorkingTime = 10,
        label = "Arrosoir",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/cannabis.png', text = "Pépite de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['gourde'] = {
        type = 'forgeetabli',
        Itemtocraft = 2,
        ItemReceipe1Name = 'ferpepite',
        ItemReceipe1Amount = 2,
        ItemReceipe2Name = 'cuir',
        ItemReceipe2Amount = 1,
        ItemToGive = 'gourde',
        Amount = 1,
        WorkingTime = 10,
        label = "Gourde",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/cannabis.png', text = "Pépite de fer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_armadillo_skin.png', text = "Cuir",count = "x1"}}
    },
    
    
    
    
    
    
}