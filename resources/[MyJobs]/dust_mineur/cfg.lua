Config = {}

Config.Jobs = {
    [1] = "mineur",
}

Config.MinerJobDepositPos = { vector3(2880.175, 1401.344, 68.70103)} -- 
Config.MinerJobWithdrawalPos = { vector3(2954.671, 1374.939, 51.32298)}
Config.GetVirginContractPos = { vector3(2917.933, 1381.086, 56.22201)}
Config.DistanceToInteract = 2.2

Config.PointSprite = 2033377404

Config.JobRanks = 
{
    [1] = Mineur,
    [2] = Contremaitre,
    [3] = Patron
} 

Config.MsgGathering = "Appuie sur Del" -- Message de récolte
Config.MsgDeposit = "Appuie sur Entrer pour déposer" -- Message de dépot
Config.MsgRetrieve = "Appuie sur Entrer" -- Message de traitement

Config.MiningAnim = 'WORLD_HUMAN_PICKAXE_WALL'

Config.WorkingTime = 10000
Config.WorkingTimeCoal = 5000
Config.TimerMsg = " Currently working for :"

Config.ShowBlips = true

Config.RessourcesPoints = 
{
    vector3(2754.291, 1358.377, 68.368),
    vector3(2753.534, 1367.671, 67.804),
    vector3(2758.344, 1371.043, 68.042),
    vector3(2767.227, 1371.093, 67.987),
    vector3(2767.958, 1382.240, 67.929),
    vector3(2761.295, 1395.276, 68.70672),
    vector3(2756.615, 1382.089, 68.24923),
    vector3(2762.815, 1378.897, 67.72325),
    vector3(2778.925, 1371.398, 68.12866),
    vector3(2778.705, 1380.084, 68.23543),
    vector3(2746.216, 1366.329, 68.43348),
    vector3(2747.632, 1382.001, 68.56892)



}

Config.p1 = { x = 2754.291, y = 1358.377, z = 68.368 }
Config.p2 = { x = 2753.534, y = 1367.671, z = 67.804 }
Config.p3 = { x = 2758.344, y = 1371.043, z = 68.042 }
Config.p4 = { x = 2767.227, y = 1371.093, z = 67.987 }
Config.p5 = { x = 2767.958, y = 1382.240, z = 67.929 }

Config.Loottable = {
    ["charbon"] = {amount = 1, chance = 25},
    ["ferbrut"] = {amount = 2, chance = 25},
    ["cuivrebrut"] = {amount = 2, chance = 20},
    ["zincbrut"] = {amount = 2, chance = 15},
    ["plombbrut"] = {amount = 2, chance = 15},

}