Config	                                    = {}			-- Don't touch this, this initializes the Config table.

Config.Version                              = "1.0.0"		-- Set the version of your server. This gets displayed on the character select screens and in a watermark.
Config.AnonymousNames                       = true          -- Set to true to make all players have anonymous target names ["Stranger (PlayerID)"]
Config.DisableChallengeNotifications        = true          -- Set to true to disable challenge notifications (base game)
Config.DisableSpaceInWeaponWheel            = true          -- Set to true to disable space in weapon wheel soft locking the game (base game)
Config.MapCrossName                         = "Repère"            -- Set the BLIP_NAME when a player is hovered over a non-existant blip on the map (base game)
Config.DisableLootBoxes                     = true          -- Set to true to disable random loot boxes (base game)
Config.DisableAimAssist                     = true          -- Set to true to disable aim assist on controllers (unfair for RP servers)

Config.StartingCash                         = 100           -- The amount of cash to start with
Config.StartingBank                         = 0             -- The amount of bank money to start with

Config.WeaponRecoilSystem              = true          -- Set to true to enable weapon recoil system.
Config.WeaponRecoils = {
    [34411519]                          = 0.7,          -- weapon_pistol_volcanic
    [1252941818]                        = 0.7,          -- weapon_pistol_mauser_drunk
    [1534638301]                        = 0.7,          -- weapon_pistol_m1899
    [1701864918]                        = 0.7,          -- weapon_pistol_semiauto
    [2239809086]                        = 0.7,          -- weapon_pistol_mauser
    [1905553950]                        = 0.7,          -- weapon_repeater_evans
    [2511488402]                        = 0.7,          -- weapon_repeater_henry
    [2823250668]                        = 0.7,          -- weapon_repeater_winchester
    [4111948705]                        = 0.7,          -- weapon_repeater_carbine
    [127400949]                         = 0.7,          -- weapon_revolver_doubleaction
    [379542007]                         = 0.7,          -- weapon_revolver_cattleman
    [383145463]                         = 0.7,          -- weapon_revolver_cattleman_mexican
    [1529685685]                        = 0.7,          -- weapon_revolver_lemat
    [2075992054]                        = 0.7,          -- weapon_revolver_schofield
    [2212320791]                        = 0.7,          -- weapon_revolver_doubleaction_gambler
    [1676963302]                        = 0.7,          -- weapon_rifle_springfield
    [1999408598]                        = 0.7,          -- weapon_rifle_boltaction
    [3724000286]                        = 0.7,          -- weapon_rifle_varmint
    [392538360]                         = 0.7,          -- weapon_shotgun_sawedoff
    [575725904]                         = 0.7,          -- weapon_shotgun_doublebarrel_exotic
    [834124286]                         = 0.7,          -- weapon_shotgun_pump
    [1674213418]                        = 0.7,          -- weapon_shotgun_repeating
    [1838922096]                        = 0.7,          -- weapon_shotgun_semiauto
    [1845102363]                        = 0.7,          -- weapon_shotgun_doublebarrel
    [1402226560]                        = 0.7,          -- weapon_sniperrifle_carcano
    [3788682007]                        = 0.7,          -- weapon_sniperrifle_rollingblock
    [2292731996]                        = 0.7,          -- bow
}

Config.DamageModifier = {
    [34411519]                          = 0.5,          -- weapon_pistol_volcanic
    [1252941818]                        = 0.5,          -- weapon_pistol_mauser_drunk
    [1534638301]                        = 0.5,          -- weapon_pistol_m1899
    [1701864918]                        = 0.5,          -- weapon_pistol_semiauto
    [2239809086]                        = 0.5,          -- weapon_pistol_mauser
    [1905553950]                        = 0.5,          -- weapon_repeater_evans
    [2511488402]                        = 0.5,          -- weapon_repeater_henry
    [2823250668]                        = 0.5,          -- weapon_repeater_winchester
    [4111948705]                        = 0.5,          -- weapon_repeater_carbine
    [127400949]                         = 0.5,          -- weapon_revolver_doubleaction
    [379542007]                         = 0.5,          -- weapon_revolver_cattleman
    [383145463]                         = 0.5,          -- weapon_revolver_cattleman_mexican
    [1529685685]                        = 0.5,          -- weapon_revolver_lemat
    [2075992054]                        = 1.0,          -- weapon_revolver_schofield
    [2212320791]                        = 0.5,          -- weapon_revolver_doubleaction_gambler
    [1676963302]                        = 0.5,          -- weapon_rifle_springfield
    [1999408598]                        = 0.5,          -- weapon_rifle_boltaction
    [3724000286]                        = 0.5,          -- weapon_rifle_varmint
    [392538360]                         = 0.5,          -- weapon_shotgun_sawedoff
    [575725904]                         = 0.5,          -- weapon_shotgun_doublebarrel_exotic
    [834124286]                         = 0.5,          -- weapon_shotgun_pump
    [1674213418]                        = 0.5,          -- weapon_shotgun_repeating
    [1838922096]                        = 0.5,          -- weapon_shotgun_semiauto
    [1845102363]                        = 0.5,          -- weapon_shotgun_doublebarrel
    [1402226560]                        = 0.5,          -- weapon_sniperrifle_carcano
    [3788682007]                        = 0.5,          -- weapon_sniperrifle_rollingblock
    [-2002235300]                        = 0.7,          -- bow
}


Config.MaxHealthCore =  5 -- 50% max health core
Config.MaxStaminaCore = 5 -- 50% max stamina core

Config.HSModifier = 0.3 --- modifie les dégats du headshot