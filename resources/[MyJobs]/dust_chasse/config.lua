Config = {}
Config.Blips = true

Config.MsgInteract = "Appuyez sur Entrée"
Config.DistanceToInteract = 2.2

Config.Boucher = 
{    
    vector3(-751.1182, -1285.012, 43.27395), -- Blackwater
    vector3(-1752.77, -394.7479, 156.1887), -- Strawberry
    vector3(-3691.475, -2621.087, -13.73207), -- Armadillo
    vector3(-5508.164, -2947.579, -1.87025), -- Tumbleweed
    vector3(-1985.348, -1646.334, 117.1001), -- Manzanita
    vector3(1296.543, -1279.365, 75.84337), -- Rhodes
    vector3(1420.489, 379.5677, 90.32045), -- Emerald
    vector3(-86.35107, 1550.303, 114.8319),  --- Camp natif
    vector3(2996.416, 565.5698, 44.75896) ---- Van Horn
}

Config.Relais = 
{    
    vector3(-1982.628, -1619.964, 118.0835),-- Manzanita
    vector3(2999.179, 563.036, 45.16215) -- Van Horn
}

Config.Craftcuir = {vector3(-1970.758, -1641.776, 117.1183), vector3(-92.08035, 1552.082, 115.7228), vector3(-1972.92, -1634.835, 117.2469), vector3(3000.897, 561.8671, 44.68987)}

-- Config.Craftviande = vector3(-1986.814, -1642.825, 117.1306)


Config.Animal = {
    [1] =  {["name"] = "Bear",                     ["model"] = -1124266369,  ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 957520252,   ["good"] = 143941906,   ["perfect"] = 1292673537},
    [2] =  {["name"] = "Big Horn Ram",             ["model"] = -15687816381, ["viande"] = "viande",  ["peau"] = "cuir",  ["poor"] = 1796037447,  ["good"] = -476045512,  ["perfect"] = 1795984405},
    [3] =  {["name"] = "Boar",                     ["model"] = 2028722809,   ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 1248540072,  ["good"] = nil,         ["perfect"] = -1858513856},
    [4] =  {["name"] = "Buck",                     ["model"] = -1963605336,  ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 1603936352,  ["good"] = -868657362,  ["perfect"] = -702790226},
    [5] =  {["name"] = "Bison",                    ["model"] = 1556473961,   ["viande"] = "viande",  ["peau"] = "cuir",  ["poor"] = -1730060063, ["good"] = -591117838,  ["perfect"] = -237756948},
    [6] =  {["name"] = "Bull",                     ["model"] = 195700131,    ["viande"] = "viande",  ["peau"] = "cuir",  ["poor"] = 9293261,     ["good"] = -336086818,  ["perfect"] = -53270317},
    [7] =  {["name"] = "Deer",                     ["model"] = 1110710183,   ["viande"] = "viandegibier",      ["peau"] = "cuir",  ["poor"] = -662178186,  ["good"] = -1827027577, ["perfect"] = -1035515486},
    [8] =  {["name"] = "Duck",                     ["model"] = -1003616053,  ["viande"] = "viandevolaille",   ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [9] =  {["name"] = "Eagle",                    ["model"] = 1459778951,   ["viande"] = "viandevolaille",   ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [10] = {["name"] = "Egret",                    ["model"] = 831859211,    ["viande"] = "viandevolaille",   ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [11] = {["name"] = "Elk",                      ["model"] = -2021043433,  ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 2053771712,  ["good"] = 1181652728,  ["perfect"] = -1332163079},
    [12] = {["name"] = "American Red Fox",         ["model"] = 252669332,    ["viande"] = "viandegibier", ["peau"] = "cuir",     ["poor"] = 1647012424,  ["good"] = 238733925,   ["perfect"] = 500722008},
    [13] = {["name"] = "Big Grey Wolf",            ["model"] = -1143398950,  ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 85441452,    ["good"] = 1145777975,  ["perfect"] = 653400939},
    [14] = {["name"] = "Medium Grey Wolf",         ["model"] = -885451903,   ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 85441452,    ["good"] = 1145777975,  ["perfect"] = 653400939},
    [15] = {["name"] = "Small Grey Wolf",          ["model"] = -829273561,   ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 85441452,    ["good"] = 1145777975,  ["perfect"] = 653400939},
    [16] = {["name"] = "Vulture",                  ["model"] = 1104697660,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [17] = {["name"] = "Snapping Turtle",          ["model"] = -407730502,   ["viande"] = "viandereptile",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [18] = {["name"] = "Wild Turkey",              ["model"] = -466054788,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [19] = {["name"] = "Wild Turkey",              ["model"] = -2011226991,  ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [20] = {["name"] = "Wild Turkey",              ["model"] = -166054593,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [21] = {["name"] = "Water Snake",              ["model"] = -229688157,   ["viande"] = "viandereptile",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [22] = {["name"] = "Water Snake",              ["model"] = -229688157,   ["viande"] = "viandereptile",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [23] = {["name"] = "Snake Red Boa",            ["model"] = -1790499186,  ["viande"] = "viandereptile",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [24] = {["name"] = "Snake Fer-De-Lance",       ["model"] = 1464167925,   ["viande"] = "viandereptile",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [25] = {["name"] = "Black-Tailed Rattlesnake", ["model"] = 846659001,    ["viande"] = "viandereptile",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [26] = {["name"] = "Western Rattlesnake",      ["model"] = 545068538,    ["viande"] = "viandereptile",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [27] = {["name"] = "Striped Skunk",            ["model"] = -1211566332,  ["viande"] = "viandepetitmamifere",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [28] = {["name"] = "Merino Sheep",             ["model"] = 40345436,     ["viande"] = "viande",  ["peau"] = "cuir",     ["poor"] = 1729948479,  ["good"] = -1317365569, ["perfect"] = 1466150167},
    [29] = {["name"] = "Herring Seagull",          ["model"] = -164963696,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [30] = {["name"] = "Roseate Spoonbill",        ["model"] = -1076508705,  ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [31] = {["name"] = "Dominique Rooster",        ["model"] = 2023522846,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [32] = {["name"] = "Red-Footed Booby",         ["model"] = -466687768,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [33] = {["name"] = "Wester Raven",             ["model"] = -575340245,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [34] = {["name"] = "North American Racoon",    ["model"] = 1458540991,   ["viande"] = "viandepetitmamifere",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [35] = {["name"] = "Black-Tailed Jackrabbit",  ["model"] = -541762431,   ["viande"] = "viandepetitmamifere",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [36] = {["name"] = "American Pronghorn Doe",   ["model"] = 1755643085,   ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = -983605026,  ["good"] = 554578289,   ["perfect"] = -1544126829},
    [37] = {["name"] = "Greater Prairie Chicken",  ["model"] = 2079703102,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [38] = {["name"] = "Wirginia Possum",          ["model"] = -1414989025,  ["viande"] = "viandepetitmamifere",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [39] = {["name"] = "Berkshire Pig",            ["model"] = 1007418994,   ["viande"] = "viande",  ["peau"] = "cuir",     ["poor"] = -308965548,  ["good"] = -57190831,   ["perfect"] = -1102272634},
    [40] = {["name"] = "Ring-Necked Pheasant",     ["model"] = 1416324601,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [41] = {["name"] = "American White Pelican",   ["model"] = 1265966684,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [42] = {["name"] = "Blue And Yellow Macaw",    ["model"] = -1797450568,  ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [43] = {["name"] = "Panther",                  ["model"] = 1654513481,   ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 1584468323,  ["good"] = -395646254,  ["perfect"] = 1969175294},
    [44] = {["name"] = "Californian Condor",       ["model"] = 1205982615,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [45] = {["name"] = "Dominique Chicken",        ["model"] = -2063183075,  ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [46] = {["name"] = "Double-Crested Cormorant", ["model"] = -2073130256,  ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [47] = {["name"] = "Cougar",                   ["model"] = 90264823,     ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 1914602340,  ["good"] = 459744337,   ["perfect"] = -1791452194},
    [48] = {["name"] = "Florida Cracker Cow",      ["model"] = -50684386,    ["viande"] = "viande",   ["peau"] = "cuir",     ["poor"] = 334093551,   ["good"] = 1150594075,  ["perfect"] = -845037222},
    [49] = {["name"] = "Coyote",                   ["model"] = 480688259,    ["viande"] = "viandegibier",  ["peau"] = "cuir",     ["poor"] = -1558096473, ["good"] = 1150939141,  ["perfect"] = -794277189},
    [50] = {["name"] = "Whooping Crane",           ["model"] = -564099192,   ["viande"] = "viandevolaille",   ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},   
    [51] = {["name"] = "Gila Monster",             ["model"] = 457416415,    ["viande"] = "viandereptile",    ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [52] = {["name"] = "Alpine Goat",              ["model"] = -753902995,   ["viande"] = "viande",  ["peau"] = "cuir",     ["poor"] = 699990316,   ["good"] = 1710714415,  ["perfect"] = -1648383828},
    [53] = {["name"] = "Canada Goose",             ["model"] = 723190474,    ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [54] = {["name"] = "Ferruinous Hawk",          ["model"] = -2145890973,  ["viande"] = "viandevolaille",   ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [55] = {["name"] = "Great Blue Heron",         ["model"] = 1095117488,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [56] = {["name"] = "Green Iguana",             ["model"] = -1854059305,  ["viande"] = "viandereptile",   ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [57] = {["name"] = "Desert Iguana",            ["model"] = -593056309,   ["viande"] = "viandereptile",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [58] = {["name"] = "Peccary Pig",              ["model"] = 1751700893,   ["viande"] = "viande",  ["peau"] = "cuir",     ["poor"] = -99092070,   ["good"] = -1379330323, ["perfect"] = 1963510418},
    [59] = {["name"] = "Common Loon",              ["model"] = 386506078,    ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [60] = {["name"] = "Moose",                    ["model"] = -1098441944,  ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 1868576868,  ["good"] = 1636891382,  ["perfect"] = -217731719},
    [61] = {["name"] = "American Muskrat",         ["model"] = -1134449699,  ["viande"] = "viandepetitmamifere",  ["peau"] = "cuir",  ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [62] = {["name"] = "Great Horned Owl",         ["model"] = -861544272,   ["viande"] = "viandevolaille",  ["peau"] = "cuir",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [63] = {["name"] = "Angus Ox",                 ["model"] = 556355544,    ["viande"] = "viande",  ["peau"] = "cuir",  ["poor"] = 4623248928,  ["good"] = 1208128650,  ["perfect"] = 659601266},
    [64] = {["name"] = "Alligator",                ["model"] = -1892280447,  ["viande"] = "viandereptile",  ["peau"] = "cuir",  ["poor"] = 1806153689,  ["good"] = -802026654,  ["perfect"] = -1625078531},
    [65] = {["name"] = "North American Beaver",    ["model"] = 759906147,    ["viande"] = "viandepetitmamifere",   ["peau"] = "cuir",     ["poor"] = -1569450319, ["good"] = -2059726619, ["perfect"] = 854596618},
    [66] = {["name"] = "American Black Bear",      ["model"] = 730092646,    ["viande"] = "viandegibier",  ["peau"] = "cuir",  ["poor"] = 1083865179,  ["good"] = 1490032862,  ["perfect"] = 663376218},

    [67] = {["name"] = "Longnose Gar",             ["model"] = -711779521,   ["peau"] = "fish",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [68] = {["name"] = "Muskie",                   ["model"] = -1553593715,  ["peau"] = "fish",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [69] = {["name"] = "Lake Sturgeon",            ["model"] = -300867788,   ["peau"] = "fish",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [70] = {["name"] = "Channel Catfish",          ["model"] = 1538187374,   ["peau"] = "fish",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    [71] = {["name"] = "Northern Pike",            ["model"] = 697075200,    ["peau"] = "fish",     ["poor"] = nil,         ["good"] = nil,         ["perfect"] = nil},
    -- AJOUT
    [72] = {["name"] = "Silver Fox",         ["model"] = 252669332,    ["viande"] = "viandegibier",  ["peau"] = "peau_pelt_bear_black",     ["poor"] = nil,  ["good"] = nil,   ["perfect"] =nil},
    [73] = {["name"] = "Lievre de Californie",         ["model"] = -541762431,    ["viande"] = "viandepetitmamifere",  ["peau"] = "peau_pelt_bear_black",     ["poor"] = nil,  ["good"] = nil,   ["perfect"] =nil},
    [74] = {["name"] = "Mouflon sierra",         ["model"] = -1568716381,    ["viande"] = "viande",  ["peau"] = "peau_pelt_bear_black",     ["poor"] = nil,  ["good"] = nil,   ["perfect"] =nil},
    [75] = {["name"] = "Blaireau Américain",         ["model"] = -1170118274,    ["viande"] = "viandepetitmamifere",  ["peau"] = "peau_pelt_bear_black",     ["poor"] = nil,  ["good"] = nil,   ["perfect"] =nil}
}   

