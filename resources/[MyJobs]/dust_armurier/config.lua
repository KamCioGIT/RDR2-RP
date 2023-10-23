Config = {}

Config.Jobs = {
    [1] = "armurier_rhodes",
    [2] = "armurier_strawberry",
}

Config.Atelier = {
    vector3(1327.263, -1321.737, 77.88863), -- Rhodes
    vector3(-1846.091, -419.7523, 162.4211) --- straw

}

Config.WorkingTime = 5000
Config.DistanceToInteract = 1.5

Config.AnimDict = "amb_work@world_human_hammer@table@male_a@trans"
Config.CraftAnim = {
    "base_trans_base",
}


Config.CraftArme = {
    [1] = vector3(1328.833, -1323.346, 76.88589), --- rhodes
    [2] = vector3(-1841.593, -414.5283, 161.2887),  --- straw
}

Config.CraftingsReceipe = {
    ['WEAPON_REVOLVER_CATTLEMAN'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crossecattleman',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmecattleman',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'barilletcattleman',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canoncattleman',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_REVOLVER_CATTLEMAN',
        Amount = 1,
        WorkingTime = 60,
        label = 'Colt 1873',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/revolverstock.png', text = "Crosse Colt 1873",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolverframe.png', text = "Corps d'arme Colt 1873",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolvercylinder.png', text = "Barillet Colt 1873",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/shortbarrel.png', text = "Canon Colt 1873",count = "x1"}}
    },
    ['WEAPON_REVOLVER_SCHOFIELD'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crosseschofield',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmeschofield',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'barilletschofield',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canonschofield',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_REVOLVER_SCHOFIELD',
        Amount = 1,
        WorkingTime = 60,
        label = 'Smith & Wesson Model 3',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/revolverstock.png', text = "Crosse Smith & Wesson Model 3",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolverframe.png', text = "Corps d'arme Smith & Wesson Model 3",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolvercylinder.png', text = "Barillet Smith & Wesson Model 3",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/shortbarrel.png', text = "Canon Smith & Wesson Model 3",count = "x1"}}
    },
    ['WEAPON_REVOLVER_DOUBLEACTION'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crossedoubleaction',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmedoubleaction',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'barilletdoubleaction',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canondoubleaction',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_REVOLVER_DOUBLEACTION',
        Amount = 1,
        WorkingTime = 60,
        label = '1873 Chamelot-Delvigne',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/revolverstock.png', text = "Crosse 1873 Chamelot-Delvigne",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolverframe.png', text = "Corps d'arme 1873 Chamelot-Delvigne",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolvercylinder.png', text = "Barillet 1873 Chamelot-Delvigne",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/shortbarrel.png', text = "Canon 1873 Chamelot-Delvigne",count = "x1"}}
    },
    ['WEAPON_REVOLVER_LEMAT'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crosselemat',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmelemat',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'barilletlemat',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canonlemat',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_REVOLVER_LEMAT',
        Amount = 1,
        WorkingTime = 60,
        label = 'Lemat Revolver',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/revolverstock.png', text = "Crosse Lemat Revolver",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolverframe.png', text = "Corps d'arme Lemat Revolver",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolvercylinder.png', text = "Barillet Lemat Revolver",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/shortbarrel.png', text = "Canon Lemat Revolver",count = "x1"}}
    },
    ['WEAPON_REVOLVER_NAVY'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crossenavy',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmenavy',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'barilletnavy',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canonnavy',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_REVOLVER_NAVY',
        Amount = 1,
        WorkingTime = 60,
        label = 'Colt 1851 Navy',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/revolverstock.png', text = "Crosse Colt 1851 Navy",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolverframe.png', text = "Corps d'arme Colt 1851 Navy",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolvercylinder.png', text = "Barillet Colt 1851 Navy",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/shortbarrel.png', text = "Canon Colt 1851 Navy",count = "x1"}}
    },
    ['WEAPON_PISTOL_VOLCANIC'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crossevolcanic',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmevolcanic',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'levierdarmementvolcanic',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canonvolcanic',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_PISTOL_VOLCANIC',
        Amount = 1,
        WorkingTime = 60,
        label = 'Smith & Wesson 1855',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/revolverstock.png', text = "Crosse Smith & Wesson 1855",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolverframe.png', text = "Corps d'arme Smith & Wesson 1855",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_scrap_metal.png', text = "Levier d'armement Smith & Wesson 1855",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/shortbarrel.png', text = "Canon Smith & Wesson 1855",count = "x1"}}
    },
    ['WEAPON_REPEATER_EVANS'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crosseevans',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmeevans',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'levierdarmementevans',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canonevans',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_REPEATER_EVANS',
        Amount = 1,
        WorkingTime = 60,
        label = 'Evans',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/longbarrel.png', text = "Crosse Evans",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/repeaterframe.png', text = "Corps d'arme Evans",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_scrap_metal.png', text = "Levier d'armement Evans",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/longbarrel.png', text = "Canon Evans",count = "x1"}}
    },
    ['WEAPON_REPEATER_CARBINE'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crossecarabine',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmecarabine',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'levierdarmementcarabine',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canoncarabine',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_REPEATER_CARBINE',
        Amount = 1,
        WorkingTime = 60,
        label = 'M1865 Spencer',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/longbarrel.png', text = "Crosse M1865 Spencer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/repeaterframe.png', text = "Corps d'arme M1865 Spencer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_scrap_metal.png', text = "Levier d'armement M1865 Spencer",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/longbarrel.png', text = "Canon M1865 Spencer",count = "x1"}}
    },
    ['WEAPON_REPEATER_WINCHESTER'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crosselancaster',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmelancaster',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'levierdarmementlancaster',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canonlancaster',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_REPEATER_WINCHESTER',
        Amount = 1,
        WorkingTime = 60,
        label = 'Winchester 1873',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/longbarrel.png', text = "Crosse Winchester 1873",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/repeaterframe.png', text = "Corps d'arme Winchester 1873",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_scrap_metal.png', text = "Levier d'armement Winchester 1873",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/longbarrel.png', text = "Canon Winchester 1873",count = "x1"}}
    },
    ['WEAPON_REPEATER_HENRY'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crosselitchfield',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmelitchfield',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'levierdarmementlitchfield',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canonlitchfield',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_REPEATER_HENRY',
        Amount = 1,
        WorkingTime = 60,
        label = '1860 Henry',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/longbarrel.png', text = "Crosse 1860 Henry",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/repeaterframe.png', text = "Corps d'arme 1860 Henry",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_scrap_metal.png', text = "Levier d'armement 1860 Henry",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/longbarrel.png', text = "Canon 1860 Henry",count = "x1"}}
    },
    ['WEAPON_RIFLE_SPRINGFIELD'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crossespringfield',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmespringfield',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'levierdarmementspringfield',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canonspringfield',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_RIFLE_SPRINGFIELD',
        Amount = 1,
        WorkingTime = 60,
        label = 'Springfield Model 1873',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/shtgn_stock.png', text = "Crosse Springfield Model 1873",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/elephantrifleframe.png', text = "Corps d'arme Springfield Model 1873",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_scrap_metal.png', text = "Levier d'armement Springfield Model 1873",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/lbarrel.png', text = "Canon Springfield Model 1873",count = "x1"}}
    },
    ['WEAPON_SNIPERRIFLE_ROLLINGBLOCK'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crosserollingblock',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmerollingblock',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'levierdarmementrollingblock',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canonrollingblock',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_SNIPERRIFLE_ROLLINGBLOCK',
        Amount = 1,
        WorkingTime = 60,
        label = 'Remington Rolling Block',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/shtgn_stock.png', text = "Crosse Remington Rolling Block",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/elephantrifleframe.png', text = "Corps d'arme Remington Rolling Block",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_scrap_metal.png', text = "Levier d'armement Remington Rolling Block",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/lbarrel.png', text = "Canon Remington Rolling Block",count = "x1"}}
    },
    ['WEAPON_SHOTGUN_DOUBLEBARREL'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crossedoublecanon',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmedoublecanon',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'levierdarmementdoublecanon',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canondoublecanon',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_SHOTGUN_DOUBLEBARREL',
        Amount = 1,
        WorkingTime = 60,
        label = 'Colt 1883',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/rptr_stock.png', text = "Crosse Colt 1883",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/elp_frame.png', text = "Corps d'arme Colt 1883",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_scrap_metal.png', text = "Levier d'armement Colt 1883",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/elp_frame.png', text = "Canon Colt 1883",count = "x1"}}
    },
    ['WEAPON_SHOTGUN_SAWEDOFF'] = {
        type = 'armurerie',
        Itemtocraft = 4,
        ItemReceipe1Name = 'crossecanonscie',
        ItemReceipe1Amount = 1,
        ItemReceipe2Name = 'corpsdarmecanonscie',
        ItemReceipe2Amount = 1,
        ItemReceipe3Name = 'levierdarmementcanonscie',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'canoncanonscie',
        ItemReceipe4Amount = 1,
        ItemToGive = 'WEAPON_SHOTGUN_SAWEDOFF',
        Amount = 1,
        WorkingTime = 60,
        label = 'Colt 1883 Scié',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/riflestock.png', text = "Crosse Colt 1883 Scié",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/revolverframe.png', text = "Corps d'arme Colt 1883 Scié",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/provision_scrap_metal.png', text = "Levier d'armement Colt 1883 Scié",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/shortbarrel.png', text = "Canon Colt 1883 Scié",count = "x1"}}
    },
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
    [392538360]                         = 1.7,          -- weapon_shotgun_sawedoff
    [575725904]                         = 1.7,          -- weapon_shotgun_doublebarrel_exotic
    [834124286]                         = 0.7,          -- weapon_shotgun_pump
    [1674213418]                        = 0.7,          -- weapon_shotgun_repeating
    [1838922096]                        = 0.7,          -- weapon_shotgun_semiauto
    [1845102363]                        = 1.7,          -- weapon_shotgun_doublebarrel
    [1402226560]                        = 0.7,          -- weapon_sniperrifle_carcano
    [3788682007]                        = 0.7,          -- weapon_sniperrifle_rollingblock
    [-2002235300]                        = 0.7,          -- bow
    [115405099]                        = 0.7,          -- bow improved
}

Config.DamageModifier = {
    [34411519]                          = 0.8,          -- weapon_pistol_volcanic 6 balles
    -- [1252941818]                        = 0.5,          -- weapon_pistol_mauser_drunk
    -- [1534638301]                        = 0.5,          -- weapon_pistol_m1899
    -- [1701864918]                        = 0.5,          -- weapon_pistol_semiauto
    -- [2239809086]                        = 0.5,          -- weapon_pistol_mauser

    [1905553950]                        = 0.5,          -- weapon_repeater_evans = evans 12 balles
    [-1783478894]                        = 0.75,          -- weapon_repeater_henry = litchfield 7 balles
    [-1471716628]                        = 0.70,          -- weapon_repeater_winchester = lancaster 8 balles
    [-183018591]                        = 0.8,          -- weapon_repeater_carbine = carbine 8 balles

    [127400949]                         = 1.3,          -- weapon_revolver_doubleaction 9 balles
    [2212320791]                        = 1.2,          -- weapon_revolver_doubleaction_gambler
    [379542007]                         = 0.6,          -- weapon_revolver_cattleman 10 balles
    [383145463]                         = 0.6,          -- weapon_revolver_cattleman_mexican
    [1529685685]                        = 0.7,          -- weapon_revolver_lemat 9 balles
    [132728264]                        = 1.0,          -- weapon_revolver_navy  6 balles
    [2075992054]                        = 0.67,          -- weapon_revolver_schofield

    [1676963302]                        = 1.0,          -- weapon_rifle_springfield 4 balles
    -- [1999408598]                        = 1.0,          -- weapon_rifle_boltaction
    -- [1402226560]                        = 0.5,          -- weapon_sniperrifle_carcano
    [-506285289]                        = 0.35,          -- weapon_sniperrifle_rollingblock
    -- [3724000286]                        = 0.5,          -- weapon_rifle_varmint

    [392538360]                         = 0.45,          -- weapon_shotgun_sawedoff
    [575725904]                         = 0.55,          -- weapon_shotgun_doublebarrel_exotic
    -- [834124286]                         = 0.5,          -- weapon_shotgun_pump
    -- [1674213418]                        = 0.5,          -- weapon_shotgun_repeating
    -- [1838922096]                        = 0.5,          -- weapon_shotgun_semiauto
    [1845102363]                        = 0.55,          -- weapon_shotgun_doublebarrel




    [-2002235300]                        = 0.7,          -- bow
    [115405099]                        = 1.0,          -- bow improved
}
