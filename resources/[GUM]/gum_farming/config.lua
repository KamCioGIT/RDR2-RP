Config = {}
Config.Debug = false

Config.interaction = true -- if you enable you use herb -> click on position -> place herb -> pick or destroy, if you disable you automaticaly place herbs on your coords
Config.RenderDistance = 100.0

Config.BannedCity = true
Config.Banned_Towns_List = {
	'Annesburg',
	'Armadillo', 
	'Blackwater', 
	'Rhodes', 
	'Siska', 
	'StDenis', 
	'Strawberry', 
	'Tumbleweed', 
	'Valentine', 
	'Vanhorn', 
	'Wapiti', 
}

Config.LocationAffect = true--Temperature affect on grow. (if hot -> more water, if cold -> slow grow)
Config.TemperatureDistrict = {--+- center of temperature in locations
	[2025841068] = {BayouNwa, 40},
	[822658194] = {bigvalley, 20},
	[1308232528] = {BluewaterMarsh, 40},
	[-108848014] = {ChollaSprings, 35},
	[1835499550] = {Cumberland, 25},
	[426773653] = {DiezCoronas, 40},
	[-2066240242] = {GaptoothRidge, 40},
	[476637847] = {greatPlains, 30},
	[-120156735] = {GrizzliesEast, 25},
	[1645618177] = {GrizzliesWest, -5},
	[-512529193] = {GuarmaD, 35},
	[131399519] = {Heartlands, 25},
	[892930832] = {HennigansStead, 30},
	[-1319956120] = {Perdido, 35},
	[1453836102] = {PuntaOrgullo, 40},
	[-2145992129] = {RioBravo, 40},
	[178647645] = {roanoke, 25},
	[-864275692] = {scarlettMeadows, 30},
	[1684533001] = {TallTrees, 20},
}

Config.Gum_Notify_NUI = true
Config.Image = "farming"

Config.Watering_Can_Item = "Watering_Can"
Config.TeaPot = "Teapot_Can"

Config.SQL_Farming_1 = "stable"--Table with wagons
Config.SQL_Farming_2 = "model"--Column model in table
Config.SQL_Farming_3 = "citizenid"--Column for character id in stables
Config.SQL_Farming_4 = "selected"--Column for selected wagons

Config.Wagons_Support = {
	oilWagon01x = 500,
	oilWagon02x = 500,
	cart05 = 200,
}

Config.UpdateTime = 15--Every 15 min update state
Config.FertilizerOnUpdate = 1--Count down %
Config.WaterOnUpdate = 1--Count down %

Config.UnderQuality = 10--Under 30% Ferti or Water

Config.DownFertilizer = 2
Config.DownWater = 2
Config.ReviveUpperFertilizer = 2
Config.ReviveUpperWater = 2

Config.WaterCalcIfHot = 3
Config.GrowSlowIfCold = 1.5

Config.AddWaterOnBucket = 100
Config.AddFertilize = 100

Config.Fertilizer = "Engrais"

Config.Language = {
	[1] = "Agriculture",
	[2] = "Utiliser",
	[3] = "Que voulez vous-faire ?",
	[4] = "Graines",
	[5] = "Descendez d'abord.",
	[6] = "Vous êtes en train d'arroser.",
	[7] = "Ma ferme",
	[8] = "Engrais",
	[9] = "Prendre",
	[10] = "Eau",
	[11] = "Détruire",
	[12] = "Planter",
	[13] = "Reprendre",
	[14] = "Remplir",
	[15] = "Ajouter",
	[16] = "Prendre de l'eau",
	[17] = "Charrette",
	[18] = "Pompe",
	[19] = "Eau",
	[20] = "Plante",
	[21] = "Qualité",
	[22] = "Eau",
	[23] = "Engrais",
	[24] = "Temps de croissance",
	[25] = "Minutes",
	[26] = "Vous n'avez pas les connaissances nécessaires.",
	[27] = "Le sol ici n'est pas fertile",
	[28] = "Vous ne pouvez avoir que : ",
	[29] = "Plantes",
	[30] = "Vous possédez déjà une ferme",
	[31] = "Il vaut mieux planter sur un sol qui vous appartient",
	[32] = "Graines",
	[33] = "Cette terre ne vous appartient pas.",
	[34] = "Vous ne pouvez pas planter cette plante ici.",
}

Config.HerbCountMax = 10 ---- Max de plantes qu'un jooueur peut planter si il a pas de job fermier
Config.FarmingJobCoords = {
	-- Farmar = {
	-- 	blipSprite = 0,
	-- 	coords = {
	-- 		vector3(1475.1964111328125,-7169.55517578125,72.68544006347656),
	-- 		vector3(1492.8079833984375,-7162.97265625,72.82546997070312),
	-- 		vector3(1494.8326416015625,-7168.7197265625,72.81822967529297),
	-- 		vector3(1499.0318603515625,-7167.30419921875,72.88807678222656),
	-- 		vector3(1493.4248046875,-7151.18115234375,72.80862426757812),
	-- 		vector3(1497.4932861328125,-7149.17919921875,72.80451202392578),
	-- 		vector3(1502.1962890625,-7152.9990234375,72.71797180175781),
	-- 		vector3(1516.113037109375,-7162.53759765625,73.11974334716797),
	-- 		vector3(1514.9547119140625,-7179.1015625,72.36971282958984),
	-- 		vector3(1504.4139404296875,-7191.17236328125,72.56635284423828),
	-- 		vector3(1492.7896728515625,-7191.95361328125,75.0114517211914),
	-- 		vector3(1479.387451171875,-7195.62109375,72.61621856689453),
	-- 		vector3(1462.6885986328125,-7193.2958984375,70.96236419677734),
	-- 		vector3(1450.5806884765625,-7178.30908203125,72.76444244384766),
	-- 		vector3(1447.215576171875,-7169.7626953125,72.90583801269531),
	-- 		vector3(1444.8153076171875,-7163.16162109375,73.76078033447266),
	-- 		vector3(1446.314697265625,-7160.7705078125,73.91941833496094),
	-- 		vector3(1452.060546875,-7154.484375,73.2757568359375),
	-- 		vector3(1460.6502685546875,-7158.0849609375,73.06087493896484),
	-- 		vector3(1468.8824462890625,-7160.623046875,72.73719024658203),
	-- 	},-- xanax
	-- 	count = 100,
	-- 	protect = true,
	-- },
	-- Farmar2 = {
	-- 	blipSprite = 0,
	-- 	coords = {
	-- 		vector3(-1639.407470703125,-1406.09375,83.01728057861328),
	-- 		vector3(-1635.2579345703125,-1407.757568359375,82.82894897460938),
	-- 		vector3(-1629.980712890625,-1409.4130859375,82.41766357421875),
	-- 		vector3(-1626.0673828125,-1411.1065673828125,82.28821563720703),
	-- 		vector3(-1621.0272216796875,-1412.7864990234375,82.16827392578125),
	-- 		vector3(-1616.220947265625,-1413.982666015625,81.98477172851562),
	-- 		vector3(-1610.0616455078125,-1415.8797607421875,81.97830200195312),
	-- 		vector3(-1610.5596923828125,-1421.01611328125,81.92898559570312),
	-- 		vector3(-1611.33544921875,-1426.740966796875,81.81102752685547),
	-- 		vector3(-1612.7423095703125,-1433.2896728515625,81.6990966796875),
	-- 		vector3(-1614.5416259765625,-1442.478271484375,81.88554382324219),
	-- 		vector3(-1615.80517578125,-1449.4288330078125,82.56646728515625),
	-- 		vector3(-1615.978759765625,-1453.5552978515625,82.9303207397461),
	-- 		vector3(-1647.5338134765625,-1456.71630859375,83.59658813476562),
	-- 		vector3(-1650.6163330078125,-1444.55419921875,83.44105529785156),
	-- 		vector3(-1649.1871337890625,-1429.7525634765625,83.20616912841797),
	-- 		vector3(-1647.9259033203125,-1418.1328125,83.12767028808594),
	-- 		vector3(-1644.935546875,-1409.9837646484375,83.0956039428711),
	-- 		vector3(-1641.24560546875,-1405.0716552734375,83.0537338256836),
	-- 	},
	-- 	count = 100,
	-- 	protect = true,
	-- },
	-- Farmar3 = {
	-- 	blipSprite = 0,
	-- 	coords = {
	-- 		vector3(-5197.64453125,-2169.437255859375,11.96008586883545),
	-- 		vector3(-5181.0078125,-2186.748291015625,13.65799808502197),
	-- 		vector3(-5154.0302734375,-2159.908203125,7.95256471633911),
	-- 		vector3(-5171.8974609375,-2142.748291015625,12.02614784240722),
	-- 	},
	-- 	count = 100,
	-- 	protect = true,
	-- },
	-- Farmar4 = {
	--  	blipSprite = 0,
	--  	coords = {
	-- 		vector3(2039.3304443359375,1161.0106201171875,161.27288818359375),
	-- 		vector3(2038.505126953125,1201.1854248046875,158.9158935546875),
	-- 		vector3(2071.784912109375,1198.4356689453125,161.9759521484375),
	-- 		vector3(2070.185546875,1157.8170166015625,159.39920043945312),
	-- 	},
	--  	count = 100,
	--  	protect = true,
	--  },
	-- Farmar5 = {
	-- 	blipSprite = 0,
	-- 	coords = {
	-- 		vector3(1433.3599853515625,335.7491149902344,88.76762390136719),
	-- 		vector3(1432.1864013671875,296.89373779296875,88.75606536865234),
	-- 		vector3(1475.6956787109375,293.7386779785156,91.67406463623048),
	-- 		vector3(1480.5831298828125,304.4750671386719,91.46981048583984),
	-- 		vector3(1487.4775390625,314.6465454101563,91.36813354492188),
	-- 		vector3(1493.8013916015625,321.3432312011719,91.29313659667967),
	-- 		vector3(1495.7618408203125,340.1376647949219,91.29637145996094),
	-- 		vector3(1494.36767578125,354.1594848632813,90.95825958251952),
	-- 		vector3(1493.720703125,361.0987854003906,91.22660064697266),
	-- 		vector3(1452.738525390625,360.0156555175781,88.77804565429688),
	-- 		vector3(1452.266357421875,339.0486755371094,88.86930084228516),
	-- 		vector3(1432.8812255859375,339.2467956542969,88.7849349975586),
	-- 	}, --matrix
	-- 	count = 100,
	-- 	protect = true,
	-- },
	-- Farmar6 = {
	-- 	blipSprite = 0,
	-- 	coords = {
	-- 		vector3(-2425.61376953125,-2443.5126953125,60.20150375366211),
	-- 		vector3(-2430.571533203125,-2431.239013671875,60.18693542480469),
	-- 		vector3(-2451.523681640625,-2435.603515625,60.1365737915039),
	-- 		vector3(-2468.423583984375,-2441.868408203125,60.22154998779297),
	-- 		vector3(-2481.230712890625,-2450.081787109375,60.46974945068359),
	-- 		vector3(-2482.41943359375,-2452.527099609375,60.36767959594726),
	-- 		vector3(-2477.487060546875,-2464.50830078125,60.18415832519531),
	-- 		vector3(-2469.1982421875,-2475.709716796875,60.18417739868164),
	-- 		vector3(-2454.367431640625,-2490.337646484375,60.18448638916015),
	-- 		vector3(-2447.58203125,-2496.140625,60.17985534667969),
	-- 		vector3(-2421.874755859375,-2484.827880859375,60.20117568969726),
	-- 	},
	-- 	count = 100,
	-- 	protect = true,
	-- },
	-- Farmar7 = {
	-- 	blipSprite = 0,
	-- 	coords = {
	-- 		vector3(-3540.33447265625,-3005.466552734375,11.4400053024292),
	-- 		vector3(-3529.58984375,-3036.842041015625,12.21374797821045),
	-- 		vector3(-3542.57763671875,-3065.257568359375,12.55669116973877),
	-- 		vector3(-3565.578125,-3051.65625,11.90004730224609),
	-- 		vector3(-3574.038330078125,-3037.954345703125,11.75597190856933),
	-- 		vector3(-3572.835693359375,-3017.038330078125,11.08937931060791),
	-- 		vector3(-3559.73046875,-3005.63427734375,11.02140522003173),
	-- 		vector3(-3549.00732421875,-3002.890625,11.12659835815429),
	-- 	},--deda
	-- 	count = 100,
	-- 	protect = true,
	-- },
	-- Farmar8 = {
	-- 	blipSprite = 0,
	-- 	coords = {
	-- 		vector3(2005.5789794921875,2031.1165771484375,278.2120056152344),
	-- 		vector3(1998.7071533203127,2025.368408203125,277.1244812011719),
	-- 		vector3(1986.5738525390625,2019.1712646484375,275.83636474609375),
	-- 		vector3(1980.439453125,2021.923583984375,275.4846496582031),
	-- 		vector3(1978.9345703125,2034.6392822265625,274.1439208984375),
	-- 		vector3(1974.1102294921875,2043.3524169921875,274.73773193359375),
	-- 		vector3(1971.6466064453127,2055.765869140625,273.8825988769531),
	-- 		vector3(1977.0582275390625,2063.267578125,276.2106018066406),
	-- 		vector3(1992.5260009765625,2063.615478515625,281.51702880859375),
	-- 		vector3(2009.8597412109375,2056.40576171875,280.0496520996094),
	-- 	},--balder
	-- 	count = 100,
	-- 	protect = true,
	-- },
	fermier = {
		blipSprite = 669307703,
		coords = {
			vector3(-2555.75341796875,319.2127685546875,150.54608154296875),
			vector3(-2529.35546875,322.1395263671875,153.2441864013672),
			vector3(-2514.41650390625,329.65277099609375,154.20220947265625),
			vector3(-2511.766357421875,349.6018371582031,154.0574188232422),
			vector3(-2510.371337890625,368.3631286621094,152.6045684814453),
			vector3(-2508.74072265625,387.8123168945313,150.3296051025391),
			vector3(-2542.580322265625,387.4136962890625,149.07034301757812),
			vector3(-2562.03955078125,386.8839111328125,149.29164123535156),
			vector3(-2561.742431640625,361.9191284179688,150.79763793945312),
			vector3(-2554.791748046875,362.1539611816406,150.9409942626953),
		},--morpheus
		count = 100,
		protect = true,
	},
	-- FarmarTest = {
	-- 	blipsPrite = 0,
	-- 	coords = {
	-- 		vector3(1063.76123046875,-1397.2821044921875,55.4610710144043),
	-- 		vector3(1063.6417236328125,-1430.6258544921875,56.49787521362305),
	-- 		vector3(1080.14453125,-1431.19384765625,56.79864883422851),
	-- 		vector3(1080.8758544921875,-1456.356201171875,54.29958343505859),
	-- 		vector3(1067.193115234375,-1455.8668212890625,54.64880752563476),
	-- 		vector3(1049.2750244140625,-1455.2186279296875,52.93606185913086),
	-- 		vector3(1033.1666259765625,-1455.2076416015625,50.92009735107422),
	-- 		vector3(1033.24755859375,-1441.153076171875,51.87373352050781),
	-- 		vector3(1033.9757080078125,-1418.2779541015625,52.0193977355957),
	-- 		vector3(1034.7381591796875,-1410.4603271484375,52.25558471679687),
	-- 		vector3(1041.5218505859375,-1410.09765625,52.94768142700195),
	-- 		vector3(1041.2186279296875,-1397.4368896484375,52.92995071411133),
	-- 	},
	-- 	count = 100, 
	-- 	protect = true,
	-- }
}

Config.QualitySystem = true--Quality is based for more rewards or more work on famr

Config.FarmHerbs = {
	-- ["Mariuhana_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 1,
	-- 	multipleEvent = "gum_eat:data",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Mariuhana",
	-- 	herbItem = "weed",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"prop_weed_01", 301},
	-- 		[2] = {"prop_weed_01", 250},
	-- 		[3] = {"prop_weed_01", 100},
	-- 		[4] = {"prop_weed_01", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 10,--480 min time without affecting temp
	-- 	temperatureSlow = 5,--Slow for grow
	-- 	temperatureGood = {5, 31},--Good for grow
	-- 	temperatureHot = 32,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--if Disabled quality system is 100 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Mariuhana", 4},--Upper 80% to 100
	-- 		[50] = {"Mariuhana", 3},--Upper 50% to 80
	-- 		[25] = {"Mariuhana", 2},--Upper 0% to 50
	-- 		[0] = {"Mariuhana", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.5,--downgrade under ground
	-- },
	-- ["Agarita_Seed"] = {
	-- 	multipleUse = true,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbToSeed = 3,
	-- 	herbName = "Chmel",
	-- 	herbItem = "Hop",
	-- 	coordLockEnable = false,
	-- 	coordLock = {
	-- 		[1] = {602.3670043945312,-230.7088623046875,147.21218872070312, 20.0},
	-- 		[2] = {602.3670043945312,-230.7088623046875,147.21218872070312, 20.0},
	-- 	},
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_inv_milkweed01bx", 301},
	-- 		[2] = {"s_inv_milkweed01cx", 250},
	-- 		[3] = {"s_inv_milkweed01x", 100},
	-- 		[4] = {"s_milkweed01x", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Hop", 5},--Upper 80% to 100
	-- 		[50] = {"Hop", 3},--Upper 50% to 80
	-- 		[25] = {"Hop", 2},--Upper 0% to 50
	-- 		[0] = {"Hop", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Hop_Seed"] = {
	-- 	multipleUse = true,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbToSeed = 3,
	-- 	herbName = "Chmel",
	-- 	herbItem = "Hop",
	-- 	coordLockEnable = true,
	-- 	coordLock = {
	-- 		[1] = {-5454.130859375, -2899.43505859375, 0.95581465959548, 20.0},
	-- 		[2] = {-5604.67529296875, -2888.024658203125, 0.8768013715744, 20.0},
	-- 	},
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_inv_milkweed01bx", 301},
	-- 		[2] = {"s_inv_milkweed01cx", 250},
	-- 		[3] = {"s_inv_milkweed01x", 100},
	-- 		[4] = {"s_milkweed01x", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Hop", 5},--Upper 80% to 100
	-- 		[50] = {"Hop", 3},--Upper 50% to 80
	-- 		[25] = {"Hop", 2},--Upper 0% to 50
	-- 		[0] = {"Hop", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Wild_Carrot_Seed"] = {
	-- 	multipleUse = true,
	-- 	multipleEvent = "gum_stables:eatFunctionForFarming",--argument is herbSeed, herbName, herbCount
	-- 	herbToSeed = 3,
	-- 	herbName = "Mrkev",
	-- 	herbItem = "Wild_Carrot",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_inv_wildcarrot01x", 301},
	-- 		[2] = {"s_inv_wildcarrot01x", 250},
	-- 		[3] = {"s_inv_wildcarrot01x", 100},
	-- 		[4] = {"s_inv_wildcarrot01x", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Wild_Carrot", 5},--Upper 80% to 100
	-- 		[50] = {"Wild_Carrot", 3},--Upper 50% to 80
	-- 		[25] = {"Wild_Carrot", 2},--Upper 0% to 50
	-- 		[0] = {"Wild_Carrot", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Indian_Tobbaco_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Tabak",
	-- 	herbItem = "Indian_Tobbaco",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_indiantobacco01x", 301},
	-- 		[2] = {"s_indiantobacco01x", 250},
	-- 		[3] = {"s_indiantobacco01x", 100},
	-- 		[4] = {"s_indiantobacco01x", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Indian_Tobbaco", 5},--Upper 80% to 100
	-- 		[50] = {"Indian_Tobbaco", 3},--Upper 50% to 80
	-- 		[25] = {"Indian_Tobbaco", 2},--Upper 0% to 50
	-- 		[0] = {"Indian_Tobbaco", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
    -- ["Guarma_Tobacco_Seed"] = {
	-- multipleUse = true,
	-- herbToSeed = 3,
	-- multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- herbName = "Guarmský tabák",
	-- herbItem = "Guarma_Tobacco",
	-- potStageProps = {--Stage is calculated automaticaly from grow time
	-- 	[1] = {"crp_tobaccoplant_ac_sim", 301},
	-- 	[2] = {"crp_tobaccoplant_ac_sim", 250},
	-- 	[3] = {"crp_tobaccoplant_ac_sim", 100},
	-- 	[4] = {"crp_tobaccoplant_ac_sim", -1},
	-- },
	-- weatherAffect = true,--If is rain -> automaticaly water herb
	-- growTime = 300,--480 min time without affecting temp
	-- temperatureSlow = 0,--Slow for grow
	-- temperatureGood = {-3, 30},--Good for grow
	-- temperatureHot = 30,--2x more watering
	-- fertilizer = {1, 2},--Empty is disabled,
	-- quality = 100,--Disabled quality system is 0 
	-- rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 	[80] = {"Guarma_Tobacco", 5},--Upper 80% to 100
	-- 	[50] = {"Guarma_Tobacco", 3},--Upper 50% to 80
	-- 	[25] = {"Guarma_Tobacco", 2},--Upper 0% to 50
	-- 	[0] = {"Guarma_Tobacco", 1},--Upper 0% to 50
	-- },
	-- grounded = 0.0,--downgrade under ground
	-- },
	["Corn_Seed"] = {
		multipleUse = true,
		herbToSeed = 3,
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
		herbName = "Maïs",
		herbItem = "Corn",
		potStageProps = {--Stage is calculated automaticaly from grow time
			[1] = {"crp_cornstalks_bb_sim", 301},
			[2] = {"crp_cornstalks_bd_sim", 250},
			[3] = {"crp_cornstalks_bc_sim", 100},
			[4] = {"crp_cornstalks_bc_sim", -1},
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 300,--480 min time without affecting temp
		temperatureSlow = 0,--Slow for grow
		temperatureGood = {-3, 30},--Good for grow
		temperatureHot = 30,--2x more watering
		fertilizer = {1, 2},--Empty is disabled,
		quality = 100,--Disabled quality system is 0 
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"Corn", 5},--Upper 80% to 100
			[50] = {"Corn", 3},--Upper 50% to 80
			[25] = {"Corn", 2},--Upper 0% to 50
			[0] = {"Corn", 1},--Upper 0% to 50
		},
		grounded = 0.0,--downgrade under ground
	},
	-- ["Wild_Mint_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Wild Mint",
	-- 	herbItem = "Wild_Mint",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_inv_wildmint01bx", 301},
	-- 		[2] = {"s_inv_wildmint01x", 250},
	-- 		[3] = {"s_inv_wildmint01x", 100},
	-- 		[4] = {"s_inv_wildmint01cx", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Wild_Mint", 5},--Upper 80% to 100
	-- 		[50] = {"Wild_Mint", 3},--Upper 50% to 80
	-- 		[25] = {"Wild_Mint", 2},--Upper 0% to 50
	-- 		[0] = {"Wild_Mint", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Rams_Head_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Rams Head",
	-- 	herbItem = "Rams_Head",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_inv_ramshead", 301},
	-- 		[2] = {"s_inv_ramshead", 250},
	-- 		[3] = {"s_inv_ramshead", 100},
	-- 		[4] = {"s_inv_ramshead", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Rams_Head", 5},--Upper 80% to 100
	-- 		[50] = {"Rams_Head", 3},--Upper 50% to 80
	-- 		[25] = {"Rams_Head", 2},--Upper 0% to 50
	-- 		[0] = {"Rams_Head", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Parasol_Mushroom_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Parasol Mushroom",
	-- 	herbItem = "Parasol_Mushroom",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_inv_parasol", 301},
	-- 		[2] = {"s_inv_parasol", 250},
	-- 		[3] = {"s_inv_parasol", 100},
	-- 		[4] = {"s_inv_parasol", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Parasol_Mushroom", 3},--Upper 80% to 100
	-- 		[50] = {"Parasol_Mushroom", 2},--Upper 50% to 80
	-- 		[0] = {"Parasol_Mushroom", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Hummingbird_Sage_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Hummingbird sage",
	-- 	herbItem = "Hummingbird_Sage",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_hummingbirdsage01x", 301},
	-- 		[2] = {"s_hummingbirdsage01x", 250},
	-- 		[3] = {"s_hummingbirdsage01x", 100},
	-- 		[4] = {"s_hummingbirdsage01x", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Hummingbird_Sage", 5},--Upper 80% to 100
	-- 		[50] = {"Hummingbird_Sage", 3},--Upper 50% to 80
	-- 		[25] = {"Hummingbird_Sage", 2},--Upper 0% to 50
	-- 		[0] = {"Hummingbird_Sage", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Evergreen_Huckleberry_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Evergreen Huckleberry",
	-- 	herbItem = "Evergreen_Huckleberry",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_inv_huckleberry01x", 301},
	-- 		[2] = {"s_inv_huckleberry01x", 250},
	-- 		[3] = {"s_inv_huckleberry01x", 100},
	-- 		[4] = {"s_inv_huckleberry01x", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Evergreen_Huckleberry", 5},--Upper 80% to 100
	-- 		[50] = {"Evergreen_Huckleberry", 3},--Upper 50% to 80
	-- 		[25] = {"Evergreen_Huckleberry", 2},--Upper 0% to 50
	-- 		[0] = {"Evergreen_Huckleberry", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Alaskan_Ginseng_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Alaskan Ginseng",
	-- 	herbItem = "Alaskan_Ginseng",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"alaskanginseng_p", 301},
	-- 		[2] = {"alaskanginseng_p", 250},
	-- 		[3] = {"alaskanginseng_p", 100},
	-- 		[4] = {"alaskanginseng_p", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Alaskan_Ginseng", 5},--Upper 80% to 100
	-- 		[50] = {"Alaskan_Ginseng", 3},--Upper 50% to 80
	-- 		[25] = {"Alaskan_Ginseng", 2},--Upper 0% to 50
	-- 		[0] = {"Alaskan_Ginseng", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Grain_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Obili",
	-- 	herbItem = "Grain",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"crp_wheat_dry_aa_sim", 301},
	-- 		[2] = {"crp_wheat_dry_aa_sim", 250},
	-- 		[3] = {"crp_wheat_dry_aa_sim", 100},
	-- 		[4] = {"crp_wheat_dry_aa_sim", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Grain", 5},--Upper 80% to 100
	-- 		[50] = {"Grain", 3},--Upper 50% to 80
	-- 		[25] = {"Grain", 2},--Upper 0% to 50
	-- 		[0] = {"Grain", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Coca_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Koka",
	-- 	herbItem = "Coca",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_indiantobaccopicked01x", 301},
	-- 		[2] = {"s_indiantobaccopicked01x", 250},
	-- 		[3] = {"s_indiantobaccopicked01x", 100},
	-- 		[4] = {"s_indiantobaccopicked01x", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Coca", 5},--Upper 80% to 100
	-- 		[50] = {"Coca", 3},--Upper 50% to 80
	-- 		[25] = {"Coca", 2},--Upper 0% to 50
	-- 		[0] = {"Coca", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Sugarcane_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Cukrova trtina",
	-- 	herbItem = "Sugarcane",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"crp_sugarcane_ac_sim", 301},
	-- 		[2] = {"crp_sugarcane_ac_sim", 250},
	-- 		[3] = {"crp_sugarcane_ac_sim", 100},
	-- 		[4] = {"crp_sugarcane_ac_sim", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Sugarcane", 5},--Upper 80% to 100
	-- 		[50] = {"Sugarcane", 3},--Upper 50% to 80
	-- 		[25] = {"Sugarcane", 2},--Upper 0% to 50
	-- 		[0] = {"Sugarcane", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Grape_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Vinná Réva",
	-- 	herbItem = "Grape",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"rdr_bush_hedgecore_aa", 301},
	-- 		[2] = {"rdr_bush_hedgecore_aa", 250},
	-- 		[3] = {"rdr_bush_hedgecore_aa", 100},
	-- 		[4] = {"rdr_bush_hedgecore_aa", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Grape", 5},--Upper 80% to 100
	-- 		[50] = {"Grape", 3},--Upper 50% to 80
	-- 		[25] = {"Grape", 2},--Upper 0% to 50
	-- 		[0] = {"Grape", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Indigo_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Indigo",
	-- 	herbItem = "Indigo",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_indiantobaccopicked01x", 301},
	-- 		[2] = {"s_indiantobaccopicked01x", 250},
	-- 		[3] = {"s_indiantobaccopicked01x", 100},
	-- 		[4] = {"s_indiantobaccopicked01x", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Indigo", 3},--Upper 80% to 100
	-- 		[50] = {"Indigo", 2},--Upper 50% to 80
	-- 		[0] = {"Indigo", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
    ["Potato_Seed"] = {
		multipleUse = true,
		herbToSeed = 3,
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
		herbName = "Brambora",
		herbItem = "Potato",
		potStageProps = {--Stage is calculated automaticaly from grow time
			[1] = {"p_potato01x", 301},
			[2] = {"p_potato01x", 250},
			[3] = {"p_potato01x", 100},
			[4] = {"p_potato01x", -1},
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 300,--480 min time without affecting temp
		temperatureSlow = 0,--Slow for grow
		temperatureGood = {-3, 30},--Good for grow
		temperatureHot = 30,--2x more watering
		fertilizer = {1, 2},--Empty is disabled,
		quality = 100,--Disabled quality system is 0 
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"Potato", 5},--Upper 80% to 100
			[50] = {"Potato", 3},--Upper 50% to 80
			[25] = {"Potato", 2},--Upper 0% to 50
			[0] = {"Potato", 1},--Upper 0% to 25
		},
		grounded = 0.0,--downgrade under ground
	},
	["Tomato_Seed"] = {
		multipleUse = true,
		herbToSeed = 3,
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
		herbName = "Rajče",
		herbItem = "Tomato",
		potStageProps = {--Stage is calculated automaticaly from grow time
			[1] = {"crp_tomatoes_aa_sim", 301},
			[2] = {"crp_tomatoes_aa_sim", 250},
			[3] = {"crp_tomatoes_aa_sim", 100},
			[4] = {"crp_tomatoes_aa_sim", -1},
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 300,--480 min time without affecting temp
		temperatureSlow = 0,--Slow for grow
		temperatureGood = {-3, 30},--Good for grow
		temperatureHot = 30,--2x more watering
		fertilizer = {1, 2},--Empty is disabled,
		quality = 100,--Disabled quality system is 0 
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"Tomato", 5},--Upper 80% to 100
			[50] = {"Tomato", 3},--Upper 50% to 80
			[25] = {"Tomato", 2},--Upper 0% to 50
			[0] = {"Tomato", 1},--Upper 0% to 25
		},
		grounded = 0.0,--downgrade under ground
	},
	-- ["Cabbage_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Zelí",
	-- 	herbItem = "Cabbage",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"crp_broccoli_aa_sim", 301},
	-- 		[2] = {"crp_broccoli_aa_sim", 250},
	-- 		[3] = {"crp_broccoli_aa_sim", 100},
	-- 		[4] = {"crp_broccoli_aa_sim", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Cabbage", 3},--Upper 80% to 100
	-- 		[50] = {"Cabbage", 2},--Upper 50% to 80
	-- 		[0] = {"Cabbage", 1},--Upper 0% to 50
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Onion_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Cibule",
	-- 	herbItem = "Onion",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"crp_tomatoes_sap_aa_sim", 301},
	-- 		[2] = {"crp_tomatoes_sap_aa_sim", 250},
	-- 		[3] = {"crp_tomatoes_sap_aa_sim", 100},
	-- 		[4] = {"crp_tomatoes_sap_aa_sim", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Onion", 5},--Upper 80% to 100
	-- 		[50] = {"Onion", 3},--Upper 50% to 80
	-- 		[25] = {"Onion", 2},--Upper 0% to 50
	-- 		[0] = {"Onion", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Pepper_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Paprika",
	-- 	herbItem = "Pepper",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"crp_tomatoes_sap_aa_sim", 301},
	-- 		[2] = {"crp_tomatoes_sap_aa_sim", 250},
	-- 		[3] = {"crp_tomatoes_sap_aa_sim", 100},
	-- 		[4] = {"crp_tomatoes_sap_aa_sim", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Pepper", 5},--Upper 80% to 100
	-- 		[50] = {"Pepper", 3},--Upper 50% to 80
	-- 		[25] = {"Pepper", 2},--Upper 0% to 50
	-- 		[0] = {"Pepper", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
	-- ["Apple_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "gum_stables:eatFunctionForFarming",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Jablko",
	-- 	herbItem = "Apple",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"p_sap_maple_ba_sim", 301},
	-- 		[2] = {"p_tree_maple_s_03", 250},
	-- 		[3] = {"p_tree_apple_01", 100},
	-- 		[4] = {"p_tree_apple_01", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 0,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--Disabled quality system is 0 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Apple", 4},--Upper 80% to 100
	-- 		[50] = {"Apple", 3},--Upper 50% to 80
	-- 		[25] = {"Apple", 2},--Upper 0% to 50
	-- 		[0] = {"Apple", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.5,--downgrade under ground
	-- },
	-- ["Chamomile_Seed"] = {
	-- 	multipleUse = true,
	-- 	herbToSeed = 3,
	-- 	multipleEvent = "",--argument is herbSeed, herbName, herbCount
	-- 	herbName = "Heřmánek",
	-- 	herbItem = "Chamomile",
	-- 	potStageProps = {--Stage is calculated automaticaly from grow time
	-- 		[1] = {"s_inv_orchid_v_01bx", 301},
	-- 		[2] = {"s_inv_orchid_v_01bx", 250},
	-- 		[3] = {"s_inv_orchid_v_01bx", 100},
	-- 		[4] = {"s_inv_orchid_v_01bx", -1},
	-- 	},
	-- 	weatherAffect = true,--If is rain -> automaticaly water herb
	-- 	growTime = 300,--480 min time without affecting temp
	-- 	temperatureSlow = 5,--Slow for grow
	-- 	temperatureGood = {-3, 30},--Good for grow
	-- 	temperatureHot = 30,--2x more watering
	-- 	fertilizer = {1, 2},--Empty is disabled,
	-- 	quality = 100,--if Disabled quality system is 100 
	-- 	rewardItem = {--If you have disabled quality set [XX] to [0]
	-- 		[80] = {"Chamomile", 4},--Upper 80% to 100
	-- 		[50] = {"Chamomile", 3},--Upper 50% to 80
	-- 		[25] = {"Chamomile", 2},--Upper 0% to 50
	-- 		[0] = {"Chamomile", 1},--Upper 0% to 25
	-- 	},
	-- 	grounded = 0.0,--downgrade under ground
	-- },
}


Config.RareHerbs = {
    -- ["Corn"] =  {
    --     items = {
    --         {"Corn_Leaves", 3, "Feuile de Maïs"},
    --     },
    -- },
	-- ["Chamomile"] =  {
    --     items = {
    --         {"Chamomile_Leaves", 3, "Lístky heřmánku"},--
    --     },
    -- },

    -- ["Indigo"] =  {
    --     items = {
    --         {"Indigo_Leaves", 3, "Lístky Indiga"},
    --     },
    -- },

    -- ["Hop"] =  {
    --     items = {
    --         {"Hop_Leaves", 3, "Lístky chmelu"},
    --     },
    -- },

    -- ["Potato"] =  {
    --     items = {
    --         {"Potato_Leaves", 3, "Lístky brambor"},
    --     },
    -- },

    -- ["Sugar"] =  {
    --     items = {
    --         {"Sugarcane", 3, "Lístky cukrové třtiny"},
    --     },
    -- },

    -- ["Coca"] =  {
    --     items = {
    --         {"Koka_Leaves", 3, "Lístky koky"},
    --     },
    -- },
	
	-- ["Grain"] =  {
    --     items = {
    --         {"Wheat_Leaves", 3, "Lístky obilí"},
    --     },
    -- },


    -- ["Wild_Carrot"] =  {
    --     items = {
    --         {"Wildcarrot_Leaves", 3, "Lístky mrkve"},
    --     },
    -- },

    -- ["Indian_Tobbaco"] =  {
    --     items = {
    --         {"Indiantobacco_Leaves", 3, "Lístky tabáku"},
    --     },
    -- },

    -- ["Wild_Mint"] =  {
    --     items = {
    --         {"Wildmint_Leaves", 3, "Lístky máty"},
    --     },
    -- },

    -- ["Rams_Head"] =  {
    --     items = {
    --         {"Ramshead_Leg", 3, "Noha hlívy úštříčný"},
    --     },
    -- },

    -- ["Parasol_Mushroom"] =  {
    --     items = {
    --         {"Parasolmushroom_Leg", 3, "Noha muchomůrky"},
    --     },
    -- },

    -- ["Hummingbird_Sage"] =  {
    --     items = {
    --         {"Hummingbird_Leaves", 3, "Lístky šalvěje"},
    --     },
    -- },
    -- ["Evergreen"] =  {
    --     items = {
    --         {"Evergreen_Huckleberry", 3, "Lístky vavřínu"},
    --     },
    -- },
	-- ["Alaskan_Ginseng"] =  { 
    --     items = {
    --         {"Alaskan_Leaves", 3, "Lístky ženšenu"},
    --     },
    -- },
}
