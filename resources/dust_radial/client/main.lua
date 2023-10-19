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
        DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP86", "", "", "", "", "", 30, "KTEXTTYPE_FLOAT")        
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0)
            Citizen.Wait(0)
        end
        if (GetOnscreenKeyboardResult()) then
            amount = tonumber(GetOnscreenKeyboardResult())
        else
        return
        end
                    
        if amount then
            if type(amount) == "number" then
            NPlayerSelector:onPlayerSelected(function (data)
                NPlayerSelector:deactivate()
                RequestAnimDict("script_common@mth_generic_enters@give_item_satchel@lhand@generic@in_place")
                while not HasAnimDictLoaded("script_common@mth_generic_enters@give_item_satchel@lhand@generic@in_place") do
                    Citizen.Wait(100)
                end
                TaskPlayAnim(PlayerPedId(), "script_common@mth_generic_enters@give_item_satchel@lhand@generic@in_place", "enter_rf", 1.0, 1.0, -1, 25, 0, true, 0, false, 0, false)  
                Wait(2500)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent('dust_radial:givemoney', data.id, amount)       
            end)
            NPlayerSelector:setRange(2)
            NPlayerSelector:activate()
            end
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
RegisterNetEvent("radial:OpenBossMenu", function()
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



---- recolte ressources 

Citizen.CreateThread(function()
	for k,v in pairs(Config.PetitBois) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, 960467426, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Petit bois")
	end
    for k,v in pairs(Config.Fil) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, 960467426, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Fil")
	end
    for k,v in pairs(Config.Silex) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, 960467426, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Silex")
	end
end)

local woodprompt = UipromptGroup:new("Petit Bois")
Uiprompt:new(0x760A9C6F, "Récolter", woodprompt)
woodprompt:setActive(false)
local filprompt = UipromptGroup:new("Fil")
Uiprompt:new(0x760A9C6F, "Récolter", filprompt)
filprompt:setActive(false)
local silexprompt = UipromptGroup:new("Silex")
Uiprompt:new(0x760A9C6F, "Récolter", silexprompt)
silexprompt:setActive(false)


Citizen.CreateThread(function()
    while true do
        Wait(2)
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, pos in pairs(Config.PetitBois) do
            if #(playerPos - pos) < 7.0 and not isInteracting then
                woodprompt:setActiveThisFrame(true)
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    isInteracting = true
                    GiveRessource(petitbois, 1)
                end
            end
        end

        for k, pos in pairs(Config.Fil) do
            if #(playerPos - pos) < 7.0 and not isInteracting then
                filprompt:setActiveThisFrame(true)
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    isInteracting = true
                    GiveRessource(fil, 1)
                end
            end
        end

        for k, pos in pairs(Config.Silex) do
            if #(playerPos - pos) < 7.0 and not isInteracting then
                silexprompt:setActiveThisFrame(true)
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    isInteracting = true
                    GiveRessource(silex, 1)
                end
            end
        end
    end
end)

function GiveRessource(item, amount)
    local playerPed = PlayerPedId()
    TriggerEvent("redemrp_inventory:PickupAnim")
    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true
    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        ClearPedTasks(playerPed)
		FreezeEntityPosition(playerPed, false)
        isInteracting = false
        TriggerServerEvent('dust_radial:AddItem', item, amount)
    end)
end
