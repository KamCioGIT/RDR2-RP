local Translations = {
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
        prepare_fishing_rod = 'Préparation de la canne',
        cast_fishing_rod = 'Lancer la canne',
        hook = 'Hameçon',
        reset_cast = 'Relancer',
        reel_lure = 'Lâcher du mou',
        reel_in = 'Mouliner',
        keep_fish = 'Garder le poisson',
        throw_fish = 'Relâcher le poisson',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
