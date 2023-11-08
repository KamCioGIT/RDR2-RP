Config = {}

Config.Jobs = {
    [1] = "marechal_stdenis",
	[2] = "marechal_bla",
}
Config.Certif = {
    vector3(-809.87, -1277.221, 43.63772), --- bla 
    vector3(1291.767, -1297.731, 77.0575), --- rhodes
    vector3(2638.67, -1292.944, 52.25156), --- stdenis
}
Config.Stables = {
	buyhorse = {
		pos = vector3(2511.494, -1431.057, 46.26681),
		name = 'buyhorse',
    },
    buybla = {
		pos = vector3(-951.3615, -1340.261, 50.63528),
		name = 'buybla',
    },
	Strawberry = {
		pos = vector3(-1781.097, -439.7949, 155.1324),
		name = 'Strawberry',
    },
	Wapiti = {
		pos = vector3(486.6815, 2217.716, 247.2323),
		name = 'Wapiti',
    },
	DakotaCamp = {
		pos = vector3(-115.0529, 1486.4540, 112.7034),
		name = 'DakotaCamp',
    },
	Amabarino = {
		pos = vector3(-1336.1310, 2397.8857, 307.0894),
		name = 'Amabarino',
    },
	Flatneck = {
		pos = vector3(-381.2650, -349.7352, 86.8605),
		name = 'Flatneck',
    },
	Valentine = {
		pos = vector3(-365.1976, 776.2587, 116.2820),
		name = 'Valentine',
    },
	Emerald = {
		pos = vector3(1383.8695, 326.0576, 87.8322),
		name = 'Emerald',
    },
	Rhodes_sheriff = {
		pos = vector3(1369.5880, -1298.0417, 76.7351),
		name = 'Rhodes_sheriff',
    },
	Rhodes_poste = {
		pos = vector3(1257.0261, -1315.4788, 76.2924),
		name = 'Rhodes_poste',
    },
	Blackwater_sheriff = {
		pos = vector3(-741.5472, -1302.6738, 43.2705),
		name = 'Blackwater_sheriff',
    },
	Strawberry_sheriff = {
		pos = vector3(-1799.4211, -351.5683, 164.0752),
		name = 'Strawberry_sheriff',
    },
	Manzanita = {
		pos = vector3(-1970.1453, -1655.9006, 117.1564),
		name = 'Manzanita',
    },
	Littlecreek = {
		pos = vector3(-2217.7065, 733.1433, 123.1683),
		name = 'Littlecreek',
    },
	Fort_Wallace = {
		pos = vector3(348.8842, 1507.8472, 180.6682),
		name = 'Fort_Wallace',
    },
	Annesburg = {
		pos = vector3(2912.6509, 1244.7437, 44.7109),
		name = 'Annesburg',
    },
	VanHorn = {
		pos = vector3(2935.8020, 573.9051, 44.6474),
		name = 'VanHorn',
    },
	Fermejohn = {
		pos = vector3(-1655.8254, -1381.1234, 83.9948),
		name = 'Fermejohn',
    },
	Stdenis_Marshall = {
		pos = vector3(2489.8730, -1322.0959, 48.8657) ,
		name = 'Stdenis_Marshall',
    },
	Stdenis_eglise = {
		pos = vector3(2732.0396, -1258.5210, 49.7719),
		name = 'Stdenis_eglise',
    },
	Stdenis_roturier = {
		pos = vector3(2556.4985, -807.7131, 42.3602),
		name = 'Stdenis_roturier',
    },
	Stdenis_start = {
		pos = vector3(2470.057, -1331.795, 46.65237),
		name = 'Stdenis_start',
    },
	Startbla = {
		pos = vector3(-885.1912, -1362.12, 43.49583),
		name = 'Startbla',
    },
}
Config.Buyhorse = {
	Saint_Denis = {
		pos = vector3(2525.539, -1432.664, 46.32558),
		name = 'Achatstdenis',
		stable= 'buyhorse',
	},
    Staff = {
		pos = vector3(3364.299, -92.8988, 49.64944),
		name = 'Achatstaff',
		stable= 'buyhorse',
	},
    Bla = {
		pos = vector3(-944.1528, -1333.534, 49.67882),
		name = 'Achatstaff',
		stable= 'buybla',
	},
    
}

Config.Buycart = {
	Saint_Denis = {
		pos = vector3(2502.023, -1487.874, 45.9691),
		name = 'Achatcartstdenis',
		stable= 'buyhorse',
	},
    	Staff = {
		pos = vector3(3337.925, -73.60331, 47.93591),
		name = 'Achatcartstaff',
		stable= 'buyhorse',
	},
    Bla = {
		pos = vector3(-878.5054, -1365.022, 42.52768),
		name = 'Achatstaff',
		stable= 'buybla',
	},
}

Config.NoobPos ={ 	
Startstdenis = {
	pos = vector3(2462.964, -1328.921, 46.23399),
	name = 'Achat',
	stable= 'Stdenis_start',
},
Startbla = {
	pos = vector3(-879.2835, -1376.261, 43.71529),
	name = 'Achat',
	stable= 'Startbla',
},
}

Config.NoobHorses = {
	TennesseeWalkerChestnut= {
		model = "A_C_Horse_TennesseeWalker_Chestnut",
		name = "Tennesse walker alezan",
		desc = "Cheval de travail",
		price = 9,
	},
	TennesseeWalkerDB= {
		model = "A_C_Horse_TennesseeWalker_DappleBay",
		name = "Tennesse walker bai pommelé",
		desc = "Cheval de travail",
		price = 9,
	},
	KentuckyBlack= {
		model = "A_C_Horse_KentuckySaddle_Black",
		name = "Cheval du Kentucky noir",
		desc = "Cheval de travail",
		price = 7,
	},
	KentuckyCP= {
		model = "A_C_Horse_KentuckySaddle_ChestnutPinto",
		name = "Cheval du Kentucky alezan pinto",
		desc = "Cheval de travail",
		price = 7,
	},
	KentuckyGrey= {
		model = "A_C_Horse_KentuckySaddle_Grey",
		name = "Cheval du Kentucky gris",
		desc = "Cheval de travail",
		price = 7,
	},
	KentuckySB= {
		model = "A_C_Horse_KentuckySaddle_SilverBay",
		name = "Cheval du Kentucky bai argenté",
		desc = "Cheval de travail",
		price = 7,
	},
	MorganBay= {
		model = "A_C_Horse_Morgan_Bay",
		name = "Morgan bai",
		desc = "Cheval de travail",
		price = 6,
	},
	MorganFC= {
		model = "A_C_Horse_Morgan_FlaxenChestnut",
		name = "Morgan alezan crins lavés",
		desc = "Cheval de travail",
		price = 6,
	},
	MorganPalomino= {
		model = "A_C_Horse_Morgan_Palomino",
		name = "Morgan palomino",
		desc = "Cheval de travail",
		price = 6,
	},
	
}




Config.BuyHorses = {
    AndalouNoir= {
        model = "A_C_Horse_Andalusian_DarkBay",
        name = "Andalou bai foncé",
        desc = "Cheval de guerre",
        price = 50,
    },
    AndalouPerlino= {
        model = "A_C_Horse_Andalusian_Perlino",
        name = "Andalou perlino",
        desc = "Cheval de guerre",
        price = 60,
    },
    AndalouRG= {
        model = "A_C_Horse_Andalusian_RoseGray",
        name = "Andalou gris perle",
        desc = "Cheval de guerre",
        price = 60,
	},

    AmericanPaintGreyOvero= {
        model = "A_C_Horse_AmericanPaint_Greyovero",
        name = "American Paint Grey Overo ",
        desc = "Cheval de travail",
        price = 50,
    },
    AmericanPaintOvero= {
        model = "A_C_Horse_AmericanPaint_Overo",
        name = "American Paint overo",
        desc = "Cheval de travail",
        price = 50,
    },
    AmericanPaintSWhite= {
        model = "A_C_Horse_AmericanPaint_SplashedWhite",
        name = "American Paint pie noir",
        desc = "Cheval de travail",
        price = 50,
    },
    AmericanPaintTobiano= {
        model = "A_C_Horse_AmericanPaint_Tobiano",
        name = "American Paint tobiano",
        desc = "Cheval de travail",
        price = 50,
    },
    AmericanPiePalomino= {
        model = "A_C_Horse_EagleFlies",
        name = "American Paint pie palomino",
        desc = "Cheval de travail",
        price = 50,
    },


    AmericanStandardbredSTbuckskin= {
        model = "A_C_Horse_AmericanStandardbred_SilverTailBuckskin",
        name = "Trotteur Américain silver tail buckskin",
        desc = "Cheval de travail",
        price = 45,
    },
    AmericanStandardPD= {
        model = "A_C_Horse_AmericanStandardbred_PalominoDapple",
        name = "Trotteur Américain palomino pommelé",
        desc = "Cheval de travail",
        price = 35,
    },
    AmericanStandardBlack= {
        model = "A_C_Horse_AmericanStandardbred_Black",
        name = "Trotteur Américain noir",
        desc = "Cheval de travail",
        price = 35,
    },
    AmericanStandardBuck= {
        model = "A_C_Horse_AmericanStandardbred_Buckskin",
        name = "Trotteur Américain isabelle",
        desc = "Cheval de travail",
        price = 35,
    },
    AmericanStandardLight= {
        model = "A_C_Horse_AmericanStandardbred_Lightbuckskin",
        name = "Trotteur Américain isabelle clair",
        desc = "Cheval de travail",
        price = 45,
    },


    AppaloosaBackSF= {
        model = "A_C_Horse_Appaloosa_BlackSnowflake",
        name = "Appaloosa léopard inversé",
        desc = "Cheval de travail",
        price = 51,
    },
    AppaloosaBlanket= {
        model = "A_C_Horse_Appaloosa_Blanket",
        name = "Appaloosa capé",
        desc = "Cheval de travail",
        price = 50,
    },
    AppaloosaBL= {
        model = "A_C_Horse_Appaloosa_BrownLeopard",
        name = "Appaloosa léopard brun",
        desc = "Cheval de travail",
        price = 71,
    },
    AppaloosaFS= {
        model = "A_C_Horse_Appaloosa_FewSpotted_PC",
        name = "Appaloosa tacheté",
        desc = "Cheval de travail",
        price = 47,
    },
    AppaloosaLeopard= {
        model = "A_C_Horse_Appaloosa_Leopard",
        name = "Appaloosa léopard",
        desc = "Cheval de travail",
        price = 72,
    },
    AppaloosaLB= {
        model = "A_C_Horse_Appaloosa_LeopardBlanket",
        name = "Appaloosa capé léopard",
        desc = "Cheval de travail",
        price = 51,
    },
    AppaloosaCharles= {
        model = "A_C_Horse_Gang_Charles",
        name = "Appaloosa capé léopard noir",
        desc = "Cheval de travail",
        price = 55,
    },
    AppaloosaUncle= {
        model = "A_C_Horse_Gang_Uncle_EndlessSummer",
        name = "Appaloosa capé isabelle tacheté",
        desc = "Cheval de travail",
        price = 50,
    },


    ArabianBlack= {
        model = "A_C_Horse_Arabian_Black",
        name = "Pur sang arabe noir",
        desc = "Cheval de course",
        price = 225,
    },
    ArabianGrey= {
        model = "A_C_Horse_Arabian_Grey",
        name = "Pur sang arabe gris",
        desc = "Cheval de course",
        price = 195,
    },
    ArabianRCL= {
        model = "A_C_Horse_Arabian_RedChestnut",
        name = "Pur sang arabe bai à liste blanche",
        desc = "",
        price = 190,
    },
    ArabianRC= {
        model = "A_C_Horse_Arabian_RedChestnut_PC",
        name = "Pur sang arabe bai",
        desc = "Cheval de course",
        price = 199,
    },
    ArabianRGB= {
        model = "A_C_Horse_Arabian_RoseGreyBay",
        name = "Pur sang arabe gris perle",
        desc = "Cheval de course",
        price = 205,
    },
    ArabianWB= {
        model = "A_C_Horse_Arabian_WarpedBrindle_PC",
        name = "Pur sang arabe bai bringé",
        desc = "Cheval de course",
        price = 215,
    },
    ArabianWhite= {
        model = "A_C_Horse_Arabian_White",
        name = "Pur sang arabe blanc",
        desc = "Cheval de course",
        price = 213,
    },


    ArdennesBR= {
        model = "A_C_Horse_Ardennes_BayRoan",
        name = "Ardennes bai rouan",
        desc = "Cheval de trait",
        price = 72,
    },
    ArdennesIGR= {
        model = "A_C_Horse_Ardennes_IronGreyRoan",
        name = "Ardennes gris rouan",
        desc = "Cheval de trait",
        price = 105,
    },
    ArdennesSR= {
        model = "A_C_Horse_Ardennes_StrawberryRoan",
        name = "Ardennes rouan fraise",
        desc = "Cheval de trait",
        price = 117,
    },
    ArdennesBill= {
        model = "A_C_Horse_Gang_Bill",
        name = "Ardennes bai crins lavés",
        desc = "Cheval de trait",
        price = 103,
    },


    BelgianBC= {
        model = "A_C_Horse_Belgian_BlondChestnut",
        name = "Trait belge alezan clair",
        desc = "Cheval de trait",
        price = 35,
    },
    BelgianMC= {
        model = "A_C_Horse_Belgian_MealyChestnut",
        name = "Trait belge alezan pangaré",
        desc = "Cheval de trait",
        price = 34,
    },


    BretonGD= {
        model = "A_C_Horse_Breton_GrulloDun",
        name = "Breton grullo",
        desc = "Cheval de trait",
        price = 92,
    },
    BretonMDP= {
        model = "A_C_Horse_Breton_MealyDappleBay",
        name = "Breton pommelé pangaré",
        desc = "Cheval de trait",
        price = 125,
    },
    BretonRR= {
        model = "A_C_Horse_Breton_RedRoan",
        name = "Breton rubican",
        desc = "Cheval de trait",
        price = 75,
    },
    BretonSB= {
        model = "A_C_Horse_Breton_Sealbrown",
        name = "Breton noir pangaré",
        desc = "Cheval de trait",
        price = 95,
    },
    BretonSorrel= {
        model = "A_C_Horse_Breton_Sorrel",
        name = "Breton oseille",
        desc = "Cheval de trait",
        price = 74,
    },
    BretonSG= {
        model = "A_C_Horse_Breton_SteelGrey",
        name = "Breton gris fer",
        desc = "Cheval de trait",
        price = 125,
    },


    CriolloBrindle= {
        model = "A_C_Horse_Criollo_Baybrindle",
        name = "Criollo bai bringé",
        desc = "Cheval de travail",
        price = 90,
    },
    CriolloBFO= {
        model = "A_C_Horse_Criollo_Bayframeovero",
        name = "Criollo bai overo",
        desc = "Cheval de travail",
        price = 110,
    },
    CriolloBR= {
        model = "A_C_Horse_Criollo_Blueroanovero",
        name = "Criollo bleu rouan overo",
        desc = "Cheval de travail",
        price = 68,
    },
    CriolloDun= {
        model = "A_C_Horse_Criollo_Dun",
        name = "Criollo dun",
        desc = "Cheval de travail",
        price = 68,
    },
    CriolloMS= {
        model = "A_C_Horse_Criollo_Marblesabino",
        name = "Criollo sabino marbré",
        desc = "Cheval de travail",
        price = 115,
    },
    CriolloSO= {
        model = "A_C_Horse_Criollo_Sorrelovero",
        name = "Criollo overo oseille",
        desc = "Cheval de travail",
        price = 95,
    },


    HollandaitChoco= {
        model = "A_C_Horse_DutchWarmblood_ChocolateRoan",
        name = "Hollandais à sang chaud rouan chocolat",
        desc = "Cheval de guerre",
        price = 115,
    },
    HoollandaisBrun= {
        model = "A_C_Horse_DutchWarmblood_SealBrown",
        name = "Hollandais à sang chaud noir pangaré",
        desc = "Cheval de guerre",
        price = 75,
    },
    HollandaisIsabelle= {
        model = "A_C_Horse_DutchWarmblood_SootyBuckskin",
        name = "Hollandais à sang chaud bai pommelé",
        desc = "Cheval de guerre",
        price = 70,
    },
    HollandaisCremello= {
        model = "A_C_Horse_Buell_WarVets",
        name = "Hollandais à sang chaud cremello",
        desc = "Cheval de guerre",
        price = 130,
    },


    GipsyCobPB= {
        model = "A_C_Horse_GypsyCob_PalominoBlagdon",
        name = "Gipsy cob pie palomino",
        desc = "Cheval de trait",
        price = 105,
    },
    GipsyCobPiebald= {
        model = "A_C_Horse_GypsyCob_Piebald",
        name = "Gipsy cob pie noir",
        desc = "Cheval de trait",
        price = 85,
    },
    GipsyCobSkewbald= {
        model = "A_C_Horse_GypsyCob_Skewbald",
        name = "Gipsy cob pie alezan",
        desc = "Cheval de trait",
        price = 105,
    },
    GipsyCobSB= {
        model = "A_C_Horse_GypsyCob_SplashedBay",
        name = "Gipsy cob pie bai",
        desc = "Cheval de trait",
        price = 125,
    },
    GipsyCobSP= {
        model = "A_C_Horse_GypsyCob_SplashedPiebald",
        name = "Gipsy cob pie éclaboussé",
        desc = "Cheval de trait",
        price = 125,
    },
    GipsyCobWB= {
        model = "A_C_Horse_GypsyCob_WhiteBlagdon",
        name = "Gipsy cob blanc",
        desc = "Cheval de trait",
        price = 85,
    },


    HungaDDG= {
        model = "A_C_Horse_HungarianHalfbred_DarkDappleGrey",
        name = "Demi sang hongrois gris pommelé",
        desc = "Cheval de guerre",
        price = 73,
    },
    HungaFC= {
        model = "A_C_Horse_HungarianHalfbred_FlaxenChestnut",
        name = "Demi sang hongrois alezan crin lavé",
        desc = "Cheval de guerre",
        price = 52,
    },
    HungaLC= {
        model = "A_C_Horse_HungarianHalfbred_LiverChestnut",
        name = "Demi sang hongrois alezan brûlé",
        desc = "Cheval de guerre",
        price = 105,
    },
    HungaP= {
        model = "A_C_Horse_HungarianHalfbred_PiebaldTobiano",
        name = "Demi sang hongrois pie tobiano",
        desc = "Cheval de guerre",
        price = 54,
    },
    HungaSDB = {
        model = "A_C_Horse_Gang_John",
        name = "Demi sang hongrois bai crins lavés",
        desc = "Cheval de guerre",
        price = 55,
    },
    KentuckyBMB= {
        model = "A_C_Horse_KentuckySaddle_ButterMilkBuckskin_PC",
        name = "Cheval du Kentucky isabelle clair",
        desc = "Cheval de travail",
        price = 10,
    },
    KentuckyUncle= {
        model = "A_C_Horse_Gang_Uncle",
        name = "Cheval du Kentucky alezan moucheté",
        desc = "Cheval de travail",
        price = 12,
    },


    KladruberBlack= {
        model = "A_C_Horse_Kladruber_Black",
        name = "Kladruber noir",
        desc = "Cheval de travail",
        price = 60,
    },
    KladruberCremello= {
        model = "A_C_Horse_Kladruber_Cremello",
        name = "Kladruber cremello",
        desc = "Cheval de travail",
        price = 88,
    },
    KladruberDRG= {
        model = "A_C_Horse_Kladruber_Dapplerosegrey",
        name = "Kladruber gris pommelé",
        desc = "Cheval de travail",
        price = 154,
    },
    KladruberGrey= {
        model = "A_C_Horse_Kladruber_Grey",
        name = "Kladruber gris",
        desc = "Cheval de travail",
        price = 85,
    },
    KladruberSilver= {
        model = "A_C_Horse_Kladruber_Silver",
        name = "Kladruber argenté",
        desc = "Cheval de travail",
        price = 149,
    },
    KladruberWhite= {
        model = "A_C_Horse_Kladruber_White",
        name = "Kladruber blanc",
        desc = "Cheval de travail",
        price = 63,
    },


    MissouriFoxTrotterAA= {
        model = "A_C_Horse_MissouriFoxTrotter_AmberChampagne",
        name = "Missouri fox trotteur champagne ambré",
        desc = "Cheval de travail",
        price = 142,
    },
    MissouriFoxTrotterBT= {
        model = "A_C_Horse_MissouriFoxTrotter_Blacktovero",
        name = "Missouri fox trotteur tovero noir",
        desc = "Cheval de travail",
        price = 153,
    },
    MissouriFoxTrotterBR= {
        model = "A_C_HORSE_MISSOURIFOXTROTTER_BLUEROAN",
        name = "Missouri fox trotteur bleu rouan",
        desc = "Cheval de travail",
        price = 138,
    },
    MissouriFoxTrotterBB= {
        model = "A_C_Horse_MissouriFoxTrotter_Buckskinbrindle",
        name = "Missouri fox trotteur isabelle bringé",
        desc = "Cheval de travail",
        price = 154,
    },
    MissouriFoxTrotterDG= {
        model = "A_C_HORSE_MISSOURIFOXTROTTER_DAPPLEGREY",
        name = "Missouri fox trotteur gris pommelé",
        desc = "Cheval de travail",
        price = 145,
    },
    MissouriFoxTrotterSC= {
        model = "A_C_Horse_MissouriFoxTrotter_SableChampagne",
        name = "Missouri fox trotteur champagne",
        desc = "Cheval de travail",
        price = 152,
    },
    MissouriFoxTrotterSDP= {
        model = "A_C_Horse_MissouriFoxTrotter_SilverDapplePinto",
        name = "Missouri fox trotteur pinto pommelé",
        desc = "Cheval de travail",
        price = 160,
    },
    MissouriFoxTrotterBlack= {
        model = "A_C_Horse_Gang_Micah",
        name = "Missouri fox trotteur noir",
        desc = "Cheval de travail",
        price = 159,
    },

    MorganBR= {
        model = "A_C_Horse_Morgan_BayRoan",
        name = "Morgan rouan bai",
        desc = "Cheval de travail",
        price = 6,
    },
    MorganLC= {
        model = "A_C_Horse_Morgan_LiverChestnut_PC",
        name = "Morgan alezan brûlé",
        desc = "Cheval de travail",
        price = 35,
    },

    MustangBO= {
        model = "A_C_HORSE_MUSTANG_BLACKOVERO",
        name = "Mustang overo noir",
        desc = "Cheval de travail",
        price = 165,
    },
    MustangBS= {
        model = "A_C_HORSE_MUSTANG_BUCKSKIN",
        name = "Mustang isabelle",
        desc = "Cheval de travail",
        price = 158,
    },
    MustangCO= {
        model = "A_C_HORSE_MUSTANG_CHESTNUTTOVERO",
        name = "Mustang tovero alezan",
        desc = "Cheval de travail",
        price = 176,
    },
    MustangGoldenD= {
        model = "A_C_Horse_Mustang_GoldenDun",
        name = "Mustang doré tigré",
        desc = "Cheval de travail",
        price = 162,
    },
    MustangGrulloD= {
        model = "A_C_Horse_Mustang_GrulloDun",
        name = "Mustang gris",
        desc = "Cheval de travail",
        price = 70,
    },
    MustangRDO= {
        model = "A_C_HORSE_MUSTANG_REDDUNOVERO",
        name = "Mustang overo alezan",
        desc = "Cheval de travail",
        price = 173,
    },
    MustangTSB= {
        model = "A_C_Horse_Mustang_TigerStripedBay",
        name = "Mustang bai tigré",
        desc = "Cheval de travail",
        price = 95,
    },
    MustangWB= {
        model = "A_C_Horse_Mustang_WildBay",
        name = "Mustang bai sauvage",
        desc = "Cheval de travail",
        price = 71,
    },
    MustangSadie= {
        model = "A_C_Horse_Gang_Sadie_EndlessSummer",
        name = "Mustang rouan bai sombre",
        desc = "Cheval de travail",
        price = 77,
    },



    NokotaWR= {
        model = "A_C_Horse_Nokota_WhiteRoan",
        name = "Nokota blanc",
        desc = "Cheval de course",
        price = 45,
    },
    NokotaBR= {
        model = "A_C_Horse_Nokota_BlueRoan",
        name = "Nokota bleu rouan",
        desc = "Cheval de course",
        price = 44,
    },
    NokotaRDR= {
        model = "A_C_Horse_Nokota_ReverseDappleRoan",
        name = "Nokota bleu rouan inversé",
        desc = "Cheval de course",
        price = 64,
    },
    NokotaKaren= {
        model = "A_C_Horse_Gang_Karen",
        name = "Nokota gris fumé",
        desc = "Cheval de course",
        price = 42,
    },
    NokotaCharles= {
        model = "A_C_Horse_Gang_Charles_EndlessSummer",
        name = "Nokota gris rouan sabino",
        desc = "Cheval de course",
        price = 46,
    },


    NorfolkRoadsterBlack= {
        model = "A_C_Horse_NorfolkRoadster_Black",
        name = "Norfolk Roadster noir",
        desc = "Cheval de travail",
        price = 65,
    },
    NorfolkRoadsterDB= {
        model = "A_C_Horse_NorfolkRoadster_DappledBuckskin",
        name = "Norfolk Roadster isabelle pommelé",
        desc = "Cheval de travail",
        price = 110,
    },
    NorfolkRoadsterPR= {
        model = "A_C_Horse_NorfolkRoadster_PiebaldRoan",
        name = "Norfolk Roadster pie rouan",
        desc = "Cheval de travail",
        price = 83,
    },
    NorfolkRoadsterRG= {
        model = "A_C_Horse_NorfolkRoadster_RoseGrey",
        name = "Norfolk Roadster gris perle pommelé",
        desc = "Cheval de travail",
        price = 85,
    },
    NorfolkRoadsterSG= {
        model = "A_C_Horse_NorfolkRoadster_SpeckledGrey",
        name = "Norfolk Roadster gris moucheté",
        desc = "Cheval de travail",
        price = 67,
    },
    NorfolkRoadsterST= {
        model = "A_C_Horse_NorfolkRoadster_SpottedTricolor",
        name = "Norfolk Roadster tricolore tacheté",
        desc = "Cheval de travail",
        price = 119,
    },


    ShireDB= {
        model = "A_C_Horse_Shire_DarkBay",
        name = "Shire bai sombre",
        desc = "Cheval de trait",
        price = 75,
    },
    ShireLG= {
        model = "A_C_Horse_Shire_LightGrey",
        name = "Shire gris",
        desc = "Cheval de trait",
        price = 76,
    },
    ShireRB= {
        model = "A_C_Horse_Shire_RavenBlack",
        name = "Shire noir",
        desc = "Cheval de trait",
        price = 104,
    },


    SuffolkPunchRC= {
        model = "A_C_Horse_SuffolkPunch_RedChestnut",
        name = "Suffolk punch alezan foncé",
        desc = "Cheval de trait",
        price = 45,
    },
    SuffolkPunchSorrel= {
        model = "A_C_Horse_SuffolkPunch_Sorrel",
        name = "Suffolk punch oseille",
        desc = "Cheval de trait",
        price = 46,
    },


    TennesseeWalkeBR= {
        model = "A_C_Horse_TennesseeWalker_BlackRabicano",
        name = "Tennesse walker rouan noir",
        desc = "Cheval de travail",
        price = 9,
    },
    TennesseeWalkerFR= {
        model = "A_C_Horse_TennesseeWalker_FlaxenRoan",
        name = "Tennesse walker rouan crins lavés",
        desc = "Cheval de travail",
        price = 53,
    },
    TennesseeWalkerGP= {
        model = "A_C_Horse_TennesseeWalker_GoldPalomino_PC",
        name = "Tennesse walker palomino",
        desc = "Cheval de travail",
        price = 25,
    },
    TennesseeWalkerMB= {
        model = "A_C_Horse_TennesseeWalker_MahoganyBay",
        name = "Tennesse walker pie bai",
        desc = "Cheval de travail",
        price = 37,
    },
    TennesseeWalkerRR= {
        model = "A_C_Horse_TennesseeWalker_RedRoan",
        name = "Tennesse walker rouan",
        desc = "Cheval de travail",
        price = 9,
    },
    TennesseeWalkerLenny= {
        model = "A_C_Horse_Gang_Lenny",
        name = "Tennesse walker palomino rouan",
        desc = "Cheval de travail",
        price = 32,
    },


    ThoroughbredBC= {
        model = "A_C_Horse_Thoroughbred_BlackChestnut",
        name = "Pur sang alezan foncé",
        desc = "Cheval de course",
        price = 44,
    },
    ThoroughbredBB= {
        model = "A_C_Horse_Thoroughbred_BloodBay",
        name = "Pur sang bai",
        desc = "Cheval de course",
        price = 28,
    },
    ThoroughbredBrindle= {
        model = "A_C_Horse_Thoroughbred_Brindle",
        name = "Pur sang bringé",
        desc = "Cheval de course",
        price = 58,
    },
    ThoroughbredDG= {
        model = "A_C_Horse_Thoroughbred_DappleGrey",
        name = "Pur sang gris pommelé",
        desc = "Cheval de course",
        price = 27,
    },
    ThoroughbredRDB= {
        model = "A_C_Horse_Thoroughbred_ReverseDappleBlack",
        name = "Pur sang noir pommelé inversé",
        desc = "Cheval de course",
        price = 60,
    },
    ThoroughbredES= {
        model = "A_C_Horse_John_EndlessSummer",
        name = "Pur sang bai pangaré",
        desc = "Cheval de course",
        price = 55,
    },


    TurkomanBlack= {
        model = "A_C_HORSE_TURKOMAN_BLACK",
        name = "Turkoman noir",
        desc = "Cheval de course",
        price = 195,
    },
    TurkomanChestnut= {
        model = "A_C_HORSE_TURKOMAN_CHESTNUT",
        name = "Turkoman alezan",
        desc = "Cheval de course",
        price = 255,
    },
    TurkomanDB= {
        model = "A_C_Horse_Turkoman_DarkBay",
        name = "Turkoman bai sombre",
        desc = "Cheval de course",
        price = 187,
    },
    TurkomanGold= {
        model = "A_C_Horse_Turkoman_Gold",
        name = "Turkoman doré",
        desc = "Cheval de course",
        price = 210,
    },
    TurkomanGoldDapple= {
        model = "A_C_Horse_Gang_Sadie",
        name = "Turkoman doré pommelé",
        desc = "Cheval de course",
        price = 215,
    },
    TurkomanGrey= {
        model = "A_C_HORSE_TURKOMAN_GREY",
        name = "Turkoman gris",
        desc = "Cheval de course",
        price = 205,
    },
    TurkomanPerlino= {
        model = "A_C_HORSE_TURKOMAN_PERLINO",
        name = "Turkoman perlino",
        desc = "Cheval de course",
        price = 200,
    },
    TurkomanSilver= {
        model = "A_C_Horse_Turkoman_Silver",
        name = "Turkoman argenté",
        desc = "Cheval de course",
        price = 225,
    },
    


    Mule= {
        model = "A_C_HorseMule_01",
        name = "Mule",
        desc = "Même pas un cheval",
        price = 3,
    },   
}

Config.DistanceToInteract = 2.0

Config.Cart = {
	gatchuck= {
		model = "gatchuck",
		name = "Charrette",
		desc = "Une Charrette",
        price = 25,
    },
	chuckwagon000x= {
		model = "chuckwagon000x",
		name = "Charrette à deux chevaux",
		desc = "Idéale pour le transport de marchandise",
        price = 40,
    },
    chuckwagon002x= {
		model = "chuckwagon002x",
		name = "Charrette à deux chevaux",
		desc = "Idéale pour le transport de marchandise",
        price = 40,
    }, 
    cart03= {
		model = "cart03",
		name = "Petite charrette",
		desc = "Une charrette pour les plus démunis",
        price = 15,
    },
	cart08= {
		model = "cart08",
		name = "Petite charrette",
		desc = "Petite charrette",
        price = 15,
    },
	wagon03x= {
		model = "wagon03x",
		name = "Charrette de transport",
		desc = "Une charrette avec des bancs",
        price = 30,
    },
    buggy01= {
		model = "buggy01",
		name = "Boquet",
		desc = "Pour les notables de Saint-Denis",
        price = 80,
    },
    buggy02= {
		model = "buggy02",
		name = "Boquet",
		desc = "Pour les notables de Saint-Denis",
        price = 80,
    },
    buggy03= {
		model = "buggy03",
		name = "Boquet",
		desc = "Pour les notables de Saint-Denis",
        price = 80,
    },
    coach02= {
		model = "coach2",
		name = "Grande Dilligence",
		desc = "Ces quatres chevaux vous emmèneront loin",
        price = 200,
    },
    coach03= {
		model = "coach3",
		name = "Grande calèche",
		desc = "Pour les notables de Saint-Denis",
        price = 120,
    },
    coach05= {
		model = "coach5",
		name = "Petite calèche",
		desc = "Pour les notables de Saint-Denis",
        price = 100,
    },
    stagecoach002x= {
		model = "stagecoach002x",
		name = "Dilligence",
		desc = "Parfaite pour les voyages dans l'Ouest sauvage",
        price = 150,
    },
    huntercart01= {
		model = "huntercart01",
		name = "Charrette Chasseur",
		desc = "Pour les bons et les mauvais",
        price = 80,
    },
}

Config.Label = {
	["saddle_horns"] = "Pommeau",
	["horse_blankets"] = "Tapis de Scelle",
	["horse_saddles"] = "Selle",
	["HORSE_SADDLEBAGS"] = "Sacoches",
	["saddle_stirrups"] = "Étriers",
	["horse_bedrolls"] = "Couchage",
	["horse_manes"] = "Crinière",
	["horse_bridles"] = "Rênes",
	["horse_accessories"] = "Masque",
	["HORSE_TAILS"] = "Queue",
}

Config.CartCustom = {
	["tints"] = "Couleurs",
	["propsets"] = "Équipements",
	["liveries"] = "Peintures",
	["extras"] = "Ajouts",
}


Config.StashWeight = {
	["chuckwagon000x"] = 70,
	["bountywagon01x"] = 30,
	["buggy01"] = 0,
	["buggy02"] = 0,
	["buggy03"] = 0,
	["cart01"] = 0,
	["cart02"] = 0,
	["cart03"] = 25,
	["cart04"] = 25,
	["cart05"] = 0,
	["cart06"] = 50,
	["cart07"] = 30,
	["cart08"] = 30,
	["chuckwagon002x"] = 70,
	["coach2"] = 50,
	["coach3"] = 0,
	["coach4"] = 0,
	["coach5"] = 0,
	["coach6"] = 0,
	["gatchuck_2"] = 0,
	["gatchuck"] = 50,
	["huntercart01"] = 50,
	["policewagon01x"] = 0,
	["stagecoach001x"] = 0,
	["stagecoach002x"] = 50,
	["stagecoach003x"] = 0,
	["stagecoach004x"] = 50,
	["stagecoach005x"] = 0,
	["stagecoach006x"] = 0,
	["supplywagon"] = 100,
	["utilliwag"] = 50,
	["wagon02x"] = 100,
	["wagon03x"] = 20,
	["wagon04x"] = 100,
	["wagon05x"] = 70,
	["wagon06x"] = 50,
	["warwagon2"] = 30,
	["wagonarmoured01x"] = 0,
	["wagonCircus01x"] = 0,
	["wagonCircus02x"] = 0,
	["wagondairy01x"] = 30,
	["wagondoc01x"] = 50,
	["wagonPrison01x"] = 0,
	["wagontraveller01x"] = 30,
	["wagonwork01x"] = 70,
	["ArmySupplyWagon"] = 150,
}