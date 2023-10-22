fx_version "adamant"
lua54 'yes'
games { 'rdr3' }

author '@turbomodus'
description 'animate entities (objects) on sight'
version '1.0'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


-- Client Scripts
client_scripts {
    'config.lua',
    'client/animate-c.lua'
} 

escrow_ignore {
    'config.lua', 
    'client/animate-c.lua', 
}
dependency '/assetpacks'