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
                TriggerServerEvent('dust_radial:givemoney', data.id, amount)       
                NPlayerSelector:deactivate()
                RequestAnimDict("script_common@mth_generic_enters@give_item_satchel@lhand@generic@in_place")
                while not HasAnimDictLoaded("script_common@mth_generic_enters@give_item_satchel@lhand@generic@in_place") do
                    Citizen.Wait(100)
                end
                TaskPlayAnim(PlayerPedId(), "script_common@mth_generic_enters@give_item_satchel@lhand@generic@in_place", "enter_rf", 1.0, 1.0, -1, 25, 0, true, 0, false, 0, false)  
                Wait(2500)
                ClearPedTasks(PlayerPedId())
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
  {
    id = 'craft',
    label = "Fabriquer",
    icon = 'hammer',
    onSelect = function()
      TriggerEvent("radial:OpenBossMenu")
    end
  },
  {
    id = 'sell',
    label = "Vendre",
    icon = 'handshake',
    onSelect = function()
      TriggerEvent("sellnpc:SellNPC")
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


RegisterNetEvent("dust_radial:CraftingAction")
AddEventHandler("dust_radial:CraftingAction", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    FreezeEntityPosition(playerPed, true)
    isInteracting = true
    RequestAnimDict(Config.AnimDict)
    while not HasAnimDictLoaded(Config.AnimDict) do
        Citizen.Wait(50)
    end

    for k,v in pairs(Config.CraftAnim) do
        TaskPlayAnim(playerPed, Config.AnimDict, v, 4.0, 4.0, -1, 1, 0, true)
    end

    local timer = GetGameTimer() + Config.WorkingTime
    isInteracting = true

    Citizen.CreateThread(function()
        while GetGameTimer() < timer do 
            Wait(0)
        end
        ClearPedTasks(PlayerPedId())
        FreezeEntityPosition(playerPed, false)
        isInteracting = false
    end)    
end)

---- recolte ressources 

Citizen.CreateThread(function()
	for k,v in pairs(Config.PetitBois) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, 960467426, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Petit bois")
	end
    for k,v in pairs(Config.Bois) do
        local blips = N_0x554d9d53f696d002(1664425300, v)
        SetBlipSprite(blips, 1904459580, 1)
        SetBlipScale(blips, 1.0)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Bois")
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
local bigwoodprompt = UipromptGroup:new("Bois")
Uiprompt:new(0x760A9C6F, "Récolter", bigwoodprompt)
bigwoodprompt:setActive(false)
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
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    isInteracting = true
                    GiveRessource("petitbois", 1)
                end
            end
        end

        for k, pos in pairs(Config.Bois) do
            if #(playerPos - pos) < 7.0 and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    isInteracting = true
                    GiveRessource("bois", 1)
                end
            end
        end

        for k, pos in pairs(Config.Fil) do
            if #(playerPos - pos) < 7.0 and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    isInteracting = true
                    GiveRessource("fil", 1)
                end
            end
        end

        for k, pos in pairs(Config.Silex) do
            if #(playerPos - pos) < 7.0 and not isInteracting then
                TriggerEvent('dust_presskey', "Appuyez sur G")
                if IsControlJustPressed(2, 0x760A9C6F) and not isInteracting then 
                    isInteracting = true
                    GiveRessource("silex", 1)
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


RegisterNetEvent('dust_presskey', function(text)
    DrawTxt(text, 0.50, 0.90, 0.40, 0.40, true, 255, 255, 255, 255, true)
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 25); -- Font
    DisplayText(str, x, y)

    local factor = (string.len(tostring(str))) / 180
    DrawTexture("honor_display", "honor_bg", x, y + 0.018, 0.035 + factor, 0.04, 0.1, 0, 0, 0, 100, 0)
end


function DrawTexture(textureStreamed,textureName,x, y, width, height,rotation,r, g, b, a, p11)
    if not HasStreamedTextureDictLoaded(textureStreamed) then
       RequestStreamedTextureDict(textureStreamed, false);
    else
        DrawSprite(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11);
    end
end



----- vente au pnj

local isSelling = false
local Itemtosell = nil
RegisterNetEvent("sellnpc:SellNPC", function()
    if isSelling then
        isSelling = false
        Itemtosell = nil
        TriggerEvent("redem_roleplay:NotifyLeft", "Vente", "Vous avez arrêté de vendre !", "scoretimer_textures", "scoretimer_generic_cross", 4000)
    else
        TriggerServerEvent("sellnpc:checkitem")
    end
end)

RegisterNetEvent("sellnpc:SellMenu", function(items)
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
        for k, v in pairs(items) do
          table.insert(elements, {label = v.amt.. " " .. v.label, value = k, desc = "Ne vous faites pas voir en train de vendre !"})
        end
  
        MenuData.Open('default', GetCurrentResourceName(), 'craft', {
            title = "Vendre",
            subtext = "Que voulez-vous vendre ?",
            align = 'top-right',
            elements = elements,
        },
  
        function(data, menu)
            MenuData.CloseAll()
            isSelling = true
            Itemtosell = data.current.value
        end,
  
        function(data, menu)
            menu.close()
            isInteracting = false
        end)
    end)
  end)

--- detection pnj
local isEventRunning = {}
local canbuy = {}
local cooldown = {}
local SellingAction = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isSelling then
            local current_town = Citizen.InvokeNative(0x43AD8FC02B429D33, GetEntityCoords(PlayerPedId()), 1)
            for k, v in pairs(Config.Price) do
                if k == current_town then
                    local itemSet = CreateItemset(true)
                    local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 7.0, itemSet, 1, Citizen.ResultAsInteger())
                
                    if size > 0 then
                        for index = 0, size - 1 do
                            local entity = GetIndexedItemInItemset(index, itemSet) -- Add entity in itemSet
                            local model = GetEntityModel(entity)

                            local boolA = Citizen.InvokeNative(0x9A100F1CF4546629, entity)
                            if IsEntityAPed(entity) and not IsPedAPlayer(entity) and not Citizen.InvokeNative(0x9A100F1CF4546629, entity) then
                                if PlayerPedId() ~= entity then 
                                    if IsEntityDead(entity) == false then
                                        if boolA ~= nil and boolA == false then
                                            TriggerEvent("sellnpc:activateselling", entity)
                                        end
                                    end
                                end
                            end
                            local playerPosition = GetEntityCoords(PlayerPedId())
                            local entityPos = GetEntityCoords(entity)
                            if #(playerPosition - entityPos) < 1.5 and not SellingAction then 
                                if canbuy[entity] == true and not cooldown[entity] then
                                    TriggerEvent('dust_presskey', "Appuyez sur G pour vendre")
                                    if IsControlJustReleased(0, 0x760A9C6F) then
                                        TriggerEvent("sellnpc:activatecd", entity)
                                        TriggerEvent("sellnpc:animate", entity)
                                        TriggerServerEvent("sellnpc:sell", current_town, Itemtosell)
                                    end
                                end
                            end
                        end
                    end

                    if IsItemsetValid(itemSet) then
                        DestroyItemset(itemSet)
                    end
                end
            end
        end
    end
end)
-- state pnj

RegisterNetEvent("sellnpc:animate",function(ent)
    SellingAction = true
    ClearPedTasks(ent)
    FreezeEntityPosition(ent, true)
    RequestAnimDict(Config.SellDict)
    while not HasAnimDictLoaded(Config.SellDict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), Config.SellDict, Config.SellAnim, 1.0, 1.0, -1, 25, 0, true, 0, false, 0, false)  
    Wait(2000)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(ent, false)
    SellingAction = false
end)

RegisterNetEvent("sellnpc:activateselling",function(ent)
    if not isEventRunning[ent] then
        isEventRunning[ent] = true
        local timer = GetGameTimer() + Config.SellTime
        local chance = math.random(0, 100)
        local hasAlreadyBought = false
        while GetGameTimer() < timer do
            Wait(0)
            if chance >= 50 and not cooldown[ent]  and not hasAlreadyBought then
                canbuy[ent] = true
                hasAlreadyBought = true
            end
        end
        isEventRunning[ent] = false
        canbuy[ent] = false
    end
end)

RegisterNetEvent("sellnpc:activatecd",function(ent)
    canbuy[ent] = false
    cooldown[ent] = true
    local timer = GetGameTimer() + Config.Cooldown
    while GetGameTimer() < timer do
        Wait(0)
    end
    cooldown[ent] = false
end)

-- sell
