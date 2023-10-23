version '1.0.0'
author 'RS DEVELOPMENT'
description 'RSD DOORLOCK https://script.redstartrp.fr'
repository 'https://script.redstartrp.fr'

fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

dependency 'rsd_notify'

client_scripts {
    'config.lua',
    'client.lua',
}

server_scripts {
    'config.lua',
    'server.lua',
}

escrow_ignore {
    'config.lua',
}



dependency '/assetpacks'