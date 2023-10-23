Config = {}

Config.Jobs = {
    -- ["police"] = {
    --     Name = "New Hanover Sheriff's Office",
    --     HasDuty = true,
    --     HasLockers = true,
    --     MenuLocations = {
    --         vector3(-278.3807, 805.3717, 119.43005), -- Valentine - NH
    --         vector3(2904.144, 1309.9204, 44.937969), -- Annesburg - NH
    --     },
    --     Grades = {
    --         [1] = {
    --             Name = "Assistant Deputy",
    --             Pay = 3.50,
    --         },
    --         [2] = {
    --             Name = "Deputy",
    --             Pay = 4.75,
    --             StorageAccess = true,
    --         },
    --         [3] = {
    --             Name = "Senior Deputy",
    --             Pay = 5.25,
    --             StorageAccess = true,
    --         },
    --         [4] = {
    --             Name = "Corporal",
    --             Pay = 6.75,
    --             StorageAccess = true,
    --         },
    --         [5] = {
    --             Name = "Sergeant",
    --             Pay = 7.75,
    --             StorageAccess = true,
    --         },
    --         [6] = {
    --             Name = "Lieutenant",
    --             Pay = 8,
    --             Personnel = true,
    --             Ledger = true,
    --             StorageAccess = true,
    --         },
    --         [7] = {
    --             Name = "Captain",
    --             Pay = 8.75,
    --             Personnel = true,
    --             Ledger = true,
    --             StorageAccess = true,
    --         },
    --         [8] = {
    --             Name = "Undersheriff",
    --             Pay = 9,
    --             Personnel = true,
    --             Ledger = true,
    --             StorageAccess = true,
    --         },
    --         [9] = {
    --             Name = "Sheriff",
    --             Pay = 9.50,
    --             Personnel = true,
    --             Ledger = true,
    --             StorageAccess = true,
    --         },
    --     }
    -- },
    ["armurier_rhodes"] = {
        bigjob = "armurier",
        Name = "Armurerie de Rhodes",
        blisprite = -145868367,
        MenuLocations = 
            vector3(1328.648, -1325.286, 76.94454)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["armurier_strawberry"] = {
        bigjob = "armurier",
        Name = "Armurerie de Strawberry",
        blisprite = -145868367,
        MenuLocations = 
            vector3(-1843.087, -413.7095, 161.3547)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["marechal_bla"] = {
        bigjob = "marechal",
        Name = "Écurie de Blackwater",
        blisprite = -1327110633,
        MenuLocations = 
            vector3(-878.4421, -1361.514, 42.57775)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["marechal_stdenis"] = {
        bigjob = "marechal",
        Name = "Écurie de Saint-Denis",
        blisprite = -1327110633,
        MenuLocations = 
            vector3(2513.883, -1459.578, 45.36203)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["usine"] = {
        bigjob = "usine",
        Name = "Usine",
        blisprite = 1576459965,
        MenuLocations = 
            vector3(2324.79, -1456.619, 45.00994)
    ,
        Grades = {
            [1] = {
                Name = "Ouvrier",
                StorageAccess = true,
            },
            [2] = {
                Name = "Contremaître",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["mineur"] = {
        bigjob = "mineur",
        Name = "Mine",
        blisprite = 1220803671,
        MenuLocations = 
            vector3(2957.164, 1377.683, 55.3044)
        ,
        Grades = {
            [1] = {
                Name = "Ouvrier",
                StorageAccess = true,
            },
            [2] = {
                Name = "Contremaître",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["fermier"] = {
        bigjob = "fermier",
        Name = "Ferme",
        blisprite = 552659337,
        MenuLocations = 
            vector3(-1643.433, -1355.236, 83.45272)
        ,
        Grades = {
            [1] = {
                Name = "Ouvrier",
                StorageAccess = true,
            },
            [2] = {
                Name = "Contremaître",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["store_straw"] = {
        bigjob = "store",
        Name = "General Store Strawberry",
        blisprite = 1475879922,
        MenuLocations = 
            vector3(-1789.773, -384.8727, 159.3285)
        ,
        Grades = {
            [1] = {
                Name = "Ouvrier",
                StorageAccess = true,
            },
            [2] = {
                Name = "Contremaître",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["store_rhodes"] = {
        bigjob = "store",
        Name = "General Store Rhodes",
        blisprite = 1475879922,
        MenuLocations = 
            vector3(1329.714, -1295.512, 76.02248)
        ,
        Grades = {
            [1] = {
                Name = "Ouvrier",
                StorageAccess = true,
            },
            [2] = {
                Name = "Contremaître",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["forge"] = {
        bigjob = "forge",
        Name = "Forge",
        blisprite = -758970771,
        MenuLocations = 
            vector3(-875.5815, -1291.787, 42.10154)
        ,
        Grades = {
            [1] = {
                Name = "Ouvrier",
                StorageAccess = true,
            },
            [2] = {
                Name = "Contremaître",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },

----- ----- ----- -----

    ["saloon_vh"] = {
        bigjob = "saloon",
        Name = "Saloon de Van Horn",
        blisprite = 1879260108,
        MenuLocations = 
        vector3(2950.342, 529.1586, 44.33422)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["saloon_faubourg"] = {
        bigjob = "saloon",
        Name = "Saloon des faubourgs",
        blisprite = 1879260108,
        MenuLocations = 
            vector3(2793.258, -1165.609, 46.93198)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["doctor_stdenis"] = {
        bigjob = "doctor",
        Name = "Cabinet de Saint-Denis",
        MenuLocations = 
            vector3(2733.16, -1230.244, 49.37041)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["presse"] = {
        bigjob = "presse",
        Name = "Presse",
        blisprite = 587827268,
        MenuLocations = 
            vector3(2613.231, -1340.257, 49.13868)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["apothicaire"] = {
        bigjob = "apothicaire",
        Name = "Apothicaire",
        blisprite = 669307703,
        MenuLocations = 
            vector3(2627.889, -1351.214, 48.04772)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
            },
        }
    },
    ["sheriff_rhodes"] = {
        bigjob = "sheriff",
        Name = "Shériff",
        blisprite = 778811758,
        MenuLocations = 
            vector3(1361.258, -1306.085, 76.7606)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
                Pay = 0.75,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
                Pay = 0.75,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
                Pay = 0.75,
            },
        }
    },
    ["sheriff_bla"] = {
        bigjob = "sheriff",
        Name = "Shériff",
        blisprite = 778811758,
        MenuLocations = 
            vector3(-768.0265, -1266.601, 43.05392)
        ,
        Grades = {
            [1] = {
                Name = "Assistant",
                StorageAccess = true,
                Pay = 0.75,
            },
            [2] = {
                Name = "Second",
                StorageAccess = true,
                Pay = 0.75,
            },
            [3] = {
                Name = "Patron",
                Personnel = true,
                StorageAccess = true,
                Pay = 0.75,
            },
        }
    },

}