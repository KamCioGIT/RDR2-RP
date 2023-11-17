Config = {}

Config.MenuDict = 'mech_dynamic@world_player_dynamic_kneel_ground@tend@male_a@stand_enter@tend1'
Config.MenuAnim = {
    "enter_back_rf",

}

Config.CloseMenuDict = 'mech_dynamic@world_player_dynamic_kneel_ground@tend@male_a@stand_exit@tend1'
Config.CloseMenuAnim = {
    "exit_front",

}

Config.CookDict = 'mech_dynamic@world_player_dynamic_kneel_ground@trans@kneelpostfirecraft@male_a'
Config.CookAnim = {
    "kneelpostfirecraft_trans_craft_again",
    "kneelpostfirecraft_trans_kneelfirecraft",
    
}
Config.CookAnim2 = {"kneelpostfirecraft_trans_stow"}


Config.IdleDict = 'mech_dynamic@world_player_dynamic_kneel_ground@tend@male_a@idle_a'
Config.IdleAnim = {'idle_b'}

Config.WorkingTime = 1000

Config.Campfire = GetHashKey('p_campfire05x')
Config.CampStick = GetHashKey("p_campfirecook01x")
Config.CampGrill = GetHashKey('p_cookgrate01x')
Config.CampChaudron = GetHashKey('p_campfirecombined03x')

Config.CraftingsReceipe = {
    ['viandepetitmamiferecuite'] = {
        type = 'fire',
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
        type = 'fire',
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
        type = 'fire',
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
        type = 'grill',
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
        type = 'grill',
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
        type = 'grill',
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
    ['attelle'] = {
        type = 'fire',
        Itemtocraft = 3,
        ItemReceipe1Name = 'cuir',
        ItemReceipe1Amount = 2,
        ItemReceipe2Name = 'petitbois',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'bandage',
        ItemReceipe3Amount = 1,
        ItemToGive = 'attelle',
        Amount = 1,
        WorkingTime = 5,
        label = 'Attelle',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_armadillo_skin.png', text = "Cuir",count = "x2"},{src = 'nui://redemrp_inventory/html/items/stick.png', text = "Petit Bois",count = "x3"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animal",count = "x1"},{src = 'nui://redemrp_inventory/html/items/bandage.png', text = "Bandage",count = "x1"}}
    },
    ['bandage'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'fil',
        ItemReceipe1Amount = 10,
        ItemToGive = "bandage",
        Amount = 1,
        WorkingTime = 5,
        label = 'Bandage',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_fsh_copper_spool.png', text = "Fil",count = "x10"}}
    },
    ['concoctionenduranceun'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'saugeducolibri',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'myrtille',
        ItemReceipe2Amount = 4,
        ItemReceipe3Name = 'cafe',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'sucre',
        ItemReceipe4Amount = 1,
        ItemToGive = 'concoctionendurance',
        Amount = 1,
        WorkingTime = 5,
        label = 'Essence de térébenthine',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_hummingbird_sage.png', text = "Sauge du colibri",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_red_raspberry.png', text = "Myrtille",count = "x4"},{src = 'nui://redemrp_inventory/html/items/consumable_coffee.png', text = "cafe",count = "x1"},{src = 'nui://redemrp_inventory/html/items/sugar.png', text = "sucre",count = "x1"}}
    },
    ['concoctionendurancedeux'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'foutrebovin',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'myrtille',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'pouledesbois',
        ItemReceipe3Amount = 4,
        ItemReceipe4Name = 'sucre',
        ItemReceipe4Amount = 1,
        ItemToGive = 'concoctionendurance',
        Amount = 1,
        WorkingTime = 5,
        label = 'Essence de térébenthine',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/water.png', text = "Semence bovine",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_red_raspberry.png', text = "Myrtille",count = "x3"},{src = 'nui://redemrp_inventory/html/items/consumable_herb_rams_head.png', text = "Pouledesbois",count = "x4"},{src = 'nui://redemrp_inventory/html/items/sugar.png', text = "sucre",count = "x1"}}
    },
    ['concoctionendurancetrois'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'ginseng',
        ItemReceipe1Amount = 4,
        ItemReceipe2Name = 'chanterelle',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'Mais',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'sucre',
        ItemReceipe4Amount = 1,
        ItemToGive = 'concoctionendurance',
        Amount = 1,
        WorkingTime = 5,
        label = 'Essence de térébenthine',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_american_ginseng.png', text = "Ginseng",count = "x4"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_chanterelles.png', text = "Chanterelle",count = "x3"},{src = 'nui://redemrp_inventory/html/items/consumable_corn.png', text = "Maïs",count = "x1"},{src = 'nui://redemrp_inventory/html/items/sugar.png', text = "sucre",count = "x1"}}
    },
    ['concoctionanesthesianteun'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'barbane',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'menthesauvage',
        ItemReceipe2Amount = 4,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'bec',
        ItemReceipe4Amount = 1,
        ItemToGive = 'concoctionanesthesiante',
        Amount = 1,
        WorkingTime = 5,
        label = 'Emulsion Anesthésiante',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_burdock_root.png', text = "Bardane",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_mint.png', text = "Menthe sauvage",count = "x4"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"},{src = 'nui://redemrp_inventory/html/items/generic_animal_beak.png', text = "Bec",count = "x1"}}
    },
    ['concoctionanesthesiantedeux'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'coulemelle',
        ItemReceipe1Amount = 4,
        ItemReceipe2Name = 'boletbai',
        ItemReceipe2Amount = 5,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'boiscerf',
        ItemReceipe4Amount = 1,
        ItemToGive = 'concoctionanesthesiante',
        Amount = 1,
        WorkingTime = 5,
        label = 'Emulsion Anesthésiante',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_parasol_mushroom.png', text = "Coulemelle",count = "x4"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_bay_bolete.png', text = "Bolet-Baï",count = "x5"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"},{src = 'nui://redemrp_inventory/html/items/provision_buck_antlers.png', text = "Bois de cerf",count = "x1"}}
    },
    ['concoctionanesthesiantetrois'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'camomillesauvage',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'chanterelle',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'corne',
        ItemReceipe4Amount = 2,
        ItemToGive = 'concoctionanesthesiante',
        Amount = 1,
        WorkingTime = 5,
        label = 'Emulsion Anesthésiante',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_feverfew.png', text = "Camomille sauvage",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_chanterelles.png', text = "Chanterelle",count = "x3"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"},{src = 'nui://redemrp_inventory/html/items/generic_animal_horn.png', text = "Corne",count = "x2"}}
    },
    ['concoctioncoagulationun'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'coulemelle',
        ItemReceipe1Amount = 4,
        ItemReceipe2Name = 'asclepiade',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'boiscerf',
        ItemReceipe4Amount = 1,
        ItemToGive = 'concoctioncoagulation',
        Amount = 1,
        WorkingTime = 5,
        label = 'Solution Coagulante',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_parasol_mushroom.png', text = "Coulemelle",count = "x4"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_milkweed.png', text = "Asclépiade",count = "x3"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"},{src = 'nui://redemrp_inventory/html/items/provision_buck_antlers.png', text = "Bois de cerf",count = "x1"}}
    },
    ['concoctioncoagulationdeux'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'baiedegaultherie',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'achillevisqueuse',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'griffe',
        ItemReceipe4Amount = 1,
        ItemToGive = 'concoctioncoagulation',
        Amount = 1,
        WorkingTime = 5,
        label = 'Solution Coagulante',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_wintergreen_berry.png', text = "Baie de gaultherie",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_english_mace.png', text = "Achillé visqueuse",count = "x3"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"},{src = 'nui://redemrp_inventory/html/items/provision_bobcat_claws.png', text = "griffe",count = "x1"}}
    },
    ['concoctioncoagulationtrois'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'millefeuille',
        ItemReceipe1Amount = 4,
        ItemReceipe2Name = 'saugeducolibri',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'corne',
        ItemReceipe4Amount = 2,
        ItemToGive = 'concoctioncoagulation',
        Amount = 1,
        WorkingTime = 5,
        label = 'Solution Coagulante',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_yarrow.png', text = "Millefeuille",count = "x4"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_hummingbird_sage.png', text = "Sauge du colibri",count = "x3"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"},{src = 'nui://redemrp_inventory/html/items/generic_animal_horn.png', text = "Corne",count = "x2"}}
    },
    ['poisonest'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'laurierrose',
        ItemReceipe1Amount = 4,
        ItemReceipe2Name = 'saugedudesert',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'glandevenin',
        ItemReceipe3Amount = 2,
        ItemReceipe4Name = 'boiscerf',
        ItemReceipe4Amount = 1,
        ItemToGive = 'poison',
        Amount = 1,
        WorkingTime = 5,
        label = 'Poison',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_oleander_sage.png', text = "Laurier-rose",count = "x4"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_desert_sage.png', text = "Sauge du desert",count = "x3"},{src = 'nui://redemrp_inventory/html/items/provision_panther_eye.png', text = "Glande",count = "x2"},{src = 'nui://redemrp_inventory/html/items/provision_buck_antlers.png', text = "Bois de cerf",count = "x1"}}
    },
    ['poisonouest'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'champignontoxique',
        ItemReceipe1Amount = 4,
        ItemReceipe2Name = 'saugedudesert',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'glandevenin',
        ItemReceipe3Amount = 2,
        ItemReceipe4Name = 'boiscerf',
        ItemReceipe4Amount = 1,
        ItemToGive = 'poison',
        Amount = 1,
        WorkingTime = 5,
        label = 'Poison',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_parasol_mushroom.png', text = "Lépiote Brun-rose",count = "x4"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_desert_sage.png', text = "Sauge du desert",count = "x3"},{src = 'nui://redemrp_inventory/html/items/provision_panther_eye.png', text = "Glande",count = "x2"},{src = 'nui://redemrp_inventory/html/items/provision_buck_antlers.png', text = "Bois de cerf",count = "x1"}}
    },
    ['remedeinfectionun'] = {
        type = 'cauldron',
        Itemtocraft = 3,
        ItemReceipe1Name = 'millefeuille',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'baiedegaultherie',
        ItemReceipe2Amount = 2,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemToGive = 'remedeinfection',
        Amount = 1,
        WorkingTime = 5,
        label = 'Concentré Antiputride',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_yarrow.png', text = "millefeuille",count = "x3"},{src = 'nui://redemrp_inventory/html/items/consumable_herb_wintergreen_berry.png', text = "Baie de gaultherie",count = "x2"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"}}
    },
    ['remedeinfectiondeux'] = {
        type = 'cauldron',
        Itemtocraft = 3,
        ItemReceipe1Name = 'asclepiade',
        ItemReceipe1Amount = 2,
        ItemReceipe2Name = 'achillevisqueuse',
        ItemReceipe2Amount = 2,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemToGive = 'remedeinfection',
        Amount = 1,
        WorkingTime = 5,
        label = 'Concentré Antiputride',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_milkweed.png', text = "Asclépiade",count = "x2"},{src = 'nui://redemrp_inventory/html/items/consumable_herb_english_mace.png', text = "Achillé visqueuse",count = "x2"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"}}
    },
    ['remedeantidouleurun'] = {
        type = 'cauldron',
        Itemtocraft = 3,
        ItemReceipe1Name = 'Coulemelle',
        ItemReceipe1Amount = 2,
        ItemReceipe2Name = 'camomillesauvage',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemToGive = 'remedeantidouleur',
        Amount = 1,
        WorkingTime = 5,
        label = 'Extrait de Camomille',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_parasol_mushroom.png', text = "Coulemelle",count = "x2"},{src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_feverfew.png', text = "Camomille sauvage",count = "x3"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"}}
    },
    ['remedeantidouleurdeux'] = {
        type = 'cauldron',
        Itemtocraft = 3,
        ItemReceipe1Name = 'menthesauvage',
        ItemReceipe1Amount = 3,
        ItemReceipe2Name = 'camomillesauvage',
        ItemReceipe2Amount = 2,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemToGive = 'remedeantidouleur',
        Amount = 1,
        WorkingTime = 5,
        label = 'Extrait de Camomille',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_mint.png', text = "Menthe saucage",count = "x3"},{src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_feverfew.png', text = "Camomille sauvage",count = "x2"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"}}
    },
    ['antidysentrie'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'Chanterelle',
        ItemReceipe1Amount = 4,
        ItemReceipe2Name = 'pouledesbois',
        ItemReceipe2Amount = 2,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'jonccommun',
        ItemReceipe4Amount = 2,
        ItemToGive = 'antidysentrie',
        Amount = 1,
        WorkingTime = 5,
        label = 'Remède Digestif',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_chanterelles.png', text = "Chanterelle",count = "x4"},{src = 'nui://redemrp_inventory/html/items/consumable_herb_rams_head.png', text = "Poule des bois",count = "x2"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"},{src = 'nui://redemrp_inventory/html/items/consumable_herb_common_bulrush.png', text = "Jonc commun",count = "x2"}}
    },
    ['antidote'] = {
        type = 'cauldron',
        Itemtocraft = 4,
        ItemReceipe1Name = 'millefeuille',
        ItemReceipe1Amount = 2,
        ItemReceipe2Name = 'baiedegaultherie',
        ItemReceipe2Amount = 2,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'barbane',
        ItemReceipe4Amount = 2,
        ItemToGive = 'antidote',
        Amount = 1,
        WorkingTime = 5,
        label = 'Antidote',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/consumable_herb_yarrow.png', text = "Millefeuille",count = "x2"},{src = 'nui://redemrp_inventory/html/items/consumable_herb_wintergreen_berry.png', text = "Baie de Gaultherie",count = "x2"},{src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Graisse animale",count = "x1"},{src = 'nui://redemrp_inventory/html/items/consumable_herb_burdock_root.png', text = "Bardane",count = "x2"}}
    },
    ['resinepavot'] = {
        type = 'cauldron',
        Itemtocraft = 1,
        ItemReceipe1Name = 'pavot',
        ItemReceipe1Amount = 1,
        ItemToGive = 'resinepavot',
        Amount = 1,
        WorkingTime = 5,
        label = 'Résine de pavot',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/opium.png', text = "Pavot",count = "x1"}}
    },
    ['pipeopium'] = {
        type = 'cauldron',
        Itemtocraft = 2,
        ItemReceipe1Name = 'resinepavot',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'petitbois',
        ItemReceipe2Amount = 3,
        ItemToGive = 'pipeopium',
        Amount = 1,
        WorkingTime = 5,
        label = "Pipe d'opium",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/opium_smokable.png', text = "Résine de pavot",count = "x1"},{src = 'nui://redemrp_inventory/html/items/stick.png', text = "Petit bois",count = "x3"}}
    },
    ['cigaretteopium'] = {
        type = 'cauldron',
        Itemtocraft = 2,
        ItemReceipe1Name = 'resinepavot',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'cigarettes',
        ItemReceipe2Amount = 1,
        ItemToGive = 'cigaretteopium',
        Amount = 1,
        WorkingTime = 5,
        label = "Cigarette d'opium",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/opium_smokable.png', text = "Résine de pavot",count = "x1"},{src = 'nui://redemrp_inventory/html/items/cigarette.png', text = "Cigarette",count = "x1"}}
    },
    ['laitpavot'] = {
        type = 'cauldron',
        Itemtocraft = 2,
        ItemReceipe1Name = 'resinepavot',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'bouteillelait',
        ItemReceipe2Amount = 1,
        ItemToGive = 'laitpavot',
        Amount = 1,
        WorkingTime = 5,
        label = "Lait de Pavot",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/opium_smokable.png', text = "Résine de pavot",count = "x1"},{src = 'nui://redemrp_inventory/html/items/consumable_offal.png', text = "Bouteille de lait",count = "x1"}}
    },

    ['ammo_arrow_poison'] = {
        type = 'fire',
        Itemtocraft = 2,
        ItemReceipe1Name = 'ammo_arrow',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'poison',
        ItemReceipe2Amount = 1,
        ItemToGive = 'ammo_arrow_poison',
        Amount = 1,
        WorkingTime = 5,
        label = "Flèche empoisonnée",
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/AMMO_ARROW.png', text = "Flèche",count = "x1"},{src = 'nui://redemrp_inventory/html/items/consumable_poison_tonic.png', text = "Poison",count = "x1"}}
    },


    ---- POISSON
    ['a_c_fishbluegil_01_ms'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishbluegil_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_bluegill.png', text = "Crapet arlequin",count = "x1"}
    },
    ['a_c_fishbluegil_01_sm'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishbluegil_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_bluegill.png', text = "Petit Crapet arlequin",count = "x1"}
    },
    ['a_c_fishbullheadcat_01_ms'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishbullheadcat_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_bullhead_catfish.png', text = "Poisson-chat",count = "x1"}
    },
    ['a_c_fishbullheadcat_01_sm'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishbullheadcat_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_bullhead_catfish.png', text = "Petit Poisson-chat",count = "x1"}
    },
    ['a_c_fishchainpickerel_01_ms'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishchainpickerel_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_chain_pickerel.png', text = "Brochet maillé",count = "x1"}
    },
    ['a_c_fishchainpickerel_01_sm'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishchainpickerel_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_chain_pickerel.png', text = "Petit Brochet maillé",count = "x1"}
    },
    ['a_c_fishchannelcatfish_01_lg'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishchainpickerel_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_channel_catfish.png', text = "Gros Barbue de rivière",count = "x1"}
    },
    ['a_c_fishchannelcatfish_01_xl'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishchainpickerel_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 4,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_channel_catfish.png', text = "Très gros Barbue de rivière",count = "x1"}
    },
    ['a_c_fishlakesturgeon_01_lg'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishlakesturgeon_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_lake_sturgeon.png', text = "Gros Esturgeon jaune",count = "x1"}
    },
    ['a_c_fishlargemouthbass_01_lg'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishlargemouthbass_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_largemouth_bass.png', text = "Gros Achigan à grande bouche",count = "x1"}
    },
    ['a_c_fishlongnosegar_01_lg'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishlongnosegar_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_longnose_gar.png', text = "Gros Lépisosté osseux",count = "x1"}
    },
    ['a_c_fishmuskie_01_lg'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishmuskie_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_muskie.png', text = "Gros Maskinongé",count = "x1"}
    },
    ['a_c_fishnorthernpike_01_lg'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishnorthernpike_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_northern_pike.png', text = "Grand Brochet",count = "x1"}
    },
    ['a_c_fishperch_01_ms'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishperch_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_perch.png', text = "Perche",count = "x1"}
    },
    ['a_c_fishperch_01_sm'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishperch_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_muskie.png', text = "Petite Perche",count = "x1"}
    },
    ['a_c_fishrainbowtrout_01_lg'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishrainbowtrout_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_speckled_trout.png', text = "Grosse Truite arc-en-ciel",count = "x1"}
    },
    ['a_c_fishrainbowtrout_01_ms'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishrainbowtrout_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_muskie.png', text = "Truite arc-en-ciel",count = "x1"}
    },
    ['a_c_fishredfinpickerel_01_ms'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishredfinpickerel_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_redfin_pickerel.png', text = "Brochet rouge",count = "x1"}
    },
    ['a_c_fishredfinpickerel_01_sm'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishredfinpickerel_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_muskie.png', text = "Petit Brochet rouge",count = "x1"}
    },
    ['a_c_fishrockbass_01_ms'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishrockbass_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_rock_bass.png', text = "Crapet de roche",count = "x1"}
    },
    ['a_c_fishrockbass_01_sm'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishrockbass_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_rock_bass.png', text = "Petit Crapet de roche",count = "x1"}
    },
    ['a_c_fishsalmonsockeye_01_lg'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsalmonsockeye_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_sockeye_salmon.png', text = "Très Gros Saumon rouge",count = "x1"}
    },
    ['a_c_fishsalmonsockeye_01_ml'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsalmonsockeye_01_ml',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_sockeye_salmon.png', text = "Gros Saumon rouge",count = "x1"}
    },
    ['a_c_fishsalmonsockeye_01_ms'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsalmonsockeye_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_sockeye_salmon.png', text = "Saumon rouge",count = "x1"}
    },
    ['a_c_fishsmallmouthbass_01_lg'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsmallmouthbass_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_smallmouth_bass.png', text = "Gros Achigan à petite bouche",count = "x1"}
    },
    ['a_c_fishsmallmouthbass_01_ms'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsmallmouthbass_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_smallmouth_bass.png', text = "Achigan à petite bouche",count = "x1"}
    },
    ['filetpoisson'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'filetpoisson',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoissoncuit',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_meat_succulent_fish.png', text = "filetpoisson",count = "x1"}
    },
}
    

Config.EauMaudite = {
    -2040708515, -- WATER_LANNAHECHEE_RIVER
    -557290573, --- Bayou swamp
    -1229593481, -- Kamassa
    -105598602, -- Elysian Pool
    -823661292, -- Southfield Flats
    301094150, --- Mattock Pond à vérifier
}

Config.RampInDict = 'mech_dynamic@world_player_dynamic_kneel_ground@tend@male_a@stand_enter@tend1'
Config.RampInAnim = {
    "enter_back_rf",

}

Config.RampOutDict = 'mech_dynamic@world_player_dynamic_kneel_ground@tend@male_a@stand_exit@tend1'
Config.RampOutAnim = {
    "exit_front",

}