version '1.0.0'
author 'RS DEVELOPMENT'
description 'RSD LOCKPICK https://script.redstartrp.fr'
repository 'https://script.redstartrp.fr'

fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

ui_page 'html/index.html'

client_scripts {
    'config.lua',
    'client.lua',
}

server_scripts {
    'config.lua',
    'server.lua',
}

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/img/*.png',

}

escrow_ignore {
    'config.lua',
}

export 'StartLockPick'


dependency '/assetpacks'