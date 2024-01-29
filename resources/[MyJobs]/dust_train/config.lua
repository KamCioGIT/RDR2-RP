Config={}
Config.DistanceToInteract = 2.0
---- Consulter les besoins et prix des gares
Config.Tableau ={
    ["stdenis"] = vector3(2741.429, -1463.604, 45.61837),
}

--- GARES
Config.Gare = {
    ["Rhodes"] = {droppoint= vector3(1240.005, -1315.862, 75.90468), npccoords = vector3(1241.802, -1318.192, 75.90168), npcheading = 139.0, npcmodel ="mp_u_m_m_fos_dockrecipients_01",
    need = {
        ["dynamite"] = {label="Dynamite",pricemin = 1, pricemax = 5},
        ["lockpick"] = {label="Lockpick",pricemin = 6, pricemax = 10},
    },
    sell ={
        ["lingotor"] = {label="Lingot",chance = 100,pricemin = 2, pricemax = 10, amountmin = 1, amountmax = 5},
    }},




}

---- garage train
