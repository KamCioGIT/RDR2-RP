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