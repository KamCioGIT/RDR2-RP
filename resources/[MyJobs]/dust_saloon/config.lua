Config = {}


Config.Jobs = {
    [1] = "saloon_kala",
    [2] = "saloon_faubourg",
}

Config.WorkingTime = 5000
Config.DistanceToInteract = 1.5

Config.Atelier = {
    [1] = vector3(2940.411, 523.3466, 45.33625),
    [2] = vector3(2795.335, -1168.009, 47.92803)
}

Config.AnimDict = "script_rc@chnt1@ig@ig2_hosea_cook_eat"
Config.CraftAnim = {
    "coooking_2p_meat_02_arthur",
}


Config.CraftingsReceipe = {
    ['soupe'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'Corn_Seed',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'patate',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'saugeducolibri',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'charbon',
        ItemReceipe4Amount = 1,
        ItemToGive = 'soupe',
        Amount = 1,
        WorkingTime = 5,
        label = 'Soupe de légume',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/corn.png', text = "Maïs",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_hummingbird_sage.png', text = "Sauge du Colibri",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['Ragoutgibier'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viandegibier',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'patate',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'Ragoutgibier',
        Amount = 1,
        WorkingTime = 5,
        label = 'Ragoût',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_mature_venison.png', text = "Venaison",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['Ragoutviande'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viande',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'patate',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'Ragoutviande',
        Amount = 1,
        WorkingTime = 5,
        label = 'Ragoût',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Viande Crue",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['Ragoutvolaille'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viandevolaille',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'patate',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'Ragoutvolaille',
        Amount = 1,
        WorkingTime = 5,
        label = 'Ragoût',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_gamey_bird.png', text = "Volaille",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['tourtegibier'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viandegibier',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'farine',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'herbesaromatiques',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'charbon',
        ItemReceipe4Amount = 1,
        ItemToGive = 'tourtegibier',
        Amount = 1,
        WorkingTime = 5,
        label = 'Tourte à la viande',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_mature_venison.png', text = "Venaison",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/flour.png', text = "Farine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['tourteviande'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viande',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'farine',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'herbesaromatiques',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'charbon',
        ItemReceipe4Amount = 1,
        ItemToGive = 'tourteviande',
        Amount = 1,
        WorkingTime = 5,
        label = 'Tourte à la viande',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Viande Crue",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/flour.png', text = "Farine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['tourtevolaille'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viandevolaille',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'farine',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'herbesaromatiques',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'charbon',
        ItemReceipe4Amount = 1,
        ItemToGive = 'tourtevolaille',
        Amount = 1,
        WorkingTime = 5,
        label = 'Tourte à la viande',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_gamey_bird.png', text = "Volaille",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/flour.png', text = "Farine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['brochettegibier'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viandegibier',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'petitbois',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'brochettegibier',
        Amount = 1,
        WorkingTime = 5,
        label = 'Brochette',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_mature_venison.png', text = "Venaison",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/stick.png', text = "Petit Bois",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['brochetteviande'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viande',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'petitbois',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'brochetteviande',
        Amount = 1,
        WorkingTime = 5,
        label = 'Brochette',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Viande Crue",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/stick.png', text = "Petit Bois",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['brochettevolaille'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viandevolaille',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'petitbois',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'brochettevolaille',
        Amount = 1,
        WorkingTime = 5,
        label = 'Brochette',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_gamey_bird.png', text = "Volaille",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/stick.png', text = "Petit Bois",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['pain'] = {
        type = 'epicerie',
        Itemtocraft = 2,
        ItemReceipe1Name = 'farine',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'charbon',
        ItemReceipe2Amount = 1,
        ItemToGive = 'pain',
        Amount = 5,
        WorkingTime = 2,
        label = 'Pain',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/flour.png', text = "Farine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['gibierherbe'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viandegibier',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'herbesaromatiques',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'gibierherbe',
        Amount = 1,
        WorkingTime = 5,
        label = 'Viande aux herbes',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_mature_venison.png', text = "Venaison",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['viandeherbe'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viande',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'herbesaromatiques',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'viandeherbe',
        Amount = 1,
        WorkingTime = 5,
        label = 'Viande aux herbes',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Viande crue",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['volailleherbe'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viandevolaille',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'herbesaromatiques',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'volailleherbe',
        Amount = 1,
        WorkingTime = 5,
        label = 'Viande aux herbes',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_gamey_bird.png', text = "Volaille",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['gateau'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'bouteillelait',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'farine',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'sucre',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'charbon',
        ItemReceipe4Amount = 1,
        ItemToGive = 'gateau',
        Amount = 1,
        WorkingTime = 5,
        label = 'Gâteau',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_offal.png', text = "Bouteille de lait",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/flour.png', text = "Farine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/sugar.png', text = "Sucre",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['tartemyrtille'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'bouteillelait',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'farine',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'sucre',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'charbon',
        ItemReceipe4Amount = 1,
        ItemToGive = 'tartemyrtille',
        Amount = 1,
        WorkingTime = 5,
        label = 'Tarte au myrtille',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_offal.png', text = "Bouteille de lait",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/flour.png', text = "Farine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_red_raspberry.png', text = "Myrtille",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['soupechampignon'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'boletbai',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'coulemelle',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'chanterelle',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'charbon',
        ItemReceipe4Amount = 1,
        ItemToGive = 'soupechampignon',
        Amount = 1,
        WorkingTime = 5,
        label = 'Soupe de champignon',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_bay_bolete.png', text = "Boletbai",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_parasol_mushroom.png', text = "Coulemelle",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_chanterelles.png', text = "Chanterelle",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['herbesaromatiques'] = {
        type = 'epicerie',
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

Config.ImportPoint = {
    [1]= vector3(2572.136, -1501.026, 45.96986), --- st denis
    [2]= vector3(-825.8802, -1241.919, 43.53639), -- bla
}

Config.Import = {
    ["beer"] = {label= "Bière", price = 0.1, saloon = {"saloon_faubourg", "saloon_kala"}},
    ["gin"] = {label= "Gin", price = 0.30, saloon = {"saloon_faubourg"}},
    ["mezcal"] = {label= "Mezcal", price = 0.30, saloon = {"saloon_kala"}},
    ["dirty_whiskey"] = {label= "Mauvais Whiskey", price = 0.2, saloon = {"saloon_faubourg", "saloon_kala"}},
    ["good_whisky"] = {label= "Bon Whiskey", price = 0.35, saloon = {"saloon_faubourg", "saloon_kala"}},
    ["lemonade"] = {label= "Limonade", price = 0.2, saloon = {"saloon_faubourg", "saloon_kala"}},
}