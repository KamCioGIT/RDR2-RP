Config = {}

Config.RagdollKey = 0xD8F73058 -- w
Config.HandsUpKey = 0x8CC9CD42 -- x 
Config.MenuKey = 0x8AAA0AD4 -- b

Config.HandsUpAnim = {
[1] = 	{dict= "mech_loco_f@generic@reaction@handsup@unarmed@normal", anim = "loop"},
[2] = 	{dict= "mech_loco_f@generic@reaction@handsup@unarmed@tough", anim = "loop"},
[3] = 	{dict= "mech_loco_m@generic@reaction@handsup@unarmed@normal", anim = "loop"},
[4] = 	{dict= "mech_loco_m@generic@reaction@handsup@unarmed@tough", anim = "loop"},
[5] = 	{dict= "script_common@other@unapproved", anim = "guard_handsup_loop"},
[6] = 	{dict= "script_proc@robberies@shop@strgen", anim ="handsup_register"},
}



Config.CraftingsReceipe = {
    ['bow'] = {
        label = "Arc",
        desc = "1 bois + 1 fil",
        ItemReceipe1Name = 'cuivrepepite',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'plombpepite',
        ItemReceipe2Amount = 1,
        ItemToGive = 'douille',
        Amount = 10,
        WorkingTime = 5,
    },
    ['arrow'] = {
        label = "Flèches",
        desc = "1 bois + 1 silex",
        ItemReceipe1Name = 'ferpepite',
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'charbon',
        ItemReceipe2Amount = 1,
        ItemToGive = 'piecearme',
        Amount = 10,
        WorkingTime = 5,
    },
    ['spit'] = {
        label = "Feu de camp",
        desc = "3 bois",
        ItemReceipe1Name = 'souffre',
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'charbon',
        ItemReceipe2Amount = 5,
        ItemToGive = 'gunpowder',
        Amount = 10,
        WorkingTime = 5,
    },
}