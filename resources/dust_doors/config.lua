Config = {}

Config.UsePrompt = true

Config.KeyPress = 0xD8F73058


Config.Trapdoor = {
	{
		authorizedJobs = { 'straw_store' },
		doorid = "p_trapdoor01x",
		objCoords = vector3(-1790.7442626953125, -390.150390625, 159.28944396972656),
		objPitchclose = vector3(0.0, 0.0, 145),
		objPitchopen =  vector3(-90, 0.0, 145),
		locked = false,
		distance = 3.0
	},

}

Config.DoorList = {
--- cabinet st denis
	{
		authorizedJobs = { 'doctor_stdenis' },
		doorid = 82263429,
		objCoords  = vector3(-276.04, 802.73, 118.41),
		textCoords  = vector3(-275.02, 802.84, 119.43),
		objYaw = 10.0,
		locked = true,
		distance = 3.0
	},

	{
		textCoords = vector3(-308.11, 779.91, 118.96),
		authorizedJobs = { 'doctor_stdenis' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				doorid = 994323006,
				objCoords = vector3(2726.5541992188,-1234.8221435547,49.363960266113),
				objYaw = 90.0,
			},
			{
				doorid = 673153214,
				objCoords = vector3(2724.8232421875,-1234.8221435547,49.363960266113),
				objYaw = 270.0,
			}
		}
	},

	{
		authorizedJobs = { 'doctor_stdenis' },
		doorid = 1104407261,
		objCoords  = vector3(2725.1469726563,-1221.6247558594,49.367805480957),
		textCoords  = vector3(-277.06, 811.83, 119.38),
		objYaw = 180.0,
		locked = true,
		distance = 3.0
	},

	---- presse 
	{
		textCoords = vector3(-308.11, 779.91, 118.96),
		authorizedJobs = { 'presse' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				doorid = 3438582231,
				objCoords = vector3(2626.15,-1338.11,49.17),
				objYaw = 309.41,
			},
			{
				doorid = 461125209,
				objCoords = vector3(2624.76,-1336.43,49.17),
				objYaw = 309.41,
			}
		}
	},
	{
		textCoords = vector3(-308.11, 779.91, 118.96),
		authorizedJobs = { 'presse' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				doorid = 2353368182,
				objCoords = vector3(2604.73,-1348.04,49.13),
				objYaw = 39.77,
			},
			{
				doorid = 1913870354,
				objCoords = vector3(2603.05,-1349.44,49.12),
				objYaw = 40.0,
			}
		}
	},
	--cells
	{
		authorizedJobs = { 'police' },
		doorid = 295355979,
		objCoords  = vector3(-273.47, 809.96, 118.36),
		textCoords  = vector3(-272.23, 810.1, 119.39),
		objYaw = 10.0,
		locked = true,
		distance = 1.5
	},
	{
		authorizedJobs = { 'police' },
		doorid = 193903155,
		objCoords  = vector3(-272.06, 808.25, 118.36),
		textCoords  = vector3(-273.3, 808.12, 119.39),
		objYaw = -170.0,
		locked = true,
		distance = 1.5
	},

	--
	-- Valentine Bank
	--
	{
		textCoords = vector3(-308.11, 779.91, 118.96),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				doorid = 3886827663,
				objCoords = vector3(-306.89, 780.11, 117.72),
				objYaw = -170.0,
			},
			{
				doorid = 2642457609,
				objCoords = vector3(-309.06, 779.73, 117.72),
				objYaw = 10.05,
			}
		}
	},

	--main doors
	{
		authorizedJobs = { 'usine' },
		doorid = 2343746133,
		objCoords  = vector3(-301.94, 771.75, 117.72),
		textCoords  = vector3(-303.02, 771.60, 118.47),
		objYaw = -170.0,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'usine' },
		doorid = 1340831050,
		objCoords  = vector3(-311.75, 774.67, 117.72),
		textCoords  = vector3(-310.48, 774.92, 118.70),
		objYaw = 10.05,
		locked = false,
		distance = 3.0
	},

	{
		authorizedJobs = { 'usine' },
		doorid = 3718620420,
		objCoords  = vector3(-311.06, 770.12, 117.7),
		textCoords  = vector3(-309.97, 770.20, 118.70),
		objYaw = 10.36,
		locked = false,
		distance = 3.0
	},

	{
		authorizedJobs = { 'usine' },
		doorid = 334467483,
		objCoords  = vector3(-302.93, 767.6, 117.69),
		textCoords  = vector3(-302.97, 768.61, 118.70),
		objYaw = 100.0,
		locked = true,
		distance = 3.0
	},

	-- --vault

	{
		authorizedJobs = { 'police' },
		doorid = 576950805,
		objCoords  = vector3(-307.76, 766.34, 117.7),
		textCoords  = vector3(-306.60, 766.65, 118.70),
		objYaw = -170.0,
		locked = true,
		distance = 3.0
	},
	-- --back door
	{
		authorizedJobs = { 'usine' },
		doorid = 2307914732,
		objCoords  = vector3(-301.51, 762.98, 117.73),
		textCoords  = vector3(-300.59, 763.20, 118.70),
		objYaw = 10.0,
		locked = true,
		distance = 3.0
	},

	-- --
	-- -- Rhodes Sheriff Office
	-- --

	{
		authorizedJobs = { 'police' },
		doorid = 349074475,
		objCoords  = vector3(1359.71, -1305.97, 76.76),
		textCoords  = vector3(1358.42, -1305.71, 77.72),
		objYaw = 160.0,
		locked = false,
		distance = 3.0
	},
	-- {
	-- 	authorizedJobs = { 'police' },
	-- 	doorid = 1614494720,
	-- 	objCoords  = vector3(1359.12, -1297.56, 76.78),
	-- 	textCoords  = vector3(1358.51, -1298.95,77.78),
	-- 	objYaw = -110.0,
	-- 	locked = true,
	-- 	distance = 3.0
	-- },

	-- --
	-- -- Blackwater Sheriff Office
	-- --

	{
		textCoords = vector3(-757.27, -1269.34, 44.04),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objYaw = 90.0,
				doorid = 3410720590,
				objCoords = vector3(-757.05, -1268.49, 43.06)
			},

			{
				objYaw = 90.0,
				doorid = 3821185084,
				objCoords = vector3(-757.05, -1269.93, 43.06)
			}
		}
	},


}
