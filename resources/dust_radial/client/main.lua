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

        -- if IsControlJustReleased(0, Config.RagdollKey) then
        --     if Ragdoll or not CanPedRagdoll(Player) or IsEntityDead(Player) then
        --         Ragdoll = false
        --     else
        --         Ragdoll = true
        --     end
        -- end

        if Ragdoll then
            SetPedToRagdoll(Player, 1000, 1000, RagdollType, false, false, false)
		end
    end
end)

local keybind = lib.addKeybind({
    name = 'ragdoll',
    description = 'ragdoll',
    defaultKey = 'J',
    onReleased = function(self)
        if Ragdoll or not CanPedRagdoll(Player) or IsEntityDead(Player) then
            Ragdoll = false
        else
            Ragdoll = true
        end
    end
})

keybind:disable(false)
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
          NPlayerSelector:setRange(2)
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
      TriggerEvent("radial:OpenBossMenu")
    end
  },
})


--- menu craft 
RegisterNetEvent("radial:OpenBossMenu", function(menutype)
  local Position = GetEntityCoords(PlayerPedId())
  local _menutype = menutype

  Citizen.CreateThread(function()
      while true do
          Wait(100)
          if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
              TriggerEvent("redemrp_menu_base:getData", function(call)
                  call.CloseAll()
                  isInteracting = false
              end)
              return
          end
      end
  end)

  TriggerEvent("redemrp_menu_base:getData", function(MenuData)
      MenuData.CloseAll()

      local elements = {}
      for k, v in pairs(Config.CraftingsReceipe) do
        table.insert(elements, {label = v.label, value = k, desc = v.desc})
      end

      MenuData.Open('default', GetCurrentResourceName(), 'craft', {
          title = "Fabrication",
          subtext = "Recettes",
          align = 'top-right',
          elements = elements,
      },

      function(data, menu)
          MenuData.CloseAll()
          TriggerServerEvent("dust_radial:MaxRessourcesAmount", data.current.value)
          Wait(150)
          TriggerEvent("dust_radial:SelectCraftingAmount", data.current.value, MenuData, menu)
      end,

      function(data, menu)
          menu.close()
          isInteracting = false
      end)
  end)
end)

RegisterNetEvent("dust_radial:SelectCraftingAmount")
AddEventHandler("dust_radial:SelectCraftingAmount", function(dataType, menuData, menu)
    menuData.CloseAll()
    local Position = GetEntityCoords(PlayerPedId())

    Citizen.CreateThread(function()
        while true do
            Wait(100)
            if #(Position - GetEntityCoords(PlayerPedId())) > 2.5 then
                TriggerEvent("redemrp_menu_base:getData", function(call)
                    call.CloseAll()
                    isInteracting = false
                end)
                return
            end
        end
    end)


    local elements = {
        { label = "Quantité", 
        value = 0, 
        desc = "Se mettre au travail",
        type = 'slider',
        min = 0,
        max = maxCraftAmountUsine 
        },
    }

    menuData.Open('default', GetCurrentResourceName(), 'craft', {
        title = "Atelier",
        subtext = "Choisir la quantité",
        align = 'top-right',
        elements = elements,
    },

    function(data, menu)
        if data.current.label == "Quantité" then
            TriggerServerEvent("dust_radial:CraftItem", dataType, menu, data.current.value)
            menu.close()
            isInteracting = false
        end 
    end,

    function(data, menu)
        menu.close()
        isInteracting = false
    end)
end)

RegisterNetEvent("dust_radial:client:SetMaxAmount", function(value)
    maxCraftAmountUsine = value
end)

