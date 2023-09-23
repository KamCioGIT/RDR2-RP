Config = {}

Config.discordHook = false
Config.webhookLink = ""
Config.webhookColor = 16755884
Config.webhookLanguage = {
    [1] = "Picked animal : ",
    [2] = "Picked herb :",
}


Config.Gum_Notify_NUI = false
Config.Image = "ecology"

Config.TimerForCounter = 120 --This count your herbs in your client cache.  (seconds)
Config.DeleteAfterGatherAnimal = false
Config.PickUp = "Ramasser"
Config.YouPick = "Vous avez ramsassé :"
Config.Header = "Plante"
Config.NotifyTime = 2000

Config.RandomRewardCount = 1-- - If its 0 disabled. This function make random reward count from herbs and animals
--Example you get 3 count from Wild Mint -> you here write 2. Now you get 2-3 counts from wild mint
Config.Herbs = {
    ["crp_cornstalks_bb_sim"] =  {
        blipSprite = -675651933,
        blipName = "Kukurice",
        coords = {
            {174.52, -189.88, 125.96, 15.0},
            {1294.60, -2149.03, 57.30, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.5,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Corn", 1, "Kukuřice"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },
	["s_inv_orchid_blackbat02"] =  {
        blipSprite = 0,
        blipName = "Měsíční svit",
        coords = {
            {-4322.75732421875,-3736.684326171875,-1.54399216175079, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Moon_Herb", 1, "Měsíční svit"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },
	["s_inv_orchid_nghtscnt_01x"] =  {
        blipSprite = -675651933,
        blipName = "Heřmánek",
        coords = {
            {-2311.007080078125,575.5375366210938,119.7043914794922, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Chamomile", 1, "Heřmánek"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },

    ["rdr_bush_paradise_aa_sim"] =  {
        blipSprite = -675651933,
        blipName = "Indigo",
        coords = {
            {-3971.35, -2443.02, -9.07, 15.0},
            {-3489.94, -1942.30, 5.2, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.5,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Indigo", 1, "Indigo"},
        },
        animDict = "mech_pickup@plant@berries",
        animPart = "base",
        animDur = 2000
    },

    ["s_milkweed01x"] =  {
        blipSprite = -675651933,
        blipName = "Chmel",
        coords = {
            {-2009.60, -1245.93, 113.30, 15.0},
            {2213.79, 125.79, 62.88, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.2,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Hop", 1, "Chmel"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },

    ["crp_potato_aa_sim"] =  {
        blipSprite = -675651933,
        blipName = "Brambory",
        coords = {
            {946.92, -1070.28, 60.15, 15.0},
        },
        maxSpawn = 10,
        propMax = 5,
        canGatherMore = 5,
        grounded = 0.3,

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Potato", 1, "Brambory"},
        },
        animDict = "amb_misc@world_human_concertina_pickup@male_a@base",
        animPart = "base",
        animDur = 1000
    },

    ["crp_sugarcane_ac_sim"] =  {
        blipSprite = -675651933,
        blipName = "Cukrova trtina",
        coords = {
            {1543.63, -7047.65, 81.87, 15.0},
        },
        maxSpawn = 10,
        propMax = 5,
        canGatherMore = 1,
        grounded = 0.2,

        randomized = false,
        items = {
            {"Sugarcane", 1, "Cukrova trtina"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },

    ["crp_sugarcane_ac_sim"] =  {
        blipSprite = -675651933,
        blipName = "Cukrova trtina",
        coords = {
            {1543.63, -7047.65, 81.87, 15.0},
        },
        maxSpawn = 10,
        propMax = 5,
        canGatherMore = 1,
        grounded = 0.2,

        randomized = false,
        items = {
            {"Sugarcane", 1, "Cukrova trtina"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },

    ["p_watermelon01x"] =  {
        blipSprite = -675651933,
        blipName = "Melouny",
        coords = {
            {891.64, -7140.65, 64.89, 15.0},
        },
        maxSpawn = 10,
        propMax = 5,
        canGatherMore = 1,
        grounded = 0.2,

        randomized = false,
        items = {
            {"Melone", 1, "Melouny"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },

    ["p_tree_banana_01_crt"] =  {
        blipSprite = -675651933,
        blipName = "Banany",
        coords = {
            {1134.29, -7301.16, 72.39, 15.0},
            {686.94, -7476.93, 185.68, 15.0},
        },
        maxSpawn = 10,
        propMax = 5,
        canGatherMore = 5,
        grounded = 0.2,

        randomized = false,
        items = {
            {"Bannana", 1, "Banany"},
        },
        animDict = "mech_pickup@plant@orchid_tree",
        animPart = "base",
        animDur = 4500
    },

    ["rdr_bush_broad_aa_sim"] =  {
        blipSprite = 0,
        blipName = "Koka",
        coords = {
            {1621.03, -7050.09, 92.80, 15.0},
            {1412.68, -7424.38, 97.93, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.2,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Coca", 1, "Koka"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },
	
    ["crp_tobaccoplant_bc_sim"] =  {
        blipSprite = 0,
        blipName = "Guarmský tabák",
        coords = {
            {735.33,-7103.82,47.09, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.2,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Guarma_Tobacco", 1, "Guarmský tabák"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },

	["crp_wheat_dry_aa_sim"] =  {
        blipSprite = 0,
        blipName = "Obili",
        coords = {
            {1038.94, 217.62, 114.11, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.2,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Grain", 1, "Obili"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },

    ["rdr_bush_hedgecore_aa"] =  {
        blipSprite = -675651933,
        blipName = "Vinná réva",
        coords = {
            {-1188.05, -1536.84, 78.35, 20.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.2,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Grape", 1, "Vinná réva"},
        },
        animDict = "mech_pickup@plant@yarrow",
        animPart = "base",
        animDur = 2000
    },

    ["COMPOSITE_LOOTABLE_MILKWEED_DEF"] =  {
        blipSprite = -675651933,
        blipName = "Jahody",
        coords = {
            {-1247.84, -215.87, 98.56, 15.0},
            {-1852.62, 447.03, 114.40, 15.0},
        },
        maxSpawn = 10,
        propMax = 5,
        canGatherMore = 1,
        grounded = 0.0,

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Strawberry", 1, "Jahody"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },

    ["COMPOSITE_LOOTABLE_WILD_CARROT_DEF"] =  {
        blipSprite = 0,
        blipName = "Mrkev",
        coords = {
            {1118.69, 963.67, 128.78, 15.0},
            {-788.26, -850.73, 52.41, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 10,--Spawn max props on limit
        canGatherMore = 2,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Wild_Carrot", 1, "Mrkev"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },

    ["COMPOSITE_LOOTABLE_INDIAN_TOBACCO_DEF"] =  {
        blipSprite = -675651933,
        blipName = "Indian Tobbaco",
        coords = {
            {2086.50, 817.83, 154.9, 15.0},
            {-2451.71, -2787.23, 71.19, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Indian_Tobbaco", 1, "Indian Tobbaco"},
        },
        animDict = "",
        animPart = "",
        animDur = 0 
    },

    ["COMPOSITE_LOOTABLE_WILD_MINT_DEF"] =  {
        blipSprite = -675651933,
        blipName = "Máta",
        coords = {
            {1607.29, 2114.36, 315.80, 15.0},
            {-830.84, -92.79, 75.42, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Wild_Mint", 1, "Máta"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },

    ["COMPOSITE_LOOTABLE_RAMS_HEAD_DEF"] =  {
        blipSprite = -675651933,
        blipName = "Hlíva ústřičná",
        coords = {
            {2180.08, 1749.82, 119.01, 15.0},
            {129.51, 1203.05, 183.14, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Rams_Head", 1, "Hlíva ústřičná"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },

    ["COMPOSITE_LOOTABLE_PARASOL_MUSHROOM_DEF"] =  {
        blipSprite = -675651933,
        blipName = "Muchomůrka",
        coords = {
            {-3483.03, -2793.92, -4.80, 15.0},
            {-2885.62, -236.60, 186.55, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Parasol_Mushroom", 1, "Muchomůrka"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },

    ["COMPOSITE_LOOTABLE_HUMMINGBIRD_SAGE_DEF"] =  {
        blipSprite = -675651933,
        blipName = "Šalvěj",
        coords = {
            {-2175.12, -1755.21, 138.88, 15.0},
            {-1904.82, 739.04, 149.39, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Hummingbird_Sage", 1, "Šalvěj"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_EVERGREEN_HUCKLEBERRY_DEF"] =  {
        blipSprite = -675651933,
        blipName = "Vavřín",
        coords = {
            { 940.94, -453.47, 85.95, 15.0},
            {2761.00, 1980.98, 161.73, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Evergreen_Huckleberry", 1, "Vavřín"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },

    ["COMPOSITE_LOOTABLE_BLACK_BERRY_DEF"] =  {
        blipSprite = -675651933,
        blipName = "Boruvky",
        coords = {
            {-981.45, 176.43, 86.31, 15.0},
            {-1648.68, -845.93, 94.31, 15.0},
            {-1651.96, -1872.25, 80.97, 15.0},
            {1115.07, 33.68, 89.57, 15.0}, 
            {1200.83, -836.70, 79.55, 15.0},
            {1989.62, 421.65, 115.70, 15.0},
            {2289.05, 1446.60, 109.44, 15.0},
            {717.08, 1497.26, 194.54, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Blueberry", 5, "Borůvky"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
	["COMPOSITE_LOOTABLE_ALASKAN_GINSENG_ROOT_DEF"] =  { 
        blipSprite = -675651933,
        blipName = "Ženšen",
        coords = {
            {206.30, 1884.69, 206.19, 15.0},
        },
        maxSpawn = 10,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"Alaskan_Ginseng", 1, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
}

-- Config.Animals = {
--     [GetHashKey("a_c_alligator_01")] =   {
--         randomized = false,
--         items = {
--             {"crocalligator", 3, "Croc d'Alligator"},
--         }
--     },    
--     [GetHashKey("a_c_alligator_03")] =   {
--         randomized = false,
--         items = {
--             {"crocalligator", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Fang", 1, "Zvířecí Zub"},
--         }
--     },   
--     [GetHashKey("a_c_armadillo_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_badger_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Fang", 1, "Zvířecí Zub"},
--         }
--     },    
--     [GetHashKey("a_c_bat_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_bear_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Bear_Paw", 1, "Medvědí Tlapa"},
-- 			{"Animal_Tallow", 2, "Zvířecí Lůj"},
--         }
--     },    
--     [GetHashKey("a_c_bearblack_01")] =   {
--         randomized = false,
--         items = {
--             {"graisse", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 		    {"Bear_Paw", 1, "Medvědí Tlapa"},
-- 			{"Animal_Tallow", 1, "Zvířecí Lůj"},
--         }
--     },    
--     [GetHashKey("a_c_beaver_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_bighornram_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Horn", 1, "Roh"},
--         }
--     },    
--     [GetHashKey("a_c_boar_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Animal_Tallow", 1, "Zvířecí Lůj"},
--         }
--     },    
--     [GetHashKey("a_c_buck_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Antler_Mall", 1, "Malé Paroží"},
--         }
--     },    
--     [GetHashKey("a_c_buffalo_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Horn", 1, "Roh"},
-- 			{"Animal_Tallow", 1, "Zvířecí Lůj"},
--         }
--     },    
--     [GetHashKey("a_c_bull_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Horn", 1, "Roh"},
--         }
--     },    
--     [GetHashKey("a_c_cardinal_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_californiacondor_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_carolinaparakeet_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_cedarwaxwing_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_chicken_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_chipmunk_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_cougar_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Claw", 2, "Dráp"},
--         }
--     },    
--     [GetHashKey("a_c_cormorant_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_cow")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Horn", 1, "Roh"},
--         }
--     },    
--     [GetHashKey("a_c_coyote_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Fang", 1, "Zvířecí Zub"},
--         }
--     },    
--     [GetHashKey("a_c_crab_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_cranewhooping_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_crow_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_deer_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Antler_Mall", 1, "Malé Paroží"},
--         }
--     },    
--     [GetHashKey("a_c_duck_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_eagle_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
-- 			{"Claw", 2, "Dráp"},
--         }
--     },    
--     [GetHashKey("a_c_egret_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_elk_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Antler_Big", 1, "Velké Paroží"},
-- 			{"Animal_Tallow", 1, "Zvířecí Lůj"},
--         }
--     },    
--     [GetHashKey("a_c_fox_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Fang", 1, "Zvířecí Zub"},
--         }
--     },    
--     [GetHashKey("a_c_frogbull_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_gilamonster_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_goat_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Horn", 1, "Roh"},
--         }
--     },    
--     [GetHashKey("a_c_goosecanada_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_hawk_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
-- 			{"Claw", 2, "Dráp"},
--         }
--     },    
--     [GetHashKey("a_c_heron_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_iguana_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_iguanadesert_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_javelina_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_loon_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_moose_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Antler_Big", 1, "Velké Paroží"},
-- 			{"Animal_Tallow", 2, "Zvířecí Lůj"},
--         }
--     },    
--     [GetHashKey("a_c_muskrat_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Velká Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_oriole_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_owl_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_ox_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Horn", 1, "Roh"},
--         }
--     },    
--     [GetHashKey("a_c_panther_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Claw", 2, "Dráp"},
--         }
--     },    
--     [GetHashKey("a_c_parrot_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_pelican_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_pheasant_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_pig_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_pigeon")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_possum_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_prairiechicken_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_pronghorn_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Antler_Mall", 1, "Malé Paroží"},
--         }
--     },    
--     [GetHashKey("a_c_quail_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_rabbit_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Rabbit_Paw", 1, "Zaječí Pacička"},
--         }
--     },    
--     [GetHashKey("a_c_raccoon_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Fang", 1, "Zvířecí Zub"},
			
--         }
--     },    
--     [GetHashKey("a_c_rat_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_raven_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_redfootedbooby_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_robin_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_rooster_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_roseatespoonbill_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_seagull_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_sheep_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_skunk_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_snake_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--             {"Snake_Poison", 3, "Hadí jed"},
--         }
--     },    
--     [GetHashKey("a_c_snakeblacktailrattle_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--             {"Snake_Poison", 3, "Hadí jed"},
--         }
--     },    
--     [GetHashKey("a_c_snakeferdelance_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--             {"Snake_Poison", 3, "Hadí jed"},
--         }
--     },    
--     [GetHashKey("a_c_snakewater_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--             {"Snake_Poison", 3, "Hadí jed"},
--         }
--     },    
--     [GetHashKey("a_c_songbird_01")] =   {
--             randomized = false,
--             items = {
--                 {"Meat", 3, "Maso"},
--                 {"Feather", 3, "Pírko"},
--         },
--     },    
--     [GetHashKey("a_c_sparrow_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },
--     [GetHashKey("a_c_squirrel_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_toad_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_turkey_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_turkeywild_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_turtlesnapping_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("a_c_vulture_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_wolf")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Fang", 1, "Zvířecí Zub"},
--         }
--     },    
--     [GetHashKey("a_c_wolf_medium")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Fang", 1, "Zvířecí Zub"},
--         }
--     },    
--     [GetHashKey("a_c_wolf_small")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Fang", 1, "Zvířecí Zub"},
--         }
--     },    
--     [GetHashKey("a_c_woodpecker_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("a_c_woodpecker_02")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("mp_a_c_alligator_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Fang", 1, "Zvířecí Zub"},
-- 			{"Animal_Tallow", 1, "Zvířecí Lůj"},
--         }
--     },    
--     [GetHashKey("mp_a_c_beaver_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
--         }
--     },    
--     [GetHashKey("mp_a_c_bighornram_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Horn", 1, "Roh"},
--         }
--     },    
--     [GetHashKey("mp_a_c_boar_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Small_Leather", 3, "Malá Kůže"},
-- 			{"Animal_Tallow", 1, "Zvířecí Lůj"},
--         }
--     },    
--     [GetHashKey("mp_a_c_buck_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Antler_Mall", 1, "Malé Paroží"},
--         }
--     },    
--     [GetHashKey("mp_a_c_chicken_01")] =   {
--         randomized = false,
--         items = {
--             {"Meat", 3, "Maso"},
--             {"Feather", 3, "Pírko"},
--         }
--     },    
--     [GetHashKey("mp_a_c_cougar_01")] =   {
--         randomized = false,
--         items = {
--             {"Gamey_Meat", 3, "Kvalitní maso"},
--             {"Big_Leather", 3, "Velká Kůže"},
-- 			{"Claw", 2, "Dráp"},
--         }
--     },    
-- }
Config.Animals = {}