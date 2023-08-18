RedEM = exports["redem_roleplay"]:RedEM()

RegisterNetEvent('contrat:use')
AddEventHandler('contrat:use', function(job)

    TriggerEvent('redemrp_inventory:close_inventory')
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()
        AddTextEntry("FMMC_MPM_TYP86", "Nom du futur employé")
        DisplayOnscreenKeyboard(4, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET

        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0)
            Citizen.Wait(0)
        end
        if (GetOnscreenKeyboardResult()) then
            name = GetOnscreenKeyboardResult()
        else
            menu.close()
        return
        end
                    
        if #(name) >= 1 then
            print(name)
            -- Appeler methods
            TriggerServerEvent("dust_contract:AddJobContrat", job, name)
        else
            RedEM.Functions.NotifyLeft("Invalid entry!", "Enter a valid ID.", "menu_textures", "menu_icon_alert", 4000)
            menu.close()
        end
    end)
end)
    
RegisterNetEvent('contrat:signe')
AddEventHandler('contrat:signe', function(job)
    print "yessai"
    local signature = false
    TriggerEvent('redemrp_inventory:close_inventory')
    TriggerEvent("redemrp_menu_base:getData", function(MenuData)
        MenuData.CloseAll()
        AddTextEntry("FMMC_MPM_TYP86", "NOM Prénom")
        DisplayOnscreenKeyboard(4, "FMMC_MPM_TYP86", "", "", "", "", "", 30) -- KTEXTTYPE_ALPHABET
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0)
            Citizen.Wait(0)
        end
        if (GetOnscreenKeyboardResult()) then
            name = GetOnscreenKeyboardResult()
            signature = true
            TriggerServerEvent("redemrp_inventory:contratsigne", name, job)
        else
            menu.close()
        return
        end
        end)    
end)