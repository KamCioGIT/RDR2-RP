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
    ['grossteakcuit'] = {
        type = 'fire',
        Itemtocraft = 1,
        ItemReceipe1Name = 'grossteak',
        ItemReceipe1Amount = 1,
        ItemToGive = 'grossteakcuit',
        Amount = 1,
        WorkingTime = 1,
        label = 'Gros Steak Cuit',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Gros Steak",count = "x1"}

    },
    ['grossteakcarottesauvage'] = {
        type = 'cauldron',
        Itemtocraft = 2,
        ItemReceipe1Name = 'grossteak',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'Wild_Carrot',
        ItemReceipe2Amount = 2,
        ItemToGive = 'grossteakcarottesauvage',
        Amount = 1,
        WorkingTime = 1,
        label = 'Gros Steak aux Carottes Sauvages',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_prime_beef.png', text = "Gros Steak",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/consumable_herb_wild_carrots.png', text = "Carotte Sauvage",count = "x2"}},
    },
    ['gunpowder'] = {
        ItemReceipe1Name = 'souffre',
        ItemReceipe1Amount = 5,
        ItemReceipe2Name = 'charbon',
        ItemReceipe2Amount = 10,
        ItemToGive = 'gunpowder',
        Amount = 10,
        WorkingTime = 5,
    },
    ['ammo_revolver'] = {
        ItemReceipe1Name = 'gunpowder',
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'douille',
        ItemReceipe2Amount = 10,
        ItemToGive = 'AMMO_REVOLVER',
        Amount = 10,
        WorkingTime = 5,
    },
    ['ammo_pistol'] = {
        ItemReceipe1Name = 'gunpowder',
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'douille',
        ItemReceipe2Amount = 10,
        ItemToGive = 'AMMO_PISTOL',
        Amount = 10,
        WorkingTime = 5,
    },
    ['ammo_repeater'] = {
        ItemReceipe1Name = 'gunpowder',
        ItemReceipe1Amount = 15,
        ItemReceipe2Name = 'douille',
        ItemReceipe2Amount = 10,
        ItemToGive = 'AMMO_REPEATER',
        Amount = 10,
        WorkingTime = 5,
    },
    ['ammo_rifle'] = {
        ItemReceipe1Name = 'gunpowder',
        ItemReceipe1Amount = 20,
        ItemReceipe2Name = 'douille',
        ItemReceipe2Amount = 10,
        ItemToGive = 'AMMO_RIFLE',
        Amount = 10,
        WorkingTime = 5,
    },
    ['ammo_shotgun'] = {
        ItemReceipe1Name = 'gunpowder',
        ItemReceipe1Amount = 15,
        ItemReceipe2Name = 'douille',
        ItemReceipe2Amount = 10,
        ItemToGive = 'AMMO_SHOTGUN',
        Amount = 10,
        WorkingTime = 5,
    }
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