Config = {}
--Timer and zone size
Config.ZoneSize = 2.0 -- Sizes of the zones
Config.lingotorTime = 5000 -- in miliseconds
Config.Policealert = 5000 -- in ms
Config.Cooldown = 120000 -- Cooldown beetwen the robberys

Config.Doors = {
    [4] = {gun = false, dynamite = 1, pos = vector3(-817.0316, -1273.834, 42.64748), started = false}, ---- bw
    [1] = {gun = false, dynamite = 1, pos = vector3(1282.487, -1308.55, 76.03965), started = false}, ---- rhodes
    [5] = {gun = false, dynamite = 5, pos = vector3(2644.074, -1299.911, 51.24611), started = false}, ---- st denis
-------
    [2] = {gun = true, dynamite = 0, pos = vector3(1295.688, -1304.729, 76.04355), started = false, npc = nil, npcmodel = "mp_u_m_m_bankprisoner_01", npcheading = 315.5272, npccoords = vector3(1291.142, -1303.214, 76.04111)}, ---- RHODES
    [3] = {gun = true, dynamite = 0, pos = vector3(-816.1816, -1277.426, 42.63772), started = false, npc = nil, npcmodel = "s_m_m_bankclerk_01", npcheading = 176.5272, npccoords = vector3(-813.2552, -1275.379, 42.6377)}, ---- bw
}
Config.HandsUpAnim = {
    [1] = 	{dict= "ai_temp@base", anim = "handsup_base"},
    }
    

Config.Vault = {
------ RHODES ----------
        {difficulty = "simple", pos = vector3(1291.873, -1309.8, 76.04002), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1290.022, -1312.351, 76.03999), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1288.659, -1311.141, 76.03963), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1290.25, -1306.203, 76.0417), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1288.809, -1303.837, 76.04027), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1291.027, -1306.732, 76.04198), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1287.84, -1309.209, 76.0681), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1282.415, -1311.285, 76.03952), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- rhodes simple dynamite
        {difficulty = "simple", pos = vector3(1282.824, -1312.411, 76.03952), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- rhodes simple dynamite
    

        {difficulty = "hard", pos = vector3(1287.978, -1313.313, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 100},
        }}, -- rhodes hard
        {difficulty = "hard", pos = vector3(1288.527, -1313.928, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 100},
        }}, -- rhodes hard
        {difficulty = "hard", pos = vector3(1287.671, -1314.883, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 100},
        }}, -- rhodes hard
        {difficulty = "hard", pos = vector3(1286.957, -1315.78, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 100},
        }}, -- rhodes hard
        {difficulty = "hard", pos = vector3(1286.318, -1315.335, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 100},
        }}, -- rhodes hard

-------- BLACKWATER ----------------
        {difficulty = "simple", pos = vector3(-813.7041, -1273.123, 42.63772), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-811.8837, -1273.173, 42.63772), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-809.7764, -1273.391, 42.63772), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-810.8128, -1275.448, 42.63773), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-815.4904, -1273.273, 42.63773), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-814.0225, -1275.481, 42.63772), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw simple

        {difficulty = "hard", pos = vector3(-821.0154, -1274.952, 42.64577), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw hard
        {difficulty = "hard", pos = vector3(-821.0328, -1273.42, 42.64167), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw hard
        {difficulty = "hard", pos = vector3(-820.0203, -1273.432, 42.65204), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw hard
        {difficulty = "hard", pos = vector3(-818.5985, -1273.44, 42.66227), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- bw hard


--------- ST DENIS ----------
        {difficulty = "simple", pos = vector3(2640.915, -1301.931, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- ST DENIS hard
        {difficulty = "simple", pos = vector3(2642.037, -1304.28, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- ST DENIS hard
        {difficulty = "simple", pos = vector3(2643.008, -1306.359, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- ST DENIS hard
        {difficulty = "simple", pos = vector3(2645.373, -1306.043, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- ST DENIS hard
        {difficulty = "simple", pos = vector3(2644.774, -1304.288, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["lingotfer"] = {amount = 2, chance = 50},
        }}, -- ST DENIS hard
}