--- available client functions
-- Eat()
-- Drink()
-- Wine()
-- Gin()
-- Rum()
-- Cognac()
-- Moonshine()
-- Whisky()
-- EatBowl()
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
            EatBowl()
        end
    },
    ["beer"] = {
        hunger = 00,
        thirst = 10,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Beer()
        end
    },
    ["lemonade"] = {
        hunger = 00,
        thirst = 70,
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

    ---- recette camp ---- 
    ["viandepetitmamiferecuite"] = {
        hunger = 20,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["viandecuite"] = {
        hunger = 30,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["viandegibiercuite"] = {
        hunger = 30,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["volaillecuite"] = {
        hunger = 30,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["viandereptilecuite"] = {
        hunger = 30,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["gibierherbe"] = {
        hunger = 50,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["viandeherbe"] = {
        hunger = 50,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["volailleherbe"] = {
        hunger = 50,
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
        hunger = 50,
        thirst = 50,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            EatBowl()
        end
    },
    ["Ragoutgibier"] = {
        hunger = 50,
        thirst = 50,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            EatBowl()
        end
    },
    ["Ragoutviande"] = {
        hunger = 50,
        thirst = 50,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            EatBowl()
        end
    },
    ["Ragoutvolaille"] = {
        hunger = 50,
        thirst = 50,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            EatBowl()
        end
    },
    ["tourtegibier"] = {
        hunger = 100,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["tourteviande"] = {
        hunger = 100,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["tourtevolaille"] = {
        hunger = 100,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["brochettegibier"] = {
        hunger = 40,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["brochetteviande"] = {
        hunger = 40,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["brochettevolaille"] = {
        hunger = 40,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["pain"] = {
        hunger = 30,
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
        hunger = 100,
        thirst = 100,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            EatBowl()
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

}
