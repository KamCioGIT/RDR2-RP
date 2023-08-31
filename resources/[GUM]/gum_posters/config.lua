Config = {}


-----------------------------
---------DISCORD HOOK--------
-----------------------------
Config.EnableHook = true
Config.WebhookLink = ""
Config.Icon = "https://cdn.discordapp.com/attachments/779321765394513930/933837501049761823/logo.png"
Config.Avatar = "https://cdn.discordapp.com/attachments/779321765394513930/933837501049761823/logo.png"
Config.ICNameDiscord = true--Name lastname on discord
Config.DiscordSpamBlock = true--This block same link in 1 line spam on discord
-----------------------------
-----------------------------
-----------------------------

-----------------------------
-----------NOTIFY------------
-----------------------------
Config.NotifyImage = ""
-----------------------------
-----------------------------
-----------------------------

-----------------------------
-----------GAME--------------
-----------------------------
Config.CleanerTime = 7--in days (every  7 days will be removed old pinned posters)
Config.CityPoster = false--If you want filter posters by city
Config.ICNamePoster = true--If you want see in game who post this poster

Config.Name = "Poster"
Config.UserName = "Name : "
Config.TownName = "Town : "

Config.Posters = {
    [1] = {
        blip=true,
        name="Poster Board - Saint Denis", 
        object="mp005_p_mp_bountyboard01x",
        coords={2516.90, -1305.57, 48.99, 90.0},
    },
    [2] = {
        blip=true,
        name="Poster Board - Valentine", 
        object="mp005_p_mp_bountyboard01x",
        coords={-270.05, 807.20, 119.42, 100.0},
    },
    [3] = {
        blip=true,
        name="Poster Board - Rhodes", 
        object="mp005_p_mp_bountyboard01x",
        coords={1234.15, -1293.25, 76.91, -45.0},
    },
    [4] = {
        blip=true,
        name="Poster Board - Van horn", 
        object="mp005_p_mp_bountyboard02x",
        coords={2956.05 ,501.69 ,44.87, 95.0},
    },
    [5] = {
        blip=true,
        name="Poster Board - Annesburg", 
        object="mp005_p_mp_bountyboard02x",
        coords={2927.45 ,1287.86, 43.46, 250.00},
    },
    [6] = {
        blip=true,
        name="Poster Board - Strawberry", 
        object="mp005_p_mp_bountyboard01x",
        coords={-1765.30, -386.10, 157.80, 326.74},
    },
    [7] = {
        blip=true,
        name="Poster Board - Blackwater", 
        object="mp005_p_mp_bountyboard02x",
        coords={-867.08, -1329.78, 42.20, 89.00},
    },
    [8] = {
        blip=true,
        name="Poster Board - Armadillo", 
        object="mp005_p_mp_bountyboard02x",
        coords={-3722.10, -2603.63, -14.40, 87.97},
    },
    [9] = {
        blip=true,
        name="Poster Board - Tumbleweed", 
        object="mp005_p_mp_bountyboard01x",
        coords={-5525.96, -2926.90, -1.90, 115.85},
    },
}

Config.JobForPlace = false
Config.JobPlaceTable = {
    [1] = "Posters",
    [2] = "Posters2",
}

Config.JobForDelete = false
Config.JobDeleteTable = {
    [1] = "Posters",
    [2] = "Posters2",
}

--In HTML File you can translate placeholder
Config.Language = {
    [1] = "Poster",
    [2] = "Open",
    [3] = "Do you want to remove this poster?",
    [4] = "Yes",
    [5] = "No",
    [6] = "This is not your poster",
    [7] = "Close",
    [8] = "Zoom poster",
    [9] = "Remove poster",
}
