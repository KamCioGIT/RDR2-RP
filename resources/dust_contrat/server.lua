RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('dust_contract:AddVirginContrat')
AddEventHandler('dust_contract:AddVirginContrat', function()
    print('dust_contract:AddVirginContrat just called')
	local _source = source
	local ItemData = data.getItem(_source, 'contratvierge')
	ItemData.AddItem(1)
end)

RegisterServerEvent("RegisterUsableItem:contratvierge")
AddEventHandler("RegisterUsableItem:contratvierge", function(source)
    local _source = source 
    
    if RedEM.GetPlayer(_source).jobgrade >= 3 then
        local itemData = data.getItem(_source, "contratvierge")
	    --itemData.RemoveItem(1)
        TriggerClientEvent('contrat:use', _source ,RedEM.GetPlayer(_source).job)
        -- local itemData2 = data.getItem(_source, "contrat"..job)
        -- itemData2.AddItem(1)
    end
end)

RegisterServerEvent("RegisterUsableItem:contratmineur")
AddEventHandler("RegisterUsableItem:contratmineur", function(source)
    local _source = source
    local job = "Mineur"
    local user = RedEM.GetPlayer(_source)
    if RedEM.GetPlayer(source).job == "unemployed" or RedEM.GetPlayer(source).job ~= "mineur" then
        TriggerClientEvent('contrat:signe', source, job)
        local itemData = data.getItem(_source, "contratusine")
        itemData.RemoveItem(1)
        user.SetJob("mineur")
        user.SetJobGrade(1)
        print('Le joueur '..source..' est maintenant mineur')
        TriggerClientEvent("global:CheckPlayerJob", source, user.getJob(), user.getJobgrade()) -- Checkjob pour assigner le nv travail
    end
end)

RegisterServerEvent("RegisterUsableItem:contratusine")
AddEventHandler("RegisterUsableItem:contratusine", function(source)
    local _source = source
    local job = "Ouvrier"
    local user = RedEM.GetPlayer(_source)
    if RedEM.GetPlayer(source).job == "unemployed" or RedEM.GetPlayer(source).job ~= "usine" then
        TriggerClientEvent('contrat:signe', source, job)
        local itemData = data.getItem(_source, "contratusine")
        itemData.RemoveItem(1)
        user.SetJob("usine")
        user.SetJobGrade(1)
        print('Le joueur '..source..' est maintenant ouvrier')
        TriggerClientEvent("global:CheckPlayerJob", source, user.getJob(), user.getJobgrade()) -- Checkjob pour assigner le nv travail
    end
end)

RegisterServerEvent("dust_contract:AddJobContrat") -- Fonctionne 
AddEventHandler("dust_contract:AddJobContrat", function(job, name)
    print(source)
    local itemData = data.getItem(source, "contrat"..job)
    itemData.AddItem(1)
end)

-- AddEventHandler("redemrp:playerLoaded", function(source, user)
--     TriggerClientEvent("global:CheckPlayerJob", source, user.getJob(), user.getJobgrade())
-- end)


AddEventHandler("redemrp:selectCharacter", function(source)
    local user = RedEM.GetPlayer(source)
    local job = user.job
    local jobgrade = user.jobgrade
    TriggerClientEvent("global:CheckPlayerJob", source, job, jobgrade)
end)

