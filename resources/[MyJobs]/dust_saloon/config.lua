Config = {}


Config.Jobs = {
    [1] = "saloon_kala",
    [2] = "saloon_faubourg",
    [3] = "saloon_bla",
    [4] = "saloon_rhodes"
    ,
}

Config.WorkingTime = 5000
Config.DistanceToInteract = 2.0

Config.Atelier = {
    [1] = vector3(2940.411, 523.3466, 44.33625),
    [2] = vector3(2795.335, -1168.009, 46.92803),
    [3] = vector3(-825.8636, -1318.234, 42.67582)
}

Config.AnimDict = "script_rc@chnt1@ig@ig2_hosea_cook_eat"
Config.CraftAnim = {
    "coooking_2p_meat_02_arthur",
}


Config.CraftingsReceipe = {
    ['viandepetitmamiferecuite'] = {
        type = 'saloon',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandepetitmamifere',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandepetitmamiferecuite',
        Amount = 1,
        WorkingTime = 5,
        label = 'Viande de petit gibier cuite',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_meat_exotic_bird.png', text = "Viande de petit gibier",count = "x1"}
    },
       ['viandecuite'] = {
        type = 'saloon',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viande',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandecuite',
        Amount = 1,
        WorkingTime = 5,
        label = 'Viande cuite',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef', text = "Viande crue",count = "x1"}
    },
       ['viandegibiercuite'] = {
        type = 'saloon',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandegibier',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandegibiercuite',
        Amount = 1,
        WorkingTime = 5,
        label = 'Venaison cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_meat_mature_venison', text = "Venaison",count = "x1"}
    },
    ['viandevolaillecuite'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandevolaille',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandevolaillecuite',
        Amount = 1,
        WorkingTime = 5,
        label = 'Volaille cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_meat_gamey_bird', text = "Volaille",count = "x1"}
    },
    ['viandereptilecuite'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandereptile',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandereptilecuite',
        Amount = 1,
        WorkingTime = 5,
        label = 'Viande de reptile cuite',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_meat_stringy', text = "Viande de reptile",count = "x1"}
    },

    ['gibierherbe'] = {
        type = 'saloon',
        Itemtocraft = 2,
        ItemReceipe1Name = 'viandegibier',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'herbesaromatiques',
        ItemReceipe2Amount = 1,
        ItemToGive = 'gibierherbe',
        Amount = 1,
        WorkingTime = 5,
        label = 'Viande aux herbes',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_mature_venison.png', text = "Venaison",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}}
    },
    ['viandeherbe'] = {
        type = 'saloon',
        Itemtocraft = 2,
        ItemReceipe1Name = 'viande',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'herbesaromatiques',
        ItemReceipe2Amount = 1,
        ItemToGive = 'viandeherbe',
        Amount = 1,
        WorkingTime = 5,
        label = 'Viande aux herbes',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Viande",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}}
    },
    ['volailleherbe'] = {
        type = 'saloon',
        Itemtocraft = 2,
        ItemReceipe1Name = 'viandevolaille',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'herbesaromatiques',
        ItemReceipe2Amount = 1,
        ItemToGive = 'volailleherbe',
        Amount = 1,
        WorkingTime = 5,
        label = 'Viande aux herbes',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_gamey_bird.png', text = "Volaille",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}}
    },
}

Config.ImportPoint = {
    [1]= vector3(2669.003, -1522.059, 45.96976), --- st denis
    [2]= vector3(-825.8802, -1241.919, 43.53639), -- bla
}

Config.Import = {
    ["beer"] = {label= "Bière", price = 0.1, saloon = {"saloon_faubourg", "saloon_kala", "saloon_bla", "saloon_rhodes"}},
    ["gin"] = {label= "Gin", price = 0.30, saloon = {"saloon_faubourg", "saloon_kala", "saloon_bla", "saloon_rhodes"}},
    ["mezcal"] = {label= "Mezcal", price = 0.30, saloon = {"saloon_faubourg", "saloon_kala", "saloon_bla", "saloon_rhodes"}},
    ["lemonade"] = {label= "Limonade", price = 0.2, saloon = {"saloon_faubourg", "saloon_kala", "saloon_bla", "saloon_rhodes"}},
}