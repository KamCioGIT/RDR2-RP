fx_version 'adamant'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

dependency 'ox_lib'

client_scripts {
    "@uiprompt/uiprompt.lua",
    '@ox_lib/init.lua',
    'client/config.lua',
    'client/main.lua',
}

server_scripts {
    '@ox_lib/init.lua',
    'client/config.lua',
    'server/main.lua',
}

lua54 'yes'