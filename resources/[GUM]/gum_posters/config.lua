Config = {}


-----------------------------
---------DISCORD HOOK--------
-----------------------------
Config.EnableHook = true
Config.WebhookLink = "https://discord.com/api/webhooks/1146934966828159110/i5-tnhMuFDwVUS6SzX3Yx1WrIlbQ9-mV83lmEpA6XhOH5Xxlc-tKY0u5Dif-HPbN3f03"
Config.Icon = "https://i.imgur.com/i1ylkFj.png"
Config.Avatar = "https://i.imgur.com/i1ylkFj.png"
Config.ICNameDiscord = true --Name lastname on discord
Config.DiscordSpamBlock = true --This block same link in 1 line spam on discord
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
Config.CityPoster = true --If you want filter posters by city
Config.ICNamePoster = false --If you want see in game who post this poster

Config.Name = "Panneau d'affichage"
Config.UserName = "Nom : "
Config.TownName = "Ville : "

Config.Posters = {
    [1] = {
        blip=true,
        name="Panneau d'affichage - New Hannover", --- saint denis
        object="mp005_p_mp_bountyboard01x",
        coords={2516.90, -1305.57, 48.99, 90.0},
    },
    [2] = {
        blip=true,
        name="Panneau d'affichage - New Hannover",  ---- Valentine
        object="mp005_p_mp_bountyboard01x",
        coords={-270.05, 807.20, 119.42, 100.0},
    },
    [3] = {
        blip=true,
        name="Panneau d'affichage - New Hannover",  ---- Rhodes
        object="mp005_p_mp_bountyboard01x",
        coords={1234.15, -1293.25, 76.91, -45.0},
    },
    [4] = {
        blip=true,
        name="Panneau d'affichage - New Hannover",  ---- Van Horn
        object="mp005_p_mp_bountyboard02x",
        coords={2956.05 ,501.69 ,44.87, 95.0},
    },
    [5] = {
        blip=true,
        name="Panneau d'affichage - New Hannover",  --- Annesburg
        object="mp005_p_mp_bountyboard02x",
        coords={2927.45 ,1287.86, 43.46, 250.00},
    },
    [6] = {
        blip=true,
        name="Panneau d'affichage - West Elizabeth",  ---- Strawberry
        object="mp005_p_mp_bountyboard01x",
        coords={-1765.30, -386.10, 157.80, 326.74},
    },
    [7] = {
        blip=true,
        name="Panneau d'affichage - West Elizabeth",  --- blackwater
        object="mp005_p_mp_bountyboard02x",
        coords={-867.08, -1329.78, 42.20, 89.00},
    },
    [8] = {
        blip=true,
        name="Panneau d'affichage - New Austin",  --- Armadillo
        object="mp005_p_mp_bountyboard02x",
        coords={-3722.10, -2603.63, -14.40, 87.97},
    },
    [9] = {
        blip=true,
        name="Panneau d'affichage - New Austin",  --- Tumbleweed
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
    [1] = "Affiche",
    [2] = "Ouvrir",
    [3] = "Voulez vous retirer cette affiche ?",
    [4] = "Oui",
    [5] = "Non",
    [6] = "Ce n'est pas votre affiche",
    [7] = "Fermer",
    [8] = "Regarder l'affiche",
    [9] = "Retirer l'affiche",
}
