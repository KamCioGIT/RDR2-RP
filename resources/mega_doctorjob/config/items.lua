MedicineItems = {
    ['bandage'] = {
        syringe = false,
        healProbability = {
            ['bleeding'] = 1.0,
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = 180000,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 10000,
        -- health to add when used
        healthAmount = 0,
        -- inner core health added from 0 to 100
        innerCoreHealth = 0,
        language = {
            cureExpired = "Votre bandage est tombé, vous saignez à nouveau. Appliquez un bandage et allez voir un docteur.",
            applying = "Application d'un bandage...",
            applied = "Vous avez arrêtez le saignement.",
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = nil,
        animation = nil,
        -- if you don't want to use scenario set it to nil
        scenario = 'WORLD_HUMAN_CROUCH_INSPECT',
        -- the next damage type, used for the bandaged state
        damageType = 'bandaged'
    },
    ['antibiotic'] = {
        syringe = false,
        healProbability = {
            ['cholera'] = 1.0 
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = -1,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 2000,
        -- health to add when used
        healthAmount = 0,
        -- inner core health added from 0 to 100
        innerCoreHealth = 0,
        language = {
            applying = "Ingestion de l'antibiotique...",
            applied = "Le médicament commence à faire effet, vous vous sentez mieux.",
            --cureExpired = "" -- no need for that if cureDuration is -1
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "amb_rest_drunk@world_human_drinking@male_a@idle_a",
        animation = "idle_a",
        -- if you don't want to use scenario set it to nil
        scenario = nil,
    },
    ['antivenin'] = {
        syringe = false,
        healProbability = {
            ['snakeBite'] = 1.0 
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = -1,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 2000,
        -- health to add when used
        healthAmount = 0,
        -- inner core health added from 0 to 100
        innerCoreHealth = 0,
        language = {
            applying = "Ingestion de l'antivenin...",
            applied = "Le médicament commence à faire effet, vous vous sentez mieux.",
            --cureExpired = "" -- no need for that if cureDuration is -1
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "amb_rest_drunk@world_human_drinking@male_a@idle_a",
        animation = "idle_a",
        -- if you don't want to use scenario set it to nil
        scenario = nil,
    },
    ['antidote'] = {
        syringe = false,
        healProbability = {
            ['poison'] = 1.0,
            ['poisonarrow'] = 1.0 
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = -1,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 2000,
        -- health to add when used
        healthAmount = 0,
        -- inner core health added from 0 to 100
        innerCoreHealth = 0,
        language = {
            applying = "Ingestion de l'antidote...",
            applied = "Le médicament commence à faire effet, vous vous sentez mieux.",
            --cureExpired = "" -- no need for that if cureDuration is -1
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "amb_rest_drunk@world_human_drinking@male_a@idle_a",
        animation = "idle_a",
        -- if you don't want to use scenario set it to nil
        scenario = nil,
    },
    ['antidysentrie'] = {
        syringe = false,
        healProbability = {
            ['dysentrie'] = 1.0 
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = -1,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 2000,
        -- health to add when used
        healthAmount = 0,
        -- inner core health added from 0 to 100
        innerCoreHealth = 0,
        language = {
            applying = "Ingestion de la concoction...",
            applied = "Le médicament commence à faire effet, vous vous sentez mieux.",
            --cureExpired = "" -- no need for that if cureDuration is -1
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "amb_rest_drunk@world_human_drinking@male_a@idle_a",
        animation = "idle_a",
        -- if you don't want to use scenario set it to nil
        scenario = nil,
    },
    ['concoctionanesthesiante'] = {
        syringe = false,
        healProbability = {
            ['bleeding'] = 1.0 
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = 60000,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 2000,
        -- health to add when used
        healthAmount = 0,
        -- inner core health added from 0 to 100
        innerCoreHealth = 0,
        language = {
            applying = "Ingestion de la concoction...",
            applied = "Votre douleur s'estompe.",
            cureExpired = "La douleur revient." -- no need for that if cureDuration is -1
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "amb_rest_drunk@world_human_drinking@male_a@idle_a",
        animation = "idle_a",
        -- if you don't want to use scenario set it to nil
        scenario = nil,
        antidouleur = true
    },
    ['concoctioncoagulation'] = {
        syringe = false,
        healProbability = {
            ['bleeding'] = 1.0,
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = 300000,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 10000,
        -- health to add when used
        healthAmount = 0,
        -- inner core health added from 0 to 100
        innerCoreHealth = 0,
        language = {
            cureExpired = "Le baume ne fait plus effet, vous saignez à nouveau.",
            applying = "Application d'un baume...",
            applied = "Vous avez arrêtez le saignement.",
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = nil,
        animation = nil,
        -- if you don't want to use scenario set it to nil
        scenario = 'WORLD_HUMAN_CROUCH_INSPECT',
        -- the next damage type, used for the bandaged state
        damageType = 'bandaged'
    },
    ['remedeinfection'] = {
        syringe = true,
        healProbability = {
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = -1,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 2000,
        -- health to add when used
        healthAmount = 200,
        -- inner core health added from 0 to 100
        innerCoreHealth = 100,
        language = {
            applying = "Ingestion du remède ...",
            applied = "Vous vous sentez mieux.",
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "mech_animal_interaction@horse@right@injection",
        animation = "injection_player",
        -- the next damage type, used for the bandaged state
        allowedJobs = { 'doctor', 'police', 'doctor_bla', 'doctor_stdenis', 'doctor_DM', 'doctor_CG', 'doctor_NC' }
        
    },
    ['remedeantidouleur'] = {
        syringe = true,
        healProbability = {
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = -1,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 2000,
        -- health to add when used
        healthAmount = 200,
        -- inner core health added from 0 to 100
        innerCoreHealth = 100,
        language = {
            applying = "Ingestion du remède ...",
            applied = "Vous vous sentez mieux.",
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "mech_animal_interaction@horse@right@injection",
        animation = "injection_player",
        -- the next damage type, used for the bandaged state
        allowedJobs = { 'doctor', 'police', 'doctor_bla', 'doctor_stdenis', 'doctor_DM', 'doctor_CG', 'doctor_NC' }
    },
    ['bandagepatate'] = {
        syringe = false,
        healProbability = {
            ['bleeding'] = 1.0,
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = 180000,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 10000,
        -- health to add when used
        healthAmount = 200,
        -- inner core health added from 0 to 100
        innerCoreHealth = 100,
        language = {
            cureExpired = "Votre bandage est tombé, vous saignez à nouveau. Appliquez un bandage et allez voir un docteur.",
            applying = "Application d'un bandage...",
            applied = "Vous avez appliqué un bandage.",
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = nil,
        animation = nil,
        -- if you don't want to use scenario set it to nil
        scenario = 'WORLD_HUMAN_CROUCH_INSPECT',
        -- the next damage type, used for the bandaged state
        damageType = 'bandaged',
    },
    ['bandagecharbon'] = {
        syringe = false,
        healProbability = {
            ['bleeding'] = 1.0,
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = 180000,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 10000,
        -- health to add when used
        healthAmount = 200,
        -- inner core health added from 0 to 100
        innerCoreHealth = 100,
        language = {
            cureExpired = "Votre bandage est tombé, vous saignez à nouveau. Appliquez un bandage et allez voir un docteur.",
            applying = "Application d'un bandage...",
            applied = "Vous avez appliqué un bandage.",
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = nil,
        animation = nil,
        -- if you don't want to use scenario set it to nil
        scenario = 'WORLD_HUMAN_CROUCH_INSPECT',
        -- the next damage type, used for the bandaged state
        damageType = 'bandaged',
    },
    ['attelle'] = {
        syringe = false,
        healProbability = {
            ['brokenBone'] = 1.0,
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = -1,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 10000,
        -- health to add when used
        healthAmount = 200,
        -- inner core health added from 0 to 100
        innerCoreHealth = 100,
        language = {
            cureExpired = "Votre bandage est tombé, vous saignez à nouveau. Appliquez un bandage et allez voir un docteur.",
            applying = "Application d'une attelle...",
            applied = "Vous avez appliqué une attelle.",
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = nil,
        animation = nil,
        -- if you don't want to use scenario set it to nil
        scenario = 'WORLD_HUMAN_CROUCH_INSPECT',
        -- the next damage type, used for the bandaged state
    },
}

-- Items for reviving unconscious people
ReviveItems = {
    ['syringe'] = {
        reviveProbability = 1.0,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 10000,
        -- health to add when used
        healthAmount = 0,
        -- inner core health added from 0 to 100
        innerCoreHealth = 0,
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "mech_revive@unapproved",
        animation = "revive",
        -- if you don't want to use scenario set it to nil
        scenario = nil,
        language = {
            applying = "Injection de la seringue...",
        },
        -- allowed jobs to use it, if you want it to be usable for anyone just leave it empty
        allowedJobs = { 'doctor', 'police', 'doctor_bla', 'doctor_stdenis', 'doctor_DM', 'doctor_CG', 'doctor_NC' }
    }
}
