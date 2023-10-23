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
            BoostStamina(20)
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
            BoostStamina(7)
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
            BoostStamina(25)
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
        thirst = 75,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Drink()
            BoostStamina(25)
        end
    },
    ["good_whisky"] = {
        hunger = 00,
        thirst = 10,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Whisky()
        end
    },
    ["dirty_whiskey"] = {
        hunger = 00,
        thirst = 10,
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
            BoostStamina(25)
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
            BoostStamina(12)
        end
    },
    ["coffee"] = {
        hunger = 5,
        thirst = 25,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Coffe()
        end
    },

    ---- recette camp ---- 
    ["grossteakcuit"] = {
        hunger = 40,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },
    ["grossteakcarottesauvage"] = {
        hunger = 60,
        thirst = 0,
        action = function(source, name)
            TriggerClientEvent('redemrp_status:Action-' .. name, source)
        end,
        ClientAction = function()
            Eat()
        end
    },

}
