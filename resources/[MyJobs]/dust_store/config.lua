Config = {}

Config.Trapdoor = {
	{
		authorizedJobs = { 'straw_store' },
		doorid = "p_trapdoor01x",
		objCoords = vector3(-1790.7442626953125, -390.150390625, 159.28944396972656),
		objPitchclose = vector3(0.0, 0.0, 145),
		objPitchopen =  vector3(-90, 0.0, 145),
		locked = false,
		distance = 3.0
	},

}



Config.Jobs = {
    [1] = "store_straw",
    [2] = "store_rhodes",
    [3] = "store_stdenis",
    [4] = "store_bla",
}

Config.WorkingTime = 5000
Config.DistanceToInteract = 1.5

Config.Atelier = {
    [1] = vector3(-1789.997, -387.5353, 156.1007),
    [2] = vector3(1329.512, -1290.322, 77.01747),
    [3] = vector3(2826.487, -1313.016, 45.75267),
    [4] = vector3(-785.561, -1326.538, 42.88415)
}

Config.AnimDict = "amb_work@world_human_hammer@table@male_a@trans"
Config.CraftAnim = {
    "base_trans_base",
}

Config.BuyPain = {
    [1] = vector3(-816.855, -1226.588, 42.58243), -- bla
    [2] = vector3(2842.779, -1224.614, 46.62225), -- st denis
}

Config.Market = {
    ["bread"] = {label = "Pain", price = 0.50},
    ["water"] = {label = "Eau", price = 0.30}
}

Config.CraftingsReceipe = {
    ['soupe'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'Corn',
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
    ['ragoutviande'] = {
        type = 'epicerie',
        Itemtocraft = 3,
        ItemReceipe1Name = 'viandehachee',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'patate',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'charbon',
        ItemReceipe3Amount = 1,
        ItemToGive = 'ragoutviande',
        Amount = 1,
        WorkingTime = 5,
        label = 'Ragoût',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_rc_quartz_chunk.png', text = "Viande Hâchée",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
    },
    ['tourteviande'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viandehachee',
        ItemReceipe1Amount = 3,
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
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_rc_quartz_chunk.png', text = "Viande hâchée",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/flour.png', text = "Farine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/rock.png', text = "Charbon",count = "x1"}}
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
        Amount = 2,
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
    ['beefsteakpatate'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viandebovine',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'patate',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'herbesaromatiques',
        ItemReceipe4Amount = 1,
        ItemToGive = 'beefsteakpatate',
        Amount = 1,
        WorkingTime = 5,
        label = 'Beefsteak Patate',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_big_game.png', text = "Viande Bovine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_bread_chunk.png', text = "Patate",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}}
    },
    ['boeufaugin'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viandebovine',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'gin',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'herbesaromatiques',
        ItemReceipe4Amount = 1,
        ItemToGive = 'boeufaugin',
        Amount = 1,
        WorkingTime = 5,
        label = 'Boeuf au gin',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_big_game.png', text = "Viande Bovine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_gin.png', text = "Gin",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}}
    },
    ['cotedeboeuf'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viandebovine',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'chanterelle',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'herbesaromatiques',
        ItemReceipe4Amount = 1,
        ItemToGive = 'cotedeboeuf',
        Amount = 1,
        WorkingTime = 5,
        label = 'Côte de boeuf',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_big_game.png', text = "Viande Bovine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_chanterelles.png', text = "Chanterelle",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}}
    },
    ['cotedeboeufdeux'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viandebovine',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'boletbai',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'herbesaromatiques',
        ItemReceipe4Amount = 1,
        ItemToGive = 'cotedeboeuf',
        Amount = 1,
        WorkingTime = 5,
        label = 'Côte de boeuf',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_big_game.png', text = "Viande Bovine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_bay_bolete.png', text = "Boletbai",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}}
    },
    ['cotedeboeuftrois'] = {
        type = 'epicerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'viandebovine',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'coulemelle',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'herbesaromatiques',
        ItemReceipe4Amount = 1,
        ItemToGive = 'cotedeboeuf',
        Amount = 1,
        WorkingTime = 5,
        label = 'Côte de boeuf',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_big_game.png', text = "Viande Bovine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_parasol_mushroom.png', text = "Coulemelle",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_creeping_thyme.png', text = "Herbes aromatiques",count = "x1"}}
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
    ['viandehachee'] = {
        type = 'epicerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viande',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Viande crue",count = "x1"}}
    },
    ['viandehacheegibier'] = {
        type = 'epicerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandegibier',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_mature_venison.png', text = "Venaison",count = "x1"}}
    },
    ['viandehacheepetitgibier'] = {
        type = 'epicerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandepetitmamifere',
        ItemReceipe1Amount = 2,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_exotic_bird.png', text = "Viande de petit gibier",count = "x2"}}
    },
    ['viandehacheereptile'] = {
        type = 'epicerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandereptile',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_stringy.png', text = "Viande de reptile",count = "x1"}}
    },
    ['viandehacheevolaille'] = {
        type = 'cuisineferme',
        Itemtocraft = 1,
        ItemReceipe1Name = 'viandevolaille',
        ItemReceipe1Amount = 1,
        ItemToGive = 'viandehachee',
        Amount = 1,
        WorkingTime = 1,
        label = 'Viande hâchée',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_gamey_bird.png', text = "Volaille",count = "x1"}}
    },
}

Config.ImportPoint = {
    [1]= vector3(2669.003, -1522.059, 45.96976), --- st denis
    [2]= vector3(-825.8802, -1241.919, 43.53639), -- bla
}

Config.Import = {
    ["sucre"] = {label= "Sucre", price = 0.05},
    ["cigarettes"] = {label= "Cigarette", price = 0.10},
    ["cigar"] = {label= "Cigare", price = 0.2},
    ["coffee"] = {label= "Café", price = 0.15},
    ["dirty_whiskey"] = {label= "Mauvais Whiskey", price = 0.25},
    ["good_whisky"] = {label= "Boon Whiskey", price = 0.45},
    ["lemonade"] = {label= "Limonade", price = 0.2},
    ["tabacchiquer"] = {label= "Tabac à chiquer", price = 0.2},


}