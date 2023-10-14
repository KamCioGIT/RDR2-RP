Config = {}

Config.Jobs = {
    [1] = "armurier_rhodes",
    [2] = "armurier_strawberry",
}

Config.Atelier = {
    vector3(1327.263, -1321.737, 77.88863), -- Rhodes
    vector3(-1846.091, -419.7523, 162.4211) --- straw

}


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


Config.MenuElementsW = {
	["specialweapon"] = {
		label = "Spécifique",
		category = {
			"BARREL",
            "GRIP",
            "SIGHT",
            "CLIP",
            "TUBE",
            "WRAP",
            "FRAME_ENGRAVING",
            "MAG",
            "STOCK",
            "CYLINDER_TINT",
            "BARREL_TINT",
            "TRIGGER_TINT",
            "TORCH_MATCHSTICK",
            "COMPONENT_FISHING_LINE",
		}
	},
    ["commun"] = {
		label = "Commun",
		category = {
			"TRIGGER_MATERIAL",
            "SIGHT_MATERIAL",
            "HAMMER_MATERIAL",
            "FRAME_MATERIAL",
            "FRAME_ENGRAVING",
            "FRAME_ENGRAVING_MATERIAL",
            "BARREL_MATERIAL",
            "BARREL_ENGRAVING",
            "BARREL_ENGRAVING_MATERIAL",
            "CYLINDER_MATERIAL",
            "CYLINDER_ENGRAVING",
            "CYLINDER_ENGRAVING_MATERIAL",
            "GRIP_MATERIAL",
            "GRIPSTOCK_ENGRAVING",
            "GRIPSTOCK_TINT",
            "BARREL_RIFLING",
            "WRAP_MATERIAL",
            "WRAP_TINT",
            "STRAP",
            "STRAP_TINT",
            "SCOPE",
            "MELEE_BLADE_MATERIAL",
            "MELEE_BLADE_ENGRAVING",
            "MELEE_BLADE_ENGRAVING_MATERIAL",
            "GRIP_TINT",
		}
	},

}

Config.LabelW = {
	["BARREL"] = "Canon",
	["GRIP"] = "Poignée",
	["SIGHT"] = "Mire",
	["CLIP"] = "Clip",
	["TUBE"] = "Intérieur Canon",
	["WRAP"] = "Enveloppe",
	["FRAME_ENGRAVING"] = "Gravure",
	["MAG"] = "Chargeur",
	["STOCK"] = "Crosse",
    ["CYLINDER_TINT"] = "Teinte dy cylindre",
	["BARREL_TINT"] = "Teinte du canon",
	["TRIGGER_TINT"] = "Teinte de la gâchette",
	["TORCH_MATCHSTICK"] = "Allumette",
	["COMPONENT_FISHING_LINE"] = "Ligne de pêche",
	["TRIGGER_MATERIAL"] = "Matière de la gâchette",
    ["SIGHT_MATERIAL"] = "Matière de la mire",
    ["HAMMER_MATERIAL"] = "Matière du marteau",
    ["FRAME_MATERIAL"] = "Matière du corps",
    ["FRAME_ENGRAVING_MATERIAL"] = "Matière de la gravure du corps",
    ["BARREL_MATERIAL"] = "Matière du canon",
    ["BARREL_ENGRAVING"] = "Gravure du canon",
    ["BARREL_ENGRAVING_MATERIAL"] = "Matière de la gravure du canon",
    ["CYLINDER_MATERIAL"] = "Matière du cylindre",
    ["CYLINDER_ENGRAVING"] = "Gravure du cylindre",
    ["CYLINDER_ENGRAVING_MATERIAL"] = "Matière de la gravure du cylindre",
    ["GRIP_MATERIAL"] = "Matière de la poignée",
    ["GRIPSTOCK_ENGRAVING"] = "Gravure de la poignée",
    ["GRIPSTOCK_TINT"] = "Teinte de la poignée",
    ["BARREL_RIFLING"] = "Canon rayé",
    ["WRAP_MATERIAL"] = "Matière de l'emballage",
    ["WRAP_TINT"] = "Teinte de l'emballage",
    ["STRAP"] = "Sangle",
    ["STRAP_TINT"] = "Teinte de la sangle",
    ["SCOPE"] = "Viseur",
    ["MELEE_BLADE_MATERIAL"] = "Matière de la lame",
    ["MELEE_BLADE_ENGRAVING"] = "Gravure de lame",
    ["MELEE_BLADE_ENGRAVING_MATERIAL"] = "Matière de la gravure de lame",
    ["GRIP_TINT"] = "Teinte de la poignée",
}

--- FRAME_VERTDATA = légendaire ---

Config.WeaponRecoilSystem              = true          -- Set to true to enable weapon recoil system.
Config.WeaponRecoils = {
    [34411519]                          = 0.7,          -- weapon_pistol_volcanic
    -- [1252941818]                        = 0.7,          -- weapon_pistol_mauser_drunk
    -- [1534638301]                        = 0.7,          -- weapon_pistol_m1899
    -- [1701864918]                        = 0.7,          -- weapon_pistol_semiauto
    -- [2239809086]                        = 0.7,          -- weapon_pistol_mauser
    [1905553950]                        = 0.7,          -- weapon_repeater_evans
    [2511488402]                        = 0.7,          -- weapon_repeater_henry
    [2823250668]                        = 0.7,          -- weapon_repeater_winchester
    [4111948705]                        = 0.7,          -- weapon_repeater_carbine
    [127400949]                         = 0.7,          -- weapon_revolver_doubleaction
    [379542007]                         = 0.7,          -- weapon_revolver_cattleman
    [383145463]                         = 0.7,          -- weapon_revolver_cattleman_mexican
    [1529685685]                        = 0.7,          -- weapon_revolver_lemat
    [2075992054]                        = 0.7,          -- weapon_revolver_schofield
    [132728264]                        = 0.7,          -- weapon_revolver_navy  
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
    [-2002235300]                        = 0.7,          -- bow
}

Config.DamageModifier = {
    [34411519]                          = 0.8,          -- weapon_pistol_volcanic 6 balles
    -- [1252941818]                        = 0.5,          -- weapon_pistol_mauser_drunk
    -- [1534638301]                        = 0.5,          -- weapon_pistol_m1899
    -- [1701864918]                        = 0.5,          -- weapon_pistol_semiauto
    -- [2239809086]                        = 0.5,          -- weapon_pistol_mauser
    [1905553950]                        = 0.5,          -- weapon_repeater_evans
    [2511488402]                        = 0.5,          -- weapon_repeater_henry
    [2823250668]                        = 0.5,          -- weapon_repeater_winchester
    [4111948705]                        = 0.5,          -- weapon_repeater_carbine
    [127400949]                         = 1.0,          -- weapon_revolver_doubleaction
    [379542007]                         = 1.0,          -- weapon_revolver_cattleman
    [383145463]                         = 1.0,          -- weapon_revolver_cattleman_mexican
    [1529685685]                        = 0.7,          -- weapon_revolver_lemat 9 balles
    [132728264]                        = 1.0,          -- weapon_revolver_navy  6 balles
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
