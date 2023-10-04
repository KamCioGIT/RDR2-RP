Config = {}

Config.MsgWorking = "Appuie sur Del" -- Message de récolte
Config.MsgOpenMenu = "Appuie sur Entrer" -- Message de traitement

Config.RessourcesPointPos = vector3(2562.859, -1495.206, 46.0) -- Récolte Souffre
Config.WorkingTime = 5000
Config.DistanceToInteract = 1.5

Config.CreateFerAndLaitonPos = vector3(2317.1611, -1455.7, 47.01) -- 1 Charbon + 10 Minerai brut  = Lingot de Laiton

Config.CreateGunPowerPos = vector3(2366.535, -1467.595, 46.0) -- 
Config.Atelier = vector3(2369.379, -1467.595, 46.0) -- Creer toutes les balles
Config.AnimDict = "amb_work@world_human_hammer@table@male_a@trans"
Config.CraftAnim = {
    "base_trans_base",
}

Config.RecolteSouffreDict = 'amb_camp@prop_camp_butcher@working@deer@male_a@meat_drop@stand_exit'
Config.RecolteSouffreAnim = 'exit_front' -- A CHANGER



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
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'charbon',
        ItemReceipe2Amount = 5,
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