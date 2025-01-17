Config = {}
Config.Jobs = {
    "peche_lagras",

}
-- settings
Config.Difficulty = 2500 -- use -1 for testing
Config.ReelSpeed = 0.0125
Config.Debug = false


Config.WorkingTime = 2500
-- fishing baits
Config.Baits = {
    "p_baitBread01x",
    "p_baitCorn01x",
    "p_baitCheese01x",
    "p_baitWorm01x",
    "p_baitCricket01x",
    "p_crawdad01x",
    "p_finishedragonfly01x",
    "p_FinisdFishlure01x",
    "p_finishdcrawd01x",
    "p_finishedragonflylegendary01x",
    "p_finisdfishlurelegendary01x",
    "p_finishdcrawdlegendary01x",
    "p_lgoc_spinner_v4",
    "p_lgoc_spinner_v6",
}

-- bait to catch fish
Config.BaitsPerFish = {
    ["p_baitBread01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
    },
    ["p_baitCorn01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
    },
    ["p_baitWorm01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHCHAINPICKEREL_01_MS",
        "A_C_FISHCHAINPICKEREL_01_SM",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHROCKBASS_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },
    ["p_finishdcrawd01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHCHAINPICKEREL_01_SM",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHLONGNOSEGAR_01_LG",
        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
        "A_C_FISHMUSKIE_01_LG",
    },
    ["p_lgoc_spinner_v4"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHCHAINPICKEREL_01_MS",
        "A_C_FISHCHAINPICKEREL_01_SM",

        "A_C_FISHCHANNELCATFISH_01_LG",
        "A_C_FISHCHANNELCATFISH_01_XL",

        "A_C_FISHLAKESTURGEON_01_LG",

        "A_C_FISHLARGEMOUTHBASS_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHLONGNOSEGAR_01_LG",

        "A_C_FISHMUSKIE_01_LG",

        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",

        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHRAINBOWTROUT_01_MS",

        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHROCKBASS_01_MS",
        "A_C_FISHROCKBASS_01_SM",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_LG",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },
    ["p_lgoc_spinner_v6"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHCHAINPICKEREL_01_MS",
        "A_C_FISHCHAINPICKEREL_01_SM",

        "A_C_FISHCHANNELCATFISH_01_LG",
        "A_C_FISHCHANNELCATFISH_01_XL",

        "A_C_FISHLAKESTURGEON_01_LG",

        "A_C_FISHLARGEMOUTHBASS_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHLONGNOSEGAR_01_LG",

        "A_C_FISHMUSKIE_01_LG",

        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",

        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHRAINBOWTROUT_01_MS",

        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHROCKBASS_01_MS",
        "A_C_FISHROCKBASS_01_SM",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_LG",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    }
}

-- fish data
Config.fishData = {
    A_C_FISHBLUEGIL_01_MS        = {"Crapet arlequin","PROVISION_FISH_BLUEGILL","PROVISION_BLUEGILL_DESC"},
    A_C_FISHBLUEGIL_01_SM        = {"Petit Crapet arlequin","PROVISION_FISH_BLUEGILL","PROVISION_BLUEGILL_DESC"},
    A_C_FISHBULLHEADCAT_01_MS    = {"Poisson-chat","PROVISION_FISH_BULLHEAD_CATFISH","PROVISION_BLUEGILL_DESC"},
    A_C_FISHBULLHEADCAT_01_SM    = {"Petit Poisson-chat","PROVISION_FISH_BULLHEAD_CATFISH","PROVISION_BLUEGILL_DESC"},
    A_C_FISHCHAINPICKEREL_01_MS  = {"Brochet maillé","PROVISION_FISH_CHAIN_PICKEREL","PROVISION_CHNPKRL_DESC"},
    A_C_FISHCHAINPICKEREL_01_SM  = {"Petit Brochet maillé","PROVISION_FISH_CHAIN_PICKEREL","PROVISION_CHNPKRL_DESC"},
    A_C_FISHCHANNELCATFISH_01_LG = {"Gros Barbue de rivière","PROVISION_FISH_CHANNEL_CATFISH","PROVISION_CHNCATFSH_DESC"},
    A_C_FISHCHANNELCATFISH_01_XL = {"Très gros Barbue de rivière","PROVISION_FISH_CHANNEL_CATFISH","PROVISION_CHNCATFSH_DESC"},
    A_C_FISHLAKESTURGEON_01_LG   = {"Gros Esturgeon jaune","PROVISION_FISH_LAKE_STURGEON","PROVISION_LKSTURG_DESC"},
    A_C_FISHLARGEMOUTHBASS_01_LG = {"Gros Achigan à grande bouche","PROVISION_FISH_LARGEMOUTH_BASS","PROVISION_LRGMTHBASS_DESC"},
    A_C_FISHLARGEMOUTHBASS_01_MS = {"Achigan à grande bouche","PROVISION_FISH_LARGEMOUTH_BASS","PROVISION_LRGMTHBASS_DESC"},
    A_C_FISHLONGNOSEGAR_01_LG    = {"Gros Lépisosté osseux","PROVISION_FISH_LONGNOSE_GAR","PROVISION_LNGNOSEGAR_DESC"},
    A_C_FISHMUSKIE_01_LG         = {"Gros Maskinongé","PROVISION_FISH_MUSKIE","PROVISION_MUSKIE_DESC"},
    A_C_FISHNORTHERNPIKE_01_LG   = {"Grand Brochet","PROVISION_FISH_NORTHERN_PIKE","PROVISION_NPIKE_DESC"},
    A_C_FISHPERCH_01_MS          = {"Perche","PROVISION_FISH_PERCH","PROVISION_PERCH_DESC"},
    A_C_FISHPERCH_01_SM          = {"Petite Perche","PROVISION_FISH_PERCH","PROVISION_PERCH_DESC"},
    A_C_FISHRAINBOWTROUT_01_LG   = {"Grosse Truite arc-en-ciel","PROVISION_FISH_STEELHEAD_TROUT","PROVISION_FISH_STHDTROUT_DESC"},
    A_C_FISHRAINBOWTROUT_01_MS   = {"Truite arc-en-ciel","PROVISION_FISH_STEELHEAD_TROUT","PROVISION_FISH_STHDTROUT_DESC"},
    A_C_FISHREDFINPICKEREL_01_MS = {"Brochet rouge","PROVISION_FISH_REDFIN_PICKEREL","PROVISION_RDFNPCKREL_DESC"},
    A_C_FISHREDFINPICKEREL_01_SM = {"Petit Brochet rouge","PROVISION_FISH_REDFIN_PICKEREL","PROVISION_RDFNPCKREL_DESC"},
    A_C_FISHROCKBASS_01_MS       = {"Crapet de roche","PROVISION_FISH_ROCK_BASS","PROVISION_ROCKBASS_DESC"},
    A_C_FISHROCKBASS_01_SM       = {"Petit Crapet de roche","PROVISION_FISH_ROCK_BASS","PROVISION_ROCKBASS_DESC"},
    A_C_FISHSALMONSOCKEYE_01_LG  = {"Très Gros Saumon rouge","PROVISION_FISH_SOCKEYE_SALMON_LEGENDARY","PROVISION_SCKEYESAL_DESC"},
    A_C_FISHSALMONSOCKEYE_01_ML  = {"Gros Saumon rouge","PROVISION_FISH_SOCKEYE_SALMON","PROVISION_SCKEYESAL_DESC"},
    A_C_FISHSALMONSOCKEYE_01_MS  = {"Saumon rouge","PROVISION_FISH_SOCKEYE_SALMON","PROVISION_SCKEYESAL_DESC"},
    A_C_FISHSMALLMOUTHBASS_01_LG = {"Gros Achigan à petite bouche","PROVISION_FISH_SMALLMOUTH_BASS","PROVISION_SMLMTHBASS_DESC"},
    A_C_FISHSMALLMOUTHBASS_01_MS = {"Achigan à petite bouche","PROVISION_FISH_SMALLMOUTH_BASS","PROVISION_SMLMTHBASS_DESC"},
}

Config.LangueEN = {
    error = {
            you_need_use_your_fishing_rod_first = 'Vous devez avoir votre canne en main.',
    },
    success = {
            var = 'text goes here',
    },
    primary = {
            you_got_fish_name = 'Vous avez eu un %{fish_name}',
    },
    menu = {
            var = 'text goes here',
    },
    commands = {
            var = 'text goes here',
    },
    progressbar = {
            var = 'text goes here',
    },
    text = {
        ready_to_fish = 'Prêt à pêcher!',
        fishing = 'Pêcher',
        get_the_fish = 'Prenez le poisson !',
        name = 'Nom',
        weight = 'Poids',
        prepare_fishing_rod = 'Préparer le lancer',
        cast_fishing_rod = 'Lancer la canne',
        hook = 'Hameçon',
        reset_cast = 'Relancer',
        reel_lure = 'Mouliner',
        reel_in = 'Mouliner',
        keep_fish = 'Garder le poisson',
        throw_fish = 'Relâcher le poisson',
    }
}


Config.CraftingsReceipe = {
    ['a_c_fishlargemouthbass_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishlargemouthbass_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_bluegill.png', text = "Achigan à grande bouche",count = "x1"}
    },

    ['a_c_fishbluegil_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishbluegil_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_bluegill.png', text = "Crapet arlequin",count = "x1"}
    },
    ['a_c_fishbluegil_01_sm'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishbluegil_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_bluegill.png', text = "Petit Crapet arlequin",count = "x1"}
    },
    ['a_c_fishbullheadcat_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishbullheadcat_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_bullhead_catfish.png', text = "Poisson-chat",count = "x1"}
    },
    ['a_c_fishbullheadcat_01_sm'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishbullheadcat_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_bullhead_catfish.png', text = "Petit Poisson-chat",count = "x1"}
    },
    ['a_c_fishchainpickerel_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishchainpickerel_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_chain_pickerel.png', text = "Brochet maillé",count = "x1"}
    },
    ['a_c_fishchainpickerel_01_sm'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishchainpickerel_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_chain_pickerel.png', text = "Petit Brochet maillé",count = "x1"}
    },
    ['a_c_fishchannelcatfish_01_lg'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishchannelcatfish_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_channel_catfish.png', text = "Gros Barbue de rivière",count = "x1"}
    },
    ['a_c_fishchannelcatfish_01_xl'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishchainpickerel_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 4,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_channel_catfish.png', text = "Très gros Barbue de rivière",count = "x1"}
    },
    ['a_c_fishlakesturgeon_01_lg'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishlakesturgeon_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_lake_sturgeon.png', text = "Gros Esturgeon jaune",count = "x1"}
    },
    ['a_c_fishlargemouthbass_01_lg'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishlargemouthbass_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_largemouth_bass.png', text = "Gros Achigan à grande bouche",count = "x1"}
    },
    ['a_c_fishlongnosegar_01_lg'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishlongnosegar_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_longnose_gar.png', text = "Gros Lépisosté osseux",count = "x1"}
    },
    ['a_c_fishmuskie_01_lg'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishmuskie_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_muskie.png', text = "Gros Maskinongé",count = "x1"}
    },
    ['a_c_fishnorthernpike_01_lg'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishnorthernpike_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_northern_pike.png', text = "Grand Brochet",count = "x1"}
    },
    ['a_c_fishperch_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishperch_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_perch.png', text = "Perche",count = "x1"}
    },
    ['a_c_fishperch_01_sm'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishperch_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_muskie.png', text = "Petite Perche",count = "x1"}
    },
    ['a_c_fishrainbowtrout_01_lg'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishrainbowtrout_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_speckled_trout.png', text = "Grosse Truite arc-en-ciel",count = "x1"}
    },
    ['a_c_fishrainbowtrout_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishrainbowtrout_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_muskie.png', text = "Truite arc-en-ciel",count = "x1"}
    },
    ['a_c_fishredfinpickerel_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishredfinpickerel_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_redfin_pickerel.png', text = "Brochet rouge",count = "x1"}
    },
    ['a_c_fishredfinpickerel_01_sm'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishredfinpickerel_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_muskie.png', text = "Petit Brochet rouge",count = "x1"}
    },
    ['a_c_fishrockbass_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishrockbass_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_rock_bass.png', text = "Crapet de roche",count = "x1"}
    },
    ['a_c_fishrockbass_01_sm'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishrockbass_01_sm',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 1,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_rock_bass.png', text = "Petit Crapet de roche",count = "x1"}
    },
    ['a_c_fishsalmonsockeye_01_lg'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsalmonsockeye_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_sockeye_salmon.png', text = "Très Gros Saumon rouge",count = "x1"}
    },
    ['a_c_fishsalmonsockeye_01_ml'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsalmonsockeye_01_ml',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_sockeye_salmon.png', text = "Gros Saumon rouge",count = "x1"}
    },
    ['a_c_fishsalmonsockeye_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsalmonsockeye_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_sockeye_salmon.png', text = "Saumon rouge",count = "x1"}
    },
    ['a_c_fishsmallmouthbass_01_lg'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsmallmouthbass_01_lg',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 3,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_smallmouth_bass.png', text = "Gros Achigan à petite bouche",count = "x1"}
    },
    ['a_c_fishsmallmouthbass_01_ms'] = {
        type = 'poissonerie',
        Itemtocraft = 1,
        ItemReceipe1Name = 'a_c_fishsmallmouthbass_01_ms',
        ItemReceipe1Amount = 1,
        ItemToGive = 'filetpoisson',
        Amount = 2,
        WorkingTime = 5,
        label = 'Filet de poisson',
        descriptionimages = {src = 'nui://redemrp_inventory/html/items/provision_fish_smallmouth_bass.png', text = "Achigan à petite bouche",count = "x1"}
    },
    ['caissedepoisson'] = {
        type ='pecheetabli',
        Itemtocraft = 4,
        ItemReceipe1Name = 'filetpoisson',
        ItemReceipe1Amount = 10,
        ItemReceipe2Name = 'bois',
        ItemReceipe2Amount = 3,
        ItemReceipe3Name = 'graisse',
        ItemReceipe3Amount = 1,
        ItemReceipe4Name = 'sel',
        ItemReceipe4Amount = 3,
        ItemToGive = 'caissepoisson',
        Amount = 1,
        WorkingTime = 1,
        label = 'Caisse de poisson',
        descriptionimages = {{src = 'nui://redemrp_inventory/html/items/provision_meat_succulent_fish.png', text = "Filet de poisson",count = "x10"}, {src = 'nui://redemrp_inventory/html/items/wood.png', text = "Bois",count = "x3"}, {src = 'nui://redemrp_inventory/html/items/generic_animal_fat.png', text = "Morceau de gras",count = "x1"}, {src = 'nui://redemrp_inventory/html/items/saltpeter.png', text = "Sac de sel",count = "x3"}}
    },
}

Config.AtelierPoisson = {
    vector3(2120.323, -606.8054, 40.64933),
    vector3(-1201.094, -1938.43, 42.59532),

}


Config.Ecrevisse = {
    vector3(2008.564, -1835.291, 39.77694),
    vector3(1566.364, -845.6798, 40.38267),
    vector3(2595.068, -331.4922, 40.26375),
}



Config.DistanceToInteract = 2.0

Config.Atelier = {
    vector3(2125.559, -594.2456, 41.5196), --- lagras
}

Config.AnimDict = "amb_camp@prop_camp_butcher@working@rabbit@male_a@rabbit_chop@base"
Config.CraftAnim = {
    "rabbitchop_trans_meatscoop",
}

