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
    ["COMPOSITE_LOOTABLE_BURDOCK_ROOT_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {634.2966, 1443.314, 185.551, 15.0},
            {2008.353, 80.90195, 76.84789, 15.0},
            {-1555.16, -137.1601, 126.1494, 15.0},
            {-1731.651, -903.3646, 101.9832, 15.0}
        },
        maxSpawn = 7,--How much props is cached
        propMax = 7,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"barbane", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_HUMMINGBIRD_SAGE_DEF"] =  { 
        blipSprite = 0,
        blipName = "zesen",
        coords = {
            {125.9249, 982.7355, 210.9116, 15.0},
            {2092.533, 116.5939, 70.97131, 15.0},
            {2099.604, 537.5249, 118.0403, 15.0},
            {-1236.328, -251.1011, 97.74142, 15.0},
            {-2193.928, -229.0691, 190.4592, 15.0},
            {-2262.983, -1381.816, 141.6076, 15.0}
        },
        maxSpawn = 6,--How much props is cached
        propMax = 6,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"saugeducolibri", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_WILD_MINT_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {981.2698, -1232.413, 59.98701, 15.0},
            {2628.306, 640.9957, 73.90434, 15.0},
            {1637.062, 1293.967, 157.1505, 15.0},
            {-905.2833, -538.3448, 71.80321, 15.0},
            {-1918.339, -1517.835, 105.9362, 15.0},
            {-1774.071, -301.3089, 181.8485, 15.0}
            
        },
        maxSpawn = 10,--How much props is cached
        propMax = 10,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"menthesauvage", 4, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_PARASOL_MUSHROOM_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {1370.721, -943.9273, 53.40933, 15.0},
            {1823.693, -375.2607, 44.39895, 15.0},
            {2118.517, 103.6463, 70.24908, 15.0},
            {2505.32, 706.6677, 75.97889, 15.0}
        },
        maxSpawn = 8,--How much props is cached
        propMax = 8,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"coulemelle", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_MILKWEED_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {2033.632, -1022.402, 43.35403, 15.0},
            {2262.735, -385.3071, 42.34921, 15.0},
            {-362.0679, 246.0696, 66.14816, 15.0}
        },
        maxSpawn = 8,--How much props is cached
        propMax = 8,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"asclepiade", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_ALASKAN_GINSENG_ROOT_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {-302.4985, 1026.319, 130.711, 15.0},
            {-1483.752, 586.595, 115.9719, 15.0},
            {-2174.6, -357.8328, 187.5935, 15.0},
            {80.4672, 875.4934, 210.774, 15.0}


        },
        maxSpawn = 5,--How much props is cached
        propMax = 5,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"ginseng", 2, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_EVERGREEN_HUCKLEBERRY_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {941.0305, 85.52578, 111.9082, 15.0},
            {1491.636, -1880.136, 50.86975, 15.0},
            {-24.4986, -579.2489, 59.20609, 15.0},
            {-1581.555, -715.8248, 134.1635, 15.0},
            {-2172.017, -1458.004, 138.2527, 15.0},
            {-796.1694, -845.8452, 53.48745, 15.0}
        },
        maxSpawn = 10,--How much props is cached
        propMax = 10,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"millefeuille", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_CHANTERELLES_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {1309.872, -934.049, 53.68198, 15.0},
            {1806.273, -537.7383, 42.75464, 15.0},
            {1986.373, -1237.09, 42.67138, 15.0},
            {-2223.153, -345.016, 180.5318, 15.0},
            {-1839.789, -1080.536, 84.08539, 15.0}
    
        },
        maxSpawn = 8,--How much props is cached
        propMax = 8,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"chanterelle", 2, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_RAMS_HEAD_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {2203.435, -191.4243, 47.75746, 15.0},
            {-830.4506, 528.0355, 62.94004, 15.0},
            {-2468.545, 470.9136, 144.224, 15.0},
            {-1975.521, 684.8396, 123.636, 15.0},
            {609.2662, 1463.395, 190.9937, 15.0}
        },
        maxSpawn = 6,--How much props is cached
        propMax = 6,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"pouledesbois", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_DESERT_SAGE_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {-733.5509, -1596.317, 54.26407, 15.0},
            {-1134.55, -1401.119, 71.66103, 15.0},
            {-753.8103, -834.6329, 51.96618, 15.0}
        },
        maxSpawn = 3,--How much props is cached
        propMax = 3,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"saugedudesert", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_COMMON_BULRUSH_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {-1575.593, -1044.217, 66.48918, 15.0},
            {-2747.818, -341.1842, 148.69, 15.0},
            {-742.4996, -999.5875, 43.59007, 15.0},
            {-432.2136, 43.71481, 43.29914, 15.0},
            {-748.4709, 529.829, 57.08273, 15.0},
            {-7.940222, 1513.159, 114.2799, 15.0},
            {2363.588, -661.6688, 41.96912, 15.0},
            {1745.068, -1170.501, 41.737, 15.0},
            {672.7833, -1267.653, 43.98404, 15.0},
            {177.8612, -608.237, 46.73311, 15.0}



        },
        maxSpawn = 10,--How much props is cached
        propMax = 10,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"jonccommun", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_ENGLISH_MACE_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {1387.44, -1694.526, 67.42712, 15.0},
            {2614.06, -452.0338, 42.52893, 15.0},
            {-1712.851, -2483.187, 48.88267, 15.0},
            {-1150.858, -739.7994, 66.30392, 15.0}
        },
        maxSpawn = 7,--How much props is cached
        propMax = 7,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"achillevisqueuse", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_WILD_FEVERFEW_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {1141.5, 620.3223, 94.32296, 15.0},
            {2099.601, 98.6325, 70.67999, 15.0},
            {980.3708, 76.83521, 106.147, 15.0},
            {-1823.146, -954.3797, 108.086, 15.0},
            {-1425.799, 226.543, 100.2333, 15.0}
        
        },
        maxSpawn = 8,--How much props is cached
        propMax = 8,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"camomillesauvage", 3, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_BAY_BOLETE_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {31.85101, 1196.117, 180.7177, 15.0},
            {1234.791, -256.5401, 96.95807, 15.0},
            {-1244.951, -262.1152, 99.44203, 15.0}
        },
        maxSpawn = 10,--How much props is cached
        propMax = 10,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"boletbai", 1, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_WINTERGREEN_BERRY_DEF"] =  { 
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {1671.244, 768.7167, 136.2882, 15.0},
            {2393.585, -653.2073, 42.27081, 15.0},
            {1687.751, -1168.159, 41.45555, 15.0},
            {-1255.429, -90.68906, 84.14188, 15.0},
            {-2193.763, 428.9289, 129.5555, 15.0}
        },
        maxSpawn = 8,--How much props is cached
        propMax = 8,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"baiedegaultherie", 5, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_PARASOL_MUSHROOM_DEF"] {
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {-2322.441, 92.69701, 221.4515, 15.0},
            {-2257.022, -1344.283, 133.9821, 15.0},
          
        },
        maxSpawn = 4,--How much props is cached
        propMax = 4,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"champignontoxique", 2, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_OLEANDER_SAGE_DEF"] {
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {2353.372, -797.1579, 41.71259, 15.0},
            {1898.907, -866.2166, 42.17447, 15.0},
          
        },
        maxSpawn = 4,--How much props is cached
        propMax = 4,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"laurierrose", 2, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
    ["COMPOSITE_LOOTABLE_WILD_CARROT_DEF"] {
        blipSprite = 0,
        blipName = "Ženšen",
        coords = {
            {1460.549, -1149.898, 68.23778, 15.0},
            {1488.161, -1935.285, 46.63864, 15.0},
            {1488.161, -1935.285, 46.63864, 15.0},
            {1009.51, -734.7998, 87.55134, 15.0},
            {-1895.552, -330.5616, 184.6244, 15.0},
            {-1131.67, -417.085, 104.1743, 15.0},
            {-1305.521, 511.2329, 93.50326, 15.0},
            {-1126.826, -482.9183, 90.74239, 15.0},
            {-1126.826, -482.9183, 90.74239, 15.0},
          
        },
        maxSpawn = 10,--How much props is cached
        propMax = 10,--Spawn max props on limit
        canGatherMore = 1,--How much you can gather 1 entity
        grounded = 0.0,--(Grounded bring entity more under ground if you have flying prop)

        randomized = false,--If you enable Randomized you get 1 from list
        items = {
            {"carrotesauvages", 5, "Ženšen"},
        },
        animDict = "",
        animPart = "",
        animDur = 0
    },
}