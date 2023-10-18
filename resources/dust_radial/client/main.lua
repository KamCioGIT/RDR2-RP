-- local CurrentJob = { name = nil, rank = nil, duty = false }

RedEM = exports["redem_roleplay"]:RedEM()

local NPlayerSelector = nil
TriggerEvent('mega_nplayerselector:load', function (data)
    NPlayerSelector = data
end)


---- Ragdoll

local Ragdoll = false


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local Player = PlayerPedId()
        
        if not CanPedRagdoll(Player) or IsEntityDead(Player)then
            Ragdoll = false
        end

        if IsControlJustReleased(0, Config.RagdollKey) then
            if Ragdoll or not CanPedRagdoll(Player) or IsEntityDead(Player) then
                Ragdoll = false
            else
                Ragdoll = true
            end
        end

        if Ragdoll then
            SetPedToRagdoll(Player, 1000, 1000, RagdollType, false, false, false)
		end
    end
end)


---- Lever les mains ----- 

local HandsUp = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local Player = PlayerPedId()
        if IsControlJustReleased(0, Config.HandsUpKey) then
            if HandsUp then
                ClearPedTasks(Player)
                Entity(Player).state:set('handsup', false, true)
                HandsUp = false
            else
                HandsUpAnim()
                Entity(Player).state:set('handsup', true, true)
                HandsUp = true
            end
        end
    end
end)

function HandsUpAnim()
    key = math.random(1, #Config.HandsUpAnim)
    RequestAnimDict(Config.HandsUpAnim[key].dict)
    while not HasAnimDictLoaded(Config.HandsUpAnim[key].dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), Config.HandsUpAnim[key].dict, Config.HandsUpAnim[key].anim, 1.0, -1.0, -1, 25, 0, true, 0, false, 0, false)
end

----- Fouiller ------ 
RegisterCommand("fouiller", function()
    TriggerEvent("redemrp_inventory:SearchPlayer")
end)
--
-- Main radial menus that are available to everyone.

lib.addRadialItem({
  {
    id = 'fouiller',
    label = 'Fouiller',
    icon = 'eye',
    onSelect = function()
      local dict = "mech_loco_m@generic@searching@low_energy@direct@unarmed@idle"
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
          Citizen.Wait(10)
      end
      TaskPlayAnim(PlayerPedId(), dict, "idle", 1.0, 8.0, -1, 1, 0, false, false, false)
      TriggerEvent("redemrp_inventory:SearchPlayer")
    end
  },
  {
    id = 'money',
    label = "Donner de l'argent",
    icon = 'dollar-sign',
    onSelect = function()
      TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()
        AddTextEntry("FMMC_MPM_TYP86", "Montant")
        DisplayOnscreenKeyboard(3, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0)
            Citizen.Wait(0)
        end
        if (GetOnscreenKeyboardResult()) then
            amount = GetOnscreenKeyboardResult()
        else
        return
        end
                    
        if amount then
          NPlayerSelector:onPlayerSelected(function (data)
            TriggerServerEvent('dust_radial:givemoney', data.id, amount)       
            NPlayerSelector:deactivate()
          end)
          NPlayerSelector:setRange(5)
          NPlayerSelector:activate()
        end
    end)

    end
  },
  {
    id = 'craft',
    label = "Fabriquer",
    icon = 'hammer',
    onSelect = function()
      print("Menu Craft")
    end
  },
})