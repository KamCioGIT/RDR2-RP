Config = {}

Config.GoldPanAnimations = {
    "panning_idle_no_water",
    "SEARCH02",
    "panning_idle_no_water",
    "SEARCH04",
}

Config.GoldRamp = GetHashKey("p_goldcradlestand01x") -- Rampe de lavage
Config.WorkingTime = 5000

Config.AnimDict = "amb_work@world_human_hammer@table@male_a@trans"
Config.CraftAnim = {
    "base_trans_base",
}

Config.RampInDict = 'mech_dynamic@world_player_dynamic_kneel_ground@tend@male_a@stand_enter@tend1'
Config.RampInAnim = {
    "enter_back_rf",

}

Config.RampOutDict = 'mech_dynamic@world_player_dynamic_kneel_ground@tend@male_a@stand_exit@tend1'
Config.RampOutAnim = {
    "exit_front",

}


Config.RiverChances = {
    [-1308233316] = { -- Lower Montana River
        chanceToGet = 40,
        chanceOfTwo = 20,
    },
    
    [-1781130443] = { -- Upper Montana River
        chanceToGet = 50,
        chanceOfTwo = 20,
    },
    
    [650214731] = { -- Beartoothbeck
        chanceToGet = 50,
        chanceOfTwo = 20,
    },
    
    [370072007] = { -- Dakota River
        chanceToGet = 40,
        chanceOfTwo = 20,
    }, 
    [-1410384421] = { -- Little Creek River
        chanceToGet = 55,
        chanceOfTwo = 20,
    },
    [-1245451421] = { -- Deadboot Creek
        chanceToGet = 50,
        chanceOfTwo = 20,
    },
    [469159176] = { -- Dewberry Creek
        chanceToGet = 20,
        chanceOfTwo = 10,
    },
    [-1276586360] = { -- Hawk eye creek Strawberry
        chanceToGet = 20,
        chanceOfTwo = 10,
    },
    [2005774838] = { -- RingNeck Creek Lemoyne
        chanceToGet = 20,
        chanceOfTwo = 10,
    },
    [-218679770] = { -- Spider Gorge - Ambarino neige
        chanceToGet = 40,
        chanceOfTwo = 20,
    },
    [-261541730] = { -- Whinyard Strait
        chanceToGet = 60,
        chanceOfTwo = 30,
    },

    
}




-- Config.DistrictChances = {
--     [0x78BFE1AC] = { -- BayouNwa --
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0x3108C492] = { -- Bigvalley ++
--         chanceToGet = 4,
--         chanceOfTwo = 2,
--     },
--     [0x4DFA0B50] = { -- Bluewater Marsh --
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0xF9831C72] = { -- Cholla Springs ++
--         chanceToGet = 4,
--         chanceOfTwo = 2,
--     },
--     [0x6D67801E] = { -- Cumberland ++ 
--         chanceToGet = 4,
--         chanceOfTwo = 2,
--     },
--     [0x19700C95] = { -- DiezCoronas --
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0x84D7AD0E] = { -- Gaptooth Ridge ++ 
--         chanceToGet = 4,
--         chanceOfTwo = 3,
--     },
--     [0x1C68EA97] = { -- Great Plains -- 
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0xF8D68DC1] = { -- Grizzlies East ++  
--         chanceToGet = 3,
--         chanceOfTwo = 3,
--     },
--     [0x62162401] = { -- Grizzlies West ++ 
--         chanceToGet = 3,
--         chanceOfTwo = 2,
--     },
--     [0xE1736CD7] = { -- GuarmaD -- 
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0x07D4FF5F] = { -- Heartlands -- 
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0x35390B10] = { -- HennigansStead ++ 
--         chanceToGet = 4,
--         chanceOfTwo = 3,
--     },
--     [0xB1531168] = { -- Perdido -- 
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0x56A7C746] = { -- PuntaOrgullo -- 
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0x8016C23F] = { -- RioBravo ++ 
--         chanceToGet = 3,
--         chanceOfTwo = 2,
--     },
--     [0x0AA5F25D] = { -- roanoke -- 
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0xCC7C3314] = { -- scarlettMeadows -- 
--         chanceToGet = 0,
--         chanceOfTwo = 0,
--     },
--     [0x6467EF09] = { -- Tall Trees ++ 
--         chanceToGet = 4,
--         chanceOfTwo = 3,
--     },
--     [-2145992129] = {
--         changeToGet = 5,
--         chanceOfTwo = 3,
--     },
-- }
