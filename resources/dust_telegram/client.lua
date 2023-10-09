local telegrams = {}
local index = 1
local menu = false

MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)


RegisterNetEvent("Telegram:ReturnMessages")
AddEventHandler("Telegram:ReturnMessages", function(data)
    index = 1
    telegrams = data

    if next(telegrams) == nil then
        SetNuiFocus(true, true)
        SendNUIMessage({ message = "No telegrams to display." })
    else
        SetNuiFocus(true, true)
        SendNUIMessage({ sender = telegrams[index].sender, message = telegrams[index].message })
    end
end)



local postprompt = UipromptGroup:new("Poste")
Uiprompt:new(0x6319DB71, "Prendre son courrier", postprompt)
Uiprompt:new(0x05CA7C52, "Envoyer un télégramme", postprompt):setHoldMode(true)
postprompt:setActive(false)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerpos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Posts) do
            if #(playerpos - v.pos ) < 7 and not menu then
                postprompt:setActiveThisFrame(true)
                if IsControlJustReleased(0, 0x6319DB71) then
                    TriggerServerEvent("Telegram:GetMessages")
                end
                if postprompt:hasHoldModeJustCompleted() then
                    MenuSend()
                end
            end 
        end
    end
end)

function MenuSend()
    local playerPed = PlayerPedId()
    local Position = GetEntityCoords(playerPed)
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
    MenuData.CloseAll()
    local elements = {
        {
         label = "Écrire un télégramme",
         value = 'send' ,
         desc = "Le destinataire saura votre Nom et Prénom",
         image="items/weapon_melee_hammer.png",
            },
        {
         label = "Écrire en anonyme",
         value = 'anno' ,
         desc = "Le destinataire ne saura pas qui lui a envoyé le courrier",
         image="items/weapon_melee_hammer.png",
            },
        }

    MenuData.Open('default', GetCurrentResourceName(), 'post', {
        title = "Télégramme",
        subtext = "Envoyer du courrier",
        align = 'top-right',
        elements = elements,
    },
    function(data, menu)
        MenuData.CloseAll()
        if data.current.value == "send" then
            
        end
    end,
    function(data, menu)
        menu.close()
        isInteracting = false
    end)

    
end

function CloseTelegram()
    index = 1
    menu = false
    SetNuiFocus(false, false)
    SendNUIMessage({})
end

RegisterNUICallback('back', function()
    if index > 1 then
        index = index - 1
        SendNUIMessage({ sender = telegrams[index].sender, message = telegrams[index].message })
    end
end)

RegisterNUICallback('next', function()
    if index < #telegrams then
        index = index + 1
        SendNUIMessage({ sender = telegrams[index].sender, message = telegrams[index].message })
    end
end)

RegisterNUICallback('close', function()
    CloseTelegram()
end)

RegisterNUICallback('new', function()
    CloseTelegram()
    Getpobox()
end)

RegisterNUICallback('delete', function()
    TriggerServerEvent("Telegram:DeleteMessage", telegrams[index].id)
end)


function Getpobox(post)
    AddTextEntry("FMMC_KEY_TIP8", "Recipient's Lastname: ")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 30)

    while (UpdateOnscreenKeyboard() == 0) do
        Wait(0);
    end

    while (UpdateOnscreenKeyboard() == 2) do
        Wait(0);
        break
    end

    while (UpdateOnscreenKeyboard() == 1) do
        Wait(0)
        if (GetOnscreenKeyboardResult()) then
            local pobox = GetOnscreenKeyboardResult()

            GetMessage(pobox, post)

            break
        end
    end
end

function GetMessage(pobox, post)
    AddTextEntry("FMMC_KEY_TIP8", "Message: ")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 150)

    while (UpdateOnscreenKeyboard() == 0) do
        Wait(0);
    end

    while (UpdateOnscreenKeyboard() == 2) do
        Wait(0);
        break
    end

    while (UpdateOnscreenKeyboard() == 1) do
        Wait(0)
        if (GetOnscreenKeyboardResult()) then
            local message = GetOnscreenKeyboardResult()
            
            TriggerServerEvent("Telegram:SendMessage", pobox, message, post)
           
            break
        end
    end
end
