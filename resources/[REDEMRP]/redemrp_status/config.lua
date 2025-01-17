--- available client functions
-- Eat()
-- Drink()
-- Wine()
-- Gin()
-- Rum()
-- Cognac()
-- Moonshine()
-- Whisky()
-- Stew()
-- Shampan()
-- Beer()
-- Coffe()
-- Watch()
-- Fan()
-- ChewingTobacco(buffed)
-- Pomade()
-- BoostStamina(10)

local crosshairhidden = false

Config = {}


Config.PocketWatches = {
    "mp007_s_pocketwatch_emote02x", "p_si_pocketwatch01x", "s_inv_pocketwatch01x", "s_inv_pocketwatch02x", "s_inv_pocketwatch03x", "s_inv_pocketwatch04x",  "s_inv_pocketwatch06x", "s_oldpocketwatch01x", "s_oldpocketwatch02x"

}

Config.Items = {
    ["tabacchiquer"] = {
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            ChewingTobacco(false)
        end
    },
    ["tabacchiquermenthe"] = {
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            ChewingTobacco(false)
            BoostStamina(30)
        end
    },
    ["gin"] = {
        hunger = 0,
        thirst = 50,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Gin()
        end
    },
    ["mezcal"] = {
        hunger = 0,
        thirst = 50,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Rum()
        end
    },
    ["wine"] = {
        hunger = 0,
        thirst = 15,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Wine()
        end
    },
    ["champagne"] = {
        hunger = 0,
        thirst = 12,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Shampan()
        end
    },
    ["water"] = {
        hunger = 0,
        thirst = 15,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Drink()
        end
    },
    ["bread"] = {
        hunger = 7,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["goulash"] = {
        hunger = 75,
        thirst = 15,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Stew()
        end
    },
    ["beer"] = {
        hunger = 00,
        thirst = 40,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Beer()
        end
    },
    ["lemonade"] = {
        hunger = 00,
        thirst = 40,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Drink()
        end
    },
    ["good_whisky"] = {
        hunger = 00,
        thirst = 70,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Whisky()
        end
    },
    ["dirty_whiskey"] = {
        hunger = 00,
        thirst = 30,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Whisky()
        end
    },
    ["cigar"] = {
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Cigar()
        end
    },
    ["cigarettes"] = {
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Cigarette()
        end
    },
    ["cigarettesdesert"] = {
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Cigarette()
            BoostStamina(20)
        end
    },
    ["coffee"] = {
        hunger = 20,
        thirst = 50,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Coffe()
            BoostStamina(20)
        end
    },
    ["thementhe"] = {
        hunger = 0,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Coffe()
            BoostStamina(20)
        end
    },
    ["laudanum"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ["moonshine"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ["moonshinemexicaine"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ["moonshinebayou"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ["moonshinetrappeur"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ["moonshinecueilleur"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ["moonshineforet"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ["moonshinefongique"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ["moonshinecitadin"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ["moonshinepeignecul"] = {
        hunger = 00,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Moonshine()
        end
    },
    ---- recette camp ---- 
    ["viandepetitmamiferecuite"] = {
        hunger = 7,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["viandecuite"] = {
        hunger = 10,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["viandegibiercuite"] = {
        hunger = 10,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["viandevolaillecuite"] = {
        hunger = 10,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["viandereptilecuite"] = {
        hunger = 10,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["gibierherbe"] = {
        hunger = 30,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["viandeherbe"] = {
        hunger = 30,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["volailleherbe"] = {
        hunger = 30,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },

    ["filetpoissoncuit"] = {
        hunger = 15,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ----- store
    ["soupe"] = {
        hunger = 40,
        thirst = 30,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Stew()
        end
    },
    ["ragoutgibier"] = {
        hunger = 40,
        thirst = 20,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Stew()
        end
    },
    ["ragoutviande"] = {
        hunger = 40,
        thirst = 20,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Stew()
        end
    },
    ["ragoutpoisson"] = {
        hunger = 40,
        thirst = 20,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Stew()
        end
    },
    ["ragoutvolaille"] = {
        hunger = 40,
        thirst = 20,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Stew()
        end
    },
    ["cerfbiere"] = {
        hunger = 70,
        thirst = 20,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Stew()
        end
    },
    ["tourtegibier"] = {
        hunger = 80,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["tourteviande"] = {
        hunger = 80,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["tourtepoisson"] = {
        hunger = 80,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["tourtevolaille"] = {
        hunger = 80,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["brochettegibier"] = {
        hunger = 20,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["brochetteviande"] = {
        hunger = 20,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["brochettevolaille"] = {
        hunger = 20,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["pain"] = {
        hunger = 15,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["gateau"] = {
        hunger = 70,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["tartemyrtille"] = {
        hunger = 70,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["soupechampignon"] = {
        hunger = 60,
        thirst = 40,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Stew()
        end
    },
    ["beefsteakpatate"] = {
        hunger = 100,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
            BoostHealth(15)
        end
    },
    ["boeufaugin"] = {
        hunger = 100,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
            BoostHealth(15)
        end
    },
    ["cotedeboeuf"] = {
        hunger = 100,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
            BoostHealth(15)
        end
    },
    ["carrottecake"] = {
        hunger = 70,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["epismaisgrille"] = {
        hunger = 40,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["sucreorge"] = {
        hunger = 20,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ---- ferme
    ["bouteillelait"] = {
        hunger = 0,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Drink()
        end
    },
    --- opium
    ["cigaretteopium"] = {
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            TriggerEvent("redemrp_status:getfx", "l_002dd49cyi", 120000)
            Cigarette()
            BoostStamina(50)
        end
    },
    ["cigarettechanvre"] = {
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            TriggerEvent("redemrp_status:getfx", "l_002dd49cyi", 120000)
            Cigarette()
            BoostStamina(50)
        end
    },
    ["pipeopium"] = {
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            TriggerEvent("redemrp_status:getfx", "l_002dd49cyi", 120000)
            Pipe()
            BoostStamina(50)
        end
    },
    ["morphine"] = {
        hunger = 0,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            TriggerEvent("redemrp_status:getfx", "PlayerSickDoctorsOpinion", 300000)
            Syringe()
            BoostStamina(100)
            BoostHealth(15)
        end
    },
    ["heroine"] = {
        hunger = 0,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            TriggerEvent("redemrp_status:getfx", "PlayerHealthPoor", 300000)
            Syringe()
            BoostStamina(100)
            BoostHealth(30)
        end
    },
    ---- bijouterie
    ["watch1"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Watch(1)
        end
    },
    ["watch2"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Watch(2)
        end
    },
    ["watch3"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Watch(3)
        end
    },
    ["watch4"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Watch(4)
        end
    },
    ["watch5"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Watch(5)
        end
    },
    ["watch6"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Watch(6)
        end
    },
    ["watch7"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Watch(7)
        end
    },
    ["watch8"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Watch(8)
        end
    },
    ["watch9"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Watch(9)
        end
    },
    ["fan"] = {
        type = "watch",
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Fan()
        end
    },



    ["concoctionendurance"] = {
        hunger = 0,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            BoostStamina(100)
            Drink()
        end
    },
    


}
