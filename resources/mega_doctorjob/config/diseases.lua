DiseasesConfig = {
   -- ['cold'] = {
   --    name = 'cold',
   --    displayName = 'Common Cold',
   --    healthLossPerTick = 50,
   --    tickRate = 250,
   --    effectRate = 60000,
   --    -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
   --    autoHealTime = 1800000,
   --    -- The coldness level system works that way:
   --    -- it starts from zero and it gets increased every tick based on cold factors (tick rate affects the whole thing, for example increasing it will considerably make it harder to get sick)
   --    -- every factor sums up to a value, when it reaches the maxColdnessLevel the player will get sick
   --    -- for each tick the player is not inside the cold factors it will lose a coldness point
   --    maxColdnessLevel = 1200,
   --    -- temperature which is considered to be cold
   --    coldTemperature = 7.0,
   --    -- how much the factors affect the coldness level (0 (nothing) to n)
   --    -- staying in cold temperatures
   --    temperatureRate = 1,
   --    -- staying in water
   --    waterRate = 1,
   --    language = {
   --       started = "You feel weak and have difficulty breathing.",
   --       autoHealed = "You're starting to breathe better.",
   --    },
   --    -- Animations
   --    coughAnimationDict = 'mech_loco_m@character@arthur@fidgets@injured@action@unarmed',
   --    coughAnimation = 'cough',
   --    -- Mandatory symptoms for the dashboard.
   --    -- Those are basically hints for the doctor to understand which cure has do be administered to the patient.
   --    symptoms = {
   --       heartRate = 'Fast',
   --       -- min and max values, body temps will be randomized between those values
   --       bodyTemperatureRange = { 37.8, 38.5 }
   --    }
   -- },
   ['brokenBone'] = {
      name = 'brokenBone',
      displayName = 'Os fissuré',
      healthLossPerTick = 0,
      tickRate = 250,
      effectRate = 120000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      -- minimum damage to take in order to get a broken bone (0.0 -> 600.0)
      minDamageActivation = 70.0,
      -- broken bone probability when you get to the minDamageActivation (0.0 -> 1.0)
      brokenBoneProbability = 1.0,
      enableRagdoll = true,
      -- damage for running while having a broken bone
      damageRunning = 100,
      language = {
         started = "Vous entendez votre os craquer, une douleur vous envahit.",
         autoHealed = "La douleur disparaît peu à peu.",
      },
   },
   ['bleeding'] = {
      name = 'bleeding',
      displayName = "Hémorragie",
      healthLossPerTick = 5,
      tickRate = 6000,
      effectRate = 5000,
      -- milliseconds, time it will take to apply the cure item
      applyDuration = 10000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = 300000,
      enableRagdoll = true,
      language = {
         started = "Vous commencez à saigner, appliquez un bandage et allez voir un médecin.",
         autoHealed = "Le saignement s'est arrêté",
      },
      -- Firearms that can affect bleeding
      -- [weaponHash] = bleedProbability (0.0 -> 1.0) }
      -- https://github.com/femga/rdr3_discoveries/blob/master/weapons/weapons.lua
      firearmsBleedProbability = {
         ['weapon_revolver_doubleaction'] = 0.1,
         ['weapon_revolver_cattleman'] = 0.1,
         ['weapon_revolver_lemat'] = 0.1,
         ['weapon_revolver_schofield'] = 0.1,
         ['weapon_pistol_mauser'] = 0.1,
         ['weapon_pistol_semiauto'] = 0.1,
         ['weapon_pistol_m1899'] = 0.1,
         ['weapon_pistol_volcanic'] = 0.1,
         ['weapon_rifle_springfield'] = 0.1,
         ['weapon_rifle_boltaction'] = 0.1,
         ['weapon_rifle_varmint'] = 0.1,
         ['weapon_shotgun_sawedoff'] = 0.1,
         ['weapon_shotgun_doublebarrel_exotic'] = 0.1,
         ['weapon_shotgun_pump'] = 0.1,
         ['weapon_shotgun_repeating'] = 0.1,
         ['weapon_shotgun_semiauto'] = 0.1,
         ['weapon_shotgun_doublebarrel'] = 0.1,
         ['weapon_sniperrifle_carcano'] = 0.1,
         ['weapon_sniperrifle_rollingblock'] = 0.1,
         ['weapon_rifle_elephant'] = 0.1,
         ['weapon_revolver_navy'] = 0.1,
         ['weapon_bow'] = 0.1,
         ['weapon_bow_improved'] = 0.1,
         ['weapon_repeater_henry'] = 0.1,
         ['weapon_repeater_winchester'] = 0.1,
         ['weapon_repeater_carbine'] = 0.1,
         ['weapon_repeater_evans'] = 0.1,
      },
      meleeBleedProbability = {
         ['weapon_melee_knife_jawbone'] = 0.1,
         ['weapon_melee_machete'] = 0.1,
         ['weapon_melee_knife'] = 0.1,
         ['weapon_melee_hatchet'] = 0.1,
         ['weapon_melee_hatchet_hunter'] = 0.1,
         ['weapon_thrown_tomahawk'] = 0.1,
         ['weapon_melee_cleaver'] = 0.1,
         ['weapon_melee_hatchet_double_bit'] = 0.1,
         ['weapon_melee_knife_trader'] = 0.1,
         ['weapon_thrown_throwing_knives'] = 0.1,
      }
   },
   ['gunscratch'] = {
      name = 'gunscratch',
      displayName = "Égratignure",
      healthLossPerTick = 1,
      tickRate = 6000,
      effectRate = 5000,
      -- milliseconds, time it will take to apply the cure item
      applyDuration = 10000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      enableRagdoll = false,
      language = {
         started = "Une balle vous a touché, vous avez une égratignure.",
         autoHealed = "Le saignement s'est arrêté",
      },
      -- Firearms that can affect bleeding
      -- [weaponHash] = bleedProbability (0.0 -> 1.0) }
      -- https://github.com/femga/rdr3_discoveries/blob/master/weapons/weapons.lua
      firearmsBleedProbability = {
         ['weapon_revolver_doubleaction'] = 1.0,
         ['weapon_revolver_cattleman'] = 1.0,
         ['weapon_revolver_lemat'] = 1.0,
         ['weapon_revolver_schofield'] = 1.0,
         ['weapon_pistol_mauser'] = 1.0,
         ['weapon_pistol_semiauto'] = 1.0,
         ['weapon_pistol_m1899'] = 1.0,
         ['weapon_pistol_volcanic'] = 1.0,
         ['weapon_rifle_springfield'] = 1.0,
         ['weapon_rifle_boltaction'] = 1.0,
         ['weapon_rifle_varmint'] = 1.0,
         ['weapon_shotgun_sawedoff'] = 1.0,
         ['weapon_shotgun_doublebarrel_exotic'] = 1.0,
         ['weapon_shotgun_pump'] = 1.0,
         ['weapon_shotgun_repeating'] = 1.0,
         ['weapon_shotgun_semiauto'] = 1.0,
         ['weapon_shotgun_doublebarrel'] = 1.0,
         ['weapon_sniperrifle_carcano'] = 1.0,
         ['weapon_sniperrifle_rollingblock'] = 1.0,
         ['weapon_rifle_elephant'] = 1.0,
         ['weapon_revolver_navy'] = 1.0,
         ['weapon_bow'] = 1.0,
         ['weapon_bow_improved'] = 1.0,
         ['weapon_repeater_henry'] = 1.0,
         ['weapon_repeater_winchester'] = 1.0,
         ['weapon_repeater_carbine'] = 1.0,
         ['weapon_repeater_evans'] = 1.0,
      },
   },
   ['meleescratch'] = {
      name = 'meleescratch',
      displayName = "Égratignure",
      healthLossPerTick = 1,
      tickRate = 6000,
      effectRate = 5000,
      -- milliseconds, time it will take to apply the cure item
      applyDuration = 10000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      enableRagdoll = false,
      language = {
         started = "Une lame vous a touché, vous avez une égratignure.",
         autoHealed = "Le saignement s'est arrêté",
      },
      -- Firearms that can affect bleeding
      -- [weaponHash] = bleedProbability (0.0 -> 1.0) }
      -- https://github.com/femga/rdr3_discoveries/blob/master/weapons/weapons.lua
      meleeBleedProbability = {
         ['weapon_melee_knife_jawbone'] = 1.0,
         ['weapon_melee_machete'] = 1.0,
         ['weapon_melee_knife'] = 1.0,
         ['weapon_melee_hatchet'] = 1.0,
         ['weapon_melee_hatchet_hunter'] = 1.0,
         ['weapon_thrown_tomahawk'] = 1.0,
         ['weapon_melee_cleaver'] = 1.0,
         ['weapon_melee_hatchet_double_bit'] = 1.0,
         ['weapon_melee_knife_trader'] = 1.0,
         ['weapon_thrown_throwing_knives'] = 1.0,
      }
   },
   ['gun1'] = {
      name = 'gun1',
      displayName = "Balle logée",
      healthLossPerTick = 5,
      tickRate = 6000,
      effectRate = 5000,
      -- milliseconds, time it will take to apply the cure item
      applyDuration = 10000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      enableRagdoll = false,
      language = {
         started = "Une balle vous a touché, elle n'est pas ressorti. Appliquez un bandage.",
         autoHealed = "Le saignement s'est arrêté",
      },
      -- Firearms that can affect bleeding
      -- [weaponHash] = bleedProbability (0.0 -> 1.0) }
      -- https://github.com/femga/rdr3_discoveries/blob/master/weapons/weapons.lua
      firearmsBleedProbability = {
         ['weapon_revolver_doubleaction'] = 0.3,
         ['weapon_revolver_cattleman'] = 0.3,
         ['weapon_revolver_lemat'] = 0.3,
         ['weapon_revolver_schofield'] = 0.3,
         ['weapon_pistol_mauser'] = 0.3,
         ['weapon_pistol_semiauto'] = 0.3,
         ['weapon_pistol_m1899'] = 0.3,
         ['weapon_pistol_volcanic'] = 0.3,
         ['weapon_rifle_springfield'] = 0.3,
         ['weapon_rifle_boltaction'] = 0.3,
         ['weapon_rifle_varmint'] = 0.3,
         ['weapon_shotgun_sawedoff'] = 0.3,
         ['weapon_shotgun_doublebarrel_exotic'] = 0.3,
         ['weapon_shotgun_pump'] = 0.3,
         ['weapon_shotgun_repeating'] = 0.3,
         ['weapon_shotgun_semiauto'] = 0.3,
         ['weapon_shotgun_doublebarrel'] = 0.3,
         ['weapon_sniperrifle_carcano'] = 0.3,
         ['weapon_sniperrifle_rollingblock'] = 0.3,
         ['weapon_rifle_elephant'] = 0.3,
         ['weapon_revolver_navy'] = 0.3,
         ['weapon_bow'] = 0.3,
         ['weapon_bow_improved'] = 0.3,
         ['weapon_repeater_henry'] = 0.3,
         ['weapon_repeater_winchester'] = 0.3,
         ['weapon_repeater_carbine'] = 0.3,
         ['weapon_repeater_evans'] = 0.3,
      },
   },
   ['gun2'] = {
      name = 'gun2',
      displayName = "Balle ressortie",
      healthLossPerTick = 5,
      tickRate = 6000,
      effectRate = 5000,
      -- milliseconds, time it will take to apply the cure item
      applyDuration = 10000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      enableRagdoll = false,
      language = {
         started = "Une balle vous a touché, elle est ressortie. Appliquez un bandage.",
         autoHealed = "Le saignement s'est arrêté",
      },
      -- Firearms that can affect bleeding
      -- [weaponHash] = bleedProbability (0.0 -> 1.0) }
      -- https://github.com/femga/rdr3_discoveries/blob/master/weapons/weapons.lua
      firearmsBleedProbability = {
         ['weapon_revolver_doubleaction'] = 0.3,
         ['weapon_revolver_cattleman'] = 0.3,
         ['weapon_revolver_lemat'] = 0.3,
         ['weapon_revolver_schofield'] = 0.3,
         ['weapon_pistol_mauser'] = 0.3,
         ['weapon_pistol_semiauto'] = 0.3,
         ['weapon_pistol_m1899'] = 0.3,
         ['weapon_pistol_volcanic'] = 0.3,
         ['weapon_rifle_springfield'] = 0.3,
         ['weapon_rifle_boltaction'] = 0.3,
         ['weapon_rifle_varmint'] = 0.3,
         ['weapon_shotgun_sawedoff'] = 0.3,
         ['weapon_shotgun_doublebarrel_exotic'] = 0.3,
         ['weapon_shotgun_pump'] = 0.3,
         ['weapon_shotgun_repeating'] = 0.3,
         ['weapon_shotgun_semiauto'] = 0.3,
         ['weapon_shotgun_doublebarrel'] = 0.3,
         ['weapon_sniperrifle_carcano'] = 0.3,
         ['weapon_sniperrifle_rollingblock'] = 0.3,
         ['weapon_rifle_elephant'] = 0.3,
         ['weapon_revolver_navy'] = 0.3,
         ['weapon_bow'] = 0.3,
         ['weapon_bow_improved'] = 0.3,
         ['weapon_repeater_henry'] = 0.3,
         ['weapon_repeater_winchester'] = 0.3,
         ['weapon_repeater_carbine'] = 0.3,
         ['weapon_repeater_evans'] = 0.3,
      },
   },
   ['malaria'] = {
      name = 'malaria',
      displayName = 'Dysentrie',
      healthLossPerTick = 2,
      tickRate = 1000,
      effectRate = 60000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      -- The infection level system works like coldness level:
      -- it starts from zero and it gets increased every tick if you're in an infected area
      -- when it reaches the maxInfectionLevel the player will get sick
      -- for each tick the player is not inside the infected area, it will lose a infection point
      -- small formula to get how much time it needs to be infected (you can use that for balancing)
      -- timeNeeded(seconds) = (tickRate/1000) * maxInfectionLevel
      -- to get the right maxInfectionLevel knowing the timeNeeded
      -- maxInfectionLevel = timeNeeded(seconds) / (tickRate/1000)
      maxInfectionLevel = 100,
      -- take a look at https://github.com/femga/rdr3_discoveries/tree/master/zones
      -- probability is calculated every tick (tickRate)
      -- higher tickrates and/or probability can make it easier to contract
      -- adjust those settings as you prefer
      language = {
         started = "Vous avez bu de l'eau croupie, vous avez mal au ventre.",
         autoHealed = "vous vous ssentez mieux.",
      },
      -- Animations
      vomitAnimationDict = 'amb_misc@world_human_vomit@male_a@idle_b',
      vomitAnimation = 'idle_e',
      -- Mandatory symptoms for the dashboard.
      -- Those are basically hints for the doctor to understand which cure has do be administered to the patient.
      symptoms = {
         heartRate = 'Rapide',
         -- min and max values, body temps will be randomized between those values
         bodyTemperatureRange = { 38.5, 40.0 }
      }
   },
   -- ['cholera'] = {
   --    name = 'cholera',
   --    displayName = 'Cholera',
   --    healthLossPerTick = 60,
   --    tickRate = 1000,
   --    effectRate = 60000,
   --    -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
   --    autoHealTime = -1,
   --    -- The infection level system works like coldness level:
   --    -- it starts from zero and it gets increased every tick if you're in an infected area
   --    -- when it reaches the maxInfectionLevel the player will get sick
   --    -- for each tick the player is not inside the infected area, it will lose a infection point
   --    -- small formula to get how much time it needs to be infected (you can use that for balancing)
   --    -- timeNeeded(seconds) = (tickRate/1000) * maxInfectionLevel
   --    -- to get the right maxInfectionLevel knowing the timeNeeded
   --    -- maxInfectionLevel = timeNeeded(seconds) / (tickRate/1000)
   --    maxInfectionLevel = 600,
   --    -- probability is calculated every tick (tickRate)
   --    -- higher tickrates and/or probability can make it easier to contract
   --    -- adjust those settings as you prefer
   --    infectionZonesProbability = {
   --       { 
   --          coords = vector3(-3663.84, -2611.92, -14.08), 
   --          radius = 80.0,
   --          infectionPoints = 1
   --       }
   --    },
   --    language = {
   --       started = "You feel weak and your stomach hurts a lot, you have a lot of nausea.",
   --       autoHealed = "You're starting to feel better.",
   --    },
   --    -- Animations
   --    vomitAnimationDict = 'amb_misc@world_human_vomit@male_a@idle_b',
   --    vomitAnimation = 'idle_e',
   --    stomachAnimationDict = 'mech_loco_m@character@arthur@fidgets@injured@action@unarmed',
   --    stomachAnimation = 'pain_stomach',
   --    -- Mandatory symptoms for the dashboard.
   --    -- Those are basically hints for the doctor to understand which cure has do be administered to the patient.
   --    symptoms = {
   --       heartRate = 'Fast',
   --       -- min and max values, body temps will be randomized between those values
   --       bodyTemperatureRange = { 39.0, 41.0 }
   --    }
   -- },
   ['snakeBite'] = {
      name = 'snakeBite',
      displayName = "Morsure de serpent",
      healthLossPerTick = 10,
      tickRate = 250,
      effectRate = 30000,
      -- milliseconds, time it will take to apply the cure item
      applyDuration = 10000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      enableRagdoll = true,
      language = {
         started = "Votre peau est irritée à l'endroit de la morsure.",
         autoHealed = "Les effets du venin se sont dissipés",
      },
      -- Probability of getting poisoned after being bitten (0.0 - 1.0)
      poisonousBiteProbability = 0.5,
      -- Animations
      vomitAnimationDict = 'amb_misc@world_human_vomit@male_a@idle_b',
      vomitAnimation = 'idle_e',
      -- Mandatory symptoms for the dashboard.
      -- Those are basically hints for the doctor to understand which cure has do be administered to the patient.
      symptoms = {
         heartRate = 'Extreme',
         -- min and max values, body temps will be randomized between those values
         bodyTemperatureRange = { 40.0, 41.0 }
      }
   },
}
