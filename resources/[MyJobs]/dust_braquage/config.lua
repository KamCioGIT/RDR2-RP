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
    [6] = {gun = true, dynamite = 0, pos = vector3(-877.6141, -1327.109, 42.96725), started = false, npc = nil, npcmodel = "mp_u_m_m_lom_train_clerk_01", npcheading = 177.5272, npccoords = vector3(-874.9944, -1327.21, 42.96835)}, ---- bw poste
    [7] = {gun = true, dynamite = 0, pos = vector3(-1763.22, -382.1005, 156.7385), started = false, npc = nil, npcmodel = "mp_u_m_m_lom_train_conductor_01", npcheading = 45.5272, npccoords = vector3(-1763.813, -385.1159, 156.7399)}, ---- straw poste
    [8] = {gun = true, dynamite = 0, pos = vector3(1228.886, -1294.315, 75.90707), started = false, npc = nil, npcmodel = "u_m_o_rigtrainstationworker_01", npcheading = 43.5272, npccoords = vector3(1226.642, -1295.094, 75.90526)}, ---- rhodes poste
    [9] = {gun = true, dynamite = 0, pos = vector3(2745.823, -1398.605, 45.1831), started = false, npc = nil, npcmodel = "u_m_m_tumtrainstationworker_01", npcheading = 202.5272, npccoords = vector3(2748.89, -1398.156, 45.18308)}, ---- stdenis poste
}
Config.HandsUpAnim = {
    [1] = 	{dict= "ai_temp@base", anim = "handsup_base"},
    }
    

Config.Vault = {
------ RHODES ----------
        {difficulty = "simple", pos = vector3(1291.873, -1309.8, 76.04002), cashmax = 20, cashmin = 13, items = {
            ["bouclesoreilles"] = {amount = 2, chance = 40},
            ["pierreprecieuse"] = {amount = 1, chance = 60},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1290.022, -1312.351, 76.03999), cashmax = 20, cashmin = 13, items = {
            ["brocheruby"] = {amount = 1, chance = 25},
            ["alliance"] = {amount = 2, chance = 35},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1288.659, -1311.141, 76.03963), cashmax = 20, cashmin = 13, items = {
            ["epinglecheveux"] = {amount = 2, chance = 45},
            ["peigneivoire"] = {amount = 1, chance = 50},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1290.25, -1306.203, 76.0417), cashmax = 20, cashmin = 13, items = {
            ["collierperles"] = {amount = 1, chance = 75},
            ["dentor"] = {amount = 3, chance = 35},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1288.809, -1303.837, 76.04027), cashmax = 20, cashmin = 13, items = {
            ["watch3"] = {amount = 2, chance = 35},
            ["pierreprecieuse"] = {amount = 1, chance = 15},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1291.027, -1306.732, 76.04198), cashmax = 20, cashmin = 13, items = {
            ["bouclesoreilles"] = {amount = 1, chance = 25},
            ["alliance"] = {amount = 2, chance = 45},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1287.84, -1309.209, 76.0681), cashmax = 50, cashmin = 20, items = {
            ["bagueor"] = {amount = 2, chance = 35},
            ["pierreprecieuse"] = {amount = 1, chance = 15},
        }}, -- rhodes simple
        {difficulty = "simple", pos = vector3(1282.415, -1311.285, 76.03952), cashmax = 50, cashmin = 20, items = {
            ["collierperles"] = {amount = 2, chance = 20},
            ["watch3"] = {amount = 1, chance = 55},
        }}, -- rhodes simple dynamite
        {difficulty = "simple", pos = vector3(1282.824, -1312.411, 76.03952), cashmax = 50, cashmin = 20, items = {
            ["epinglecheveux"] = {amount = 2, chance = 40},
            ["brocheruby"] = {amount = 1, chance = 35},
        }}, -- rhodes simple dynamite
    

        {difficulty = "hard", pos = vector3(1287.978, -1313.313, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["watch1"] = {amount = 1, chance = 50},
        }}, -- rhodes hard
        {difficulty = "hard", pos = vector3(1288.527, -1313.928, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["watch1"] = {amount = 1, chance = 30},
            ["sacbijoux"] = {amount = 1, chance = 15},
        }}, -- rhodes hard
        {difficulty = "hard", pos = vector3(1287.671, -1314.883, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["diamant"] = {amount = 2, chance = 75},
            ["obligations"] = {amount = 2, chance = 20},
        }}, -- rhodes hard
        {difficulty = "hard", pos = vector3(1286.957, -1315.78, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["rivierediamants"] = {amount = 1, chance = 35},
            ["watch7"] = {amount = 2, chance = 95},
        }}, -- rhodes hard
        {difficulty = "hard", pos = vector3(1286.318, -1315.335, 76.03976), cashmax = 50, cashmin = 20, items = {
            ["boitebijoux"] = {amount = 1, chance = 25},
            ["bagueor"] = {amount = 2, chance = 100},
        }}, -- rhodes hard

-------- BLACKWATER ----------------
        {difficulty = "simple", pos = vector3(-813.7041, -1273.123, 42.63772), cashmax = 50, cashmin = 20, items = {
            ["epinglecheveux"] = {amount = 2, chance = 35},
            ["boucleceinture"] = {amount = 1, chance = 60},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-811.8837, -1273.173, 42.63772), cashmax = 50, cashmin = 20, items = {
            ["alliance"] = {amount = 1, chance = 35},
            ["bouclesoreilles"] = {amount = 2, chance = 50},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-809.7764, -1273.391, 42.63772), cashmax = 50, cashmin = 20, items = {
            ["dentor"] = {amount = 1, chance = 85},
            ["peigneivoire"] = {amount = 2, chance = 50},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-810.8128, -1275.448, 42.63773), cashmax = 50, cashmin = 20, items = {
            ["pierreprecieuse"] = {amount = 1, chance = 25},
            ["brocheruby"] = {amount = 2, chance = 35},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-815.4904, -1273.273, 42.63773), cashmax = 50, cashmin = 20, items = {
            ["collierperles"] = {amount = 2, chance = 45},
            ["watch3"] = {amount = 1, chance = 70},
        }}, -- bw simple
        {difficulty = "simple", pos = vector3(-814.0225, -1275.481, 42.63772), cashmax = 50, cashmin = 20, items = {
            ["alliance"] = {amount = 2, chance = 25},
            ["bagueor"] = {amount = 1, chance = 40},
        }}, -- bw simple

        {difficulty = "hard", pos = vector3(-821.0154, -1274.952, 42.64577), cashmax = 50, cashmin = 20, items = {
            ["obligations"] = {amount = 3, chance = 15},
            ["bagueor"] = {amount = 2, chance = 50},
        }}, -- bw hard
        {difficulty = "hard", pos = vector3(-821.0328, -1273.42, 42.64167), cashmax = 50, cashmin = 20, items = {
            ["sacbijoux"] = {amount = 1, chance = 20},
            ["diamant"] = {amount = 2, chance = 40},
        }}, -- bw hard
        {difficulty = "hard", pos = vector3(-820.0203, -1273.432, 42.65204), cashmax = 50, cashmin = 20, items = {
            ["watch1"] = {amount = 1, chance = 25},
            ["rivierediamants"] = {amount = 1, chance = 40},
        }}, -- bw hard
        {difficulty = "hard", pos = vector3(-818.5985, -1273.44, 42.66227), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 20},
            ["baguediamant"] = {amount = 2, chance = 45},
        }}, -- bw hard


--------- ST DENIS ----------
        {difficulty = "simple", pos = vector3(2640.915, -1301.931, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["lingotor"] = {amount = 1, chance = 25},
            ["watch7"] = {amount = 2, chance = 65},
        }}, -- ST DENIS hard
        {difficulty = "simple", pos = vector3(2642.037, -1304.28, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["boitebijoux"] = {amount = 2, chance = 50},
            ["watch1"] = {amount = 3, chance = 20},
        }}, -- ST DENIS hard
        {difficulty = "simple", pos = vector3(2643.008, -1306.359, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["rivierediamants"] = {amount = 2, chance = 60},
            ["bagueor"] = {amount = 2, chance = 85},
        }}, -- ST DENIS hard
        {difficulty = "simple", pos = vector3(2645.373, -1306.043, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["sacbijoux"] = {amount = 1, chance = 40},
            ["baguediamant"] = {amount = 2, chance = 30},
        }}, -- ST DENIS hard
        {difficulty = "simple", pos = vector3(2644.774, -1304.288, 51.24611), cashmax = 50, cashmin = 20, items = {
            ["diamant"] = {amount = 2, chance = 30},
            ["obligations"] = {amount = 2, chance = 50},
        }}, -- ST DENIS hard

        ----- poste blackwater
        {difficulty = "simple", pos = vector3(-873.8395, -1326.745, 42.9581), cashmax = 25, cashmin = 10, items = {
            ["epinglecheveux"] = {amount = 2, chance = 45},
            ["peigneivoire"] = {amount = 1, chance = 50},
        }},
        ----- poste strawberry
        {difficulty = "simple", pos = vector3(-1761.182, -382.8658, 156.7415), cashmax = 20, cashmin = 5, items = {
            ["collierperles"] = {amount = 1, chance = 75},
            ["dentor"] = {amount = 3, chance = 35},
        }},
        ----- poste rhodes
        {difficulty = "simple", pos = vector3(1229.783, -1297.321, 75.90556), cashmax = 15, cashmin =5, items = {
            ["collierperles"] = {amount = 1, chance = 75},
            ["dentor"] = {amount = 3, chance = 35},
        }},
        ----- poste rhodes
        {difficulty = "simple", pos = vector3(1227.403, -1297.888, 75.90291), cashmax = 15, cashmin = 5, items = {
            ["epinglecheveux"] = {amount = 2, chance = 45},
            ["peigneivoire"] = {amount = 1, chance = 50},
        }},
        ----- poste saint denis
        {difficulty = "simple", pos = vector3(2749.128, -1395.896, 45.18307), cashmax = 25, cashmin = 15, items = {
            ["bouclesoreilles"] = {amount = 2, chance = 40},
            ["pierreprecieuse"] = {amount = 1, chance = 60},
        }},
}