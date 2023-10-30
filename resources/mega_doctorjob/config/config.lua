Config = {}

Config.debug = false -- use only in dev
Config.printLogs = true
Config.adminGroups = { 'admin', 'moderator', 'superadmin' }

Config.framework = 'redemrp2k23'

Config.language = {
    notificationTitle = "Santé",
    medicalBed = "Table d'examen",
    layDown = "S'allonger",
    getUp = "Se lever",
    visit = "Ausculter",
    inspect = "Ausculter",
    unableToUseItem = "Vous ne savez pas utiliser cet objet.",
    doctorsOnline = "Il y a un de mes collègues en service.",
    notEnoughMoney = "Vous n'avez pas assez d'argent.",
    healed = "Vous avez été soigné par le médecin.",
    noDiseases = "Vous n'êtes pas malade.",
    revived = "Vous avez été relevé par le médecin.",
    notDead = "Vous ne pouvez pas relever ce joueur.",
    cannotReviveHeadshot = "Le joueur a pris une balle dans la tête.",
    healMe = "Me Soigner",
    npcDoctor = "Médecin de garde",
    revive = "Relever",
    noDoctorsOnline = "Il n'y as pas de médecins",
    helpRequest = "Quelqu'un a entendu un blessé crier dans les environs.",
    helpRequested = "Vous criez à l'aide.",
    helpBlipText = "Personne en danger #%d | %s",
    helpResponse = "Quelqu'un est parti chercher de l'aide.",
    -- webhooks
    embedName = "Mega Doctorjob",
    newDiseaseTitle = "Nouvelle maladie",
    newDiseaseText = "**Joueur**: %s (%s)\n**Maladie:** %s\n**Bone:** %s\n**Type de dommage:** %s",
    autoHealedDiseaseTitle = "La maladie s'est auto-heal",
    autoHealedDiseaseText = "**Maladie:** %s\n**Joueur:** %s (%s)",
    healItemUsedTitle = "Utilisation de heal",
    healItemUsedText = "**Item:** %s\n**Joueur:** %s (%s)\n**Maladie heal:** %s",
    doctorHealedDiseaseTitle = "Un médecin a soignée une maladie",
    doctorHealedDiseaseText = "**Disease:** %s\n**Damage Type:** %s\n**Médecin:** %s (%s)\n**Joueur:** %s (%s)",
    npcDoctorHealedTitle = "PNJ Heal Joueur",
    npcDoctorHealedText = "**Joueur:** %s (%s)\n**Hôpital:** %s",
    npcDoctorRevivedTitle = "PNJ Revive Joueur",
    npcDoctorRevivedText = "**Joueur:** %s (%s)\n**Hôpital:** %s",
    resurrectedPlayerTitle = "Un joueur a été relevé",
    resurrectedPlayerText = "**Joueur:** %s (%s)\n**Target Joueur:** %s (%s)",
    playerAlertTitle = "Un joueur demande de l'aide",
    playerAlertText = "**Joueur:** %s (%s)\n**Coords:** `%s %s %s`"
}

-- uncomment to enable webhook options
Config.webhookOptions = {
    webhook = "https://discord.com/api/webhooks/1165342579987075172/E3NW0E_vbgQNyVAePe3UaXmaiHqB4AaVQxStutHzJqC7SvHR60jHFmL54XYL8o4hR5Me",
    color = 3447003
}

-- If you have syn_society it will use it's API export to calculate only "in duty" workers.
Config.syn_society = false
Config.mega_companies = false
-- !!!Only works if you have syn_society or mega_companies!!!
-- Tax that gets deducted from the doctor npc revenue. 
-- Example: doctor npc heal costs 30$
-- Tax: 0.10 (10%)
-- Society receives: 27$
Config.ledgerTax = 0.10
-- the id of the society (syn_society) or company (mega_companies) where taxes will be sent
-- set this to nil if you don't need it
Config.taxJobId = 'state'

Config.enableAlert = true
Config.enableAlertResponse = false
Config.allowDeadPlayers = false
Config.alertCommand = 'alertdoctor'
Config.respondCommand = 'respond'
Config.clearAlertCommand = 'clearAlerts'
-- put 0 if you don't want to show anything
Config.alertBlipSprite = -1998899839	
Config.showRadiusAroundBlip = true
Config.blipRadius = 75.0
Config.radiusStyle = -666422021
-- seconds to wait before the alert blip will be removed from the map
Config.alertTimeout = 720

Config.medicalBeds = { 'p_medbed01x', 'p_bed03x' }
Config.jobs = { 'doctor', 'doctor_stdenis', 'doctor_bla', 'doctor_DM', 'doctor_CG', 'doctor_NC', 'doctor_AL', 'doctor_CP', 'doctor_GB'}
Config.allowPlayerTargeting = true
Config.playerTargetRange = 1.5

-- jobs that can inspect a dead body
Config.inspectCommand = 'analyse'
Config.inspectJobs = { 'doctor', 'police', 'doctor_bla', 'doctor_stdenis', 'doctor_DM', 'doctor_CG', 'doctor_NC', 'doctor_AL', 'doctor_CP', 'doctor_GB' }
Config.allowPlayerInspecting = true
Config.playerInspectRange = 1.5

-- NPC Revive System
Config.noHeadshotRevive = false

-- If you already have a bandana script, you can link it by adding an event when the bandana is up or down
-- doctorjob script will listen for this event, data must be a boolean (true/false) for (up/down)
-- It's used to prevent getting diseases such cholera or malaria
Config.bandanaEvent = 'syn_robbery:bandana'

-- Whether to remove or not diseases on revive/respawn
Config.removeDiseaseOnRevive = false

-- Hospitals are just used for patient notes.
-- When a doctor saves a note for a patient it will be shared within the hospital structure.
Config.hospitals = {
    ['Cabinet de Saint-Denis'] = {
        showBlip = true,
        blipSprite = -1739686743,
        coords = vector3(2725.86, -1227.72, 50.36),
        radius = 20.0,
        npc = {
            enabled = true,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor', 'doctor_stdenis', 'doctor_bla', 'doctor_DM', 'doctor_CG', 'doctor_NC', 'doctor_AL', 'doctor_CP', 'doctor_GB'},
            healCost = 1.0,
            reviveCost = 1.0,
            reviveTime = 30,
            npcModel = 'CS_DrMalcolmMacIntosh',
            coords = vector3(2721.34, -1231.71, 49.36),
            heading = 90.0,
            range = 2.0
        },
        jobId = nil -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Cabinet de Blackwater'] = {
        showBlip = true,
        blipSprite = -1739686743,
        coords = vector3(-784.4287, -1304.812, 42.50),
        radius = 20.0,
        npc = {
            enabled = true,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor', 'doctor_stdenis', 'doctor_bla', 'doctor_DM', 'doctor_CG', 'doctor_NC', 'doctor_AL', 'doctor_CP', 'doctor_GB'},
            healCost = 1.0,
            reviveCost = 1.0,
            reviveTime = 30,
            npcModel = 'cs_crackpotinventor',
            coords = vector3(-789.4224, -1301.978, 42.5),
            heading = -180.0,
            range = 2.0
        },
        jobId = nil -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Cabinet de Clarence Goodwin'] = {
        showBlip = false,
        blipSprite = -1739686743,
        coords = vector3(-784.4287, -1304.812, 42.50),
        radius = 20.0,
        npc = {
            enabled = false,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor_CG' },
            healCost = 1.0,
            reviveCost = 1.0,
            reviveTime = 30,
            npcModel = 'cs_crackpotinventor',
            coords = vector3(-789.4224, -1301.978, 42.5),
            heading = -180.0,
            range = 2.0
        },
        jobId = nil -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Cabinet de Duncan Mccormick'] = {
        showBlip = false,
        blipSprite = -1739686743,
        coords = vector3(-784.4287, -1304.812, 42.50),
        radius = 20.0,
        npc = {
            enabled = false,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor_DM' },
            healCost = 1.0,
            reviveCost = 1.0,
            reviveTime = 30,
            npcModel = 'cs_crackpotinventor',
            coords = vector3(-789.4224, -1301.978, 42.5),
            heading = -180.0,
            range = 2.0
        },
        jobId = nil -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Cabinet de Neteyam Chumani'] = {
        showBlip = false,
        blipSprite = -1739686743,
        coords = vector3(-784.4287, -1304.812, 42.50),
        radius = 20.0,
        npc = {
            enabled = false,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor_NC' },
            healCost = 1.0,
            reviveCost = 1.0,
            reviveTime = 30,
            npcModel = 'cs_crackpotinventor',
            coords = vector3(-789.4224, -1301.978, 42.5),
            heading = -180.0,
            range = 2.0
        },
        jobId = nil -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Cabinet de Armand Leclair'] = {
        showBlip = false,
        blipSprite = -1739686743,
        coords = vector3(-784.4287, -1304.812, 42.50),
        radius = 20.0,
        npc = {
            enabled = false,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor_AL' },
            healCost = 1.0,
            reviveCost = 1.0,
            reviveTime = 30,
            npcModel = 'cs_crackpotinventor',
            coords = vector3(-789.4224, -1301.978, 42.5),
            heading = -180.0,
            range = 2.0
        },
        jobId = nil -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Cabinet de CP'] = {
        showBlip = false,
        blipSprite = -1739686743,
        coords = vector3(-784.4287, -1304.812, 42.50),
        radius = 20.0,
        npc = {
            enabled = false,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor_CP' },
            healCost = 1.0,
            reviveCost = 1.0,
            reviveTime = 30,
            npcModel = 'cs_crackpotinventor',
            coords = vector3(-789.4224, -1301.978, 42.5),
            heading = -180.0,
            range = 2.0
        },
        jobId = nil -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Cabinet de GB'] = {
        showBlip = false,
        blipSprite = -1739686743,
        coords = vector3(-784.4287, -1304.812, 42.50),
        radius = 20.0,
        npc = {
            enabled = false,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor_GB' },
            healCost = 1.0,
            reviveCost = 1.0,
            reviveTime = 30,
            npcModel = 'cs_crackpotinventor',
            coords = vector3(-789.4224, -1301.978, 42.5),
            heading = -180.0,
            range = 2.0
        },
        jobId = nil -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    
}

-- This is for calculaing body temperature including types of clothes that the player has

Config.ClothesTemperatures = {
    -- Hat
    [0x9925C067] = {
        temperature = 2.0 -- How many degrees add to the local temperature if wearing this
    }, 
    -- Shirts
    [0x2026C46D] = {
        temperature = 1.0
    },
    -- Pants
    [0x1D4C528A] = {
        temperature = 2.0
    },
    -- Boots
    [0x777EC6EF] = {
        temperature = 1.0
    },
    -- Coats
    [0xE06D30CE] = {
        temperature = 3.0
    },
    -- Coats Closed
    [0x662AC34] = {
        temperature = 4.0
    },
    -- Gloves 
    [0xEABE0032] = {
        temperature = 1.0
    },
    -- Vest
    [0x485EE834] = {
        temperature = 1.0
    },
    -- Ponchos
    [0xAF14310B] = {
        temperature = 2.0
    },
    -- Cloaks
    [0x3C1A74CD] = {
        temperature = 2.0
    },
    -- Skirts
    [0xA0E3AB7F] = {
        temperature = 2.0
    }
}

-- Don't touch unless you know what you're doing

-- Those are damage states for diseases, you can add your own if you need to
-- also, take a look in config.js for the translation in the UI, names must match.

-- They are used to add some steps to heal wounds, originally only for bleeding
-- and for customising healing animations and progress.

-- It is declared inside disease data
-- example: self._data.damageType = 'projectile'
Config.damageTypes = {
    ['projectile'] = {
        next = 'cut',
        lang = 'Vous retirez le projectile...',
        animationDict = 'amb_work@world_human_repair@med@oilcan@male_a@idle_b',
        animation = 'idle_d',
        duration = 5000
    },
    ['cut'] = {
        next = nil,
        lang = 'Application de points de suture...',
        animationDict = 'script_re@injured_rider@dr_office',
        animation = 'surgery_exit_doc',
        duration = 20000
    },
    ['broken'] = {
        next = nil,
        lang = "Application d'une attelle...",
        animationDict = 'script_re@injured_rider@dr_office',
        animation = 'surgery_exit_doc',
        duration = 20000
    },
    ['bandaged'] = {
        next = 'cut',
        lang = 'Vous retirez les bandages...',
        animationDict = 'amb_work@world_human_repair@med@oilcan@male_a@idle_b',
        animation = 'idle_d',
        duration = 5000
    },
    -- default fallback state if none of those is set
    ['default'] = {
        next = nil,
        lang = 'Soin...',
        animationDict = 'script_re@injured_rider@dr_office',
        animation = 'surgery_exit_doc',
        duration = 20000
    }
}

-- Don't touch unless you know what you're doing
-- Still unused, waiting for RedM to work with some walkstyles on MP_Ped
Config.boneIDsToAnimation = {
    female = {
        ['injured_right_arm'] = {
            54802, 
            16827, 
            16828, 
            16829, 
            16747, 
            16748, 
            16749, 
            16750, 
            16731, 
            16732, 
            16733, 
            16734, 
            16779, 
            16780, 
            16781,
            16782,
            16763,
            16764,
            16765,
            16766,
            54187,
            46065
        },
        ['injured_left_arm'] = {
            30226,
	        41403,
	        41404,
	        41405,
	        41323,
	        41324,
	        41325,
	        41326,
	        41307,
	        41308,
	        41309,
	        41310,
	        41355,
	        41356,
	        41357,
	        41358,
	        41339,
	        41340,
	        41341,
	        41342,
            45454,
	        53675,
	        34606,
	        37873,
        },
        ['injured_right_leg'] = {
            43312,
            33646,
            6884,
            41273,
            18013,
            18029
        },
        ['injured_left_leg'] = {
            55120,
            45454,
            53081,
            11440,
            11456,
            65478
        },
        ['default'] = { 'injured_general' }
    },
    male = {
        ['injured_right_arm'] = {
            54802,
            16827,
            16828,
            16829,
            16747,
            16748,
            16749,
            16750,
            16731,
            16732,
            16733,
            16734,
            16779,
            16780,
            16781,
            16782,
            16763,
            16764,
            16765,
            16766,
            54187,
            22798,
            46065,
        },
        ['injured_left_arm'] = {
            30226,
            41403,
            41404,
            41405,
            41323,
            41324,
            41325,
            41326,
            41307,
            41308,
            41309,
            41310,
            41355,
            41356,
            41357,
            41358,
            41339,
            41340,
            41341,
            41342,
            53675,
	        34606,
            37873
        },
        ['injured_right_leg'] = {
            43312,
            55120,
            65478,
            53081,
            11440,
            11456
        },
        ['injured_left_leg'] = {
            43312,
            33646,
            6884,
            41273,
            18013,
            18029
        },
        ['default'] = { 'injured_general' }
    }
}