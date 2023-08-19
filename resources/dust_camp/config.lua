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

Config.Campfire = 'p_campfire05x'
Config.CamoStick = 'p_campfirecook01x'
Config.CampGrill = 'p_cookgrate01x'
Config.CampChaudron = 'p_campfirecombined03x'

Config.CraftingsReceipe = {
    ['douille'] = {
        ItemReceipe1Name = 'cuivrepepite',
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'plombpepite',
        ItemReceipe2Amount = 10,
        ItemToGive = 'douille',
        Amount = 10,
        WorkingTime = 5,
    },
    ['piecearme'] = {
        ItemReceipe1Name = 'ferpepite',
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'charbon',
        ItemReceipe2Amount = 1,
        ItemToGive = 'piecearme',
        Amount = 10,
        WorkingTime = 5,
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