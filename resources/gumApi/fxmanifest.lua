fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
server_scripts {
    'config.lua',
	'serverData/serverCompCustom.lua',
	'serverData/serverCompGum.lua',
	'serverData/serverCompRedEM.lua',
	'serverData/serverCompRedEMReboot.lua',
	'serverData/serverCompQBR.lua',
	'serverData/serverCompRSG.lua',
	'serverData/serverCompVorp.lua',
}

client_scripts {
    'config.lua',
	'clientData/data.lua',
	'clientData/client.lua',
}

export 'gumApi'

ui_page 'html/index.html'

files {
    'html/index.js',
    'html/index.css',
    'html/index.html',
    'html/crock.ttf',
    'html/images/*.png',
}
