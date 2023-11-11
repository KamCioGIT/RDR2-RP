fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'
version '1.0.0'

author 'systemNEO'
author 'DerHobbs'

description 'Chalkboard for muted players to show messages around a specific display radius via chat command.'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/helper.lua',
    'client/actions.lua',
    'client/client.lua'
}

server_scripts {
    'server/helper.lua',
    'server/server.lua',
}

ui_page 'html/index.html'

files {
    'html/**/*',
}

dependencies {
    'vorp_inventory',
}

escrow_ignore {
    'config.lua'
}


dependency '/assetpacks'